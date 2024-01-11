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
				elseif (Enum == 5) then
					if ((Inst[3] == "_ENV") or (Inst[3] == "getfenv")) then
						Stk[Inst[2]] = Env;
					else
						Stk[Inst[2]] = Env[Inst[3]];
					end
				else
					Stk[Inst[2]] = Inst[3];
				end
				VIP = VIP + 1;
			end
		end;
	end
	return Wrap(Deserialize(), {}, vmenv)(...);
end
VMCall("LOL!023O00030A3O006C6F6164737472696E67032D082O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20746172676574203D20756E69742E7461726765740D0A0D0A646F0D0A2O206C6F63616C206E616D65706C617465556E697473203D20756E69742E6E616D65706C6174650D0A0D0A2O206170693A5265676973746572466F724576656E742866756E6374696F6E286576656E742C20756E69744944290D0A4O206E616D65706C617465556E6974735B756E697449445D3A436163686528290D0A2O20656E642C20224E414D455F504C4154455F554E49545F412O44454422290D0A2O206170693A5265676973746572466F724576656E742866756E6374696F6E286576656E742C20756E69744944290D0A4O206E616D65706C617465556E6974735B756E697449445D3A496E697428290D0A2O20656E642C20224E414D455F504C4154455F554E49545F52454D4F56454422290D0A656E640D0A0D0A6170693A5265676973746572466F724576656E742866756E6374696F6E28290D0A2O207461726765743A436163686528290D0A656E642C2022504C415945525F5441524745545F4348414E47454422290D0A0D0A646F0D0A2O206C6F63616C20666F637573203D20756E69742E666F6375730D0A0D0A2O206170693A5265676973746572466F724576656E742866756E6374696F6E28290D0A4O20666F6375733A436163686528290D0A2O20656E642C2022504C415945525F464F4355535F4348414E47454422290D0A656E640D0A0D0A646F0D0A2O206C6F63616C206172656E61556E697473203D20756E69742E6172656E610D0A0D0A2O206170693A5265676973746572466F724576656E74280D0A6O2066756E6374696F6E286576656E742C20756E69744944290D0A8O206C6F63616C206172656E61556E6974203D206172656E61556E6974735B756E697449445D0D0A8O206966206172656E61556E6974207468656E0D0A9O20206172656E61556E69743A436163686528290D0A8O20656E640D0A6O20656E642C0D0A6O20224152454E415F4F2O504F4E454E545F555044415445220D0A2O20290D0A656E640D0A0D0A646F0D0A2O206C6F63616C20626F2O73556E697473203D20756E69742E626F2O730D0A0D0A2O206170693A5265676973746572466F724576656E74280D0A6O2066756E6374696F6E28290D0A8O20666F72205F2C20626F2O73556E697420696E20706169727328626F2O73556E6974732920646F0D0A9O2020626F2O73556E69743A436163686528290D0A8O20656E640D0A6O20656E642C0D0A6O2022494E5354414E43455F454E434F554E5445525F454E474147455F554E4954220D0A2O20290D0A656E640D0A0D0A6170693A5265676973746572466F724576656E74280D0A4O2066756E6374696F6E28290D0A6O20666F72205F2C207061727479556E697420696E20706169727328756E69742E70617274792920646F0D0A8O207061727479556E69743A436163686528290D0A6O20656E640D0A6O20666F72205F2C2072616964556E697420696E20706169727328756E69742E726169642920646F0D0A8O2072616964556E69743A436163686528290D0A6O20656E640D0A4O20656E642C0D0A4O202247524F55505F524F535445525F555044415445220D0A290D0A2O2D20544F444F3A204E2O656420746F206D6179626520616C736F2075706461746520667269656E646C7920756E69747320776974683A0D0A2O2D2050415254595F4D454D4245525F454E41424C450D0A2O2D2050415254595F4D454D4245525F44495341424C450D0A0D0A2O2D2047656E6572616C20556E69742054617267657420557064617465640D0A646F0D0A2O206C6F63616C20666F637573203D20756E69742E666F6375730D0A2O206C6F63616C20626F2O73556E6974732C207061727479556E6974732C2072616964556E6974732C206E616D65706C617465556E697473203D20756E69742E626F2O732C20756E69742E70617274792C20756E69742E726169642C20756E69742E6E616D65706C6174650D0A0D0A2O206170693A5265676973746572466F724576656E74280D0A6O2066756E6374696F6E286576656E742C20756E69744944290D0A8O20696620756E69744944202O3D207461726765743A49442829207468656E0D0A9O20207461726765743A436163686528290D0A8O20656C7365696620756E69744944202O3D20666F6375733A49442829207468656E0D0A9O2020666F6375733A436163686528290D0A8O20656C73650D0A9O20206C6F63616C20666F756E64556E6974203D207061727479556E6974735B756E697449445D206F722072616964556E6974735B756E697449445D206F7220626F2O73556E6974735B756E697449445D206F72206E616D65706C617465556E6974735B756E697449445D0D0A9O2020696620666F756E64556E6974207468656E0D0A9O203O20666F756E64556E69743A436163686528290D0A9O2020656E640D0A8O20656E640D0A6O20656E642C0D0A6O2022554E49545F54415247455441424C455F4348414E474544222C2022554E49545F46414354494F4E222C2022554E49545F464C414753220D0A2O20290D0A656E640D0A00063O0012033O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
