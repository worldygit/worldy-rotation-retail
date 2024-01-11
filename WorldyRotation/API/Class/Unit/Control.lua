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
						local A = Inst[2];
						Stk[A] = Stk[A](Stk[A + 1]);
					elseif ((Inst[3] == "_ENV") or (Inst[3] == "getfenv")) then
						Stk[Inst[2]] = Env;
					else
						Stk[Inst[2]] = Env[Inst[3]];
					end
				elseif (Enum <= 4) then
					if (Enum > 3) then
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
						Stk[Inst[2]] = Inst[3];
					end
				elseif (Enum == 5) then
					local A = Inst[2];
					Top = (A + Varargsz) - 1;
					for Idx = A, Top do
						local VA = Vararg[Idx - A];
						Stk[Idx] = VA;
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
VMCall("LOL!023O00030A3O006C6F6164737472696E670339082O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C206361636865203D2057522E63616368650D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A0D0A6C6F63616C2069735374752O6E6564446562752O6673203D207B0D0A2O202O2D2044656D6F6E2048756E7465720D0A2O202O2D2044727569640D0A2O202O2D2047656E6572616C0D0A2O207370652O6C2835322O31292C202O2D204D696768747920426173680D0A2O202O2D20466572616C0D0A2O207370652O6C28323033313233292C202O2D204D61696D0D0A2O207370652O6C28313633353035292C202O2D2052616B650D0A2O202O2D2050616C6164696E0D0A2O202O2D2047656E6572616C0D0A2O207370652O6C28383533292C202O2D2048612O6D6572206F66204A7573746963650D0A2O202O2D205265747269627574696F6E0D0A2O207370652O6C28323035323930292C202O2D2057616B65206F662041736865730D0A2O202O2D20526F6775650D0A2O202O2D2047656E6572616C0D0A2O207370652O6C28312O39383034292C202O2D20426574772O656E2074686520457965730D0A2O207370652O6C2831382O33292C202O2D2043686561702053686F740D0A2O207370652O6C28343038292C202O2D204B69646E65792053686F740D0A2O207370652O6C28313936393538292C202O2D20537472696B652066726F6D2074686520536861646F77730D0A2O202O2D2057612O72696F720D0A2O202O2D2047656E6572616C0D0A2O207370652O6C28313332313638292C202O2D2053686F636B776176650D0A2O207370652O6C28313332313639292C202O2D2053746F726D20426F6C740D0A7D0D0A66756E6374696F6E20756E69743A497465726174655374756E446562752O667328290D0A2O20666F722069203D20312C202369735374752O6E6564446562752O667320646F0D0A4O206C6F63616C2069735374752O6E6564446562752O66203D2069735374752O6E6564446562752O66735B695D0D0A4O2069662073656C663A446562752O6655702869735374752O6E6564446562752O662C206E696C2C207472756529207468656E0D0A6O2072657475726E20747275650D0A4O20656E640D0A2O20656E640D0A0D0A2O2072657475726E2066616C73650D0A656E640D0A0D0A66756E6374696F6E20756E69743A49735374752O6E656428290D0A2O206C6F63616C2067756964203D2073656C663A4755494428290D0A2O206966206E6F742067756964207468656E2072657475726E20656E640D0A0D0A2O206C6F63616C20756E6974496E666F203D2063616368652E756E6974496E666F5B677569645D0D0A2O206966206E6F7420756E6974496E666F207468656E0D0A4O20756E6974496E666F203D207B7D0D0A4O2063616368652E756E6974496E666F5B677569645D203D20756E6974496E666F0D0A2O20656E640D0A0D0A2O206C6F63616C2069735374752O6E6564203D20756E6974496E666F2E69735374752O6E65640D0A2O2069662069735374752O6E6564202O3D206E696C207468656E0D0A4O2069735374752O6E6564203D2073656C663A497465726174655374756E446562752O667328290D0A4O20756E6974496E666F2E69735374752O6E6564203D2069735374752O6E65640D0A2O20656E640D0A0D0A2O2072657475726E2069735374752O6E65640D0A656E640D0A0D0A6C6F63616C2069735374752O6E61626C65436C612O73696669636174696F6E203D207B0D0A2O205B227472697669616C225D203D20747275652C0D0A2O205B226D696E7573225D203D20747275652C0D0A2O205B226E6F726D616C225D203D20747275652C0D0A2O205B2272617265225D203D20747275652C0D0A2O205B227261722O656C697465225D203D2066616C73652C0D0A2O205B22656C697465225D203D2066616C73652C0D0A2O205B22776F726C64626F2O73225D203D2066616C73652C0D0A2O205B2O225D203D2066616C73650D0A7D0D0A66756E6374696F6E20756E69743A49735374752O6E61626C6528290D0A2O202O2D20544F444F3A20412O6420445220436865636B0D0A2O206C6F63616C2067756964203D2073656C663A4755494428290D0A2O206966206E6F742067756964207468656E2072657475726E20656E640D0A0D0A2O206C6F63616C20756E6974496E666F203D2063616368652E756E6974496E666F5B677569645D0D0A2O206966206E6F7420756E6974496E666F207468656E0D0A4O20756E6974496E666F203D207B7D0D0A4O2063616368652E756E6974496E666F5B677569645D203D20756E6974496E666F0D0A2O20656E640D0A0D0A2O206C6F63616C2069735374752O6E61626C65203D20756E6974496E666F2E49735374752O6E61626C650D0A2O2069662069735374752O6E61626C65202O3D206E696C207468656E0D0A4O2069735374752O6E61626C65203D2069735374752O6E61626C65436C612O73696669636174696F6E5B73656C663A436C612O73696669636174696F6E28295D0D0A4O20756E6974496E666F2E69735374752O6E61626C65203D2069735374752O6E61626C650D0A2O20656E640D0A0D0A2O2072657475726E2069735374752O6E61626C650D0A656E640D0A0D0A66756E6374696F6E20756E69743A43616E42655374752O6E65642869676E6F7265436C612O73696669636174696F6E290D0A2O2072657475726E202O2869676E6F7265436C612O73696669636174696F6E206F722073656C663A49735374752O6E61626C65282O2920616E64206E6F742073656C663A49735374752O6E6564282O29206F722066616C73650D0A656E640D0A00063O0012043O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
