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
					elseif (Enum == 1) then
						Stk[Inst[2]] = Inst[3];
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
						local A = Inst[2];
						Stk[A](Unpack(Stk, A + 1, Top));
					else
						do
							return;
						end
					end
				elseif (Enum == 5) then
					if ((Inst[3] == "_ENV") or (Inst[3] == "getfenv")) then
						Stk[Inst[2]] = Env;
					else
						Stk[Inst[2]] = Env[Inst[3]];
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
VMCall("LOL!023O00030A3O006C6F6164737472696E6703BA082O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A0D0A646F0D0A2O206C6F63616C20737465616C74685370652O6C73427954797065203D207B0D0A4O207B0D0A6O202O2D20526F6775650D0A6O207370652O6C2831373834292C202O2D20537465616C74680D0A6O207370652O6C282O3135313931292C202O2D20537465616C746820772F20537562746572667567652054616C656E740D0A6O207370652O6C282O31333237292C202O2D2056616E6973680D0A6O207370652O6C282O3135313933292C202O2D2056616E69736820772F20537562746572667567652054616C656E740D0A6O202O2D20466572616C0D0A6O207370652O6C283532313529202O2D2050726F776C0D0A4O207D2C0D0A4O202O2D20436F6D62617420537465616C74680D0A4O207B0D0A6O202O2D20526F6775650D0A6O207370652O6C282O3135313932292C202O2D20537562746572667567652042752O660D0A6O207370652O6C28313835342O32292C202O2D20537465616C74682066726F6D20536861646F772044616E63650D0A6O202O2D2044727569640D0A6O207370652O6C2831303235343329202O2D20496E6361726E6174696F6E3A204B696E67206F6620746865204A756E676C650D0A4O207D2C0D0A4O202O2D205370656369616C20537465616C74680D0A4O207B0D0A6O202O2D20526F6775650D0A6O207370652O6C28333735393339292C202O2D20536570736973207374616E6365206D61736B2062752O660D0A6O202O2D204E6967687420456C660D0A6O207370652O6C28353839383429202O2D20536861646F776D656C640D0A4O207D0D0A2O207D0D0A0D0A2O2066756E6374696F6E20706C617965723A537465616C746852656D61696E7328636865636B436F6D6261742C20636865636B5370656369616C2C20627970612O735265636F76657279290D0A4O206966207370652O6C2E726F677565207468656E0D0A6O2069662028636865636B436F6D62617420616E6420287370652O6C2E726F6775652E636F2O6D6F6E732E736861646F7744616E63653A54696D6553696E63654C617374436173742829203C20302E33206F72207370652O6C2E726F6775652E636F2O6D6F6E732E76616E6973683A54696D6553696E63654C617374436173742829203C20302E332O290D0A8O206F722028636865636B5370656369616C20616E64207370652O6C2E726F6775652E636F2O6D6F6E732E736861646F776D656C643A54696D6553696E63654C617374436173742829203C20302E3329207468656E0D0A9O202072657475726E20310D0A6O20656E640D0A4O20656E640D0A0D0A4O206966207370652O6C2E6472756964207468656E0D0A6O206C6F63616C20666572616C203D207370652O6C2E64727569642E666572616C0D0A0D0A6O20696620666572616C207468656E0D0A8O2069662028636865636B436F6D62617420616E6420666572616C2E696E6361726E6174696F6E3A54696D6553696E63654C617374436173742829203C20302E33290D0A9O20206F722028636865636B5370656369616C20616E6420666572616C2E736861646F776D656C643A54696D6553696E63654C617374436173742829203C20302E3329207468656E0D0A9O202072657475726E20310D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A0D0A4O20666F722069203D20312C2023737465616C74685370652O6C7342795479706520646F0D0A6O2069662069202O3D2031206F72202869202O3D203220616E6420636865636B436F6D62617429206F72202869202O3D203320616E6420636865636B5370656369616C29207468656E0D0A8O206C6F63616C20737465616C74685370652O6C73203D20737465616C74685370652O6C734279547970655B695D0D0A8O20666F72206A203D20312C2023737465616C74685370652O6C7320646F0D0A9O20206C6F63616C20737465616C74685370652O6C203D20737465616C74685370652O6C735B6A5D0D0A9O2020696620706C617965723A42752O66557028737465616C74685370652O6C2C206E696C2C20627970612O735265636F7665727929207468656E0D0A9O203O2072657475726E20706C617965723A42752O6652656D61696E7328737465616C74685370652O6C2C206E696C2C20627970612O735265636F76657279290D0A9O2020656E640D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A0D0A4O2072657475726E20300D0A2O20656E640D0A0D0A2O2066756E6374696F6E20706C617965723A537465616C7468557028636865636B436F6D6261742C20636865636B5370656369616C2C20627970612O735265636F76657279290D0A4O2072657475726E2073656C663A537465616C746852656D61696E7328636865636B436F6D6261742C20636865636B5370656369616C2C20627970612O735265636F7665727929203E20300D0A2O20656E640D0A0D0A2O2066756E6374696F6E20706C617965723A537465616C7468446F776E28636865636B436F6D6261742C20636865636B5370656369616C2C20627970612O735265636F76657279290D0A4O2072657475726E206E6F742073656C663A537465616C7468557028636865636B436F6D6261742C20636865636B5370656369616C2C20627970612O735265636F76657279290D0A2O20656E640D0A656E640D0A00063O00124O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
