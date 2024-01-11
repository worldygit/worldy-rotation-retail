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
						local A = Inst[2];
						Top = (A + Varargsz) - 1;
						for Idx = A, Top do
							local VA = Vararg[Idx - A];
							Stk[Idx] = VA;
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
				elseif (Enum <= 4) then
					if (Enum == 3) then
						do
							return;
						end
					elseif ((Inst[3] == "_ENV") or (Inst[3] == "getfenv")) then
						Stk[Inst[2]] = Env;
					else
						Stk[Inst[2]] = Env[Inst[3]];
					end
				elseif (Enum > 5) then
					local A = Inst[2];
					Stk[A](Unpack(Stk, A + 1, Top));
				else
					Stk[Inst[2]] = Inst[3];
				end
				VIP = VIP + 1;
			end
		end;
	end
	return Wrap(Deserialize(), {}, vmenv)(...);
end
VMCall("LOL!023O00030A3O006C6F6164737472696E6703C6082O003O2D20416365436F6E6669672D332E30207772612O706572206C6962726172792E0D0A2O2D2050726F766964657320616E2041504920746F20726567697374657220616E206F7074696F6E73207461626C6520776974682074686520636F6E6669672072656769737472792C0D0A2O2D2061732077652O6C20617320612O736F63696174652069742077697468206120736C61736820636F2O6D616E642E0D0A2O2D2040636C612O732066696C650D0A2O2D20406E616D6520416365436F6E6669672D332E300D0A2O2D204072656C65617365202449643A20416365436F6E6669672D332E302E6C7561203132303220323031392D30352D31352032333A2O313A2O325A206E65766361697269656C20240D0A0D0A2O2D2O5B0D0A416365436F6E6669672D332E300D0A0D0A56657279206C69676874207772612O706572206C696272617279207468617420636F6D62696E657320612O6C2074686520416365436F6E66696720737562636F6D706F6E656E747320696E746F206F6E65206D6F726520656173696C7920757365642077686F6C652E0D0A0D0A2O5D0D0A0D0A6C6F63616C20636667726567203D204C6962537475622822416365436F6E66696752656769737472792D332E3022290D0A6C6F63616C20636667636D64203D204C6962537475622822416365436F6E666967436D642D332E3022290D0A0D0A6C6F63616C204D414A4F522C204D494E4F52203D2022416365436F6E6669672D332E30222C20330D0A6C6F63616C20416365436F6E666967203D204C6962537475623A4E65774C696272617279284D414A4F522C204D494E4F52290D0A0D0A6966206E6F7420416365436F6E666967207468656E2072657475726E20656E640D0A0D0A2O2D544F444F3A206C6F63616C20636667646C67203D204C6962537475622822416365436F6E6669674469616C6F672D332E30222C2074727565290D0A2O2D544F444F3A206C6F63616C20636667647270203D204C6962537475622822416365436F6E66696744726F70646F776E2D332E30222C2074727565290D0A0D0A2O2D204C756120415049730D0A6C6F63616C207063612O6C2C20652O726F722C20747970652C207061697273203D207063612O6C2C20652O726F722C20747970652C2070616972730D0A0D0A2O2D209O2D9O2D9O2D9O2D9O2D9O2D9O2D4O2D0D0A2O2D203A52656769737465724F7074696F6E735461626C6528612O704E616D652C206F7074696F6E732C20736C617368636D642C2070657273697374290D0A2O2D0D0A2O2D202D20612O704E616D65202D2028737472696E672920612O706C69636174696F6E206E616D650D0A2O2D202D206F7074696F6E73202D207461626C65206F722066756E6374696F6E207265662C20732O6520416365436F6E66696752656769737472790D0A2O2D202D20736C617368636D64202D20736C61736820636F2O6D616E642028737472696E6729206F72207461626C65207769746820636F2O6D616E64732C206F72206E696C20746F204E4F5420637265617465206120736C61736820636F2O6D616E640D0A0D0A3O2D2052656769737465722061206F7074696F6E207461626C6520776974682074686520416365436F6E6669672072656769737472792E0D0A2O2D20596F752063616E2073752O706C79206120736C61736820636F2O6D616E6420286F722061207461626C65206F6620736C61736820636F2O6D616E64732920746F207265676973746572207769746820416365436F6E666967436D64206469726563746C792E0D0A2O2D2040706172616D73696720612O704E616D652C206F7074696F6E73205B2C20736C617368636D645D0D0A2O2D2040706172616D20612O704E616D652054686520612O706C69636174696F6E206E616D6520666F722074686520636F6E666967207461626C652E0D0A2O2D2040706172616D206F7074696F6E7320546865206F7074696F6E207461626C6520286F7220612066756E6374696F6E20746F2067656E6572617465206F6E65206F6E2064656D616E64292E2O20682O74703A2O2F3O772E776F776163652E636F6D2F612O646F6E732F616365332F70616765732F6163652D636F6E6669672D332D302D6F7074696F6E732D7461626C65732F0D0A2O2D2040706172616D20736C617368636D64204120736C61736820636F2O6D616E6420746F20726567697374657220666F7220746865206F7074696F6E207461626C652C206F722061207461626C65206F6620736C61736820636F2O6D616E64732E0D0A2O2D204075736167650D0A2O2D206C6F63616C20416365436F6E666967203D204C6962537475622822416365436F6E6669672D332E3022290D0A2O2D20416365436F6E6669673A52656769737465724F7074696F6E735461626C6528224D79412O646F6E222C206D794F7074696F6E732C207B222F6D79736C617368222C20222F6D79227D290D0A66756E6374696F6E20416365436F6E6669673A52656769737465724F7074696F6E735461626C6528612O704E616D652C206F7074696F6E732C20736C617368636D64290D0A096C6F63616C206F6B2C6D7367203D207063612O6C286366677265672E52656769737465724F7074696F6E735461626C652C2073656C662C20612O704E616D652C206F7074696F6E73290D0A096966206E6F74206F6B207468656E20652O726F72286D73672C20322920656E640D0A0D0A09696620736C617368636D64207468656E0D0A2O096966207479706528736C617368636D6429202O3D20227461626C6522207468656E0D0A3O09666F72205F2C636D6420696E20706169727328736C617368636D642920646F0D0A4O09636667636D643A43726561746543686174436F2O6D616E6428636D642C20612O704E616D65290D0A3O09656E640D0A2O09656C73650D0A3O09636667636D643A43726561746543686174436F2O6D616E6428736C617368636D642C20612O704E616D65290D0A2O09656E640D0A09656E640D0A656E640D0A00063O0012023O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
