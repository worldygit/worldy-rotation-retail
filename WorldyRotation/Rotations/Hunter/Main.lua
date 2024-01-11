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
					elseif (Enum > 1) then
						do
							return;
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
					if (Enum > 3) then
						local A = Inst[2];
						Stk[A](Unpack(Stk, A + 1, Top));
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
VMCall("LOL!023O00030A3O006C6F6164737472696E670373242O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206D756C74695370652O6C203D206170692E6D756C74695370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C730D0A6966206E6F74207370652O6C2E68756E746572207468656E0D0A2O207370652O6C2E68756E746572203D207B7D0D0A656E640D0A7370652O6C2E68756E7465722E636F2O6D6F6E73203D207B0D0A2O202O2D2072616369616C730D0A2O20616E6365737472616C43612O6C203D207370652O6C28323734373338292C0D0A2O20617263616E6550756C7365203D207370652O6C28323630333634292C0D0A2O20617263616E65546F2O72656E74203D207370652O6C283238373330292C0D0A2O206261676F66547269636B73203D207370652O6C28333132342O31292C0D0A2O206265727365726B696E67203D207370652O6C283236323937292C0D0A2O20626C2O6F6446757279203D207370652O6C283230353732292C0D0A2O2066697265626C2O6F64203D207370652O6C283236352O3231292C0D0A2O206C69676874734A7564676D656E74203D207370652O6C28322O35363437292C0D0A2O202O2D20706574206162696C69746965730D0A2O2062697465203D207370652O6C2831373235332C202270657422292C0D0A2O20626C2O6F64426F6C74203D207370652O6C28322O383936322C202270657422292C0D0A2O20636C6177203D207370652O6C2831363832372C202270657422292C0D0A2O2067726F776C203D207370652O6C28323634392C202270657422292C0D0A2O20736D61636B203D207370652O6C28342O392O362C202270657422292C0D0A2O202O2D20706574207574696C697479206162696C69746965730D0A2O206D656E64506574203D207370652O6C28313336292C0D0A2O20726576697665506574203D207370652O6C28393832292C0D0A2O2073752O6D6F6E506574203D207370652O6C282O3833292C0D0A2O2073752O6D6F6E50657432203D207370652O6C283833323432292C0D0A2O2073752O6D6F6E50657433203D207370652O6C283833323433292C0D0A2O2073752O6D6F6E50657434203D207370652O6C283833322O34292C0D0A2O2073752O6D6F6E50657435203D207370652O6C283833323435292C0D0A2O202O2D206162696C69746965730D0A2O20616C7068615072656461746F72203D207370652O6C28323639373337292C0D0A2O20617263616E6553686F74203D207370652O6C28313835333538292C0D0A2O2062612O72616765203D207370652O6C28313230333630292C0D0A2O2062656173744D6173746572203D207370652O6C283337382O3037292C0D0A2O2062696E64696E6753686F74203D207370652O6C28313039323438292C0D0A2O20636F756E74657253686F74203D207370652O6C28313437333632292C0D0A2O2064656174684368616B72616D203D207370652O6C28333735383931292C0D0A2O20646973656E67616765203D207370652O6C28373831292C0D0A2O20657868696C61726174696F6E203D207370652O6C28313039333034292C0D0A2O206578706C6F7369766553686F74203D207370652O6C28323132343331292C0D0A2O20666C617265203D207370652O6C2831353433292C0D0A2O2066722O657A696E6754726170203D207370652O6C28313837363530292C0D0A2O2068756E746572734D61726B203D207370652O6C28323537323834292C0D0A2O2068796472617342697465203D207370652O6C28323630323431292C0D0A2O20696E74696D69646174696F6E203D207370652O6C283139352O37292C0D0A2O206B692O6C436F2O6D616E64203D206D756C74695370652O6C2833343032362C20323539343839292C0D0A2O206B692O6C53686F74203D206D756C74695370652O6C28352O3335312C20333230393736292C0D0A2O206B692O6C6572496E7374696E6374203D207370652O6C283237332O3837292C0D0A2O206D6973646972656374696F6E203D207370652O6C28332O342O37292C0D0A2O206D752O7A6C65203D207370652O6C2831382O373037292C0D0A2O20706F69736F6E496E6A656374696F6E203D207370652O6C28333738303134292C0D0A2O20706F73746861737465203D207370652O6C28313039323135292C0D0A2O2073636172654265617374203D207370652O6C2831353133292C0D0A2O2073657270656E745374696E67203D207370652O6C28323731372O38292C0D0A2O207374616D70656465203D207370652O6C28323031343330292C0D0A2O2073742O656C54726170203D207370652O6C28313632342O38292C0D0A2O2074617254726170203D207370652O6C28313837363938292C0D0A2O207472616E7175696C697A696E6753686F74203D207370652O6C283139383031292C0D0A2O207761696C696E67412O726F77203D207370652O6C28333932303630292C0D0A2O202O2D2062752O66730D0A2O206265727365726B696E6742752O66203D207370652O6C283236323937292C0D0A2O20626C2O6F644675727942752O66203D207370652O6C283230353732292C0D0A2O20732O657468696E675261676542752O66203D207370652O6C2834302O383335292C202O2D2062752O662066726F6D20646A61722O756E0D0A2O202O2D20646562752O66730D0A2O2068756E746572734D61726B446562752O66203D207370652O6C28323537323834292C0D0A2O206C6174656E74506F69736F6E446562752O66203D207370652O6C282O3336393033292C0D0A2O2073657270656E745374696E67446562752O66203D207370652O6C28323731372O38292C0D0A2O2074617254726170446562752O66203D207370652O6C28313335322O39292C0D0A2O202O2D206D6973630D0A2O20702O6F6C203D207370652O6C284O393130292C0D0A7D0D0A0D0A7370652O6C2E68756E7465722E62656173744D617374657279203D204D657267655461626C6542794B6579287370652O6C2E68756E7465722E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O20614D75726465726F6643726F7773203D207370652O6C28313331383934292C0D0A2O20616E696D616C436F6D70616E696F6E203D207370652O6C283236372O3136292C0D0A2O206173706563746F6674686557696C64203D207370652O6C28313933353330292C0D0A2O2062617262656453686F74203D207370652O6C28323137322O30292C0D0A2O206265617374436C65617665203D207370652O6C282O3135393339292C0D0A2O206265737469616C5772617468203D207370652O6C283139353734292C0D0A2O20626C2O6F6473686564203D207370652O6C28333231353330292C0D0A2O20626C2O6F64794672656E7A79203D207370652O6C28343037343132292C0D0A2O2063612O6C6F6674686557696C64203D207370652O6C28333539382O34292C0D0A2O20636F62726153686F74203D207370652O6C28313933342O35292C0D0A2O20646972654265617374203D207370652O6C28313230363739292C0D0A2O206B692O6C436C65617665203D207370652O6C28333738323037292C0D0A2O206D756C746953686F74203D207370652O6C2832363433292C0D0A2O206F6E65576974685468655061636B203D207370652O6C28312O39353238292C0D0A2O207361766167657279203D207370652O6C283432342O3537292C0D0A2O207363656E746F66426C2O6F64203D207370652O6C28313933353332292C0D0A2O2073746F6D70203D207370652O6C28312O39353330292C0D0A2O2077696C6443612O6C203D207370652O6C28313835373839292C0D0A2O2077696C64496E7374696E637473203D207370652O6C283337382O3432292C0D0A2O202O2D2062752O66730D0A2O206173706563746F6674686557696C6442752O66203D207370652O6C28313933353330292C0D0A2O206265617374436C6561766550657442752O66203D207370652O6C282O3138342O352C202270657422292C0D0A2O206265617374436C6561766542752O66203D207370652O6C2832362O382O37292C0D0A2O206265737469616C577261746842752O66203D207370652O6C283139353734292C0D0A2O206265737469616C577261746850657442752O66203D207370652O6C283138363235342C202270657422292C0D0A2O2063612O6C6F6674686557696C6442752O66203D207370652O6C28333539382O34292C0D0A2O206672656E7A7950657442752O66203D207370652O6C283237323739302C202270657422292C0D0A2O202O2D20646562752O66730D0A2O2062617262656453686F74446562752O66203D207370652O6C28323137322O30292C0D0A7D290D0A0D0A7370652O6C2E68756E7465722E6D61726B736D616E73686970203D204D657267655461626C6542794B6579287370652O6C2E68756E7465722E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O2061696D656453686F74203D207370652O6C283139343334292C0D0A2O206275727374696E6753686F74203D207370652O6C28313836333837292C0D0A2O206361726566756C41696D203D207370652O6C283236302O3238292C0D0A2O206368696D6165726153686F74203D207370652O6C28333432303439292C0D0A2O20646F75626C65546170203D207370652O6C28323630343032292C0D0A2O20696E54686552687974686D203D207370652O6C28343037343034292C0D0A2O206C65676163796F6674686557696E6472752O6E657273203D207370652O6C28343036343235292C0D0A2O206C6F6E65576F6C66203D207370652O6C28312O352O3238292C0D0A2O206D756C746953686F74203D207370652O6C28323537363230292C0D0A2O20726170696446697265203D207370652O6C28323537302O34292C0D0A2O2073616C766F203D207370652O6C28342O30343536292C0D0A2O2073657270656E747374616C6B657273547269636B657279203D207370652O6C2833374O38292C0D0A2O20737465616479466F637573203D207370652O6C28313933352O33292C0D0A2O2073746561647953686F74203D207370652O6C28352O363431292C0D0A2O2073747265616D6C696E65203D207370652O6C28323630333637292C0D0A2O2073757267696E6753686F7473203D207370652O6C283339312O3539292C0D0A2O20747269636B53686F7473203D207370652O6C28323537363231292C0D0A2O207472756573686F74203D207370652O6C28322O38363133292C0D0A2O20766F2O6C6579203D207370652O6C28323630323433292C0D0A2O2077696E6472752O6E65727347756964616E6365203D207370652O6C28333738393035292C0D0A2O202O2D2062752O66730D0A2O20626F6D626172646D656E7442752O66203D207370652O6C28333836383735292C0D0A2O2062752O6C657473746F726D42752O66203D207370652O6C28333839303230292C0D0A2O20646F75626C6554617042752O66203D207370652O6C28323630343032292C0D0A2O20696E54686552687974686D42752O66203D207370652O6C28343037343035292C0D0A2O206C6F636B616E644C6F616442752O66203D207370652O6C28313934353934292C0D0A2O207072656369736553686F747342752O66203D207370652O6C28323630323432292C0D0A2O2072617A6F72467261676D656E747342752O66203D207370652O6C28332O382O3938292C0D0A2O2073616C766F42752O66203D207370652O6C28342O30343536292C0D0A2O20737465616479466F63757342752O66203D207370652O6C28313933353334292C0D0A2O20747269636B53686F747342752O66203D207370652O6C28323537362O32292C0D0A2O207472756573686F7442752O66203D207370652O6C28322O38363133292C0D0A2O20766F2O6C657942752O66203D207370652O6C28323630323433292C0D0A2O202O2D20646562752O66730D0A2O2073616C766F446562752O66203D207370652O6C28332O38393039292C0D0A2O202O2D206C6567656E6461726965730D0A2O206561676C6574616C6F6E7354727565466F63757342752O66203D207370652O6C282O3336383531292C0D0A7D290D0A0D0A7370652O6C2E68756E7465722E737572766976616C203D204D657267655461626C6542794B6579287370652O6C2E68756E7465722E636F2O6D6F6E732C207B0D0A2O202O2D20626F6D62730D0A2O20706865726F6D6F6E65426F6D62203D207370652O6C28323730333233292C0D0A2O2073687261706E656C426F6D62203D207370652O6C283237302O3335292C0D0A2O20766F6C6174696C65426F6D62203D207370652O6C28323731303435292C0D0A2O2077696C6466697265426F6D62203D207370652O6C28323539343935292C0D0A2O202O2D206162696C69746965730D0A2O206173706563746F667468654561676C65203D207370652O6C28313836323839292C0D0A2O2062697264736F6650726579203D207370652O6C283236302O3331292C0D0A2O20626F6D62617264696572203D207370652O6C283338392O3830292C0D0A2O206275746368657279203D207370652O6C28323132343336292C0D0A2O206361727665203D207370652O6C2831382O373038292C0D0A2O20632O6F7264696E61746564412O7361756C74203D207370652O6C28333630393532292C0D0A2O20632O6F7264696E617465644B692O6C203D207370652O6C28333835373339292C0D0A2O20666C616E6B657273416476616E74616765203D207370652O6C28323633313836292C0D0A2O20666C616E6B696E67537472696B65203D207370652O6C28323639373531292C0D0A2O20667572796F667468654561676C65203D207370652O6C28323033343135292C0D0A2O20686172702O6F6E203D207370652O6C28313930393235292C0D0A2O206C756E6765203D207370652O6C28333738393334292C0D0A2O206D6F6E672O6F736542697465203D206D756C74695370652O6C283235393338372C203236353O38292C0D0A2O2072616E676572203D207370652O6C28333835363935292C0D0A2O20726170746F72537472696B65203D206D756C74695370652O6C283138363237302C20323635313839292C0D0A2O20727574686C652O734D61726175646572203D207370652O6C28333835373138292C0D0A2O20737065617268656164203D207370652O6C28333630392O36292C0D0A2O207465726D736F66456E676167656D656E74203D207370652O6C28323635383935292C0D0A2O207469706F667468655370656172203D207370652O6C28323630323835292C0D0A2O2076697065727356656E6F6D203D207370652O6C28323638353031292C0D0A2O2077696C6466697265496E667573696F6E203D207370652O6C28323731303134292C0D0A2O202O2D2062752O66730D0A2O20626C2O6F64732O656B657242752O66203D207370652O6C28323630323439292C0D0A2O20636F6E7461696E65644578706C6F73696F6E42752O66203D207370652O6C28343236332O34292C202O2D20543331203470630D0A2O20632O6F7264696E61746564412O7361756C7442752O66203D207370652O6C28333630393532292C0D0A2O20632O6F7264696E61746564412O7361756C74456D706F77657242752O66203D207370652O6C28333631373338292C0D0A2O20646561646C7944756F42752O66203D207370652O6C28333937353638292C0D0A2O206D6F6E672O6F73654675727942752O66203D207370652O6C28323539332O38292C0D0A2O2073706561726865616442752O66203D207370652O6C28333630392O36292C0D0A2O2073742O656C54726170446562752O66203D207370652O6C28313632343837292C0D0A2O207469706F66746865537065617242752O66203D207370652O6C28323630323836292C0D0A2O202O2D20646562752O66730D0A2O20626C2O6F64732O656B6572446562752O66203D207370652O6C28323539322O37292C0D0A2O20696E7465726E616C426C2O6564696E67446562752O66203D207370652O6C28323730333433292C0D0A2O20706865726F6D6F6E65426F6D62446562752O66203D207370652O6C283237302O3332292C0D0A2O2073687261706E656C426F6D62446562752O66203D207370652O6C283237302O3339292C0D0A2O20736872652O64656441726D6F72446562752O66203D207370652O6C28343130313637292C0D0A2O20766F6C6174696C65426F6D62446562752O66203D207370652O6C28323731303439292C0D0A2O2077696C6466697265426F6D62446562752O66203D207370652O6C28323639373437292C0D0A7D290D0A0D0A2O2D206974656D730D0A6966206E6F74206974656D2E68756E746572207468656E0D0A2O206974656D2E68756E746572203D207B7D0D0A656E640D0A6974656D2E68756E7465722E636F2O6D6F6E73203D207B0D0A7D0D0A0D0A6974656D2E68756E7465722E62656173744D617374657279203D204D657267655461626C6542794B6579286974656D2E68756E7465722E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E68756E7465722E6D61726B736D616E73686970203D204D657267655461626C6542794B6579286974656D2E68756E7465722E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E68756E7465722E737572766976616C203D204D657267655461626C6542794B6579286974656D2E68756E7465722E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F730D0A6966206E6F74206D6163726F2E68756E746572207468656E0D0A2O206D6163726F2E68756E746572203D207B7D0D0A656E640D0A6D6163726F2E68756E7465722E636F2O6D6F6E73203D207B0D0A2O202O2D207370652O6C730D0A2O20617263616E6553686F744D6F7573656F766572203D206D6163726F2822617263616E6553686F744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E617263616E6553686F743A4E616D65282O292C0D0A2O2062696E64696E6753686F74437572736F72203D206D6163726F282262696E64696E6753686F74437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E62696E64696E6753686F743A4E616D65282O292C0D0A2O20636F756E74657253686F744D6F7573656F766572203D206D6163726F2822636F756E74657253686F744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E636F756E74657253686F743A4E616D65282O292C0D0A2O20696E74696D69646174696F6E4D6F7573656F766572203D206D6163726F2822696E74696D69646174696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E696E74696D69646174696F6E3A4E616D65282O292C0D0A2O206B692O6C53686F744D6F7573656F766572203D206D6163726F28226B692O6C53686F744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E6B692O6C53686F743A4E616D65282O292C0D0A2O206D752O7A6C654D6F7573656F766572203D206D6163726F28226D752O7A6C654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E6D752O7A6C653A4E616D65282O292C0D0A2O2073657270656E745374696E674D6F7573656F766572203D206D6163726F282273657270656E745374696E674D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E73657270656E745374696E673A4E616D65282O292C0D0A2O2073742O656C54726170437572736F72203D206D6163726F282273742O656C54726170437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E73742O656C547261703A4E616D65282O292C0D0A2O206D6973646972656374696F6E466F637573203D206D6163726F28226D6973646972656374696F6E466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E6D6973646972656374696F6E3A4E616D65282O292C0D0A2O2074617254726170437572736F72203D206D6163726F282274617254726170437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E746172547261703A4E616D65282O292C0D0A2O2066722O657A696E6754726170437572736F72203D206D6163726F282266722O657A696E6754726170437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E66722O657A696E67547261703A4E616D65282O292C0D0A2O206B692O6C436F2O6D616E64506574412O7461636B203D206D6163726F28226B692O6C436F2O6D616E64506574412O7461636B222C20222F636173742022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E6B692O6C436F2O6D616E643A4E616D652829202O2E20225C6E2F706574612O7461636B22292C0D0A2O206B692O6C436F2O6D616E644D6F7573656F766572203D206D6163726F28226B692O6C436F2O6D616E644D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E68756E7465722E636F2O6D6F6E732E6B692O6C436F2O6D616E643A4E616D65282O292C0D0A7D0D0A0D0A6D6163726F2E68756E7465722E62656173744D617374657279203D204D657267655461626C6542794B6579286D6163726F2E68756E7465722E636F2O6D6F6E732C207B0D0A2O2062617262656453686F744D6F7573656F766572203D206D6163726F282262617262656453686F744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E68756E7465722E62656173744D6173746572792E62617262656453686F743A4E616D65282O292C0D0A2O2062617262656453686F74506574412O7461636B203D206D6163726F282262617262656453686F74506574412O7461636B222C20222F636173742022202O2E207370652O6C2E68756E7465722E62656173744D6173746572792E62617262656453686F743A4E616D652829202O2E20225C6E2F706574612O7461636B22292C0D0A2O20636F62726153686F744D6F7573656F766572203D206D6163726F2822636F62726153686F744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E68756E7465722E62656173744D6173746572792E636F62726153686F743A4E616D65282O292C0D0A2O20636F62726153686F74506574412O7461636B203D206D6163726F2822636F62726153686F74506574412O7461636B222C20222F636173742022202O2E207370652O6C2E68756E7465722E62656173744D6173746572792E636F62726153686F743A4E616D652829202O2E20225C6E2F706574612O7461636B22292C0D0A7D290D0A0D0A6D6163726F2E68756E7465722E6D61726B736D616E73686970203D204D657267655461626C6542794B6579286D6163726F2E68756E7465722E636F2O6D6F6E732C207B0D0A2O2061696D656453686F744D6F7573656F766572203D206D6163726F282261696D656453686F744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E68756E7465722E6D61726B736D616E736869702E61696D656453686F743A4E616D65282O292C0D0A2O20766F2O6C6579437572736F72203D206D6163726F2822766F2O6C6579437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E68756E7465722E6D61726B736D616E736869702E766F2O6C65793A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E68756E7465722E737572766976616C203D204D657267655461626C6542794B6579286D6163726F2E68756E7465722E636F2O6D6F6E732C207B0D0A2O206D6F6E672O6F7365426974654D6F7573656F766572203D206D6163726F28226D6F6E672O6F7365426974654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E68756E7465722E737572766976616C2E6D6F6E672O6F7365426974653A4E616D65282O292C0D0A2O20726170746F72537472696B654D6F7573656F766572203D206D6163726F2822726170746F72537472696B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E68756E7465722E737572766976616C2E726170746F72537472696B653A4E616D65282O292C0D0A7D290D0A00063O0012053O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
