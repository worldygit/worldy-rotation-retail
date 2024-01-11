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
				elseif (Enum <= 4) then
					if (Enum == 3) then
						local A = Inst[2];
						Stk[A] = Stk[A](Stk[A + 1]);
					else
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
VMCall("LOL!023O00030A3O006C6F6164737472696E670300222O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206D756C74695370652O6C203D206170692E6D756C74695370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C730D0A6966206E6F74207370652O6C2E6D616765207468656E0D0A2O207370652O6C2E6D616765203D207B7D0D0A656E640D0A7370652O6C2E6D6167652E636F2O6D6F6E73203D207B0D0A2O202O2D2072616369616C730D0A2O20616E6365737472616C43612O6C203D207370652O6C28323734373338292C0D0A2O206261676F66547269636B73203D207370652O6C28333132342O31292C0D0A2O206265727365726B696E67203D207370652O6C283236323937292C0D0A2O20626C2O6F6446757279203D207370652O6C283230353732292C0D0A2O2066697265626C2O6F64203D207370652O6C283236352O3231292C0D0A2O206C69676874734A7564676D656E74203D207370652O6C28322O35363437292C0D0A2O202O2D206162696C69746965730D0A2O20616C74657254696D65203D207370652O6C2833342O323435292C0D0A2O20617263616E654578706C6F73696F6E203D207370652O6C28312O3439292C202O2D6D656C2O652C2031300D0A2O20617263616E65496E74652O6C656374203D207370652O6C2831343539292C0D0A2O20626C61737457617665203D207370652O6C28313537393831292C0D0A2O20626C696E6B203D206D756C74695370652O6C28313935332C20323132363533292C0D0A2O20636F756E7465727370652O6C203D207370652O6C2832313339292C0D0A2O20647261676F6E73427265617468203D207370652O6C2833312O3631292C0D0A2O20666F6375734D61676963203D207370652O6C28333231333538292C0D0A2O2066726F7374626F6C74203D207370652O6C282O3136292C0D0A2O2066726F73744E6F7661203D207370652O6C28312O32292C0D0A2O20696365426C6F636B203D207370652O6C283435343338292C0D0A2O20696365466C6F6573203D207370652O6C2831302O383339292C0D0A2O206963654E6F7661203D207370652O6C283135372O3937292C202O2D73706C6173682C20380D0A2O20696E7669736962696C697479203D207370652O6C282O36292C0D0A2O206D612O7342612O72696572203D207370652O6C283431342O3630292C0D0A2O206D6574656F72203D207370652O6C28313533353631292C0D0A2O206D692O726F72496D616765203D207370652O6C282O35333432292C0D0A2O20706F6C796D6F727068203D207370652O6C282O3138292C0D0A2O2072656D6F76654375727365203D207370652O6C28343735292C0D0A2O2072696E674F6646726F7374203D207370652O6C282O3133373234292C0D0A2O2072756E656F66506F776572203D207370652O6C282O3136302O31292C0D0A2O207368696674696E67506F776572203D207370652O6C283338322O3430292C202O2D6D656C2O652031350D0A2O20736C6F7746612O6C203D207370652O6C28313330292C0D0A2O207370652O6C537465616C203D207370652O6C2833302O3439292C0D0A2O2074656D706F72616C57617270203D207370652O6C28333836353339292C0D0A2O2074696D6557617270203D207370652O6C283830333533292C0D0A2O202O2D2062752O66730D0A2O20617263616E65496E74652O6C65637442752O66203D207370652O6C2831343539292C0D0A2O206265727365726B696E6742752O66203D207370652O6C283236323937292C0D0A2O20626C2O6F644675727942752O66203D207370652O6C283230353732292C0D0A2O2072756E656F66506F77657242752O66203D207370652O6C282O3136303134292C0D0A2O2074656D706F72616C5761727042752O66203D207370652O6C28333836353430292C0D0A2O202O2D20646562752O66730D0A2O202O2D20502O6F6C0D0A2O20702O6F6C203D207370652O6C284O393130290D0A7D0D0A0D0A7370652O6C2E6D6167652E617263616E65203D204D657267655461626C6542794B6579287370652O6C2E6D6167652E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O20616D706C696669636174696F6E203D207370652O6C2832332O363238292C0D0A2O20617263616E65426C617374203D207370652O6C283330343531292C0D0A2O20617263616E6542612O72616765203D207370652O6C283O343235292C202O2D73706C6173682C2031300D0A2O20617263616E65426F6D626172646D656E74203D207370652O6C28333834353831292C0D0A2O20617263696E67436C65617665203D207370652O6C28323331353634292C0D0A2O20617263616E654563686F203D207370652O6C2833342O323331292C202O2D73706C6173682C20380D0A2O20617263616E6546616D696C696172203D207370652O6C28323035302O32292C0D0A2O20617263616E654861726D6F6E79203D207370652O6C2833382O343532292C0D0A2O20617263616E654D692O73696C6573203D207370652O6C2835313433292C0D0A2O20617263616E654F7262203D207370652O6C28313533363236292C202O2D73706C6173682C2031360D0A2O20617263616E65506F776572203D207370652O6C28333231373339292C0D0A2O20617263616E655375726765203D207370652O6C28333635333530292C0D0A2O20636173636164696E67506F776572203D207370652O6C28333834323736292C0D0A2O20636861726765644F7262203D207370652O6C28333834363531292C0D0A2O20636F6E6A7572654D616E6147656D203D207370652O6C28373539292C0D0A2O20636F6E63656E74726174696F6E203D207370652O6C28333834333734292C0D0A2O20656E6C69676874656E6564203D207370652O6C28333231333837292C0D0A2O2065766F636174696F6E203D207370652O6C283132303531292C0D0A2O2066697265426C617374203D207370652O6C28333139383336292C0D0A2O2067726561746572496E7669736962696C697479203D207370652O6C282O3130393539292C0D0A2O206E657468657254656D70657374203D207370652O6C282O3134393233292C202O2D73706C6173682C2031300D0A2O206E6574686572507265636973696F6E203D207370652O6C28333833373832292C0D0A2O206F726242612O72616765203D207370652O6C28333834383538292C0D0A2O206F766572706F7765726564203D207370652O6C28312O35313437292C0D0A2O2070726573656E63656F664D696E64203D207370652O6C28323035303235292C0D0A2O20707269736D6174696342612O72696572203D207370652O6C28323335343530292C0D0A2O2072616469616E74537061726B203D207370652O6C28333736313033292C0D0A2O207265736F6E616E6365203D207370652O6C28323035303238292C0D0A2O2072756C656F665468722O6573203D207370652O6C28323634333534292C0D0A2O20736970686F6E53746F726D203D207370652O6C28333834313837292C0D0A2O20736C697073747265616D203D207370652O6C28323336343537292C0D0A2O2073757065726E6F7661203D207370652O6C28313537393830292C202O2D73706C6173682C20380D0A2O2074696D65416E6F6D616C79203D207370652O6C28333833323433292C0D0A2O20746F7563686F667468654D616769203D207370652O6C28333231353037292C202O2D73706C6173682C20380D0A2O202O2D2062752O66730D0A2O20617263616E65417274692O6C65727942752O66203D207370652O6C283432342O3331292C202O2D2054696572203331203470630D0A2O20617263616E6546616D696C69617242752O66203D207370652O6C28323130313236292C0D0A2O20617263616E654861726D6F6E7942752O66203D207370652O6C2833382O342O35292C0D0A2O20617263616E654F7665726C6F616442752O66203D207370652O6C28343039302O32292C202O2D2074696572203330203470630D0A2O20617263616E65537572676542752O66203D207370652O6C28333635333632292C0D0A2O20636C65617263617374696E6742752O66203D207370652O6C28323633373235292C0D0A2O20636F6E63656E74726174696F6E42752O66203D207370652O6C28333834333739292C0D0A2O206E6574686572507265636973696F6E42752O66203D207370652O6C28333833373833292C0D0A2O2070726573656E63656F664D696E6442752O66203D207370652O6C28323035303235292C0D0A2O2072756C656F665468722O657342752O66203D207370652O6C283236342O3734292C0D0A2O20736970686F6E53746F726D42752O66203D207370652O6C28333834323637292C0D0A2O202O2D20646562752O66730D0A2O206E657468657254656D70657374446562752O66203D207370652O6C282O3134393233292C202O2D73706C6173682C2031300D0A2O2072616469616E74537061726B446562752O66203D207370652O6C28333736313033292C0D0A2O2072616469616E74537061726B56756C6E65726162696C697479203D207370652O6C28333736313034292C0D0A2O20746F7563686F667468654D616769446562752O66203D207370652O6C28323130383234292C0D0A7D290D0A0D0A7370652O6C2E6D6167652E66697265203D204D657267655461626C6542794B6579287370652O6C2E6D6167652E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O20616C657873747261737A617346757279203D207370652O6C28323335383730292C0D0A2O20626C617A696E6742612O72696572203D207370652O6C28323335333133292C0D0A2O20636F6D62757374696F6E203D207370652O6C28313930333139292C0D0A2O20662O656C7468654275726E203D207370652O6C2833382O333931292C0D0A2O206669726562612O6C203D207370652O6C28312O33292C0D0A2O2066697265426C617374203D207370652O6C2831302O383533292C0D0A2O206669726573746172746572203D207370652O6C28323035303236292C0D0A2O20666C616D65737472696B65203D207370652O6C2832313230292C0D0A2O20666C616D654F6E203D207370652O6C28323035303239292C0D0A2O20666C616D655061746368203D207370652O6C28323035303337292C0D0A2O2066726F6D5468654173686573203D207370652O6C28333432332O34292C0D0A2O206675656C74686546697265203D207370652O6C28343136303934292C0D0A2O206879706572746865726D6961203D207370652O6C28333833383630292C0D0A2O20696D70726F76656453636F726368203D207370652O6C28333833363034292C0D0A2O206B696E646C696E67203D207370652O6C28312O35313438292C0D0A2O206C6976696E67426F6D62203D207370652O6C283O343537292C0D0A2O2070686F656E6978466C616D6573203D207370652O6C28323537353431292C0D0A2O207079726F626C617374203D207370652O6C282O31332O36292C0D0A2O2073636F726368203D207370652O6C2832393438292C0D0A2O2073656172696E67546F756368203D207370652O6C28323639362O34292C0D0A2O2073756E4B696E6773426C652O73696E67203D207370652O6C283338332O3836292C0D0A2O2074656D7065726564466C616D6573203D207370652O6C28333833363539292C0D0A2O202O2D2062752O66730D0A2O20636F6D62757374696F6E42752O66203D207370652O6C28313930333139292C0D0A2O20662O656C7468654275726E42752O66203D207370652O6C2833382O333935292C0D0A2O20666C616D65412O63656C6572616E7442752O66203D207370652O6C28323033322O37292C0D0A2O20666C616D65734675727942752O66203D207370652O6C2834302O393634292C202O2D207433302034706320626F6E75730D0A2O2068656174696E67557042752O66203D207370652O6C283438313037292C0D0A2O20686F7453747265616B42752O66203D207370652O6C283438313038292C0D0A2O206879706572746865726D696142752O66203D207370652O6C28333833383734292C0D0A2O2073756E4B696E6773426C652O73696E6742752O66203D207370652O6C283338332O3832292C0D0A2O20667572796F6674686553756E4B696E6742752O66203D207370652O6C283338332O3833292C0D0A2O202O2D20646562752O66730D0A2O206368612O72696E67456D62657273446562752O66203D207370652O6C283430382O3635292C202O2D207433302032706320626F6E75730D0A2O2069676E697465446562752O66203D207370652O6C283132363534292C0D0A2O20696D70726F76656453636F726368446562752O66203D207370652O6C28333833363038292C0D0A7D290D0A0D0A7370652O6C2E6D6167652E66726F7374203D204D657267655461626C6542794B6579287370652O6C2E6D6167652E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O20626C692O7A617264203D207370652O6C28313930333536292C202O2D73706C6173682C2031360D0A2O20626F6E654368692O6C696E67203D207370652O6C28323035303237292C0D0A2O20636861696E5265616374696F6E203D207370652O6C28323738333039292C0D0A2O20636F6C64657374536E6170203D207370652O6C28343137343933292C0D0A2O20636F6E656F66436F6C64203D207370652O6C28313230292C202O2D6D656C2O652C2031320D0A2O20636F6D657453746F726D203D207370652O6C28313533353935292C202O2D73706C6173682C20360D0A2O20642O65705368612O746572203D207370652O6C28333738373439292C0D0A2O2065626F6E626F6C74203D207370652O6C28323537353337292C202O2D73706C6173682C20382028776974682073706C692O74696E6720696365290D0A2O2066697265426C617374203D207370652O6C28333139383336292C0D0A2O20666C752O7279203D207370652O6C282O34363134292C0D0A2O2066722O657A696E675261696E203D207370652O6C28323730322O33292C0D0A2O2066722O657A696E6757696E6473203D207370652O6C28333832313033292C0D0A2O2066726F737462697465203D207370652O6C28333738373536292C0D0A2O2066726F7A656E4F7262203D207370652O6C283834373134292C202O2D73706C6173682C2031360D0A2O2066726F7A656E546F756368203D207370652O6C28323035303330292C0D0A2O20676C616369616C5370696B65203D207370652O6C28312O39373836292C202O2D73706C6173682C20382028776974682073706C692O74696E6720696365290D0A2O2069636542612O72696572203D207370652O6C282O31343236292C0D0A2O2069636543612O6C6572203D207370652O6C2832333O3632292C0D0A2O206963654C616E6365203D207370652O6C283330342O35292C202O2D73706C6173682C20382028776974682073706C692O74696E6720696365290D0A2O206963795665696E73203D207370652O6C283132343732292C0D0A2O207261796F6646726F7374203D207370652O6C28323035303231292C0D0A2O20736C69636B496365203D207370652O6C28333832312O34292C0D0A2O20736E6F7773746F726D203D207370652O6C28333831373036292C0D0A2O2073706C696E746572696E67436F6C64203D207370652O6C28333739303439292C0D0A2O2073706C692O74696E67496365203D207370652O6C283536332O37292C202O2D73706C6173682C20380D0A2O2073752O6D6F6E5761746572456C656D656E74616C203D207370652O6C283331363837292C0D0A2O202O2D20706574206162696C69746965730D0A2O2066722O657A65203D207370652O6C283O3339352C202270657422292C202O2D73706C6173682C20380D0A2O2077617465724A6574203D207370652O6C283133353032392C202270657422292C0D0A2O202O2D2062752O66730D0A2O20626F6E654368692O6C696E6742752O66203D207370652O6C28323035372O36292C0D0A2O20627261696E46722O657A6542752O66203D207370652O6C283139302O3436292C0D0A2O2066696E676572736F6646726F737442752O66203D207370652O6C282O34352O34292C0D0A2O2066722O657A696E675261696E42752O66203D207370652O6C28323730323332292C0D0A2O2066722O657A696E6757696E647342752O66203D207370652O6C28333832313036292C0D0A2O20676C616369616C5370696B6542752O66203D207370652O6C28312O39382O34292C0D0A2O20696369636C657342752O66203D207370652O6C28323035343733292C0D0A2O206963795665696E7342752O66203D207370652O6C283132343732292C0D0A2O20736E6F7773746F726D42752O66203D207370652O6C28333831352O32292C0D0A2O202O2D20646562752O66730D0A2O2066726F737462697465446562752O66203D207370652O6C28333738373630292C0D0A2O2077696E746572734368692O6C446562752O66203D207370652O6C282O3238333538292C0D0A7D290D0A0D0A2O2D206974656D730D0A6966206E6F74206974656D2E6D616765207468656E0D0A2O206974656D2E6D616765203D207B7D0D0A656E640D0A6974656D2E6D6167652E636F2O6D6F6E73203D207B0D0A2O2069726964616C203D206974656D283230383332312C207B31367D292C0D0A7D0D0A0D0A6974656D2E6D6167652E617263616E65203D204D657267655461626C6542794B6579286974656D2E6D6167652E636F2O6D6F6E732C207B0D0A2O206D616E6147656D203D206974656D283336372O39292C0D0A7D290D0A0D0A6974656D2E6D6167652E66697265203D204D657267655461626C6542794B6579286974656D2E6D6167652E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E6D6167652E66726F7374203D204D657267655461626C6542794B6579286974656D2E6D6167652E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F730D0A6966206E6F74206D6163726F2E6D616765207468656E0D0A2O206D6163726F2E6D616765203D207B7D0D0A656E640D0A6D6163726F2E6D6167652E636F2O6D6F6E73203D207B0D0A2O202O2D207370652O6C730D0A2O20617263616E65496E74652O6C656374506C61796572203D206D6163726F2822617263616E65496E74652O6C656374506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E6D6167652E636F2O6D6F6E732E617263616E65496E74652O6C6563743A4E616D65282O292C0D0A2O20636F756E7465727370652O6C4D6F7573656F766572203D206D6163726F2822636F756E7465727370652O6C4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6167652E636F2O6D6F6E732E636F756E7465727370652O6C3A4E616D65282O292C0D0A2O20706F6C796D6F7270684D6F7573656F766572203D206D6163726F2822706F6C796D6F7270684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6167652E636F2O6D6F6E732E706F6C796D6F7270683A4E616D65282O292C0D0A2O2072656D6F766543757273654D6F7573656F766572203D206D6163726F282272656D6F766543757273654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6167652E636F2O6D6F6E732E72656D6F766543757273653A4E616D65282O292C0D0A2O2072696E674F6646726F7374437572736F72203D206D6163726F282272696E674F6646726F7374437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E6D6167652E636F2O6D6F6E732E72696E674F6646726F73743A4E616D65282O292C0D0A2O2073746F7043617374696E67203D206D6163726F282273746F7043617374696E67222C20222F73746F7063617374696E6722292C0D0A2O202O2D206974656D730D0A2O2069726964616C203D206D6163726F282269726964616C222C20222F757365206974656D3A32303833323122292C0D0A7D0D0A0D0A6D6163726F2E6D6167652E617263616E65203D204D657267655461626C6542794B6579286D6163726F2E6D6167652E636F2O6D6F6E732C207B0D0A2O20617263616E6546616D696C696172506C61796572203D206D6163726F2822617263616E6546616D696C696172506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E6D6167652E617263616E652E617263616E6546616D696C6961723A4E616D65282O292C0D0A2O206D616E6147656D203D206D6163726F28226D616E6147656D222C20222F757365206974656D3A3336372O3922292C0D0A2O2063616E63656C50726573656E63656F664D696E64203D206D6163726F282263616E63656C50726573656E63656F664D696E64222C20222F63616E63656C617572612022202O2E207370652O6C2E6D6167652E617263616E652E70726573656E63656F664D696E643A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E6D6167652E66697265203D204D657267655461626C6542794B6579286D6163726F2E6D6167652E636F2O6D6F6E732C207B0D0A2O20666C616D65737472696B65437572736F72203D206D6163726F2822666C616D65737472696B65437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E6D6167652E666972652E666C616D65737472696B653A4E616D65282O292C0D0A2O206D6574656F72437572736F72203D206D6163726F28226D6574656F72437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E6D6167652E666972652E6D6574656F723A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E6D6167652E66726F7374203D204D657267655461626C6542794B6579286D6163726F2E6D6167652E636F2O6D6F6E732C207B0D0A2O20626C692O7A617264437572736F72203D206D6163726F2822626C692O7A617264437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E6D6167652E66726F73742E626C692O7A6172643A4E616D65282O292C0D0A2O206963654C616E63654D6F7573656F766572203D206D6163726F28226963654C616E63654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6167652E66726F73742E6963654C616E63653A4E616D65282O292C0D0A2O20666C752O72794D6F7573656F766572203D206D6163726F2822666C752O72794D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6167652E66726F73742E666C752O72793A4E616D65282O292C0D0A2O2066722O657A65437572736F72203D206D6163726F282266722O657A65437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E6D6167652E66726F73742E66722O657A653A4E616D65282O292C0D0A2O207261796F6646726F73744D6F7573656F766572203D206D6163726F28227261796F6646726F73744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6167652E66726F73742E7261796F6646726F73743A4E616D65282O292C0D0A7D290D0A00063O0012023O00013O00122O000100028O000200024O00019O003O00016O00017O00", GetFEnv(), ...);
