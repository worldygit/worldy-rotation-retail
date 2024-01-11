local StrToNumber = tonumber;
local Byte = string.byte;
local Char = string.char;
local Sub = string.sub;
local Subg = string.gsub;
local Rep = string.rep;
local Concat = table.concat;
local Insert = table.insert;
local LDExp = math.ldexp;
local GetFEnv = getfenv or function()
	return _ENV;
end;
local Setmetatable = setmetatable;
local PCall = pcall;
local Select = select;
local Unpack = unpack or table.unpack;
local ToNumber = tonumber;
local function VMCall(ByteString, vmenv, ...)
	local DIP = 1;
	local repeatNext;
	ByteString = Subg(Sub(ByteString, 5), "..", function(byte)
		if (Byte(byte, 2) == 79) then
			repeatNext = StrToNumber(Sub(byte, 1, 1));
			return "";
		else
			local a = Char(StrToNumber(byte, 16));
			if repeatNext then
				local b = Rep(a, repeatNext);
				repeatNext = nil;
				return b;
			else
				return a;
			end
		end
	end);
	local function gBit(Bit, Start, End)
		if End then
			local Res = (Bit / (2 ^ (Start - 1))) % (2 ^ (((End - 1) - (Start - 1)) + 1));
			return Res - (Res % 1);
		else
			local Plc = 2 ^ (Start - 1);
			return (((Bit % (Plc + Plc)) >= Plc) and 1) or 0;
		end
	end
	local function gBits8()
		local a = Byte(ByteString, DIP, DIP);
		DIP = DIP + 1;
		return a;
	end
	local function gBits16()
		local a, b = Byte(ByteString, DIP, DIP + 2);
		DIP = DIP + 2;
		return (b * 256) + a;
	end
	local function gBits32()
		local a, b, c, d = Byte(ByteString, DIP, DIP + 3);
		DIP = DIP + 4;
		return (d * 16777216) + (c * 65536) + (b * 256) + a;
	end
	local function gFloat()
		local Left = gBits32();
		local Right = gBits32();
		local IsNormal = 1;
		local Mantissa = (gBit(Right, 1, 20) * (2 ^ 32)) + Left;
		local Exponent = gBit(Right, 21, 31);
		local Sign = ((gBit(Right, 32) == 1) and -1) or 1;
		if (Exponent == 0) then
			if (Mantissa == 0) then
				return Sign * 0;
			else
				Exponent = 1;
				IsNormal = 0;
			end
		elseif (Exponent == 2047) then
			return ((Mantissa == 0) and (Sign * (1 / 0))) or (Sign * NaN);
		end
		return LDExp(Sign, Exponent - 1023) * (IsNormal + (Mantissa / (2 ^ 52)));
	end
	local function gString(Len)
		local Str;
		if not Len then
			Len = gBits32();
			if (Len == 0) then
				return "";
			end
		end
		Str = Sub(ByteString, DIP, (DIP + Len) - 1);
		DIP = DIP + Len;
		local FStr = {};
		for Idx = 1, #Str do
			FStr[Idx] = Char(Byte(Sub(Str, Idx, Idx)));
		end
		return Concat(FStr);
	end
	local gInt = gBits32;
	local function _R(...)
		return {...}, Select("#", ...);
	end
	local function Deserialize()
		local Instrs = {};
		local Functions = {};
		local Lines = {};
		local Chunk = {Instrs,Functions,nil,Lines};
		local ConstCount = gBits32();
		local Consts = {};
		for Idx = 1, ConstCount do
			local Type = gBits8();
			local Cons;
			if (Type == 1) then
				Cons = gBits8() ~= 0;
			elseif (Type == 2) then
				Cons = gFloat();
			elseif (Type == 3) then
				Cons = gString();
			end
			Consts[Idx] = Cons;
		end
		Chunk[3] = gBits8();
		for Idx = 1, gBits32() do
			local Descriptor = gBits8();
			if (gBit(Descriptor, 1, 1) == 0) then
				local Type = gBit(Descriptor, 2, 3);
				local Mask = gBit(Descriptor, 4, 6);
				local Inst = {gBits16(),gBits16(),nil,nil};
				if (Type == 0) then
					Inst[3] = gBits16();
					Inst[4] = gBits16();
				elseif (Type == 1) then
					Inst[3] = gBits32();
				elseif (Type == 2) then
					Inst[3] = gBits32() - (2 ^ 16);
				elseif (Type == 3) then
					Inst[3] = gBits32() - (2 ^ 16);
					Inst[4] = gBits16();
				end
				if (gBit(Mask, 1, 1) == 1) then
					Inst[2] = Consts[Inst[2]];
				end
				if (gBit(Mask, 2, 2) == 1) then
					Inst[3] = Consts[Inst[3]];
				end
				if (gBit(Mask, 3, 3) == 1) then
					Inst[4] = Consts[Inst[4]];
				end
				Instrs[Idx] = Inst;
			end
		end
		for Idx = 1, gBits32() do
			Functions[Idx - 1] = Deserialize();
		end
		return Chunk;
	end
	local function Wrap(Chunk, Upvalues, Env)
		local Instr = Chunk[1];
		local Proto = Chunk[2];
		local Params = Chunk[3];
		return function(...)
			local Instr = Instr;
			local Proto = Proto;
			local Params = Params;
			local _R = _R;
			local VIP = 1;
			local Top = -1;
			local Vararg = {};
			local Args = {...};
			local PCount = Select("#", ...) - 1;
			local Lupvals = {};
			local Stk = {};
			for Idx = 0, PCount do
				if (Idx >= Params) then
					Vararg[Idx - Params] = Args[Idx + 1];
				else
					Stk[Idx] = Args[Idx + 1];
				end
			end
			local Varargsz = (PCount - Params) + 1;
			local Inst;
			local Enum;
			while true do
				Inst = Instr[VIP];
				Enum = Inst[1];
				if (Enum <= 2) then
					if (Enum <= 0) then
						local A = Inst[2];
						Stk[A] = Stk[A](Stk[A + 1]);
					elseif (Enum == 1) then
						if ((Inst[3] == "_ENV") or (Inst[3] == "getfenv")) then
							Stk[Inst[2]] = Env;
						else
							Stk[Inst[2]] = Env[Inst[3]];
						end
					else
						local A = Inst[2];
						Top = (A + Varargsz) - 1;
						for Idx = A, Top do
							local VA = Vararg[Idx - A];
							Stk[Idx] = VA;
						end
					end
				elseif (Enum <= 4) then
					if (Enum > 3) then
						local A = Inst[2];
						Stk[A](Unpack(Stk, A + 1, Top));
					else
						local VA;
						local A;
						if ((Inst[3] == "_ENV") or (Inst[3] == "getfenv")) then
							Stk[Inst[2]] = Env;
						else
							Stk[Inst[2]] = Env[Inst[3]];
						end
						VIP = VIP + 1;
						Inst = Instr[VIP];
						Stk[Inst[2]] = Inst[3];
						VIP = VIP + 1;
						Inst = Instr[VIP];
						A = Inst[2];
						Stk[A] = Stk[A](Stk[A + 1]);
						VIP = VIP + 1;
						Inst = Instr[VIP];
						A = Inst[2];
						Top = (A + Varargsz) - 1;
						for Idx = A, Top do
							VA = Vararg[Idx - A];
							Stk[Idx] = VA;
						end
						VIP = VIP + 1;
						Inst = Instr[VIP];
						A = Inst[2];
						Stk[A](Unpack(Stk, A + 1, Top));
						VIP = VIP + 1;
						Inst = Instr[VIP];
						do
							return;
						end
					end
				elseif (Enum == 5) then
					Stk[Inst[2]] = Inst[3];
				else
					do
						return;
					end
				end
				VIP = VIP + 1;
			end
		end;
	end
	return Wrap(Deserialize(), {}, vmenv)(...);
