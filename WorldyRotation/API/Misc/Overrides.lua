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
						Top = (A + Varargsz) - 1;
						for Idx = A, Top do
							local VA = Vararg[Idx - A];
							Stk[Idx] = VA;
						end
					elseif (Enum > 1) then
						local A = Inst[2];
						Stk[A](Unpack(Stk, A + 1, Top));
					else
						do
							return;
						end
					end
				elseif (Enum <= 4) then
					if (Enum > 3) then
						local A = Inst[2];
						Stk[A] = Stk[A](Stk[A + 1]);
					else
						Stk[Inst[2]] = Inst[3];
					end
				elseif (Enum == 5) then
					if ((Inst[3] == "_ENV") or (Inst[3] == "getfenv")) then
						Stk[Inst[2]] = Env;
					else
						Stk[Inst[2]] = Env[Inst[3]];
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
				VIP = VIP + 1;
			end
		end;
	end
	return Wrap(Deserialize(), {}, vmenv)(...);
end
VMCall("LOL!023O00030A3O006C6F6164737472696E67034B042O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C20706574203D20756E69742E7065740D0A6C6F63616C20746172676574203D20756E69742E7461726765740D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A0D0A6C6F63616C20726573746F72654442203D207B7D0D0A6C6F63616C206F76652O726964654442203D207B7D0D0A0D0A66756E6374696F6E206170692E412O64436F72654F76652O7269646528742C206E657766756E6374696F6E2C20737065634B6579290D0A2O206C6F63616C206C6F61644F76652O7269646546756E63203D20612O73657274286C6F6164737472696E67282O5B0D0A6O2072657475726E2066756E6374696F6E202866756E63290D0A6O202O5D202O2E2074202O2E202O5B203D2066756E630D0A6O20656E642C202O5D202O2E2074202O2E202O5B0D0A6O202O5D2O290D0A2O2073657466656E76286C6F61644F76652O7269646546756E632C207B20617069203D206170692C20706C61796572203D20706C617965722C207370652O6C203D207370652O6C2C206974656D203D206974656D2C20746172676574203D207461726765742C20756E6974203D20756E69742C20706574203D20706574207D290D0A2O206C6F63616C206F76652O7269646546756E632C206F6C6466756E6374696F6E203D206C6F61644F76652O7269646546756E6328290D0A2O206966206F76652O7269646544425B737065634B65795D202O3D206E696C207468656E0D0A4O206F76652O7269646544425B737065634B65795D203D207B7D0D0A2O20656E640D0A2O207461626C652E696E73657274286F76652O7269646544425B737065634B65795D2C207B206F76652O7269646546756E632C206E657766756E6374696F6E207D290D0A2O207461626C652E696E7365727428726573746F726544422C207B206F76652O7269646546756E632C206F6C6466756E6374696F6E207D290D0A2O2072657475726E206F6C6466756E6374696F6E0D0A656E640D0A0D0A66756E6374696F6E206170692E4C6F6164526573746F72657328290D0A2O20666F72205F2C207620696E20706169727328726573746F726544422920646F0D0A4O20765B315D28765B325D290D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170692E4C6F61644F76652O726964657328737065634B6579290D0A2O2069662074797065286F76652O7269646544425B737065634B65795D29202O3D20227461626C6522207468656E0D0A4O20666F72205F2C207620696E207061697273286F76652O7269646544425B737065634B65795D2920646F0D0A6O20765B315D28765B325D290D0A4O20656E640D0A2O20656E640D0A656E640D0A00063O0012063O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
