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
						Stk[Inst[2]] = Inst[3];
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
				elseif (Enum == 5) then
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
				VIP = VIP + 1;
			end
		end;
	end
	return Wrap(Deserialize(), {}, vmenv)(...);
end
VMCall("LOL!023O00030A3O006C6F6164737472696E6703A6202O006C6F63616C20612O646F6E4E616D65203D203O2E0D0A0D0A6C6F63616C20617069203D2057522E6170690D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C20706574203D20756E69742E7065740D0A0D0A6C6F63616C206576656E744672616D65203D204372656174654672616D6528224672616D65222C20612O646F6E4E616D65202O2E20225F4576656E744672616D65222C205549506172656E74290D0A6C6F63616C2068616E646C657273203D207B7D0D0A6C6F63616C20636F6D62617448616E646C657273203D207B7D0D0A6C6F63616C2073656C66436F6D62617448616E646C657273203D207B7D0D0A6C6F63616C20706574436F6D62617448616E646C657273203D207B7D0D0A6C6F63616C20707265666978436F6D62617448616E646C657273203D207B7D0D0A6C6F63616C2073752O666978436F6D62617448616E646C657273203D207B7D0D0A6C6F63616C20636F6D6261745072656669786573203D207B0D0A2O2022454E5649524F4E4D454E54414C222C0D0A2O202252414E4745222C0D0A2O20225350452O4C5F4255494C44494E47222C0D0A2O20225350452O4C5F504552494F444943222C0D0A2O20225350452O4C222C0D0A2O20225357494E47220D0A7D0D0A6C6F63616C20636F6D6261745072656669786573436F756E74203D2023636F6D62617450726566697865730D0A0D0A66756E6374696F6E206170693A5265676973746572466F724576656E742868616E646C65722C203O2E290D0A2O206C6F63616C206576656E74735461626C65203D207B203O2E207D0D0A2O20666F722069203D20312C20236576656E74735461626C6520646F0D0A4O206C6F63616C206576656E74203D206576656E74735461626C655B695D0D0A4O206966206E6F742068616E646C6572735B6576656E745D207468656E0D0A6O2068616E646C6572735B6576656E745D203D207B2068616E646C6572207D0D0A6O206576656E744672616D653A52656769737465724576656E74286576656E74290D0A4O20656C73650D0A6O207461626C652E696E736572742868616E646C6572735B6576656E745D2C2068616E646C6572290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A556E7265676973746572466F724576656E742868616E646C65722C206576656E74290D0A2O2069662068616E646C6572735B6576656E745D207468656E0D0A4O20666F7220696E6465782C20666E20696E2070616972732868616E646C6572735B6576656E745D2920646F0D0A6O20696620666E202O3D2068616E646C6572207468656E0D0A8O207461626C652E72656D6F76652868616E646C6572735B6576656E745D2C20696E646578290D0A8O206966202368616E646C6572735B6576656E745D202O3D2030207468656E0D0A9O20206576656E744672616D653A556E72656769737465724576656E74286576656E74290D0A8O20656E640D0A8O2072657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6576656E744672616D653A53657453637269707428224F6E4576656E74222C0D0A2O2066756E6374696F6E2873656C662C206576656E742C203O2E290D0A4O20666F72205F2C2068616E646C657220696E2070616972732868616E646C6572735B6576656E745D2920646F0D0A6O2068616E646C6572286576656E742C203O2E290D0A4O20656E640D0A2O20656E640D0A290D0A0D0A66756E6374696F6E206170693A5265676973746572466F72436F6D6261744576656E742868616E646C65722C203O2E290D0A2O206C6F63616C206576656E74735461626C65203D207B203O2E207D0D0A2O20666F722069203D20312C20236576656E74735461626C6520646F0D0A4O206C6F63616C206576656E74203D206576656E74735461626C655B695D0D0A4O206966206E6F7420636F6D62617448616E646C6572735B6576656E745D207468656E0D0A6O20636F6D62617448616E646C6572735B6576656E745D203D207B2068616E646C6572207D0D0A4O20656C73650D0A6O207461626C652E696E7365727428636F6D62617448616E646C6572735B6576656E745D2C2068616E646C6572290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A5265676973746572466F7253656C66436F6D6261744576656E742868616E646C65722C203O2E290D0A2O206C6F63616C206576656E74735461626C65203D207B203O2E207D0D0A2O20666F722069203D20312C20236576656E74735461626C6520646F0D0A4O206C6F63616C206576656E74203D206576656E74735461626C655B695D0D0A4O206966206E6F742073656C66436F6D62617448616E646C6572735B6576656E745D207468656E0D0A6O2073656C66436F6D62617448616E646C6572735B6576656E745D203D207B2068616E646C6572207D0D0A4O20656C73650D0A6O207461626C652E696E736572742873656C66436F6D62617448616E646C6572735B6576656E745D2C2068616E646C6572290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A5265676973746572466F72506574436F6D6261744576656E742868616E646C65722C203O2E290D0A2O206C6F63616C206576656E74735461626C65203D207B203O2E207D0D0A2O20666F722069203D20312C20236576656E74735461626C6520646F0D0A4O206C6F63616C206576656E74203D206576656E74735461626C655B695D0D0A4O206966206E6F7420706574436F6D62617448616E646C6572735B6576656E745D207468656E0D0A6O20706574436F6D62617448616E646C6572735B6576656E745D203D207B2068616E646C6572207D0D0A4O20656C73650D0A6O207461626C652E696E7365727428706574436F6D62617448616E646C6572735B6576656E745D2C2068616E646C6572290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A5265676973746572466F72436F6D6261745072656669784576656E742868616E646C65722C203O2E290D0A2O206C6F63616C206576656E74735461626C65203D207B203O2E207D0D0A2O20666F722069203D20312C20236576656E74735461626C6520646F0D0A4O206C6F63616C206576656E74203D206576656E74735461626C655B695D0D0A4O206966206E6F7420707265666978436F6D62617448616E646C6572735B6576656E745D207468656E0D0A6O20707265666978436F6D62617448616E646C6572735B6576656E745D203D207B2068616E646C6572207D0D0A4O20656C73650D0A6O207461626C652E696E7365727428707265666978436F6D62617448616E646C6572735B6576656E745D2C2068616E646C6572290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A5265676973746572466F72436F6D62617453752O6669784576656E742868616E646C65722C203O2E290D0A2O206C6F63616C206576656E74735461626C65203D207B203O2E207D0D0A2O20666F722069203D20312C20236576656E74735461626C6520646F0D0A4O206C6F63616C206576656E74203D206576656E74735461626C655B695D0D0A4O206966206E6F742073752O666978436F6D62617448616E646C6572735B6576656E745D207468656E0D0A6O2073752O666978436F6D62617448616E646C6572735B6576656E745D203D207B2068616E646C6572207D0D0A4O20656C73650D0A6O207461626C652E696E736572742873752O666978436F6D62617448616E646C6572735B6576656E745D2C2068616E646C6572290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A556E7265676973746572466F72436F6D6261744576656E742868616E646C65722C206576656E74290D0A2O20696620636F6D62617448616E646C6572735B6576656E745D207468656E0D0A4O20666F7220696E6465782C20666E20696E20706169727328636F6D62617448616E646C6572735B6576656E745D2920646F0D0A6O20696620666E202O3D2068616E646C6572207468656E0D0A8O207461626C652E72656D6F766528636F6D62617448616E646C6572735B6576656E745D2C20696E646578290D0A8O2072657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A556E7265676973746572466F7253656C66436F6D6261744576656E742868616E646C65722C206576656E74290D0A2O2069662073656C66436F6D62617448616E646C6572735B6576656E745D207468656E0D0A4O20666F7220696E6465782C20666E20696E2070616972732873656C66436F6D62617448616E646C6572735B6576656E745D2920646F0D0A6O20696620666E202O3D2068616E646C6572207468656E0D0A8O207461626C652E72656D6F76652873656C66436F6D62617448616E646C6572735B6576656E745D2C20696E646578290D0A8O2072657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A556E7265676973746572466F72506574436F6D6261744576656E742868616E646C65722C206576656E74290D0A2O20696620706574436F6D62617448616E646C6572735B6576656E745D207468656E0D0A4O20666F7220696E6465782C20666E20696E20706169727328706574436F6D62617448616E646C6572735B6576656E745D2920646F0D0A6O20696620666E202O3D2068616E646C6572207468656E0D0A8O207461626C652E72656D6F766528706574436F6D62617448616E646C6572735B6576656E745D2C20696E646578290D0A8O2072657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A556E7265676973746572466F72436F6D6261745072656669784576656E742868616E646C65722C206576656E74290D0A2O20696620707265666978436F6D62617448616E646C6572735B6576656E745D207468656E0D0A4O20666F7220696E6465782C20666E20696E20706169727328707265666978436F6D62617448616E646C6572735B6576656E745D2920646F0D0A6O20696620666E202O3D2068616E646C6572207468656E0D0A8O207461626C652E72656D6F766528707265666978436F6D62617448616E646C6572732C20696E646578290D0A8O2072657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A556E7265676973746572466F72436F6D62617453752O6669784576656E742868616E646C65722C206576656E74290D0A2O2069662073752O666978436F6D62617448616E646C6572735B6576656E745D207468656E0D0A4O20666F7220696E6465782C20666E20696E2070616972732873752O666978436F6D62617448616E646C6572735B6576656E745D2920646F0D0A6O20696620666E202O3D2068616E646C6572207468656E0D0A8O207461626C652E72656D6F76652873752O666978436F6D62617448616E646C6572735B6576656E745D2C20696E646578290D0A8O2072657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204C697374656E6572436F6D6261744C6F674576656E74556E66696C7465726564286576656E742C2074696D655374616D702C207375624576656E742C203O2E290D0A2O20696620636F6D62617448616E646C6572735B7375624576656E745D207468656E0D0A4O202O2D20556E66696C746572656420436F6D626174204C6F670D0A4O20666F72205F2C2068616E646C657220696E20706169727328636F6D62617448616E646C6572735B7375624576656E745D2920646F0D0A6O2068616E646C65722874696D655374616D702C207375624576656E742C203O2E290D0A4O20656E640D0A2O20656E640D0A2O2069662073656C66436F6D62617448616E646C6572735B7375624576656E745D207468656E0D0A4O202O2D20556E66696C746572656420436F6D626174204C6F67207769746820536F7572636547554944202O3D20506C61796572475549442066696C7465720D0A4O2069662073656C65637428322C203O2E29202O3D20706C617965723A475549442829207468656E0D0A6O20666F72205F2C2068616E646C657220696E2070616972732873656C66436F6D62617448616E646C6572735B7375624576656E745D2920646F0D0A8O2068616E646C65722874696D655374616D702C207375624576656E742C203O2E290D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2O20696620706574436F6D62617448616E646C6572735B7375624576656E745D207468656E0D0A4O202O2D20556E66696C746572656420436F6D626174204C6F67207769746820536F7572636547554944202O3D20506574475549442066696C7465720D0A4O2069662073656C65637428322C203O2E29202O3D207065743A475549442829207468656E0D0A6O20666F72205F2C2068616E646C657220696E20706169727328706574436F6D62617448616E646C6572735B7375624576656E745D2920646F0D0A8O2068616E646C65722874696D655374616D702C207375624576656E742C203O2E290D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2O20666F722069203D20312C20636F6D6261745072656669786573436F756E7420646F0D0A4O202O2D20544F444F203A204F7074696D697A6520746865207374722066696E640D0A4O206966207375624576656E74207468656E0D0A6O206C6F63616C2073746172742C20656E64696E67203D20737472696E672E66696E64287375624576656E742C20636F6D62617450726566697865735B695D290D0A6O20696620737461727420616E6420656E64696E67207468656E0D0A8O202O2D20544F444F3A204F7074696D697A652074686520646F75626C6520737472207375620D0A8O206C6F63616C207072656669782C2073752O666978203D20737472696E672E737562287375624576656E742C2073746172742C20656E64696E67292C20737472696E672E737562287375624576656E742C20656E64696E67202B2031290D0A8O20696620707265666978436F6D62617448616E646C6572735B7072656669785D207468656E0D0A9O20202O2D20556E66696C746572656420436F6D626174204C6F67207769746820507265666978206F6E6C790D0A9O2020666F72205F2C2068616E646C657220696E20706169727328707265666978436F6D62617448616E646C6572735B7072656669785D2920646F0D0A9O203O2068616E646C65722874696D655374616D702C207375624576656E742C203O2E290D0A9O2020656E640D0A8O20656E640D0A8O2069662073752O666978436F6D62617448616E646C6572735B73752O6669785D207468656E0D0A9O20202O2D20556E66696C746572656420436F6D626174204C6F6720776974682053752O666978206F6E6C790D0A9O2020666F72205F2C2068616E646C657220696E2070616972732873752O666978436F6D62617448616E646C6572735B73752O6669785D2920646F0D0A9O203O2068616E646C65722874696D655374616D702C207375624576656E742C203O2E290D0A9O2020656E640D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6170693A5265676973746572466F724576656E742866756E6374696F6E286576656E74290D0A2O204C697374656E6572436F6D6261744C6F674576656E74556E66696C7465726564286576656E742C20436F6D6261744C6F6747657443752O72656E744576656E74496E666F282O290D0A656E642C2022434F4D4241545F4C4F475F4556454E545F554E46494C544552454422290D0A0D0A3O2D207O3D20434F4D4241544C4F47207O3D0D0A3O2D20436F6D626174204C6F6720417267756D656E74730D0A7O2D2042617365207O2D0D0A2O2D20319O2020326O20339O202O20349O202O20359O202O20369O203O20379O207O20389O20399O2031309O202O310D0A2O2D2054696D655374616D702C204576656E742C20486964654361737465722C20536F75726365475549442C20536F757263654E616D652C20536F75726365466C6167732C20536F7572636552616964466C6167732C2044657374475549442C20446573744E616D652C2044657374466C6167732C204465737452616964466C6167730D0A0D0A7O2D205072656669786573207O2D0D0A3O2D205357494E470D0A2O2D204E2F410D0A0D0A3O2D205350452O4C2026205350452O4C5F504552494F4449430D0A2O2D2031328O2031339O202031340D0A2O2D205370652O6C49442C205370652O6C4E616D652C205370652O6C5363682O6F6C0D0A0D0A3O2D205350452O4C5F4142534F524245442A202D205768656E206162736F726265642064616D616765206F726967696E617465642066726F6D2061207370652O6C2C2077692O6C206861766520612O646974696F6E616C203320636F6C756D6E732077697468207370652O6C20696E666F2E0D0A2O2D2031329O207O2031339O207O2031349O208O2031359O209O203O2031367O2031379O2031389O202O2031390D0A2O2D204162736F7262536F75726365475549442C204162736F7262536F757263654E616D652C204162736F7262536F75726365466C6167732C204162736F7262536F7572636552616964466C6167732C205370652O6C49442C205370652O6C4E616D652C205370652O6C5363682O6F6C2C20416D6F756E740D0A0D0A3O2D205350452O4C5F4142534F524245440D0A2O2D2031329O204O2031339O206O2031349O208O2031359O207O2031369O207O2031379O208O2031389O209O203O2031397O2032309O2032319O202O202O320D0A2O2D204162736F72625370652O6C49642C204162736F72625370652O6C4E616D652C204162736F72625370652O6C5363682O6F6C2C204162736F7262536F75726365475549442C204162736F7262536F757263654E616D652C204162736F7262536F75726365466C6167732C204162736F7262536F7572636552616964466C6167732C205370652O6C49442C205370652O6C4E616D652C205370652O6C5363682O6F6C2C20416D6F756E740D0A0D0A7O2D2053752O6669786573207O2D0D0A3O2D205F434153545F53544152542026205F434153545F53552O43452O532026205F53552O4D4F4E2026205F524553552O524543540D0A2O2D204E2F410D0A0D0A3O2D205F434153545F4641494C45440D0A2O2D2031350D0A2O2D204661696C6564547970650D0A0D0A3O2D205F415552415F412O504C4945442026205F415552415F52454D4F5645442026205F415552415F524546524553480D0A2O2D2031350D0A2O2D2041757261547970650D0A0D0A3O2D205F415552415F412O504C4945445F444F53450D0A2O2D2031358O2031360D0A2O2D2041757261547970652C20436861726765730D0A0D0A3O2D205F494E54452O525550540D0A2O2D2031359O203O2031369O205O2031370D0A2O2D2045787472615370652O6C49442C2045787472615370652O6C4E616D652C2045787472615363682O6F6C0D0A0D0A3O2D205F4845414C0D0A2O2D2031356O2031369O202O2031378O2031380D0A2O2D20416D6F756E742C204F7665726865616C696E672C204162736F726265642C20437269746963616C0D0A0D0A3O2D205F44414D4147450D0A2O2D2031356O2031368O2031376O2031388O2031397O2032308O2032318O202O328O2032330D0A2O2D20416D6F756E742C204F7665726B692O6C2C205363682O6F6C2C2052657369737465642C20426C6F636B65642C204162736F726265642C20437269746963616C2C20476C616E63696E672C204372757368696E670D0A0D0A3O2D205F4D492O5345440D0A2O2D2031358O2031369O2031370D0A2O2D204D692O73547970652C2049734F2O6648616E642C20416D6F756E744D692O7365640D0A0D0A7O2D205370656369616C207O2D0D0A3O2D20554E49545F444945442C20554E49545F44455354524F5945440D0A2O2D204E2F410D0A0D0A3O2D20456E6420436F6D626174204C6F6720417267756D656E74730D0A0D0A2O2D20417267756D656E7473205661726961626C65730D0A0D0A00063O0012043O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
