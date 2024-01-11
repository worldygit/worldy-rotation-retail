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
						Stk[A] = Stk[A](Stk[A + 1]);
					else
						Stk[Inst[2]] = Inst[3];
					end
				elseif (Enum > 5) then
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
				VIP = VIP + 1;
			end
		end;
	end
	return Wrap(Deserialize(), {}, vmenv)(...);
end
VMCall("LOL!023O00030A3O006C6F6164737472696E670374052O002O2D204C69625374756220697320612073696D706C652076657273696F6E696E672073747562206D65616E7420666F722075736520696E204C69627261726965732E2O20682O74703A2O2F3O772E776F776163652E636F6D2F77696B692F4C69625374756220666F72206D6F726520696E666F0D0A2O2D204C6962537475622069732068657265627920706C6163656420696E20746865205075626C696320446F6D61696E20437265646974733A204B61656C74656E2C20436C616468616972652C20632O6B6E696768742C204D692O6B2C20412O6D6F2C204E65766361697269656C2C206A6F7368626F726B650D0A6C6F63616C204C4942535455425F4D414A4F522C204C4942535455425F4D494E4F52203D20224C696253747562222C20322O202O2D204E45564552204D414B45205448495320414E2053564E205245564953494F4E21204954204E2O45445320544F20424520555341424C4520494E20412O4C205245504F53210D0A6C6F63616C204C696253747562203D205F475B4C4942535455425F4D414A4F525D0D0A0D0A6966206E6F74204C696253747562206F72204C6962537475622E6D696E6F72203C204C4942535455425F4D494E4F52207468656E0D0A094C696253747562203D204C696253747562206F72207B6C696273203D207B7D2C206D696E6F7273203D207B7D207D0D0A095F475B4C4942535455425F4D414A4F525D203D204C6962537475620D0A094C6962537475622E6D696E6F72203D204C4942535455425F4D494E4F520D0A0D0A0966756E6374696F6E204C6962537475623A4E65774C696272617279286D616A6F722C206D696E6F72290D0A2O09612O736572742874797065286D616A6F7229202O3D2022737472696E67222C202242616420617267756D656E7420233220746F20604E65774C696272617279272028737472696E672065787065637465642922290D0A2O096D696E6F72203D20612O7365727428746F6E756D62657228737472696E672E6D61746368286D696E6F722C202225642B222O292C20224D696E6F722076657273696F6E206D757374206569746865722062652061206E756D626572206F7220636F6E7461696E2061206E756D6265722E22290D0A0D0A2O096C6F63616C206F6C646D696E6F72203D2073656C662E6D696E6F72735B6D616A6F725D0D0A2O096966206F6C646D696E6F7220616E64206F6C646D696E6F72203E3D206D696E6F72207468656E2072657475726E206E696C20656E640D0A2O0973656C662E6D696E6F72735B6D616A6F725D2C2073656C662E6C6962735B6D616A6F725D203D206D696E6F722C2073656C662E6C6962735B6D616A6F725D206F72207B7D0D0A2O0972657475726E2073656C662E6C6962735B6D616A6F725D2C206F6C646D696E6F720D0A09656E640D0A0D0A0966756E6374696F6E204C6962537475623A4765744C696272617279286D616A6F722C2073696C656E74290D0A2O096966206E6F742073656C662E6C6962735B6D616A6F725D20616E64206E6F742073696C656E74207468656E0D0A3O09652O726F722O282243612O6E6F742066696E642061206C69627261727920696E7374616E6365206F662025712E22293A666F726D617428746F737472696E67286D616A6F722O292C2032290D0A2O09656E640D0A2O0972657475726E2073656C662E6C6962735B6D616A6F725D2C2073656C662E6D696E6F72735B6D616A6F725D0D0A09656E640D0A0D0A0966756E6374696F6E204C6962537475623A497465726174654C696272617269657328292072657475726E2070616972732873656C662E6C6962732920656E640D0A097365746D6574617461626C65284C6962537475622C207B202O5F63612O6C203D204C6962537475622E4765744C696272617279207D290D0A656E640D0A00063O00124O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