end
VMCall("LOL!023O00030A3O006C6F6164737472696E67031B1F2O002O2D2O5B202449643A2043612O6C6261636B48616E646C65722D312E302E6C756120313239382032302O322D31322D31322031353A31303A31305A206E65766361697269656C2024202O5D0D0A6C6F63616C204D414A4F522C204D494E4F52203D202243612O6C6261636B48616E646C65722D312E30222C20380D0A6C6F63616C2043612O6C6261636B48616E646C6572203D204C6962537475623A4E65774C696272617279284D414A4F522C204D494E4F52290D0A0D0A6966206E6F742043612O6C6261636B48616E646C6572207468656E2072657475726E20656E64202O2D204E6F2075706772616465206E2O656465640D0A0D0A6C6F63616C206D657461203D207B2O5F696E646578203D2066756E6374696F6E2874626C2C206B6579292074626C5B6B65795D203D207B7D2072657475726E2074626C5B6B65795D20656E647D0D0A0D0A2O2D204C756120415049730D0A6C6F63616C2073656375726563612O6C66756E6374696F6E2C20652O726F72203D2073656375726563612O6C66756E6374696F6E2C20652O726F720D0A6C6F63616C207365746D6574617461626C652C20726177676574203D207365746D6574617461626C652C207261776765740D0A6C6F63616C206E6578742C2073656C6563742C2070616972732C20747970652C20746F737472696E67203D206E6578742C2073656C6563742C2070616972732C20747970652C20746F737472696E670D0A0D0A0D0A6C6F63616C2066756E6374696F6E2044697370617463682868616E646C6572732C203O2E290D0A096C6F63616C20696E6465782C206D6574686F64203D206E6578742868616E646C657273290D0A096966206E6F74206D6574686F64207468656E2072657475726E20656E640D0A097265706561740D0A2O0973656375726563612O6C66756E6374696F6E286D6574686F642C203O2E290D0A2O09696E6465782C206D6574686F64203D206E6578742868616E646C6572732C20696E646578290D0A09756E74696C206E6F74206D6574686F640D0A656E640D0A0D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D2O2D0D0A2O2D2043612O6C6261636B48616E646C65723A4E65770D0A2O2D0D0A2O2D3O207461726765749O203O202D20746172676574206F626A65637420746F20656D626564207075626C6963204150497320696E0D0A2O2D3O2052656769737465724E616D656O202D206E616D65206F66207468652063612O6C6261636B20726567697374726174696F6E204150492C2064656661756C742022526567697374657243612O6C6261636B220D0A2O2D3O20556E72656769737465724E616D654O202D206E616D65206F66207468652063612O6C6261636B20756E726567697374726174696F6E204150492C2064656661756C742022556E726567697374657243612O6C6261636B220D0A2O2D3O20556E7265676973746572412O6C4E616D65202D206E616D65206F66207468652041504920746F20756E726567697374657220612O6C2063612O6C6261636B732C2064656661756C742022556E7265676973746572412O6C43612O6C6261636B73222E2066616C7365202O3D20646F6E2774207075626C6973682074686973204150492E0D0A0D0A66756E6374696F6E2043612O6C6261636B48616E646C65722E4E6577285F73656C662C207461726765742C2052656769737465724E616D652C20556E72656769737465724E616D652C20556E7265676973746572412O6C4E616D65290D0A0D0A0952656769737465724E616D65203D2052656769737465724E616D65206F722022526567697374657243612O6C6261636B220D0A09556E72656769737465724E616D65203D20556E72656769737465724E616D65206F722022556E726567697374657243612O6C6261636B220D0A09696620556E7265676973746572412O6C4E616D652O3D6E696C207468656E092O2D2066616C7365206973207573656420746F20696E6469636174652022646F6E27742077616E742074686973206D6574686F64220D0A2O09556E7265676973746572412O6C4E616D65203D2022556E7265676973746572412O6C43612O6C6261636B73220D0A09656E640D0A0D0A092O2D207765206465636C61726520612O6C206F626A6563747320616E64206578706F72746564204150497320696E73696465207468697320636C6F7375726520746F20717569636B6C79206761696E20612O63652O730D0A092O2D20746F20652E672E2066756E6374696F6E206E616D65732C2074686520227461726765742220706172616D657465722C206574630D0A0D0A0D0A092O2D2043726561746520746865207265676973747279206F626A6563740D0A096C6F63616C206576656E7473203D207365746D6574617461626C65287B7D2C206D657461290D0A096C6F63616C207265676973747279203D207B20726563757273653D302C206576656E74733D6576656E7473207D0D0A0D0A092O2D2072656769737472793A466972652829202D2066697265732074686520676976656E206576656E742F6D652O7361676520696E746F207468652072656769737472790D0A0966756E6374696F6E2072656769737472793A46697265286576656E746E616D652C203O2E290D0A2O096966206E6F7420726177676574286576656E74732C206576656E746E616D6529206F72206E6F74206E657874286576656E74735B6576656E746E616D655D29207468656E2072657475726E20656E640D0A2O096C6F63616C206F6C6472656375727365203D2072656769737472792E726563757273650D0A2O0972656769737472792E72656375727365203D206F6C6472656375727365202B20310D0A0D0A2O094469737061746368286576656E74735B6576656E746E616D655D2C206576656E746E616D652C203O2E290D0A0D0A2O0972656769737472792E72656375727365203D206F6C64726563757273650D0A0D0A2O0969662072656769737472792E696E73657274517565756520616E64206F6C64726563757273652O3D30207468656E0D0A3O092O2D20536F6D657468696E6720696E206F6E65206F66206F75722063612O6C6261636B732077616E74656420746F207265676973746572206D6F72652063612O6C6261636B733B207468657920676F74207175657565640D0A3O09666F72206576656E742C63612O6C6261636B7320696E2070616972732872656769737472792E696E7365727451756575652920646F0D0A4O096C6F63616C206669727374203D206E6F7420726177676574286576656E74732C206576656E7429206F72206E6F74206E657874286576656E74735B6576656E745D29092O2D207465737420666F7220656D707479206265666F72652E206E6F74207465737420666F72206F6E65206D656D6265722061667465722E2074686174206F6E65206D656D626572206D6179206861766520622O656E206F7665727772692O74656E2E0D0A4O09666F72206F626A6563742C66756E6320696E2070616972732863612O6C6261636B732920646F0D0A5O096576656E74735B6576656E745D5B6F626A6563745D203D2066756E630D0A5O092O2D2066697265204F6E557365642063612O6C6261636B3F0D0A5O09696620666972737420616E642072656769737472792E4F6E55736564207468656E0D0A6O0972656769737472792E4F6E557365642872656769737472792C207461726765742C206576656E74290D0A6O096669727374203D206E696C0D0A5O09656E640D0A4O09656E640D0A3O09656E640D0A3O0972656769737472792E696E736572745175657565203D206E696C0D0A2O09656E640D0A09656E640D0A0D0A092O2D20526567697374726174696F6E206F6620612063612O6C6261636B2C2068616E646C65733A0D0A092O2D3O2073656C665B226D6574686F64225D2C206C6561647320746F2073656C665B226D6574686F64225D2873656C662C203O2E290D0A092O2D3O2073656C6620776974682066756E6374696F6E207265662C206C6561647320746F2066756E6374696F6E726566283O2E290D0A092O2D3O2022612O646F6E4964222028696E7374656164206F662073656C662920776974682066756E6374696F6E207265662C206C6561647320746F2066756E6374696F6E726566283O2E290D0A092O2D20612O6C207769746820616E206F7074696F6E616C206172672C2077686963682C2069662070726573656E742C20676574732070612O73656420617320666972737420617267756D656E74202861667465722073656C662069662070726573656E74290D0A097461726765745B52656769737465724E616D655D203D2066756E6374696F6E2873656C662C206576656E746E616D652C206D6574686F642C203O2E202O2D2O5B61637475612O6C79206A75737420612073696E676C65206172672O5D290D0A2O0969662074797065286576656E746E616D6529207E3D2022737472696E6722207468656E0D0A3O09652O726F72282255736167653A20222O2E52656769737465724E616D652O2E22286576656E746E616D652C206D6574686F645B2C206172675D293A20276576656E746E616D6527202D20737472696E672065787065637465642E222C2032290D0A2O09656E640D0A0D0A2O096D6574686F64203D206D6574686F64206F72206576656E746E616D650D0A0D0A2O096C6F63616C206669727374203D206E6F7420726177676574286576656E74732C206576656E746E616D6529206F72206E6F74206E657874286576656E74735B6576656E746E616D655D29092O2D207465737420666F7220656D707479206265666F72652E206E6F74207465737420666F72206F6E65206D656D6265722061667465722E2074686174206F6E65206D656D626572206D6179206861766520622O656E206F7665727772692O74656E2E0D0A0D0A2O0969662074797065286D6574686F6429207E3D2022737472696E672220616E642074797065286D6574686F6429207E3D202266756E6374696F6E22207468656E0D0A3O09652O726F72282255736167653A20222O2E52656769737465724E616D652O2E22285C226576656E746E616D655C222C205C226D6574686F646E616D655C22293A20276D6574686F646E616D6527202D20737472696E67206F722066756E6374696F6E2065787065637465642E222C2032290D0A2O09656E640D0A0D0A2O096C6F63616C2072656766756E630D0A0D0A2O0969662074797065286D6574686F6429202O3D2022737472696E6722207468656E0D0A3O092O2D2073656C665B226D6574686F64225D2063612O6C696E67207374796C650D0A3O09696620747970652873656C6629207E3D20227461626C6522207468656E0D0A4O09652O726F72282255736167653A20222O2E52656769737465724E616D652O2E22285C226576656E746E616D655C222C205C226D6574686F646E616D655C22293A2073656C6620776173206E6F742061207461626C653F222C2032290D0A3O09656C736569662073656C662O3D746172676574207468656E0D0A4O09652O726F72282255736167653A20222O2E52656769737465724E616D652O2E22285C226576656E746E616D655C222C205C226D6574686F646E616D655C22293A20646F206E6F7420757365204C6962726172793A222O2E52656769737465724E616D652O2E2228292C2075736520796F7572206F776E202773656C6627222C2032290D0A3O09656C7365696620747970652873656C665B6D6574686F645D29207E3D202266756E6374696F6E22207468656E0D0A4O09652O726F72282255736167653A20222O2E52656769737465724E616D652O2E22285C226576656E746E616D655C222C205C226D6574686F646E616D655C22293A20276D6574686F646E616D6527202D206D6574686F642027222O2E746F737472696E67286D6574686F64292O2E2227206E6F7420666F756E64206F6E2073656C662E222C2032290D0A3O09656E640D0A0D0A3O0969662073656C656374282223222C3O2E293E3D31207468656E092O2D2074686973206973206E6F74207468652073616D652061732074657374696E6720666F72206172672O3D6E696C210D0A4O096C6F63616C206172673D73656C65637428312C3O2E290D0A4O0972656766756E63203D2066756E6374696F6E283O2E292073656C665B6D6574686F645D2873656C662C6172672C3O2E2920656E640D0A3O09656C73650D0A4O0972656766756E63203D2066756E6374696F6E283O2E292073656C665B6D6574686F645D2873656C662C3O2E2920656E640D0A3O09656E640D0A2O09656C73650D0A3O092O2D2066756E6374696F6E2072656620776974682073656C663D6F626A656374206F722073656C663D22612O646F6E496422206F722073656C663D7468726561640D0A3O09696620747970652873656C66297E3D227461626C652220616E6420747970652873656C66297E3D22737472696E672220616E6420747970652873656C66297E3D2274687265616422207468656E0D0A4O09652O726F72282255736167653A20222O2E52656769737465724E616D652O2E222873656C66206F72205C22612O646F6E49645C222C206576656E746E616D652C206D6574686F64293A202773656C66206F7220612O646F6E4964273A207461626C65206F7220737472696E67206F72207468726561642065787065637465642E222C2032290D0A3O09656E640D0A0D0A3O0969662073656C656374282223222C3O2E293E3D31207468656E092O2D2074686973206973206E6F74207468652073616D652061732074657374696E6720666F72206172672O3D6E696C210D0A4O096C6F63616C206172673D73656C65637428312C3O2E290D0A4O0972656766756E63203D2066756E6374696F6E283O2E29206D6574686F64286172672C3O2E2920656E640D0A3O09656C73650D0A4O0972656766756E63203D206D6574686F640D0A3O09656E640D0A2O09656E640D0A0D0A0D0A2O096966206576656E74735B6576656E746E616D655D5B73656C665D206F722072656769737472792E726563757273653C31207468656E0D0A2O092O2D2069662072656769737472792E726563757273653C31207468656E0D0A3O092O2D207765277265206F76657277726974696E6720616E206578697374696E6720656E7472792C206F72206E6F742063752O72656E746C7920726563757273696E672E206A757374207365742069742E0D0A3O096576656E74735B6576656E746E616D655D5B73656C665D203D2072656766756E630D0A3O092O2D2066697265204F6E557365642063612O6C6261636B3F0D0A3O0969662072656769737472792E4F6E5573656420616E64206669727374207468656E0D0A4O0972656769737472792E4F6E557365642872656769737472792C207461726765742C206576656E746E616D65290D0A3O09656E640D0A2O09656C73650D0A3O092O2D2077652772652063752O72656E746C792070726F63652O73696E6720612063612O6C6261636B20696E20746869732072656769737472792C20736F2064656C61792074686520726567697374726174696F6E206F662074686973206E657720656E747279210D0A3O092O2D207965732C20776527726520612062697420776173746566756C206F6E20676172626167652C2062757420746869732069732061206672696E676520636173652C20736F207765277265207069636B696E67206C6F7720696D706C656D656E746174696F6E206F76657268656164206F766572206761726261676520652O66696369656E63790D0A3O0972656769737472792E696E736572745175657565203D2072656769737472792E696E736572745175657565206F72207365746D6574617461626C65287B7D2C6D657461290D0A3O0972656769737472792E696E7365727451756575655B6576656E746E616D655D5B73656C665D203D2072656766756E630D0A2O09656E640D0A09656E640D0A0D0A092O2D20556E726567697374657220612063612O6C6261636B0D0A097461726765745B556E72656769737465724E616D655D203D2066756E6374696F6E2873656C662C206576656E746E616D65290D0A2O096966206E6F742073656C66206F722073656C662O3D746172676574207468656E0D0A3O09652O726F72282255736167653A20222O2E556E72656769737465724E616D652O2E22286576656E746E616D65293A20626164202773656C6627222C2032290D0A2O09656E640D0A2O0969662074797065286576656E746E616D6529207E3D2022737472696E6722207468656E0D0A3O09652O726F72282255736167653A20222O2E556E72656769737465724E616D652O2E22286576656E746E616D65293A20276576656E746E616D6527202D20737472696E672065787065637465642E222C2032290D0A2O09656E640D0A2O09696620726177676574286576656E74732C206576656E746E616D652920616E64206576656E74735B6576656E746E616D655D5B73656C665D207468656E0D0A3O096576656E74735B6576656E746E616D655D5B73656C665D203D206E696C0D0A3O092O2D2046697265204F6E556E757365642063612O6C6261636B3F0D0A3O0969662072656769737472792E4F6E556E7573656420616E64206E6F74206E657874286576656E74735B6576656E746E616D655D29207468656E0D0A4O0972656769737472792E4F6E556E757365642872656769737472792C207461726765742C206576656E746E616D65290D0A3O09656E640D0A2O09656E640D0A2O0969662072656769737472792E696E73657274517565756520616E64207261776765742872656769737472792E696E7365727451756575652C206576656E746E616D652920616E642072656769737472792E696E7365727451756575655B6576656E746E616D655D5B73656C665D207468656E0D0A3O0972656769737472792E696E7365727451756575655B6576656E746E616D655D5B73656C665D203D206E696C0D0A2O09656E640D0A09656E640D0A0D0A092O2D204F5054494F4E414C3A20556E726567697374657220612O6C2063612O6C6261636B7320666F7220676976656E2073656C66732F612O646F6E4964730D0A09696620556E7265676973746572412O6C4E616D65207468656E0D0A2O097461726765745B556E7265676973746572412O6C4E616D655D203D2066756E6374696F6E283O2E290D0A3O0969662073656C656374282223222C3O2E293C31207468656E0D0A4O09652O726F72282255736167653A20222O2E556E7265676973746572412O6C4E616D652O2E22285B77686174466F725D293A206D692O73696E67202773656C6627206F72205C22612O646F6E49645C2220746F20756E7265676973746572206576656E747320666F722E222C2032290D0A3O09656E640D0A3O0969662073656C656374282223222C3O2E292O3D3120616E64203O2E2O3D746172676574207468656E0D0A4O09652O726F72282255736167653A20222O2E556E7265676973746572412O6C4E616D652O2E22285B77686174466F725D293A2073752O706C792061206D65616E696E6766756C202773656C6627206F72205C22612O646F6E49645C2O222C2032290D0A3O09656E640D0A0D0A0D0A3O09666F7220693D312C73656C656374282223222C3O2E2920646F0D0A4O096C6F63616C2073656C66203D2073656C65637428692C3O2E290D0A4O0969662072656769737472792E696E736572745175657565207468656E0D0A5O09666F72206576656E746E616D652C2063612O6C6261636B7320696E2070616972732872656769737472792E696E7365727451756575652920646F0D0A6O0969662063612O6C6261636B735B73656C665D207468656E0D0A7O0963612O6C6261636B735B73656C665D203D206E696C0D0A6O09656E640D0A5O09656E640D0A4O09656E640D0A4O09666F72206576656E746E616D652C2063612O6C6261636B7320696E207061697273286576656E74732920646F0D0A5O0969662063612O6C6261636B735B73656C665D207468656E0D0A6O0963612O6C6261636B735B73656C665D203D206E696C0D0A6O092O2D2046697265204F6E556E757365642063612O6C6261636B3F0D0A6O0969662072656769737472792E4F6E556E7573656420616E64206E6F74206E6578742863612O6C6261636B7329207468656E0D0A7O0972656769737472792E4F6E556E757365642872656769737472792C207461726765742C206576656E746E616D65290D0A6O09656E640D0A5O09656E640D0A4O09656E640D0A3O09656E640D0A2O09656E640D0A09656E640D0A0D0A0972657475726E2072656769737472790D0A656E640D0A0D0A0D0A2O2D2043612O6C6261636B48616E646C657220707572706F736566752O6C7920646F6573204E4F5420646F206578706C6963697420656D62652O64696E672E204E6F7220646F65732069740D0A2O2D2074727920746F2075706772616465206F6C6420696D706C6963697420656D626564732073696E6365207468652073797374656D2069732073656C66636F6E7461696E656420616E640D0A2O2D2072656C696573206F6E20636C6F737572657320746F20776F726B2E0D0A0D0A00063O0012033O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
