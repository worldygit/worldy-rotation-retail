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
					elseif (Enum == 1) then
						Stk[Inst[2]] = Inst[3];
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
						local A = Inst[2];
						Stk[A](Unpack(Stk, A + 1, Top));
					end
				elseif (Enum == 5) then
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
				elseif ((Inst[3] == "_ENV") or (Inst[3] == "getfenv")) then
					Stk[Inst[2]] = Env;
				else
					Stk[Inst[2]] = Env[Inst[3]];
				end
				VIP = VIP + 1;
			end
		end;
	end
	return Wrap(Deserialize(), {}, vmenv)(...);
end
VMCall("LOL!023O00030A3O006C6F6164737472696E6703E4052O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C206361636865203D2057522E63616368650D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A0D0A6C6F63616C2066756E6374696F6E2046696E64422O6F6B496E646578287370652O6C49442C207370652O6C54797065290D0A2O206966207370652O6C54797065202O3D2022706C6179657222207468656E0D0A4O20666F722069203D20312C204765744E756D5370652O6C54616273282920646F0D0A6O206C6F63616C206F2O667365742C206E756D5370652O6C732C205F2C206F2O6653706563203D2073656C65637428332C204765745370652O6C546162496E666F28692O290D0A6O206966206F2O6653706563202O3D2030207468656E0D0A8O20666F72206A203D20312C20286F2O66736574202B206E756D5370652O6C732920646F0D0A9O20206C6F63616C2063752O72656E745370652O6C4944203D2073656C65637428372C204765745370652O6C496E666F286A2C20422O4F4B545950455F5350452O4C2O290D0A9O202069662063752O72656E745370652O6C494420616E642063752O72656E745370652O6C4944202O3D207370652O6C4944207468656E0D0A9O203O2072657475726E206A0D0A9O2020656E640D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656C73656966207370652O6C54797065202O3D202270657422207468656E0D0A4O206C6F63616C206E756D5065745370652O6C73203D204861735065745370652O6C7328290D0A4O206966206E756D5065745370652O6C73207468656E0D0A6O20666F722069203D20312C206E756D5065745370652O6C7320646F0D0A8O206C6F63616C2063752O72656E745370652O6C4944203D2073656C65637428372C204765745370652O6C496E666F28692C20422O4F4B545950455F5045542O290D0A8O2069662063752O72656E745370652O6C494420616E642063752O72656E745370652O6C4944202O3D207370652O6C4944207468656E0D0A9O202072657475726E20690D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656C73650D0A4O20652O726F722822496E636F2O72656374207370652O6C547970652E22290D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A422O6F6B496E64657828290D0A2O206C6F63616C207370652O6C4944203D2073656C662E7370652O6C49440D0A2O206C6F63616C207370652O6C54797065203D2073656C662E7370652O6C547970650D0A0D0A2O206C6F63616C20622O6F6B496E646578203D2063616368652E70657273697374656E742E622O6F6B496E6465785B7370652O6C547970655D5B7370652O6C49445D0D0A2O206966206E6F7420622O6F6B496E646578207468656E0D0A4O20622O6F6B496E646578203D2046696E64422O6F6B496E646578287370652O6C49442C207370652O6C54797065290D0A4O2063616368652E70657273697374656E742E622O6F6B496E6465785B7370652O6C547970655D5B7370652O6C49445D203D20622O6F6B496E6465780D0A2O20656E640D0A0D0A2O2072657475726E20622O6F6B496E6465780D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A422O6F6B5479706528290D0A2O206C6F63616C207370652O6C54797065203D2073656C662E7370652O6C547970650D0A2O206966207370652O6C54797065202O3D2022706C6179657222207468656E0D0A4O2072657475726E20422O4F4B545950455F5350452O4C0D0A2O20656C73656966207370652O6C54797065202O3D202270657422207468656E0D0A4O2072657475726E20422O4F4B545950455F5045540D0A2O20656C73650D0A4O20652O726F722822496E636F2O72656374207370652O6C547970652E22290D0A2O20656E640D0A656E640D0A00063O0012053O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
