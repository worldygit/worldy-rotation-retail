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
						Stk[Inst[2]] = Inst[3];
					elseif (Enum == 1) then
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
					else
						local A = Inst[2];
						Stk[A](Unpack(Stk, A + 1, Top));
					end
				elseif (Enum <= 4) then
					if (Enum == 3) then
						local A = Inst[2];
						Top = (A + Varargsz) - 1;
						for Idx = A, Top do
							local VA = Vararg[Idx - A];
							Stk[Idx] = VA;
						end
					else
						local A = Inst[2];
						Stk[A] = Stk[A](Stk[A + 1]);
					end
				elseif (Enum > 5) then
					if ((Inst[3] == "_ENV") or (Inst[3] == "getfenv")) then
						Stk[Inst[2]] = Env;
					else
						Stk[Inst[2]] = Env[Inst[3]];
					end
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
VMCall("LOL!023O00030A3O006C6F6164737472696E6703A4202O002O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A536C69646572205769646765740D0A47726170686963616C20536C696465722C206C696B652C20666F722052616E67652076616C7565732E0D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C20547970652C2056657273696F6E203D2022536C69646572222C2032330D0A6C6F63616C20416365475549203D204C69625374756220616E64204C6962537475622822576F726C64794163654755492D332E30222C2074727565290D0A6966206E6F7420416365475549206F7220284163654755493A47657457696467657456657273696F6E285479706529206F72203029203E3D2056657273696F6E207468656E2072657475726E20656E640D0A0D0A2O2D204C756120415049730D0A6C6F63616C206D696E2C206D61782C20666C2O6F72203D206D6174682E6D696E2C206D6174682E6D61782C206D6174682E666C2O6F720D0A6C6F63616C20746F6E756D6265722C207061697273203D20746F6E756D6265722C2070616972730D0A0D0A2O2D20576F5720415049730D0A6C6F63616C20506C6179536F756E64203D20506C6179536F756E640D0A6C6F63616C204372656174654672616D652C205549506172656E74203D204372656174654672616D652C205549506172656E740D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A53752O706F72742066756E6374696F6E730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E20557064617465546578742873656C66290D0A096C6F63616C2076616C7565203D2073656C662E76616C7565206F7220300D0A0969662073656C662E697370657263656E74207468656E0D0A2O0973656C662E65646974626F783A536574546578742O282225732O2522293A666F726D617428666C2O6F722876616C7565202A20313O30202B20302E3529202F2031302O290D0A09656C73650D0A2O0973656C662E65646974626F783A5365745465787428666C2O6F722876616C7565202A20312O30202B20302E3529202F20312O30290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E205570646174654C6162656C732873656C66290D0A096C6F63616C206D696E5F76616C75652C206D61785F76616C7565203D202873656C662E6D696E206F722030292C202873656C662E6D6178206F7220312O30290D0A0969662073656C662E697370657263656E74207468656E0D0A2O0973656C662E6C6F77746578743A536574466F726D612O74656454657874282225732O25222C20286D696E5F76616C7565202A20312O302O290D0A2O0973656C662E68696768746578743A536574466F726D612O74656454657874282225732O25222C20286D61785F76616C7565202A20312O302O290D0A09656C73650D0A2O0973656C662E6C6F77746578743A53657454657874286D696E5F76616C7565290D0A2O0973656C662E68696768746578743A53657454657874286D61785F76616C7565290D0A09656E640D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A536372697074730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E20436F6E74726F6C5F4F6E456E746572286672616D65290D0A096672616D652E6F626A3A4669726528224F6E456E74657222290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20436F6E74726F6C5F4F6E4C65617665286672616D65290D0A096672616D652E6F626A3A4669726528224F6E4C6561766522290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204672616D655F4F6E4D6F757365446F776E286672616D65290D0A096672616D652E6F626A2E736C696465723A456E61626C654D6F75736557682O656C2874727565290D0A094163654755493A436C656172466F63757328290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20536C696465725F4F6E56616C75654368616E676564286672616D652C206E657776616C7565290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A096966206E6F74206672616D652E7365747570207468656E0D0A2O0969662073656C662E7374657020616E642073656C662E73746570203E2030207468656E0D0A3O096C6F63616C206D696E5F76616C7565203D2073656C662E6D696E206F7220300D0A3O096E657776616C7565203D20666C2O6F722O286E657776616C7565202D206D696E5F76616C756529202F2073656C662E73746570202B20302E3529202A2073656C662E73746570202B206D696E5F76616C75650D0A2O09656E640D0A2O096966206E657776616C7565207E3D2073656C662E76616C756520616E64206E6F742073656C662E64697361626C6564207468656E0D0A3O0973656C662E76616C7565203D206E657776616C75650D0A3O0973656C663A4669726528224F6E56616C75654368616E676564222C206E657776616C7565290D0A2O09656E640D0A2O0969662073656C662E76616C7565207468656E0D0A3O09557064617465546578742873656C66290D0A2O09656E640D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20536C696465725F4F6E4D6F7573655570286672616D65290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A0973656C663A4669726528224F6E4D6F7573655570222C2073656C662E76616C7565290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20536C696465725F4F6E4D6F75736557682O656C286672616D652C2076290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A096966206E6F742073656C662E64697361626C6564207468656E0D0A2O096C6F63616C2076616C7565203D2073656C662E76616C75650D0A2O0969662076203E2030207468656E0D0A3O0976616C7565203D206D696E2876616C7565202B202873656C662E73746570206F722031292C2073656C662E6D6178290D0A2O09656C73650D0A3O0976616C7565203D206D61782876616C7565202D202873656C662E73746570206F722031292C2073656C662E6D696E290D0A2O09656E640D0A2O0973656C662E736C696465723A53657456616C75652876616C7565290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E4573636170655072652O736564286672616D65290D0A096672616D653A436C656172466F63757328290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E456E7465725072652O736564286672616D65290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A096C6F63616C2076616C7565203D206672616D653A4765745465787428290D0A0969662073656C662E697370657263656E74207468656E0D0A2O0976616C7565203D2076616C75653A6773756228272O25272C202O27290D0A2O0976616C7565203D20746F6E756D6265722876616C756529202F20312O300D0A09656C73650D0A2O0976616C7565203D20746F6E756D6265722876616C7565290D0A09656E640D0A0D0A0969662076616C7565207468656E0D0A2O09506C6179536F756E642838353629202O2D20534F554E444B49542E49475F4D41494E4D454E555F4F5054494F4E5F434845434B424F585F4F4E0D0A2O0973656C662E736C696465723A53657456616C75652876616C7565290D0A2O0973656C663A4669726528224F6E4D6F7573655570222C2076616C7565290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E456E746572286672616D65290D0A096672616D653A5365744261636B64726F70426F72646572436F6C6F7228302E352C20302E352C20302E352C2031290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E4C65617665286672616D65290D0A096672616D653A5365744261636B64726F70426F72646572436F6C6F7228302E332C20302E332C20302E332C20302E38290D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A4D6574686F64730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C206D6574686F6473203D207B0D0A095B224F6E41637175697265225D203D2066756E6374696F6E2873656C66290D0A2O0973656C663A536574576964746828322O30290D0A2O0973656C663A536574486569676874282O34290D0A2O0973656C663A53657444697361626C65642866616C7365290D0A2O0973656C663A536574497350657263656E74286E696C290D0A2O0973656C663A536574536C6964657256616C75657328302C312O302C31290D0A2O0973656C663A53657456616C75652830290D0A2O0973656C662E736C696465723A456E61626C654D6F75736557682O656C2866616C7365290D0A09656E642C0D0A0D0A092O2D205B224F6E52656C65617365225D203D206E696C2C0D0A0D0A095B2253657444697361626C6564225D203D2066756E6374696F6E2873656C662C2064697361626C6564290D0A2O0973656C662E64697361626C6564203D2064697361626C65640D0A2O0969662064697361626C6564207468656E0D0A3O0973656C662E736C696465723A456E61626C654D6F7573652866616C7365290D0A3O0973656C662E6C6162656C3A53657454657874436F6C6F72282E352C202E352C202E35290D0A3O0973656C662E68696768746578743A53657454657874436F6C6F72282E352C202E352C202E35290D0A3O0973656C662E6C6F77746578743A53657454657874436F6C6F72282E352C202E352C202E35290D0A3O092O2D73656C662E76616C7565746578743A53657454657874436F6C6F72282E352C202E352C202E35290D0A3O0973656C662E65646974626F783A53657454657874436F6C6F72282E352C202E352C202E35290D0A3O0973656C662E65646974626F783A456E61626C654D6F7573652866616C7365290D0A3O0973656C662E65646974626F783A436C656172466F63757328290D0A2O09656C73650D0A3O0973656C662E736C696465723A456E61626C654D6F7573652874727565290D0A3O0973656C662E6C6162656C3A53657454657874436F6C6F7228312C202E38322C2030290D0A3O0973656C662E68696768746578743A53657454657874436F6C6F7228312C20312C2031290D0A3O0973656C662E6C6F77746578743A53657454657874436F6C6F7228312C20312C2031290D0A3O092O2D73656C662E76616C7565746578743A53657454657874436F6C6F7228312C20312C2031290D0A3O0973656C662E65646974626F783A53657454657874436F6C6F7228312C20312C2031290D0A3O0973656C662E65646974626F783A456E61626C654D6F7573652874727565290D0A2O09656E640D0A09656E642C0D0A0D0A095B2253657456616C7565225D203D2066756E6374696F6E2873656C662C2076616C7565290D0A2O0973656C662E736C696465722E7365747570203D20747275650D0A2O0973656C662E736C696465723A53657456616C75652876616C7565290D0A2O0973656C662E76616C7565203D2076616C75650D0A2O09557064617465546578742873656C66290D0A2O0973656C662E736C696465722E7365747570203D206E696C0D0A09656E642C0D0A0D0A095B2247657456616C7565225D203D2066756E6374696F6E2873656C66290D0A2O0972657475726E2073656C662E76616C75650D0A09656E642C0D0A0D0A095B225365744C6162656C225D203D2066756E6374696F6E2873656C662C2074657874290D0A2O0973656C662E6C6162656C3A536574546578742874657874290D0A09656E642C0D0A0D0A095B22536574536C6964657256616C756573225D203D2066756E6374696F6E2873656C662C206D696E5F76616C75652C206D61785F76616C75652C2073746570290D0A2O096C6F63616C206672616D65203D2073656C662E736C696465720D0A2O096672616D652E7365747570203D20747275650D0A2O0973656C662E6D696E203D206D696E5F76616C75650D0A2O0973656C662E6D6178203D206D61785F76616C75650D0A2O0973656C662E73746570203D20737465700D0A2O096672616D653A5365744D696E4D617856616C756573286D696E5F76616C7565206F7220302C6D61785F76616C7565206F7220312O30290D0A2O095570646174654C6162656C732873656C66290D0A2O096672616D653A53657456616C7565537465702873746570206F722031290D0A2O0969662073656C662E76616C7565207468656E0D0A3O096672616D653A53657456616C75652873656C662E76616C7565290D0A2O09656E640D0A2O096672616D652E7365747570203D206E696C0D0A09656E642C0D0A0D0A095B22536574497350657263656E74225D203D2066756E6374696F6E2873656C662C2076616C7565290D0A2O0973656C662E697370657263656E74203D2076616C75650D0A2O095570646174654C6162656C732873656C66290D0A2O09557064617465546578742873656C66290D0A09656E640D0A7D0D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A436F6E7374727563746F720D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C20536C696465724261636B64726F702O203D207B0D0A09626746696C65203D2022496E746572666163652O5C42752O746F6E732O5C55492D536C696465724261722D4261636B67726F756E64222C0D0A096564676546696C65203D2022496E746572666163652O5C42752O746F6E732O5C55492D536C696465724261722D426F72646572222C0D0A0974696C65203D20747275652C2074696C6553697A65203D20382C206564676553697A65203D20382C0D0A09696E73657473203D207B206C656674203D20332C207269676874203D20332C20746F70203D20362C20626F2O746F6D203D2036207D0D0A7D0D0A0D0A6C6F63616C204D616E75616C4261636B64726F70203D207B0D0A09626746696C65203D2022496E746572666163652O5C436861744672616D652O5C436861744672616D654261636B67726F756E64222C0D0A096564676546696C65203D2022496E746572666163652O5C436861744672616D652O5C436861744672616D654261636B67726F756E64222C0D0A0974696C65203D20747275652C206564676553697A65203D20312C2074696C6553697A65203D20352C0D0A7D0D0A0D0A6C6F63616C2066756E6374696F6E20436F6E7374727563746F7228290D0A096C6F63616C206672616D65203D204372656174654672616D6528224672616D65222C206E696C2C205549506172656E74290D0A0D0A096672616D653A456E61626C654D6F7573652874727565290D0A096672616D653A53657453637269707428224F6E4D6F757365446F776E222C204672616D655F4F6E4D6F757365446F776E290D0A0D0A096C6F63616C206C6162656C203D206672616D653A437265617465466F6E74537472696E67286E696C2C20224F5645524C4159222C202247616D65466F6E744E6F726D616C22290D0A096C6162656C3A536574506F696E742822544F504C45465422290D0A096C6162656C3A536574506F696E742822544F50524947485422290D0A096C6162656C3A5365744A75737469667948282243454E54455222290D0A096C6162656C3A536574486569676874283135290D0A0D0A096C6F63616C20736C69646572203D204372656174654672616D652822536C69646572222C206E696C2C206672616D652C20224261636B64726F7054656D706C61746522290D0A09736C696465723A5365744F7269656E746174696F6E2822484F52495A4F4E54414C22290D0A09736C696465723A536574486569676874283135290D0A09736C696465723A53657448697452656374496E7365747328302C20302C202D31302C2030290D0A09736C696465723A5365744261636B64726F7028536C696465724261636B64726F70290D0A09736C696465723A5365745468756D62546578747572652822496E746572666163652O5C42752O746F6E732O5C55492D536C696465724261722D42752O746F6E2D486F72697A6F6E74616C22290D0A09736C696465723A536574506F696E742822544F50222C206C6162656C2C2022424F2O544F4D22290D0A09736C696465723A536574506F696E7428224C454654222C20332C2030290D0A09736C696465723A536574506F696E7428225249474854222C202D332C2030290D0A09736C696465723A53657456616C75652830290D0A09736C696465723A53657453637269707428224F6E56616C75654368616E676564222C536C696465725F4F6E56616C75654368616E676564290D0A09736C696465723A53657453637269707428224F6E456E746572222C20436F6E74726F6C5F4F6E456E746572290D0A09736C696465723A53657453637269707428224F6E4C65617665222C20436F6E74726F6C5F4F6E4C65617665290D0A09736C696465723A53657453637269707428224F6E4D6F7573655570222C20536C696465725F4F6E4D6F7573655570290D0A09736C696465723A53657453637269707428224F6E4D6F75736557682O656C222C20536C696465725F4F6E4D6F75736557682O656C290D0A0D0A096C6F63616C206C6F7774657874203D20736C696465723A437265617465466F6E74537472696E67286E696C2C2022415254574F524B222C202247616D65466F6E74486967686C69676874536D612O6C22290D0A096C6F77746578743A536574506F696E742822544F504C454654222C20736C696465722C2022424F2O544F4D4C454654222C20322C2033290D0A0D0A096C6F63616C206869676874657874203D20736C696465723A437265617465466F6E74537472696E67286E696C2C2022415254574F524B222C202247616D65466F6E74486967686C69676874536D612O6C22290D0A0968696768746578743A536574506F696E742822544F505249474854222C20736C696465722C2022424F2O544F4D5249474854222C202D322C2033290D0A0D0A096C6F63616C2065646974626F78203D204372656174654672616D65282245646974426F78222C206E696C2C206672616D652C20224261636B64726F7054656D706C61746522290D0A0965646974626F783A5365744175746F466F6375732866616C7365290D0A0965646974626F783A536574466F6E744F626A6563742847616D65466F6E74486967686C69676874536D612O6C290D0A0965646974626F783A536574506F696E742822544F50222C20736C696465722C2022424F2O544F4D22290D0A0965646974626F783A536574486569676874283134290D0A0965646974626F783A5365745769647468283730290D0A0965646974626F783A5365744A75737469667948282243454E54455222290D0A0965646974626F783A456E61626C654D6F7573652874727565290D0A0965646974626F783A5365744261636B64726F70284D616E75616C4261636B64726F70290D0A0965646974626F783A5365744261636B64726F70436F6C6F7228302C20302C20302C20302E35290D0A0965646974626F783A5365744261636B64726F70426F72646572436F6C6F7228302E332C20302E332C20302E33302C20302E3830290D0A0965646974626F783A53657453637269707428224F6E456E746572222C2045646974426F785F4F6E456E746572290D0A0965646974626F783A53657453637269707428224F6E4C65617665222C2045646974426F785F4F6E4C65617665290D0A0965646974626F783A53657453637269707428224F6E456E7465725072652O736564222C2045646974426F785F4F6E456E7465725072652O736564290D0A0965646974626F783A53657453637269707428224F6E4573636170655072652O736564222C2045646974426F785F4F6E4573636170655072652O736564290D0A0D0A096C6F63616C20776964676574203D207B0D0A2O096C6162656C7O203D206C6162656C2C0D0A2O09736C696465726O203D20736C696465722C0D0A2O096C6F77746578745O203D206C6F77746578742C0D0A2O0968696768746578744O203D2068696768746578742C0D0A2O0965646974626F785O203D2065646974626F782C0D0A2O09616C69676E6F2O66736574203D2032352C0D0A2O096672616D657O203D206672616D652C0D0A2O09747970658O203D20547970650D0A097D0D0A09666F72206D6574686F642C2066756E6320696E207061697273286D6574686F64732920646F0D0A2O097769646765745B6D6574686F645D203D2066756E630D0A09656E640D0A09736C696465722E6F626A2C2065646974626F782E6F626A203D207769646765742C207769646765740D0A0D0A0972657475726E204163654755493A5265676973746572417357696467657428776964676574290D0A656E640D0A0D0A4163654755493A52656769737465725769646765745479706528547970652C436F6E7374727563746F722C56657273696F6E290D0A00063O0012013O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
