local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));elseif (v86==1) then local v117=v85[2];v78=(v117 + v84) -1 ;for v129=v117,v78 do local v130=v79[v129-v117 ];v83[v129]=v130;end else local v118=v85[2];v78=(v118 + v84) -1 ;for v132=v118,v78 do local v133=v79[v132-v118 ];v83[v132]=v133;end end elseif (v86<=3) then v83[v85[2]]=v85[3];elseif (v86>4) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v119=v85[2];v83[v119](v13(v83,v119 + 1 ,v78));end elseif (v86<=8) then if (v86<=6) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86>7) then do return;end else local v123=v85[2];v83[v123]=v83[v123](v83[v123 + 1 ]);end elseif (v86<=9) then v83[v85[2]]=v85[3];elseif (v86==10) then local v125=v85[2];v83[v125]=v83[v125](v83[v125 + 1 ]);else do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67030C3B2O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206D756C74695370652O6C203D206170692E6D756C74695370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C0D0A6966206E6F74207370652O6C2E6472756964207468656E0D0A2O207370652O6C2E6472756964203D207B7D0D0A656E640D0A7370652O6C2E64727569642E636F2O6D6F6E73203D207B0D0A2O202O2D206162696C69746965730D0A2O2061737472616C436F2O6D756E696F6E203D207370652O6C28323032333539292C0D0A2O2061737472616C496E666C75656E6365203D207370652O6C28313937353234292C0D0A2O206261726B736B696E203D207370652O6C282O32383132292C0D0A2O2062656172466F726D203D207370652O6C2835343837292C0D0A2O20636174466F726D203D207370652O6C28373638292C0D0A2O20636F6E766F6B6574686553706972697473203D207370652O6C28333931353238292C0D0A2O206665726F63696F757342697465203D207370652O6C282O32353638292C0D0A2O206672656E7A696564526567656E65726174696F6E203D207370652O6C282O32383432292C0D0A2O2068656172746F6674686557696C64203D207370652O6C28333139343534292C0D0A2O2068696265726E617465203D207370652O6C2832363337292C0D0A2O20692O6E657276617465203D207370652O6C283239312O36292C0D0A2O20696E636170616369746174696E67526F6172203D207370652O6C282O39292C0D0A2O20696D70726F7665644E61747572657343757265203D207370652O6C28333932333738292C0D0A2O2069726F6E667572203D207370652O6C28313932303831292C0D0A2O206E617475726573566967696C203D207370652O6C28313234393734292C0D0A2O206D61696D203D207370652O6C282O32353730292C0D0A2O206D61726B4F6654686557696C64203D207370652O6C282O313236292C0D0A2O206D696768747942617368203D207370652O6C2835322O31292C0D0A2O206D2O6F6E66697265203D207370652O6C2838393231292C0D0A2O206D2O6F6E6B696E466F726D203D206D756C74695370652O6C2832343835382C20313937363235292C0D0A2O20706F504865616C42752O66203D207370652O6C283339352O3336292C0D0A2O2070726F746563746F726F667468655061636B203D207370652O6C28333738393836292C0D0A2O2070726F776C203D206D756C74695370652O6C28353231352C20313032353437292C0D0A2O2072616B65203D207370652O6C2831382O32292C0D0A2O2072656269727468203D207370652O6C283230343834292C0D0A2O20726567726F777468203D207370652O6C2838393336292C0D0A2O2072656A7576656E6174696F6E203D207370652O6C282O3734292C0D0A2O2072656E6577616C203D207370652O6C28313038323338292C0D0A2O2072656D6F7665436F2O72757074696F6E203D207370652O6C2832373832292C0D0A2O20726576697665203D207370652O6C283530373639292C0D0A2O20726970203D207370652O6C2831303739292C0D0A2O207368726564203D207370652O6C28352O3231292C0D0A2O20732O6F746865203D207370652O6C2832393038292C0D0A2O20736B752O6C42617368203D207370652O6C28313036383339292C0D0A2O207374616D706564696E67526F6172203D207370652O6C283O373634292C0D0A2O207374617266697265203D206D756C74695370652O6C283139343135332C20313937363238292C0D0A2O20737461727375726765203D206D756C74695370652O6C2837383637342C20313937363236292C0D0A2O2073756E66697265203D207370652O6C283933343032292C0D0A2O20737572766976616C496E7374696E637473203D207370652O6C2836312O3336292C0D0A2O2073776966746D656E64203D207370652O6C283138353632292C0D0A2O207377697065203D206D756C74695370652O6C283130363738352C203231332O37312C20323133373634292C0D0A2O2074726176656C466F726D203D207370652O6C28373833292C0D0A2O20747970682O6F6E203D207370652O6C28313332343639292C0D0A2O20746872617368203D206D756C74695370652O6C283O3735382C20313036383330292C0D0A2O2077696C64436861726765203D206D756C74695370652O6C2831363937392C2034393337362C20313032343137292C0D0A2O2077696C6467726F777468203D207370652O6C283438343338292C0D0A2O207572736F6C73566F72746578203D207370652O6C28313032373933292C0D0A2O206D612O73456E74616E676C656D656E74203D207370652O6C28313032333539292C0D0A2O202O2D2062752O66730D0A2O206672656E7A696564526567656E65726174696F6E42752O66203D207370652O6C282O32383432292C0D0A2O2068656172746F6674686557696C6442752O66203D207370652O6C28333139343534292C0D0A2O2069726F6E66757242752O66203D207370652O6C28313932303831292C0D0A2O206D61726B6F6674686557696C6442752O66203D207370652O6C282O313236292C0D0A2O20706F504865616C42752O66203D207370652O6C283339352O3336292C0D0A2O2073752O64656E416D6275736842752O66203D207370652O6C28333430363938292C0D0A2O202O2D20646562752O66730D0A2O206D2O6F6E66697265446562752O66203D207370652O6C28313634383132292C0D0A2O2072616B65446562752O66203D207370652O6C28312O35372O32292C0D0A2O20726970446562752O66203D207370652O6C2831303739292C0D0A2O2073756E66697265446562752O66203D207370652O6C28313634383135292C0D0A2O20746872617368446562752O66203D206D756C74695370652O6C283130363833302C20313932303930292C0D0A2O202O2D2072616369616C730D0A2O206265727365726B696E67203D207370652O6C283236323937292C0D0A2O20736861646F776D656C64203D207370652O6C283538393834292C0D0A2O202O2D206F746865720D0A2O20702O6F6C203D207370652O6C284O393130290D0A7D0D0A0D0A7370652O6C2E64727569642E62616C616E6365203D204D657267655461626C6542794B6579287370652O6C2E64727569642E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O2061657468657269616C4B696E646C696E67203D207370652O6C28333237353431292C0D0A2O2061737472616C436F2O6D756E696F6E203D207370652O6C28342O30363336292C0D0A2O2061737472616C536D6F6C646572203D207370652O6C28333934303538292C0D0A2O2062616C616E63656F66412O6C5468696E6773203D207370652O6C28333934303438292C0D0A2O2063656C65737469616C416C69676E6D656E74203D206D756C74695370652O6C283139342O32332C20333833343130292C202O2D203139342O323320776974686F7574206F72626974616C20737472696B652C203338333431302077697468206F72626974616C20737472696B650D0A2O2065636C697073654C756E6172203D207370652O6C283438353138292C0D0A2O2065636C69707365536F6C6172203D207370652O6C283438353137292C0D0A2O20656C756E657347756964616E6365203D207370652O6C283339332O3931292C0D0A2O20666F7263656F664E6174757265203D207370652O6C28323035363336292C0D0A2O2066756E67616C47726F777468203D207370652O6C283339323O39292C0D0A2O20667572796F66456C756E65203D207370652O6C283230322O3730292C0D0A2O20696E6361726E6174696F6E203D206D756C74695370652O6C283130323536302C20333930343134292C202O2D2031303235363020776974686F7574206F72626974616C20737472696B652C203339303431342077697468206F72626974616C20737472696B650D0A2O20696E6361726E6174696F6E54616C656E74203D207370652O6C28333934303133292C0D0A2O206E61747572657342616C616E6365203D207370652O6C28323032343330292C0D0A2O206F72626974427265616B6572203D207370652O6C28333833313937292C0D0A2O206F72626974616C537472696B65203D207370652O6C28333930333738292C0D0A2O20706F7765724F66476F6C6472692O6E203D207370652O6C28333934303436292C0D0A2O207072696D6F726469616C417263616E696350756C736172203D207370652O6C28333933393630292C0D0A2O2072612O746C655468655374617273203D207370652O6C28333933393534292C0D0A2O20736F6C61724265616D203D207370652O6C283738363735292C0D0A2O20736F6C7374696365203D207370652O6C28333433363437292C0D0A2O20736F756C6F66746865466F72657374203D207370652O6C282O3134313037292C0D0A2O207374617266612O6C203D207370652O6C28313931303334292C0D0A2O20737461726C6F7264203D207370652O6C28323032333435292C0D0A2O2073746172776561766572203D207370652O6C28333933393430292C0D0A2O207374652O6C6172466C617265203D207370652O6C28323032333437292C0D0A2O207377697065203D207370652O6C28323133373634292C0D0A2O207477696E4D2O6F6E73203D207370652O6C28323739363230292C0D0A2O20756D6272616C456D6272616365203D207370652O6C28333933373630292C0D0A2O20756D6272616C496E74656E73697479203D207370652O6C28333833313935292C0D0A2O2077616E696E675477696C69676874203D207370652O6C28333933393536292C0D0A2O2077612O72696F726F66456C756E65203D207370652O6C28323032343235292C0D0A2O2077696C644D757368722O6F6D203D207370652O6C282O38373437292C0D0A2O2077696C64537572676573203D207370652O6C28343036383930292C0D0A2O207772617468203D207370652O6C28313930393834292C0D0A2O202O2D206E6577206D2O6F6E207068617365730D0A2O2066752O6C4D2O6F6E203D207370652O6C28323734323833292C0D0A2O2068616C664D2O6F6E203D207370652O6C28323734323832292C0D0A2O206E65774D2O6F6E203D207370652O6C28323734323831292C0D0A2O202O2D2062752O66730D0A2O20624F4154417263616E6542752O66203D207370652O6C28333934303530292C0D0A2O20624F41544E617475726542752O66203D207370652O6C28333934303439292C0D0A2O20634142752O66203D207370652O6C28333833343130292C0D0A2O20647265616D737461746542752O66203D207370652O6C28343234323438292C202O2D20543331203270630D0A2O20696E6361726E6174696F6E42752O66203D207370652O6C28333930343134292C0D0A2O2070415042752O66203D207370652O6C28333933393631292C0D0A2O2072612O746C6564537461727342752O66203D207370652O6C28333933392O35292C0D0A2O20736F6C737469636542752O66203D207370652O6C28333433363438292C0D0A2O207374617266612O6C42752O66203D207370652O6C28313931303334292C0D0A2O20737461726C6F726442752O66203D207370652O6C28323739373039292C0D0A2O20737461727765617665727357617270203D207370652O6C28333933393432292C0D0A2O20737461727765617665727357656674203D207370652O6C28333933392O34292C0D0A2O20756D6272616C456D627261636542752O66203D207370652O6C28333933373633292C0D0A2O2077612O72696F726F66456C756E6542752O66203D207370652O6C28323032343235292C0D0A2O202O2D20646562752O66730D0A2O2066756E67616C47726F777468446562752O66203D207370652O6C283831323831292C0D0A2O207374652O6C6172466C617265446562752O66203D207370652O6C28323032333437292C0D0A2O202O2D207469657220323920652O66656374730D0A2O20676174686572696E67537461727374752O66203D207370652O6C2833392O343132292C0D0A2O20746F756368746865436F736D6F73203D207370652O6C2833392O343134292C0D0A2O202O2D206C6567656E6461727920652O66656374730D0A2O20624F4154417263616E654C656742752O66203D207370652O6C282O332O393436292C0D0A2O20624F41544E61747572654C656742752O66203D207370652O6C282O332O393433292C0D0A2O206F6E65746873436C656172566973696F6E42752O66203D207370652O6C282O3339373937292C0D0A2O206F6E6574687350657263657074696F6E42752O66203D207370652O6C282O3339382O30292C0D0A2O2074696D65776F726E447265616D62696E64657242752O66203D207370652O6C2833342O303439290D0A7D290D0A0D0A7370652O6C2E64727569642E666572616C203D204D657267655461626C6542794B6579287370652O6C2E64727569642E636F2O6D6F6E732C207B0D0A2O202O2D2074616C656E74730D0A2O206164617074697665537761726D203D207370652O6C283339313O38292C0D0A2O20617065785072656461746F727343726176696E67203D207370652O6C283339312O3831292C0D0A2O20617368616D616E657347756964616E6365203D207370652O6C28333931353438292C0D0A2O206265727365726B203D207370652O6C28313036393531292C0D0A2O206265727365726B48656172746F667468654C696F6E203D207370652O6C2833392O313734292C0D0A2O20626C2O6F6474616C6F6E73203D207370652O6C28333139343339292C0D0A2O2062727574616C536C617368203D207370652O6C28323032303238292C0D0A2O20636972636C656F664C696665616E644465617468203D207370652O6C28342O30333230292C0D0A2O20646972654669786174696F6E203D207370652O6C2834312O373130292C0D0A2O20646F75626C65436C6177656452616B65203D207370652O6C28333931372O30292C0D0A2O20666572616C4672656E7A79203D207370652O6C28323734383337292C0D0A2O206672616E7469634D6F6D656E74756D203D207370652O6C28333931383735292C0D0A2O20696E6361726E6174696F6E203D207370652O6C28313032353433292C0D0A2O206C696F6E73537472656E677468203D207370652O6C28333931393732292C0D0A2O206C756E6172496E737069726174696F6E203D207370652O6C28313O353830292C0D0A2O206C494D2O6F6E66697265203D207370652O6C28312O35363235292C202O2D206C756E617220696E737069726174696F6E206D2O6F6E666972650D0A2O206D6F6D656E746F66436C6172697479203D207370652O6C28323336303638292C0D0A2O207072656461746F72203D207370652O6C28323032303231292C0D0A2O207072696D616C5772617468203D207370652O6C28323835333831292C0D0A2O2072616D70616E744665726F63697479203D207370652O6C28333931373039292C0D0A2O20726970616E6454656172203D207370652O6C28333931333437292C0D0A2O207361626572742O6F7468203D207370652O6C28323032303331292C0D0A2O20736F756C6F66746865466F72657374203D207370652O6C28313538343736292C0D0A2O207377697065203D207370652O6C28313036373835292C0D0A2O20746561724F70656E576F756E6473203D207370652O6C28333931373835292C0D0A2O20746872617368696E67436C617773203D207370652O6C28343035332O30292C0D0A2O2074696765727346757279203D207370652O6C2835323137292C0D0A2O20756E627269646C6564537761726D203D207370652O6C28333931393531292C0D0A2O2077696C64536C6173686573203D207370652O6C28333930383634292C0D0A2O202O2D2062752O66730D0A2O20617065785072656461746F727343726176696E6742752O66203D207370652O6C283339312O3832292C0D0A2O20626C2O6F6474616C6F6E7342752O66203D207370652O6C28313435313532292C0D0A2O20636C65617263617374696E67203D207370652O6C28313335372O30292C0D0A2O206F766572666C6F77696E67506F77657242752O66203D207370652O6C28343035313839292C0D0A2O207072656461746F7252657665616C656442752O66203D207370652O6C28343038343638292C202O2D207433302070340D0A2O207072656461746F727953776966746E652O7342752O66203D207370652O6C283639333639292C0D0A2O207361626572742O6F746842752O66203D207370652O6C28333931372O32292C0D0A2O20736D6F6C646572696E674672656E7A7942752O66203D207370652O6C28342O32373531292C202O2D205433312050320D0A2O2073752O64656E416D6275736842752O66203D207370652O6C28333931393734292C0D0A2O202O2D20646562752O66730D0A2O206164617074697665537761726D446562752O66203D207370652O6C283339312O3839292C0D0A2O206164617074697665537761726D4865616C203D207370652O6C28333931383931292C0D0A2O20646972654669786174696F6E446562752O66203D207370652O6C2834312O373133292C0D0A2O206C494D2O6F6E66697265446562752O66203D207370652O6C28312O35363235292C0D0A2O20746872617368446562752O66203D207370652O6C28343035322O33292C0D0A7D290D0A0D0A7370652O6C2E64727569642E677561726469616E203D204D657267655461626C6542794B6579287370652O6C2E64727569642E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O206265727365726B203D207370652O6C2835302O3334292C0D0A2O2062726973746C696E67467572203D207370652O6C28312O35383335292C0D0A2O20647265616D6F6643656E6172697573203D207370652O6C283337322O3139292C0D0A2O20666C617368696E67436C617773203D207370652O6C28333933343237292C0D0A2O20667572796F664E6174757265203D207370652O6C28333730363935292C0D0A2O20696E6361726E6174696F6E203D207370652O6C283130322O3538292C0D0A2O206C6179657265644D616E65203D207370652O6C28333834373231292C0D0A2O206C756E61724265616D203D207370652O6C28323034302O36292C0D0A2O206D616E676C65203D207370652O6C282O33393137292C0D0A2O206D61756C203D207370652O6C2836383037292C0D0A2O2070756C766572697A65203D207370652O6C283830333133292C0D0A2O20726167656F66746865536C2O65706572203D207370652O6C28322O30383531292C0D0A2O2072617A65203D207370652O6C28342O30323534292C0D0A2O207265696E666F72636564467572203D207370652O6C28333933363138292C0D0A2O20736F756C6F66746865466F72657374203D207370652O6C28313538342O37292C0D0A2O207377697065203D207370652O6C283231332O3731292C0D0A2O2074686F726E736F6649726F6E203D207370652O6C28342O303O32292C0D0A2O20742O6F7468616E64436C6177203D207370652O6C28313335322O38292C0D0A2O20766963696F75734379636C65203D207370652O6C283337313O39292C0D0A2O2076756C6E657261626C65466C657368203D207370652O6C28333732363138292C0D0A2O202O2D2062752O66730D0A2O206265727365726B42752O66203D207370652O6C2835302O3334292C0D0A2O20647265616D6F6643656E617269757342752O66203D207370652O6C28333732313532292C0D0A2O2067616C6163746963477561726469616E42752O66203D207370652O6C28323133373038292C0D0A2O20676F726542752O66203D207370652O6C2839332O3632292C0D0A2O20696E6361726E6174696F6E42752O66203D207370652O6C283130322O3538292C0D0A2O20742O6F7468616E64436C617742752O66203D207370652O6C28313335323836292C0D0A2O20766963696F75734379636C654D61756C42752O66203D207370652O6C28333732303135292C0D0A2O20766963696F75734379636C654D616E676C6542752O66203D207370652O6C28333732303139292C0D0A2O202O2D20646562752O66730D0A2O20742O6F7468616E64436C6177446562752O66203D207370652O6C28313335363031292C0D0A7D290D0A0D0A7370652O6C2E64727569642E726573746F726174696F6E203D204D657267655461626C6542794B6579287370652O6C2E64727569642E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O206162756E64616E6365203D207370652O6C28323037333833292C0D0A2O206164617074697665537761726D203D207370652O6C283339313O38292C0D0A2O2062616C616E6365412O66696E697479203D207370652O6C28313937363332292C0D0A2O2063656E6172696F6E57617264203D207370652O6C28313032333531292C0D0A2O2065636C697073654C756E6172203D207370652O6C283438353138292C0D0A2O2065636C69707365536F6C6172203D207370652O6C283438353137292C0D0A2O20652O666C6F72657363656E6365203D207370652O6C28313435323035292C0D0A2O20666572616C412O66696E697479203D207370652O6C28313937343930292C0D0A2O20666C6F7572697368203D207370652O6C2831392O373231292C0D0A2O206765726D696E6174696F6E203D207370652O6C28312O35363735292C0D0A2O2067726F7665477561726469616E73203D207370652O6C28313032363933292C0D0A2O2069726F6E4261726B203D207370652O6C28313032333432292C0D0A2O206C696665626C2O6F6D203D206D756C74695370652O6C282O333736332C20312O382O3530292C0D0A2O206E61747572657343757265203D207370652O6C282O38343233292C0D0A2O206E61747572657353776966746E652O73203D207370652O6C28313332313538292C0D0A2O2070686F746F73796E746865736973203D207370652O6C28323734393032292C0D0A2O207265666F726573746174696F6E203D207370652O6C28333932333536292C0D0A2O207265766974616C697A65203D207370652O6C28323132303430292C0D0A2O20736F756C6F66746865466F72657374203D207370652O6C28313538343738292C0D0A2O207472616E7175696C697479203D207370652O6C28373430292C0D0A2O20756E627269646C6564537761726D203D207370652O6C28333931393531292C0D0A2O20756E64657267726F777468203D207370652O6C28333932333031292C0D0A2O207772617468203D207370652O6C2835313736292C0D0A2O202O2D2062752O66730D0A2O206164617074697665537761726D4865616C203D207370652O6C28333931383931292C0D0A2O20696E6361726E6174696F6E42752O66203D207370652O6C282O3137363739292C0D0A2O20736F756C6F66746865466F7265737442752O66203D207370652O6C282O3134313038292C0D0A2O202O2D20646562752O66730D0A2O206164617074697665537761726D446562752O66203D207370652O6C283339312O3839292C0D0A7D290D0A0D0A2O2D206974656D730D0A6966206E6F74206974656D2E6472756964207468656E0D0A2O206974656D2E6472756964203D207B7D0D0A656E640D0A6974656D2E64727569642E636F2O6D6F6E73203D207B0D0A2O20646A61722O756E203D206974656D28323032353639292C0D0A2O2069726964616C203D206974656D283230383332312C207B31367D292C0D0A7D0D0A0D0A6974656D2E64727569642E62616C616E6365203D204D657267655461626C6542794B6579286974656D2E64727569642E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E64727569642E666572616C203D204D657267655461626C6542794B6579286974656D2E64727569642E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E64727569642E677561726469616E203D204D657267655461626C6542794B6579286974656D2E64727569642E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E64727569642E726573746F726174696F6E203D204D657267655461626C6542794B6579286974656D2E64727569642E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F730D0A6966206E6F74206D6163726F2E6472756964207468656E0D0A2O206D6163726F2E6472756964203D207B7D0D0A656E640D0A6D6163726F2E64727569642E636F2O6D6F6E73203D207B0D0A2O202O2D2062617365207370652O6C730D0A2O20636F6E766F6B65746865537069726974734D6F7573656F766572203D206D6163726F2822636F6E766F6B65746865537069726974734D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E692O6E6572766174653A4E616D65282O292C0D0A2O20692O6E657276617465506C61796572203D206D6163726F2822692O6E657276617465506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E692O6E6572766174653A4E616D65282O292C0D0A2O206665726F63696F7573426974654D6F7573656F766572203D206D6163726F28226665726F63696F7573426974654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E6665726F63696F7573426974653A4E616D65282O292C0D0A2O2068696265726E6174654D6F7573656F766572203D206D6163726F282268696265726E6174654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E68696265726E6174653A4E616D65282O292C0D0A2O206D61726B4F6654686557696C64506C61796572203D206D6163726F28226D61726B4F6654686557696C64506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E6D61726B4F6654686557696C643A4E616D65282O292C0D0A2O20736B752O6C426173684D6F7573656F766572203D206D6163726F2822736B752O6C426173684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E736B752O6C426173683A4E616D65282O292C0D0A2O206D6967687479426173684D6F7573656F766572203D206D6163726F28226D6967687479426173684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E6D6967687479426173683A4E616D65282O292C0D0A2O206D2O6F6E666972654D6F7573656F766572203D206D6163726F28226D2O6F6E666972654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E6D2O6F6E666972653A4E616D65282O292C0D0A2O2072616B654D6F7573656F766572203D206D6163726F282272616B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E72616B653A4E616D65282O292C0D0A2O207269704D6F7573656F766572203D206D6163726F28227269704D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E7269703A4E616D65282O292C0D0A2O20726562697274684D6F7573656F766572203D206D6163726F2822726562697274684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E726562697274683A4E616D65282O292C0D0A2O207265766976654D6F7573656F766572203D206D6163726F28227265766976654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E7265766976653A4E616D65282O292C0D0A2O2072656D6F7665436F2O72757074696F6E4D6F7573656F766572203D206D6163726F282272656D6F7665436F2O72757074696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E72656D6F7665436F2O72757074696F6E3A4E616D65282O292C0D0A2O20726567726F777468466F637573203D206D6163726F2822726567726F777468466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E726567726F7774683A4E616D65282O292C0D0A2O20726567726F7774684D6F7573656F766572203D206D6163726F2822726567726F7774684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E726567726F7774683A4E616D65282O292C0D0A2O20726567726F777468506C61796572203D206D6163726F2822726567726F777468506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E726567726F7774683A4E616D65282O292C0D0A2O2072656A7576656E6174696F6E466F637573203D206D6163726F282272656A7576656E6174696F6E466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E72656A7576656E6174696F6E3A4E616D65282O292C0D0A2O2072656A7576656E6174696F6E4D6F7573656F766572203D206D6163726F282272656A7576656E6174696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E72656A7576656E6174696F6E3A4E616D65282O292C0D0A2O2073687265644D6F7573656F766572203D206D6163726F282273687265644D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E73687265643A4E616D65282O292C0D0A2O2073756E666972654D6F7573656F766572203D206D6163726F282273756E666972654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E73756E666972653A4E616D65282O292C0D0A2O2073776966746D656E64466F637573203D206D6163726F282273776966746D656E64466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E73776966746D656E643A4E616D65282O292C0D0A2O2073776966746D656E644D6F7573656F766572203D206D6163726F282273776966746D656E644D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E73776966746D656E643A4E616D65282O292C0D0A2O2073776966746D656E64506C61796572203D206D6163726F282273776966746D656E64506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E73776966746D656E643A4E616D65282O292C0D0A2O20736B752O6C426173684D6F7573656F766572203D206D6163726F2822736B752O6C426173684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E736B752O6C426173683A4E616D65282O292C0D0A2O207468726173684D6F7573656F766572203D206D6163726F28227468726173684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E7468726173683A4E616D65282O292C0D0A2O2077696C6467726F777468466F637573203D206D6163726F282277696C6467726F777468466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E77696C6467726F7774683A4E616D65282O292C0D0A2O207572736F6C73566F72746578437572736F72203D206D6163726F28227572736F6C73566F72746578437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E64727569642E636F2O6D6F6E732E7572736F6C73566F727465783A4E616D65282O292C0D0A2O202O2D206974656D730D0A2O20646A61722O756E203D206D6163726F2822646A61722O756E222C20222F757365206974656D3A32303235363922292C0D0A2O2069726964616C203D206D6163726F282269726964616C222C20222F757365206974656D3A32303833323122292C0D0A2O202O2D206D6973630D0A2O2073746F7043617374696E67203D206D6163726F282273746F7043617374696E67222C20222F73746F7063617374696E6722292C0D0A7D0D0A0D0A6D6163726F2E64727569642E62616C616E6365203D204D657267655461626C6542794B6579286D6163726F2E64727569642E636F2O6D6F6E732C207B0D0A2O2063616E63656C537461726C6F726442752O66203D206D6163726F282263616E63656C537461726C6F726442752O66222C20222F63616E63656C617572612022202O2E207370652O6C2E64727569642E62616C616E63652E737461726C6F726442752O663A4E616D65282O292C0D0A2O2063656C65737469616C416C69676E6D656E74437572736F72203D206D6163726F282263656C65737469616C416C69676E6D656E74437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E64727569642E62616C616E63652E63656C65737469616C416C69676E6D656E743A4E616D65282O292C0D0A2O20696E6361726E6174696F6E437572736F72203D206D6163726F2822696E6361726E6174696F6E437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E64727569642E62616C616E63652E696E6361726E6174696F6E3A4E616D65282O292C0D0A2O20666F7263656F664E6174757265506C61796572203D206D6163726F2822666F7263656F664E6174757265506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64727569642E62616C616E63652E666F7263656F664E61747572653A4E616D65282O292C0D0A2O20736F6C61724265616D4D6F7573656F766572203D206D6163726F2822736F6C61724265616D4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E62616C616E63652E736F6C61724265616D3A4E616D65282O292C0D0A2O207374652O6C6172466C6172654D6F7573656F766572203D206D6163726F28227374652O6C6172466C6172654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E62616C616E63652E7374652O6C6172466C6172653A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E64727569642E666572616C203D204D657267655461626C6542794B6579286D6163726F2E64727569642E636F2O6D6F6E732C207B0D0A2O206164617074697665537761726D4D6F7573656F766572203D206D6163726F28226164617074697665537761726D4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E666572616C2E6164617074697665537761726D3A4E616D65282O292C0D0A2O2062727574616C536C6173684D6F7573656F766572203D206D6163726F282262727574616C536C6173684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E666572616C2E62727574616C536C6173683A4E616D65282O292C0D0A2O20666572616C4672656E7A794D6F7573656F766572203D206D6163726F2822666572616C4672656E7A794D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E666572616C2E666572616C4672656E7A793A4E616D65282O292C0D0A2O206C494D2O6F6E666972654D6F7573656F766572203D206D6163726F28226C494D2O6F6E666972654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E666572616C2E6C494D2O6F6E666972653A4E616D65282O292C0D0A2O207072696D616C57726174684D6F7573656F766572203D206D6163726F28227072696D616C57726174684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E666572616C2E7072696D616C57726174683A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E64727569642E677561726469616E203D204D657267655461626C6542794B6579286D6163726F2E64727569642E636F2O6D6F6E732C207B0D0A2O2070756C766572697A654D6F7573656F766572203D206D6163726F282270756C766572697A654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E677561726469616E2E70756C766572697A653A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E64727569642E726573746F726174696F6E203D204D657267655461626C6542794B6579286D6163726F2E64727569642E636F2O6D6F6E732C207B0D0A2O202O2D2062617365207370652O6C730D0A2O206164617074697665537761726D466F637573203D206D6163726F28226164617074697665537761726D466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E64727569642E726573746F726174696F6E2E6164617074697665537761726D3A4E616D65282O292C0D0A2O2063656E6172696F6E57617264466F637573203D206D6163726F282263656E6172696F6E57617264466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E64727569642E726573746F726174696F6E2E63656E6172696F6E576172643A4E616D65282O292C0D0A2O20652O666C6F72657363656E6365437572736F72203D206D6163726F2822652O666C6F72657363656E6365437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E64727569642E726573746F726174696F6E2E652O666C6F72657363656E63653A4E616D65282O292C0D0A2O2069726F6E4261726B466F637573203D206D6163726F282269726F6E4261726B466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E64727569642E726573746F726174696F6E2E69726F6E4261726B3A4E616D65282O292C0D0A2O2069726F6E4261726B4D6F7573656F766572203D206D6163726F282269726F6E4261726B4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E726573746F726174696F6E2E69726F6E4261726B3A4E616D65282O292C0D0A2O206C696665626C2O6F6D466F637573203D206D6163726F28226C696665626C2O6F6D466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E64727569642E726573746F726174696F6E2E6C696665626C2O6F6D3A4E616D65282O292C0D0A2O206C696665626C2O6F6D506C61796572203D206D6163726F28226C696665626C2O6F6D506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64727569642E726573746F726174696F6E2E6C696665626C2O6F6D3A4E616D65282O292C0D0A2O206E61747572657343757265466F637573203D206D6163726F28226E61747572657343757265466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E64727569642E726573746F726174696F6E2E6E617475726573437572653A4E616D65282O292C0D0A2O206E617475726573437572654D6F7573656F766572203D206D6163726F28226E617475726573437572654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64727569642E726573746F726174696F6E2E6E617475726573437572653A4E616D65282O292C0D0A7D290D0A00063O0012053O00013O001203000100024O000A3O000200022O000200016O00045O00012O000B3O00017O00",v9(),...);