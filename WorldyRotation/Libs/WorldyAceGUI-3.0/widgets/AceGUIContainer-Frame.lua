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
						Stk[A](Unpack(Stk, A + 1, Top));
					elseif (Enum > 1) then
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
					if (Enum == 3) then
						do
							return;
						end
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
				elseif (Enum > 5) then
					Stk[Inst[2]] = Inst[3];
				else
					local A = Inst[2];
					Stk[A] = Stk[A](Stk[A + 1]);
				end
				VIP = VIP + 1;
			end
		end;
	end
	return Wrap(Deserialize(), {}, vmenv)(...);
end
VMCall("LOL!023O00030A3O006C6F6164737472696E670306202O002O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A4672616D6520436F6E7461696E65720D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C20547970652C2056657273696F6E203D20224672616D65222C2033300D0A6C6F63616C20416365475549203D204C69625374756220616E64204C6962537475622822576F726C64794163654755492D332E30222C2074727565290D0A6966206E6F7420416365475549206F7220284163654755493A47657457696467657456657273696F6E285479706529206F72203029203E3D2056657273696F6E207468656E0D0A2O2072657475726E0D0A656E640D0A0D0A2O2D204C756120415049730D0A6C6F63616C2070616972732C20612O736572742C2074797065203D2070616972732C20612O736572742C20747970650D0A6C6F63616C2077697065203D207461626C652E776970650D0A0D0A2O2D20576F5720415049730D0A6C6F63616C20506C6179536F756E64203D20506C6179536F756E640D0A6C6F63616C204372656174654672616D652C205549506172656E74203D204372656174654672616D652C205549506172656E740D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A536372697074730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E2042752O746F6E5F4F6E436C69636B286672616D65290D0A2O20506C6179536F756E6428372O3929202O2D20534F554E444B49542E47535F5449544C455F4F5054494F4E5F455849540D0A2O206672616D652E6F626A3A4869646528290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204672616D655F4F6E53686F77286672616D65290D0A2O206672616D652E6F626A3A4669726528224F6E53686F7722290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204672616D655F4F6E436C6F7365286672616D65290D0A2O206672616D652E6F626A3A4669726528224F6E436C6F736522290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204672616D655F4F6E4D6F757365446F776E286672616D65290D0A2O204163654755493A436C656172466F63757328290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E205469746C655F4F6E4D6F757365446F776E286672616D65290D0A2O206672616D653A476574506172656E7428293A53746172744D6F76696E6728290D0A2O204163654755493A436C656172466F63757328290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204D6F76657253697A65725F4F6E4D6F7573655570286D6F766572290D0A2O206C6F63616C206672616D65203D206D6F7665723A476574506172656E7428290D0A2O206672616D653A53746F704D6F76696E674F7253697A696E6728290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2053697A657253455F4F6E4D6F757365446F776E286672616D65290D0A2O206672616D653A476574506172656E7428293A537461727453697A696E672822424F2O544F4D524947485422290D0A2O204163654755493A436C656172466F63757328290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2053697A6572535F4F6E4D6F757365446F776E286672616D65290D0A2O206672616D653A476574506172656E7428293A537461727453697A696E672822424F2O544F4D22290D0A2O204163654755493A436C656172466F63757328290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2053697A6572455F4F6E4D6F757365446F776E286672616D65290D0A2O206672616D653A476574506172656E7428293A537461727453697A696E672822524947485422290D0A2O204163654755493A436C656172466F63757328290D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A4D6574686F64730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C206D6574686F6473203D207B0D0A2O205B224F6E41637175697265225D203D2066756E6374696F6E2873656C66290D0A4O2073656C662E6672616D653A536574506172656E74285549506172656E74290D0A4O2073656C662E6672616D653A5365744672616D65537472617461282246552O4C5343522O454E5F4449414C4F4722290D0A4O2073656C662E6672616D653A5365744672616D654C6576656C28312O3029202O2D204C6F7473206F6620722O6F6D20746F206472617720756E6465722069740D0A4O2073656C663A5365745469746C6528290D0A4O206C6F63616C206672616D65203D2073656C662E6672616D650D0A4O2073656C663A536574576964746828332O30290D0A4O2073656C663A53657448656967687428352O30290D0A4O206672616D653A436C656172412O6C506F696E747328290D0A4O206672616D653A536574506F696E74282243454E54455222290D0A4O2073656C663A53686F7728290D0A4O2073656C663A456E61626C65526573697A652874727565290D0A2O20656E642C0D0A0D0A2O205B224F6E5769647468536574225D203D2066756E6374696F6E2873656C662C207769647468290D0A4O206C6F63616C20636F6E74656E74203D2073656C662E636F6E74656E740D0A4O206C6F63616C20636F6E74656E747769647468203D207769647468202D2033340D0A4O20696620636F6E74656E747769647468203C2030207468656E0D0A6O20636F6E74656E747769647468203D20300D0A4O20656E640D0A4O20636F6E74656E743A536574576964746828636F6E74656E747769647468290D0A4O20636F6E74656E742E7769647468203D20636F6E74656E7477696474680D0A2O20656E642C0D0A0D0A2O205B224F6E486569676874536574225D203D2066756E6374696F6E2873656C662C20686569676874290D0A4O206C6F63616C20636F6E74656E74203D2073656C662E636F6E74656E740D0A4O206C6F63616C20636F6E74656E74686569676874203D20686569676874202D2035370D0A4O20696620636F6E74656E74686569676874203C2030207468656E0D0A6O20636F6E74656E74686569676874203D20300D0A4O20656E640D0A4O20636F6E74656E743A53657448656967687428636F6E74656E74686569676874290D0A4O20636F6E74656E742E686569676874203D20636F6E74656E746865696768740D0A2O20656E642C0D0A0D0A2O205B225365745469746C65225D203D2066756E6374696F6E2873656C662C207469746C65290D0A4O2073656C662E7469746C65746578743A53657454657874287469746C65290D0A4O2073656C662E7469746C6562673A53657457696474682O2873656C662E7469746C65746578743A47657457696474682829206F72203029202B203130290D0A2O20656E642C0D0A0D0A2O205B2248696465225D203D2066756E6374696F6E2873656C66290D0A4O2073656C662E6672616D653A4869646528290D0A2O20656E642C0D0A0D0A2O205B2253686F77225D203D2066756E6374696F6E2873656C66290D0A4O2073656C662E6672616D653A53686F7728290D0A2O20656E642C0D0A0D0A2O205B22456E61626C65526573697A65225D203D2066756E6374696F6E2873656C662C207374617465290D0A4O206C6F63616C2066756E63203D20737461746520616E64202253686F7722206F72202248696465220D0A4O2073656C662E73697A65725F73655B66756E635D2873656C662E73697A65725F7365290D0A4O2073656C662E73697A65725F735B66756E635D2873656C662E73697A65725F73290D0A4O2073656C662E73697A65725F655B66756E635D2873656C662E73697A65725F65290D0A2O20656E642C0D0A7D0D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A436F6E7374727563746F720D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C204672616D654261636B64726F70203D207B0D0A2O20626746696C65203D2022496E746572666163652O5C4469616C6F674672616D652O5C55492D4469616C6F67426F782D4261636B67726F756E64222C0D0A2O206564676546696C65203D2022496E746572666163652O5C4469616C6F674672616D652O5C55492D4469616C6F67426F782D426F72646572222C0D0A2O2074696C65203D20747275652C2074696C6553697A65203D2033322C206564676553697A65203D2033322C0D0A2O20696E73657473203D207B206C656674203D20382C207269676874203D20382C20746F70203D20382C20626F2O746F6D203D2038207D0D0A7D0D0A0D0A6C6F63616C2050616E654261636B64726F70203D207B0D0A2O20626746696C65203D2022496E746572666163652O5C436861744672616D652O5C436861744672616D654261636B67726F756E64222C0D0A2O206564676546696C65203D2022496E746572666163652O5C542O6F6C746970732O5C55492D542O6F6C7469702D426F72646572222C0D0A2O2074696C65203D20747275652C2074696C6553697A65203D2031362C206564676553697A65203D2031362C0D0A2O20696E73657473203D207B206C656674203D20332C207269676874203D20332C20746F70203D20352C20626F2O746F6D203D2033207D0D0A7D0D0A0D0A6C6F63616C2066756E6374696F6E20436F6E7374727563746F7228290D0A2O206C6F63616C206672616D65203D204372656174654672616D6528224672616D65222C206E696C2C205549506172656E742C20224261636B64726F7054656D706C61746522290D0A2O206672616D653A4869646528290D0A2O200D0A2O206672616D653A536574436C616D706564546F5363722O656E2874727565290D0A2O206672616D653A456E61626C654D6F7573652874727565290D0A2O206672616D653A5365744D6F7661626C652874727565290D0A2O206672616D653A536574526573697A61626C652874727565290D0A2O206672616D653A5365744672616D65537472617461282246552O4C5343522O454E5F4449414C4F4722290D0A2O206672616D653A5365744672616D654C6576656C28312O3029202O2D204C6F7473206F6620722O6F6D20746F206472617720756E6465722069740D0A2O206672616D653A5365744261636B64726F70284672616D654261636B64726F70290D0A2O206672616D653A5365744261636B64726F70436F6C6F7228302C20302C20302C2031290D0A2O206966206672616D652E536574526573697A65426F756E6473207468656E0D0A4O202O2D20576F572031302E300D0A4O206672616D653A536574526573697A65426F756E647328332O302C20332O30290D0A2O20656C73650D0A4O206672616D653A5365744D696E526573697A6528332O302C20332O30290D0A2O20656E640D0A2O206672616D653A536574546F706C6576656C2874727565290D0A2O206672616D653A53657453637269707428224F6E53686F77222C204672616D655F4F6E53686F77290D0A2O206672616D653A53657453637269707428224F6E48696465222C204672616D655F4F6E436C6F7365290D0A2O206672616D653A53657453637269707428224F6E4D6F757365446F776E222C204672616D655F4F6E4D6F757365446F776E290D0A0D0A2O206C6F63616C20636C6F736562752O746F6E203D204372656174654672616D65282242752O746F6E222C206E696C2C206672616D652C2022554950616E656C42752O746F6E54656D706C61746522290D0A2O20636C6F736562752O746F6E3A53657453637269707428224F6E436C69636B222C2042752O746F6E5F4F6E436C69636B290D0A2O20636C6F736562752O746F6E3A536574506F696E742822424F2O544F4D5249474854222C202D32372C203137290D0A2O20636C6F736562752O746F6E3A536574486569676874283230290D0A2O20636C6F736562752O746F6E3A536574576964746828312O30290D0A2O20636C6F736562752O746F6E3A5365745465787428434C4F5345290D0A0D0A2O206C6F63616C207469746C656267203D206672616D653A43726561746554657874757265286E696C2C20224F5645524C415922290D0A2O207469746C6562673A536574546578747572652831333130383029202O2D20496E746572666163652O5C4469616C6F674672616D652O5C55492D4469616C6F67426F782D4865616465720D0A2O207469746C6562673A536574546578432O6F726428302E33312C20302E36372C20302C20302E3633290D0A2O207469746C6562673A536574506F696E742822544F50222C20302C203132290D0A2O207469746C6562673A536574576964746828312O30290D0A2O207469746C6562673A536574486569676874283430290D0A0D0A2O206C6F63616C207469746C65203D204372656174654672616D6528224672616D65222C206E696C2C206672616D65290D0A2O207469746C653A456E61626C654D6F7573652874727565290D0A2O207469746C653A53657453637269707428224F6E4D6F757365446F776E222C205469746C655F4F6E4D6F757365446F776E290D0A2O207469746C653A53657453637269707428224F6E4D6F7573655570222C204D6F76657253697A65725F4F6E4D6F7573655570290D0A2O207469746C653A536574412O6C506F696E7473287469746C656267290D0A0D0A2O206C6F63616C207469746C6574657874203D207469746C653A437265617465466F6E74537472696E67286E696C2C20224F5645524C4159222C202247616D65466F6E744E6F726D616C22290D0A2O207469746C65746578743A536574506F696E742822544F50222C207469746C6562672C2022544F50222C20302C202D3134290D0A0D0A2O206C6F63616C207469746C6562675F6C203D206672616D653A43726561746554657874757265286E696C2C20224F5645524C415922290D0A2O207469746C6562675F6C3A536574546578747572652831333130383029202O2D20496E746572666163652O5C4469616C6F674672616D652O5C55492D4469616C6F67426F782D4865616465720D0A2O207469746C6562675F6C3A536574546578432O6F726428302E32312C20302E33312C20302C20302E3633290D0A2O207469746C6562675F6C3A536574506F696E7428225249474854222C207469746C6562672C20224C45465422290D0A2O207469746C6562675F6C3A5365745769647468283330290D0A2O207469746C6562675F6C3A536574486569676874283430290D0A0D0A2O206C6F63616C207469746C6562675F72203D206672616D653A43726561746554657874757265286E696C2C20224F5645524C415922290D0A2O207469746C6562675F723A536574546578747572652831333130383029202O2D20496E746572666163652O5C4469616C6F674672616D652O5C55492D4469616C6F67426F782D4865616465720D0A2O207469746C6562675F723A536574546578432O6F726428302E36372C20302E2O372C20302C20302E3633290D0A2O207469746C6562675F723A536574506F696E7428224C454654222C207469746C6562672C2022524947485422290D0A2O207469746C6562675F723A5365745769647468283330290D0A2O207469746C6562675F723A536574486569676874283430290D0A0D0A2O206C6F63616C2073697A65725F7365203D204372656174654672616D6528224672616D65222C206E696C2C206672616D65290D0A2O2073697A65725F73653A536574506F696E742822424F2O544F4D524947485422290D0A2O2073697A65725F73653A5365745769647468283235290D0A2O2073697A65725F73653A536574486569676874283235290D0A2O2073697A65725F73653A456E61626C654D6F75736528290D0A2O2073697A65725F73653A53657453637269707428224F6E4D6F757365446F776E222C2053697A657253455F4F6E4D6F757365446F776E290D0A2O2073697A65725F73653A53657453637269707428224F6E4D6F7573655570222C204D6F76657253697A65725F4F6E4D6F7573655570290D0A0D0A2O206C6F63616C206C696E6531203D2073697A65725F73653A43726561746554657874757265286E696C2C20224241434B47524F554E4422290D0A2O206C696E65313A5365745769647468283134290D0A2O206C696E65313A536574486569676874283134290D0A2O206C696E65313A536574506F696E742822424F2O544F4D5249474854222C202D382C2038290D0A2O206C696E65313A536574546578747572652831333730353729202O2D20496E746572666163652O5C542O6F6C746970732O5C55492D542O6F6C7469702D426F726465720D0A2O206C6F63616C2078203D20302E31202A203134202F2031370D0A2O206C696E65313A536574546578432O6F726428302E3035202D20782C20302E352C20302E30352C20302E35202B20782C20302E30352C20302E35202D20782C20302E35202B20782C20302E35290D0A0D0A2O206C6F63616C206C696E6532203D2073697A65725F73653A43726561746554657874757265286E696C2C20224241434B47524F554E4422290D0A2O206C696E65323A53657457696474682838290D0A2O206C696E65323A5365744865696768742838290D0A2O206C696E65323A536574506F696E742822424F2O544F4D5249474854222C202D382C2038290D0A2O206C696E65323A536574546578747572652831333730353729202O2D20496E746572666163652O5C542O6F6C746970732O5C55492D542O6F6C7469702D426F726465720D0A2O2078203D20302E31202A2038202F2031370D0A2O206C696E65323A536574546578432O6F726428302E3035202D20782C20302E352C20302E30352C20302E35202B20782C20302E30352C20302E35202D20782C20302E35202B20782C20302E35290D0A0D0A2O206C6F63616C2073697A65725F73203D204372656174654672616D6528224672616D65222C206E696C2C206672616D65290D0A2O2073697A65725F733A536574506F696E742822424F2O544F4D5249474854222C202D32352C2030290D0A2O2073697A65725F733A536574506F696E742822424F2O544F4D4C45465422290D0A2O2073697A65725F733A536574486569676874283235290D0A2O2073697A65725F733A456E61626C654D6F7573652874727565290D0A2O2073697A65725F733A53657453637269707428224F6E4D6F757365446F776E222C2053697A6572535F4F6E4D6F757365446F776E290D0A2O2073697A65725F733A53657453637269707428224F6E4D6F7573655570222C204D6F76657253697A65725F4F6E4D6F7573655570290D0A0D0A2O206C6F63616C2073697A65725F65203D204372656174654672616D6528224672616D65222C206E696C2C206672616D65290D0A2O2073697A65725F653A536574506F696E742822424F2O544F4D5249474854222C20302C203235290D0A2O2073697A65725F653A536574506F696E742822544F50524947485422290D0A2O2073697A65725F653A5365745769647468283235290D0A2O2073697A65725F653A456E61626C654D6F7573652874727565290D0A2O2073697A65725F653A53657453637269707428224F6E4D6F757365446F776E222C2053697A6572455F4F6E4D6F757365446F776E290D0A2O2073697A65725F653A53657453637269707428224F6E4D6F7573655570222C204D6F76657253697A65725F4F6E4D6F7573655570290D0A0D0A2O202O2D436F6E7461696E65722053752O706F72740D0A2O206C6F63616C20636F6E74656E74203D204372656174654672616D6528224672616D65222C206E696C2C206672616D65290D0A2O20636F6E74656E743A536574506F696E742822544F504C454654222C2031372C202D3237290D0A2O20636F6E74656E743A536574506F696E742822424F2O544F4D5249474854222C202D31372C203430290D0A0D0A2O206C6F63616C20776964676574203D207B0D0A4O207469746C6574657874203D207469746C65746578742C0D0A4O207469746C656267203D207469746C6562672C0D0A4O2073697A65725F7365203D2073697A65725F73652C0D0A4O2073697A65725F73203D2073697A65725F732C0D0A4O2073697A65725F65203D2073697A65725F652C0D0A4O20636F6E74656E74203D20636F6E74656E742C0D0A4O206672616D65203D206672616D652C0D0A4O2074797065203D20547970650D0A2O207D0D0A2O20666F72206D6574686F642C2066756E6320696E207061697273286D6574686F64732920646F0D0A4O207769646765745B6D6574686F645D203D2066756E630D0A2O20656E640D0A2O20636C6F736562752O746F6E2E6F626A203D207769646765740D0A0D0A2O2072657475726E204163654755493A52656769737465724173436F6E7461696E657228776964676574290D0A656E640D0A0D0A4163654755493A52656769737465725769646765745479706528547970652C20436F6E7374727563746F722C2056657273696F6E290D0A00063O0012043O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
