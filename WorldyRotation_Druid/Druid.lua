local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110]=v83[v110](v83[v110 + 1 ]);elseif (v86>1) then local v113=v85[2];v78=(v113 + v84) -1 ;for v128=v113,v78 do local v129=v79[v128-v113 ];v83[v128]=v129;end else v83[v85[2]]=v59[v85[3]];end elseif (v86<=4) then if (v86==3) then local v116;local v117;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v83[v117]=v83[v117](v83[v117 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v78=(v117 + v84) -1 ;for v131=v117,v78 do v116=v79[v131-v117 ];v83[v131]=v116;end v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v83[v117](v13(v83,v117 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else do return;end end elseif (v86==5) then local v124=v85[2];v83[v124](v13(v83,v124 + 1 ,v78));else v83[v85[2]]=v85[3];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703FE572O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A3O2D207O3D204C4F43414C495A45207O3D0D0A2O2D20412O646F6E0D0A6C6F63616C20612O646F6E4E616D652C20612O646F6E5461626C65203D203O2E0D0A2O2D204865726F4442430D0A6C6F63616C20444243203D204865726F4442432E4442430D0A2O2D204865726F4C69620D0A6C6F63616C20484C9O203D204865726F4C69620D0A6C6F63616C2043616368656O203D204865726F43616368650D0A6C6F63616C20556E69747O203D20484C2E556E69740D0A6C6F63616C20506C617965725O203D20556E69742E506C617965720D0A6C6F63616C205461726765745O203D20556E69742E5461726765740D0A6C6F63616C205065748O203D20556E69742E5065740D0A6C6F63616C205370652O6C6O203D20484C2E5370652O6C0D0A6C6F63616C204D756C74695370652O6C203D20484C2E4D756C74695370652O6C0D0A6C6F63616C204974656D7O203D20484C2E4974656D0D0A6C6F63616C204D657267655461626C6542794B6579203D20484C2E5574696C732E4D657267655461626C6542794B65790D0A2O2D20576F726C6479526F746174696F6E0D0A6C6F63616C2057529O203D20576F726C6479526F746174696F6E0D0A6C6F63616C204D6163726F6O203D2057522E4D6163726F0D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D3D0D0A0D0A2O2D205370652O6C0D0A6966206E6F74205370652O6C2E4472756964207468656E205370652O6C2E4472756964203D207B7D20656E640D0A5370652O6C2E44727569642E436F2O6D6F6E73203D207B0D0A2O202O2D2052616369616C730D0A2O204265727365726B696E679O209O209O20203D205370652O6C283236323937292C0D0A2O20536861646F776D656C649O209O209O20203D205370652O6C283538393834292C0D0A2O202O2D204162696C69746965730D0A2O204261726B736B696E9O209O209O203O203D205370652O6C282O32383132292C0D0A2O2042656172466F726D9O209O209O203O203D205370652O6C2835343837292C0D0A2O20436174466F726D9O209O209O204O203D205370652O6C28373638292C0D0A2O204665726F63696F7573426974659O209O207O203D205370652O6C282O32353638292C0D0A2O204D61726B4F6654686557696C649O209O207O203D205370652O6C282O313236292C0D0A2O204D2O6F6E666972659O209O209O203O203D205370652O6C2838393231292C0D0A2O2050726F776C9O209O209O206O203D205370652O6C2835323135292C0D0A2O20526562697274689O209O209O204O203D205370652O6C283230343834292C0D0A2O20526567726F7774689O209O209O203O203D205370652O6C2838393336292C0D0A2O2052656A7576656E6174696F6E9O209O208O203D205370652O6C282O3734292C0D0A2O205265766976659O209O209O205O203D205370652O6C283530373639292C0D0A2O2053687265649O209O209O206O203D205370652O6C28352O3231292C0D0A2O20532O6F7468659O209O209O205O203D205370652O6C2832393038292C0D0A2O2054726176656C466F726D9O209O209O20203D205370652O6C28373833292C0D0A2O202O2D2054616C656E74730D0A2O2041737472616C436F2O6D756E696F6E9O209O205O203D205370652O6C28323032333539292C0D0A2O20436F6E766F6B65546865537069726974739O209O203O203D205370652O6C28333931353238292C0D0A2O204672656E7A696564526567656E65726174696F6E9O209O203D205370652O6C282O32383432292C0D0A2O2048656172744F6654686557696C649O209O206O203D205370652O6C28333139343534292C0D0A2O20492O6E6572766174659O209O209O202O203D205370652O6C283239312O36292C0D0A2O20496E636170616369746174696E67526F61729O209O202O203D205370652O6C282O39292C0D0A2O20496D70726F7665644E617475726573437572659O209O20203D205370652O6C28333932333738292C0D0A2O2049726F6E6675729O209O209O204O203D205370652O6C28313932303831292C0D0A2O204E617475726573566967696C9O209O208O203D205370652O6C28313234393734292C0D0A2O204D61696D9O209O209O207O203D205370652O6C282O32353730292C0D0A2O204D6967687479426173689O209O209O20203D205370652O6C2835322O31292C0D0A2O204D2O6F6E6B696E466F726D9O209O209O203D204D756C74695370652O6C2832343835382C313937363235292C0D0A2O20506F504865616C42752O669O209O209O203D205370652O6C283339352O3336292C0D0A2O2052616B659O209O209O207O203D205370652O6C2831382O32292C0D0A2O2052656E6577616C9O209O209O204O203D205370652O6C28313038323338292C0D0A2O2052656D6F7665436F2O72757074696F6E9O209O204O203D205370652O6C2832373832292C0D0A2O205269709O209O209O208O203D205370652O6C2831303739292C0D0A2O20536B752O6C426173689O209O209O202O203D205370652O6C28313036383339292C0D0A2O205374616D706564696E67526F61729O209O206O203D205370652O6C283O373634292C0D0A2O2053746172666972659O209O209O203O203D205370652O6C28313934313533292C0D0A2O205374617273757267659O209O209O202O203D204D756C74695370652O6C2837383637342C313937363236292C0D0A2O2053756E666972659O209O209O204O203D205370652O6C283933343032292C0D0A2O20537572766976616C496E7374696E6374739O209O203O203D205370652O6C2836312O3336292C0D0A2O2053776966746D656E649O209O209O202O203D205370652O6C283138353632292C0D0A2O2053776970659O209O209O206O203D204D756C74695370652O6C283130363738352C3231332O37312C323133373634292C0D0A2O20547970682O6F6E9O209O209O204O203D205370652O6C28313332343639292C0D0A2O205468726173689O209O209O205O203D204D756C74695370652O6C283O3735382C313036383330292C0D0A2O2057696C644368617267659O209O209O20203D204D756C74695370652O6C2831363937392C34393337362C313032343137292C0D0A2O2057696C6467726F7774689O209O209O20203D205370652O6C283438343338292C0D0A2O205572736F6C73566F727465789O209O208O203D205370652O6C28313032373933292C0D0A2O204D612O73456E74616E676C656D656E749O209O204O203D205370652O6C28313032333539292C0D0A2O202O2D2042752O66730D0A2O204672656E7A696564526567656E65726174696F6E42752O669O205O203D205370652O6C282O32383432292C0D0A2O2049726F6E66757242752O669O209O209O203D205370652O6C28313932303831292C0D0A2O2053752O64656E416D6275736842752O669O209O204O203D205370652O6C28333430363938292C0D0A2O202O2D20446562752O66730D0A2O204D2O6F6E66697265446562752O669O209O206O203D205370652O6C28313634383132292C0D0A2O2052616B65446562752O669O209O209O20203D205370652O6C28312O35372O32292C0D0A2O2053756E66697265446562752O669O209O207O203D205370652O6C28313634383135292C0D0A2O20546872617368446562752O669O209O208O203D204D756C74695370652O6C283130363833302C313932303930292C0D0A2O202O2D204F746865720D0A2O20502O6F6C9O209O209O207O203D205370652O6C284O393130290D0A7D0D0A0D0A5370652O6C2E44727569642E42616C616E6365203D204D657267655461626C6542794B6579285370652O6C2E44727569642E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O2045636C697073654C756E61729O209O208O203D205370652O6C283438353138292C0D0A2O2045636C69707365536F6C61729O209O208O203D205370652O6C283438353137292C0D0A2O2057726174689O209O209O206O203D205370652O6C28313930393834292C0D0A2O202O2D2054616C656E74730D0A2O2041657468657269616C4B696E646C696E679O209O203O203D205370652O6C28333237353431292C0D0A2O2041737472616C436F2O6D756E696F6E9O209O205O203D205370652O6C28342O30363336292C0D0A2O2041737472616C536D6F6C6465729O209O207O203D205370652O6C28333934303538292C0D0A2O2042616C616E63656F66412O6C5468696E67739O209O202O203D205370652O6C28333934303438292C0D0A2O2043656C65737469616C416C69676E6D656E749O209O202O203D204D756C74695370652O6C283139342O32332C333833343130292C202O2D203139342O323320776974686F7574204F72626974616C20537472696B652C203338333431302077697468204F72626974616C20537472696B650D0A2O20456C756E657347756964616E63659O209O206O203D205370652O6C283339332O3931292C0D0A2O20466F7263654F664E61747572659O209O207O203D205370652O6C28323035363336292C0D0A2O2046756E67616C47726F7774689O209O208O203D205370652O6C283339323O39292C0D0A2O20467572794F66456C756E659O209O209O203D205370652O6C283230322O3730292C0D0A2O20496E6361726E6174696F6E9O209O209O203D204D756C74695370652O6C283130323536302C333930343134292C202O2D2031303235363020776974686F7574204F72626974616C20537472696B652C203339303431342077697468204F72626974616C20537472696B650D0A2O20496E6361726E6174696F6E54616C656E749O209O203O203D205370652O6C28333934303133292C0D0A2O204E61747572657342616C616E63659O209O206O203D205370652O6C28323032343330292C0D0A2O204F72626974427265616B65729O209O208O203D205370652O6C28333833313937292C0D0A2O204F72626974616C537472696B659O209O207O203D205370652O6C28333930333738292C0D0A2O20506F7765724F66476F6C6472692O6E9O209O205O203D205370652O6C28333934303436292C0D0A2O205072696D6F726469616C417263616E696350756C7361729O206O203D205370652O6C28333933393630292C0D0A2O2052612O746C6554686553746172739O209O206O203D205370652O6C28333933393534292C0D0A2O20536F6C73746963659O209O209O203O203D205370652O6C28333433363437292C0D0A2O20536F756C4F66546865466F726573749O209O205O203D205370652O6C282O3134313037292C0D0A2O205374617266612O6C9O209O209O203O203D205370652O6C28313931303334292C0D0A2O20537461726C6F72649O209O209O203O203D205370652O6C28323032333435292C0D0A2O20537461727765617665729O209O209O20203D205370652O6C28333933393430292C0D0A2O205374652O6C6172466C6172659O209O208O203D205370652O6C28323032333437292C0D0A2O205477696E4D2O6F6E739O209O209O202O203D205370652O6C28323739363230292C0D0A2O20556D6272616C456D62726163659O209O207O203D205370652O6C28333933373630292C0D0A2O20556D6272616C496E74656E736974799O209O205O203D205370652O6C28333833313935292C0D0A2O2057616E696E675477696C696768749O209O206O203D205370652O6C28333933393536292C0D0A2O2057612O72696F724F66456C756E659O209O206O203D205370652O6C28323032343235292C0D0A2O2057696C644D757368722O6F6D9O209O208O203D205370652O6C282O38373437292C0D0A2O202O2D204E6577204D2O6F6E205068617365730D0A2O2046752O6C4D2O6F6E9O209O209O203O203D205370652O6C28323734323833292C0D0A2O2048616C664D2O6F6E9O209O209O203O203D205370652O6C28323734323832292C0D0A2O204E65774D2O6F6E9O209O209O204O203D205370652O6C28323734323831292C0D0A2O202O2D2042752O66730D0A2O20424F4154417263616E6542752O669O209O206O203D205370652O6C28333934303530292C0D0A2O20424F41544E617475726542752O669O209O206O203D205370652O6C28333934303439292C0D0A2O20434142752O669O209O209O205O203D205370652O6C28333833343130292C0D0A2O20496E6361726E6174696F6E42752O669O209O205O203D204D756C74695370652O6C283130323536302C333930343134292C0D0A2O2050415042752O669O209O209O204O203D205370652O6C28333933393631292C0D0A2O2052612O746C6564537461727342752O669O209O204O203D205370652O6C28333933392O35292C0D0A2O20536F6C737469636542752O669O209O208O203D205370652O6C28333433363438292C0D0A2O205374617266612O6C42752O669O209O208O203D205370652O6C28313931303334292C0D0A2O20537461726C6F726442752O669O209O208O203D205370652O6C28323739373039292C0D0A2O205374617277656176657273576172709O209O205O203D205370652O6C28333933393432292C0D0A2O205374617277656176657273576566749O209O205O203D205370652O6C28333933392O34292C0D0A2O20556D6272616C456D627261636542752O669O209O203O203D205370652O6C28333933373633292C0D0A2O2057612O72696F724F66456C756E6542752O669O209O202O203D205370652O6C28323032343235292C0D0A2O202O2D20446562752O66730D0A2O2046756E67616C47726F777468446562752O669O209O202O203D205370652O6C283831323831292C0D0A2O205374652O6C6172466C617265446562752O669O209O202O203D205370652O6C28323032333437292C0D0A2O202O2D205469657220323920452O66656374730D0A2O20476174686572696E67537461727374752O669O209O202O203D205370652O6C2833392O343132292C0D0A2O20546F756368546865436F736D6F739O209O206O203D205370652O6C2833392O343134292C0D0A2O202O2D204C6567656E6461727920452O66656374730D0A2O20424F4154417263616E654C656742752O669O209O203O203D205370652O6C282O332O393436292C0D0A2O20424F41544E61747572654C656742752O669O209O203O203D205370652O6C282O332O393433292C0D0A2O204F6E65746873436C656172566973696F6E42752O669O208O203D205370652O6C282O3339373937292C0D0A2O204F6E6574687350657263657074696F6E42752O669O209O203D205370652O6C282O3339382O30292C0D0A2O2054696D65776F726E447265616D62696E64657242752O669O206O203D205370652O6C2833342O303439290D0A7D290D0A0D0A5370652O6C2E44727569642E466572616C203D204D657267655461626C6542794B6579285370652O6C2E44727569642E436F2O6D6F6E732C207B0D0A2O202O2D204162696C746965730D0A2O202O2D2054616C656E74730D0A2O204164617074697665537761726D9O209O207O203D205370652O6C283339313O38292C0D0A2O20417065785072656461746F727343726176696E679O209O203D205370652O6C283339312O3831292C0D0A2O20417368616D616E657347756964616E63659O209O203O203D205370652O6C28333931353438292C0D0A2O204265727365726B9O209O209O204O203D205370652O6C28313036393531292C0D0A2O204265727365726B48656172746F667468654C696F6E9O208O203D205370652O6C2833392O313734292C0D0A2O20426C2O6F6474616C6F6E739O209O209O203D205370652O6C28333139343339292C0D0A2O2042727574616C536C6173689O209O209O203D205370652O6C28323032303238292C0D0A2O20436972636C656F664C696665616E6444656174689O209O203D205370652O6C28342O30333230292C0D0A2O20446972654669786174696F6E9O209O208O203D205370652O6C2834312O373130292C0D0A2O20446F75626C65436C6177656452616B659O209O204O203D205370652O6C28333931372O30292C0D0A2O20466572616C4672656E7A799O209O209O203D205370652O6C28323734383337292C0D0A2O20496E6361726E6174696F6E9O209O209O203D205370652O6C28313032353433292C0D0A2O204C696F6E73537472656E6774689O209O207O203D205370652O6C28333931393732292C0D0A2O204C756E6172496E737069726174696F6E9O209O204O203D205370652O6C28313O353830292C0D0A2O204C494D2O6F6E666972659O209O209O20203D205370652O6C28312O35363235292C202O2D204C756E617220496E737069726174696F6E204D2O6F6E666972650D0A2O204D6F6D656E746F66436C61726974799O209O205O203D205370652O6C28323336303638292C0D0A2O205072656461746F729O209O209O203O203D205370652O6C28323032303231292C0D0A2O205072696D616C57726174689O209O209O203D205370652O6C28323835333831292C0D0A2O2052616D70616E744665726F636974799O209O205O203D205370652O6C28333931373039292C0D0A2O20526970616E64546561729O209O209O20203D205370652O6C28333931333437292C0D0A2O205361626572742O6F74689O209O209O20203D205370652O6C28323032303331292C0D0A2O20536F756C6F66746865466F726573749O209O205O203D205370652O6C28313538343736292C0D0A2O2053776970659O209O209O206O203D205370652O6C28313036373835292C0D0A2O20546561724F70656E576F756E64739O209O206O203D205370652O6C28333931373835292C0D0A2O20546872617368696E67436C6177739O209O206O203D205370652O6C28343035332O30292C0D0A2O20546967657273467572799O209O209O20203D205370652O6C2835323137292C0D0A2O20556E627269646C6564537761726D9O209O206O203D205370652O6C28333931393531292C0D0A2O2057696C64536C61736865739O209O209O203D205370652O6C28333930383634292C0D0A2O202O2D2042752O66730D0A2O20417065785072656461746F727343726176696E6742752O669O205O203D205370652O6C283339312O3832292C0D0A2O20426C2O6F6474616C6F6E7342752O669O209O205O203D205370652O6C28313435313532292C0D0A2O20436C65617263617374696E679O209O208O203D205370652O6C28313335372O30292C0D0A2O204F766572666C6F77696E67506F77657242752O669O209O203D205370652O6C28343035313839292C0D0A2O205072656461746F7252657665616C656442752O669O209O203D205370652O6C28343038343638292C202O2D205433302050340D0A2O205072656461746F727953776966746E652O7342752O669O207O203D205370652O6C283639333639292C0D0A2O205361626572742O6F746842752O669O209O206O203D205370652O6C28333931372O32292C0D0A2O2053752O64656E416D6275736842752O669O209O204O203D205370652O6C28333931393734292C0D0A2O202O2D20446562752O66730D0A2O204164617074697665537761726D446562752O669O209O20203D205370652O6C283339312O3839292C0D0A2O204164617074697665537761726D4865616C9O209O203O203D205370652O6C28333931383931292C0D0A2O20446972654669786174696F6E446562752O669O209O202O203D205370652O6C2834312O373133292C0D0A2O204C494D2O6F6E66697265446562752O669O209O204O203D205370652O6C28312O35363235292C0D0A2O20546872617368446562752O669O209O208O203D205370652O6C28343035322O33292C0D0A7D290D0A0D0A5370652O6C2E44727569642E477561726469616E203D204D657267655461626C6542794B6579285370652O6C2E44727569642E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O204D616E676C659O209O209O205O203D205370652O6C282O33393137292C0D0A2O202O2D2054616C656E74730D0A2O204265727365726B9O209O209O204O203D205370652O6C2835302O3334292C0D0A2O2042726973746C696E674675729O209O208O203D205370652O6C28312O35383335292C0D0A2O20447265616D6F6643656E61726975739O209O205O203D205370652O6C283337322O3139292C0D0A2O20466C617368696E67436C6177739O209O207O203D205370652O6C28333933343237292C0D0A2O20467572796F664E61747572659O209O208O203D205370652O6C28333730363935292C0D0A2O20496E6361726E6174696F6E9O209O209O203D205370652O6C283130322O3538292C0D0A2O204C6179657265644D616E659O209O209O203D205370652O6C28333834373231292C0D0A2O204C756E61724265616D9O209O209O202O203D205370652O6C28323034302O36292C0D0A2O204D61756C9O209O209O207O203D205370652O6C2836383037292C0D0A2O2050756C766572697A659O209O209O202O203D205370652O6C283830333133292C0D0A2O20526167656F66746865536C2O657065729O209O204O203D205370652O6C28322O30383531292C0D0A2O2052617A659O209O209O207O203D205370652O6C28342O30323534292C0D0A2O205265696E666F726365644675729O209O207O203D205370652O6C28333933363138292C0D0A2O20536F756C6F66746865466F726573749O209O205O203D205370652O6C28313538342O37292C0D0A2O2053776970659O209O209O206O203D205370652O6C283231332O3731292C0D0A2O2054686F726E736F6649726F6E9O209O208O203D205370652O6C28342O303O32292C0D0A2O20542O6F7468616E64436C61779O209O208O203D205370652O6C28313335322O38292C0D0A2O20566963696F75734379636C659O209O208O203D205370652O6C283337313O39292C0D0A2O2056756C6E657261626C65466C6573689O209O205O203D205370652O6C28333732363138292C0D0A2O202O2D2042752O66730D0A2O204265727365726B42752O669O209O209O203D205370652O6C2835302O3334292C0D0A2O20447265616D6F6643656E617269757342752O669O209O20203D205370652O6C28333732313532292C0D0A2O2047616C6163746963477561726469616E42752O669O209O203D205370652O6C28323133373038292C0D0A2O20476F726542752O669O209O209O203O203D205370652O6C2839332O3632292C0D0A2O20496E6361726E6174696F6E42752O669O209O205O203D205370652O6C283130322O3538292C0D0A2O20542O6F7468616E64436C617742752O669O209O204O203D205370652O6C28313335323836292C0D0A2O20566963696F75734379636C654D61756C42752O669O209O203D205370652O6C28333732303135292C0D0A2O20566963696F75734379636C654D616E676C6542752O669O207O203D205370652O6C28333732303139292C0D0A2O202O2D20446562752O66730D0A2O20542O6F7468616E64436C6177446562752O669O209O202O203D205370652O6C28313335363031292C0D0A7D290D0A0D0A5370652O6C2E44727569642E526573746F726174696F6E203D204D657267655461626C6542794B6579285370652O6C2E44727569642E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O2045636C697073654C756E61729O209O208O203D205370652O6C283438353138292C0D0A2O2045636C69707365536F6C61729O209O208O203D205370652O6C283438353137292C0D0A2O20452O666C6F72657363656E63659O209O207O203D205370652O6C28313435323035292C0D0A2O204C696665626C2O6F6D9O209O209O202O203D204D756C74695370652O6C282O333736332C312O382O3530292C0D0A2O204E617475726573437572659O209O209O203D205370652O6C282O38343233292C0D0A2O205265766974616C697A659O209O209O20203D205370652O6C28323132303430292C0D0A2O2053746172666972659O209O209O203O203D205370652O6C28313937363238292C0D0A2O205374617273757267659O209O209O202O203D205370652O6C28313937363236292C0D0A2O2057726174689O209O209O206O203D205370652O6C2835313736292C0D0A2O202O2D2054616C656E74730D0A2O204162756E64616E63659O209O209O202O203D205370652O6C28323037333833292C0D0A2O204164617074697665537761726D9O209O207O203D205370652O6C283339313O38292C0D0A2O2042616C616E6365412O66696E6974799O209O205O203D205370652O6C28313937363332292C0D0A2O2043656E6172696F6E576172649O209O208O203D205370652O6C28313032333531292C0D0A2O20466572616C412O66696E6974799O209O207O203D205370652O6C28313937343930292C0D0A2O20466C6F75726973689O209O209O203O203D205370652O6C2831392O373231292C0D0A2O2049726F6E4261726B9O209O209O203O203D205370652O6C28313032333432292C0D0A2O204E61747572657353776966746E652O739O209O204O203D205370652O6C28313332313538292C0D0A2O205265666F726573746174696F6E9O209O207O203D205370652O6C28333932333536292C0D0A2O20536F756C4F66546865466F726573749O209O205O203D205370652O6C28313538343738292C0D0A2O205472616E7175696C6974799O209O209O203D205370652O6C28373430292C0D0A2O20556E627269646C6564537761726D9O209O206O203D205370652O6C28333931393531292C0D0A2O20556E64657267726F7774689O209O209O203D205370652O6C28333932333031292C0D0A2O202O2D2042752O66730D0A2O204164617074697665537761726D4865616C9O209O203O203D205370652O6C28333931383931292C0D0A2O20496E6361726E6174696F6E42752O669O209O205O203D205370652O6C282O3137363739292C0D0A2O20536F756C4F66546865466F7265737442752O669O209O20203D205370652O6C282O3134313038292C0D0A2O202O2D20446562752O66730D0A2O204164617074697665537761726D446562752O669O209O20203D205370652O6C283339312O3839292C0D0A7D290D0A0D0A2O2D204974656D730D0A6966206E6F74204974656D2E4472756964207468656E204974656D2E4472756964203D207B7D20656E640D0A4974656D2E44727569642E436F2O6D6F6E73203D207B0D0A2O202O2D20506F74696F6E0D0A2O204865616C746873746F6E659O209O204O203D204974656D282O353132292C0D0A2O202O2D204F74686572204F6E2D557365204974656D730D0A2O20446A61722O756E9O209O208O203D204974656D28323032353639292C0D0A7D0D0A0D0A4974656D2E44727569642E42616C616E6365203D204D657267655461626C6542794B6579284974656D2E44727569642E436F2O6D6F6E732C207B0D0A7D290D0A0D0A4974656D2E44727569642E466572616C203D204D657267655461626C6542794B6579284974656D2E44727569642E436F2O6D6F6E732C207B0D0A7D290D0A0D0A4974656D2E44727569642E477561726469616E203D204D657267655461626C6542794B6579284974656D2E44727569642E436F2O6D6F6E732C207B0D0A7D290D0A0D0A4974656D2E44727569642E526573746F726174696F6E203D204D657267655461626C6542794B6579284974656D2E44727569642E436F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D204D6163726F730D0A6966206E6F74204D6163726F2E4472756964207468656E204D6163726F2E4472756964203D207B7D20656E640D0A4D6163726F2E44727569642E436F2O6D6F6E73203D207B0D0A2O202O2D2042617365205370652O6C730D0A2O20492O6E657276617465506C617965729O209O203D204D6163726F2822492O6E657276617465506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E492O6E6572766174653A4E616D65282O292C0D0A2O204D61726B4F6654686557696C64506C617965729O205O203D204D6163726F28224D61726B4F6654686557696C64506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E4D61726B4F6654686557696C643A4E616D65282O292C0D0A2O204D2O6F6E666972654D6F7573656F7665729O207O203D204D6163726F28224D2O6F6E666972654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E4D2O6F6E666972653A4E616D65282O292C0D0A2O2052616B654D6F7573656F7665729O209O202O203D204D6163726F282252616B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E52616B653A4E616D65282O292C0D0A2O205269704D6F7573656F7665729O209O203O203D204D6163726F28225269704D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E5269703A4E616D65282O292C0D0A2O20526562697274684D6F7573656F7665729O208O203D204D6163726F2822526562697274684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E526562697274683A4E616D65282O292C0D0A2O205265766976654D6F7573656F7665729O209O203D204D6163726F28225265766976654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E5265766976653A4E616D65282O292C0D0A2O2052656D6F7665436F2O72757074696F6E4D6F7573656F7665728O203D204D6163726F282252656D6F7665436F2O72757074696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E52656D6F7665436F2O72757074696F6E3A4E616D65282O292C0D0A2O20526567726F777468466F6375739O209O202O203D204D6163726F2822526567726F777468466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E526567726F7774683A4E616D65282O292C0D0A2O20526567726F7774684D6F7573656F7665729O207O203D204D6163726F2822526567726F7774684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E526567726F7774683A4E616D65282O292C0D0A2O20526567726F777468506C617965729O209O20203D204D6163726F2822526567726F777468506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E526567726F7774683A4E616D65282O292C0D0A2O2052656A7576656E6174696F6E466F6375739O207O203D204D6163726F282252656A7576656E6174696F6E466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E52656A7576656E6174696F6E3A4E616D65282O292C0D0A2O2052656A7576656E6174696F6E4D6F7573656F7665729O203O203D204D6163726F282252656A7576656E6174696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E52656A7576656E6174696F6E3A4E616D65282O292C0D0A2O2053756E666972654D6F7573656F7665729O208O203D204D6163726F282253756E666972654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E53756E666972653A4E616D65282O292C0D0A2O2053776966746D656E64466F6375739O209O20203D204D6163726F282253776966746D656E64466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E53776966746D656E643A4E616D65282O292C0D0A2O2053776966746D656E644D6F7573656F7665729O206O203D204D6163726F282253776966746D656E644D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E53776966746D656E643A4E616D65282O292C0D0A2O2053776966746D656E64506C617965729O209O203D204D6163726F282253776966746D656E64506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E53776966746D656E643A4E616D65282O292C0D0A2O20536B752O6C426173684D6F7573656F7665729O206O203D204D6163726F2822536B752O6C426173684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E536B752O6C426173683A4E616D65282O292C0D0A2O2057696C6467726F777468466F6375739O209O203D204D6163726F282257696C6467726F777468466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E57696C6467726F7774683A4E616D65282O292C0D0A2O205572736F6C73566F72746578437572736F729O206O203D204D6163726F28225572736F6C73566F72746578437572736F72222C20222F63617374205B40637572736F725D2022202O2E205370652O6C2E44727569642E436F2O6D6F6E732E5572736F6C73566F727465783A4E616D65282O292C0D0A2O202O2D204974656D730D0A2O205472696E6B6574319O209O207O203D204D6163726F28225472696E6B657431222C20222F75736520313322292C0D0A2O205472696E6B6574329O209O207O203D204D6163726F28225472696E6B657432222C20222F75736520313422292C0D0A2O204865616C746873746F6E659O209O204O203D204D6163726F28224865616C746873746F6E65222C20222F757365206974656D3A2O35313222292C0D0A2O20446A61722O756E9O209O208O203D204D6163726F2822446A61722O756E222C20222F757365206974656D3A32303235363922292C0D0A7D0D0A0D0A4D6163726F2E44727569642E42616C616E6365203D204D657267655461626C6542794B6579284D6163726F2E44727569642E436F2O6D6F6E732C207B0D0A2O205374652O6C6172466C6172654D6F7573656F7665729O203O203D204D6163726F28225374652O6C6172466C6172654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E42616C616E63652E5374652O6C6172466C6172653A4E616D65282O292C0D0A7D290D0A0D0A4D6163726F2E44727569642E466572616C203D204D657267655461626C6542794B6579284D6163726F2E44727569642E436F2O6D6F6E732C207B0D0A2O204164617074697665537761726D4D6F7573656F7665729O202O203D204D6163726F28224164617074697665537761726D4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E466572616C2E4164617074697665537761726D3A4E616D65282O292C0D0A2O205072696D616C57726174684D6F7573656F7665729O204O203D204D6163726F28225072696D616C57726174684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E466572616C2E5072696D616C57726174683A4E616D65282O292C0D0A7D290D0A0D0A4D6163726F2E44727569642E477561726469616E203D204D657267655461626C6542794B6579284D6163726F2E44727569642E436F2O6D6F6E732C207B0D0A2O2050756C766572697A654D6F7573656F7665729O206O203D204D6163726F282250756C766572697A654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E477561726469616E2E50756C766572697A653A4E616D65282O292C0D0A2O205468726173684D6F7573656F7665729O209O203D204D6163726F28225468726173684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E477561726469616E2E5468726173683A4E616D65282O292C0D0A7D290D0A0D0A4D6163726F2E44727569642E526573746F726174696F6E203D204D657267655461626C6542794B6579284D6163726F2E44727569642E436F2O6D6F6E732C207B0D0A2O202O2D2042617365205370652O6C730D0A2O204164617074697665537761726D466F6375739O206O203D204D6163726F28224164617074697665537761726D466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E44727569642E526573746F726174696F6E2E4164617074697665537761726D3A4E616D65282O292C0D0A2O2043656E6172696F6E57617264466F6375739O207O203D204D6163726F282243656E6172696F6E57617264466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E44727569642E526573746F726174696F6E2E43656E6172696F6E576172643A4E616D65282O292C0D0A2O20452O666C6F72657363656E6365437572736F729O205O203D204D6163726F2822452O666C6F72657363656E6365437572736F72222C20222F63617374205B40637572736F725D2022202O2E205370652O6C2E44727569642E526573746F726174696F6E2E452O666C6F72657363656E63653A4E616D65282O292C0D0A2O2049726F6E4261726B466F6375739O209O202O203D204D6163726F282249726F6E4261726B466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E44727569642E526573746F726174696F6E2E49726F6E4261726B3A4E616D65282O292C0D0A2O204C696665626C2O6F6D466F6375739O209O20203D204D6163726F28224C696665626C2O6F6D466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E44727569642E526573746F726174696F6E2E4C696665626C2O6F6D3A4E616D65282O292C0D0A2O204E61747572657343757265466F6375739O208O203D204D6163726F28224E61747572657343757265466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E44727569642E526573746F726174696F6E2E4E617475726573437572653A4E616D65282O292C0D0A2O204E617475726573437572654D6F7573656F7665729O204O203D204D6163726F28224E617475726573437572654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44727569642E526573746F726174696F6E2E4E617475726573437572653A4E616D65282O292C0D0A2O202O2D20466F6375730D0A2O20466F6375735461726765749O209O204O203D204D6163726F2822466F637573546172676574222C20222F666F6375732074617267657422292C0D0A2O20466F637573506C617965729O209O204O203D204D6163726F2822466F637573506C61796572222C20222F666F63757320706C6179657222292C0D0A2O20466F6375735061727479319O209O204O203D204D6163726F2822466F637573506172747931222C20222F666F6375732070617274793122292C0D0A2O20466F6375735061727479329O209O204O203D204D6163726F2822466F637573506172747932222C20222F666F6375732070617274793222292C0D0A2O20466F6375735061727479339O209O204O203D204D6163726F2822466F637573506172747933222C20222F666F6375732070617274793322292C0D0A2O20466F6375735061727479349O209O204O203D204D6163726F2822466F637573506172747934222C20222F666F6375732070617274793422292C0D0A2O20466F63757352616964319O209O205O203D204D6163726F2822466F6375735261696431222C20222F666F63757320726169643122292C0D0A2O20466F63757352616964329O209O205O203D204D6163726F2822466F6375735261696432222C20222F666F63757320726169643222292C0D0A2O20466F63757352616964339O209O205O203D204D6163726F2822466F6375735261696433222C20222F666F63757320726169643322292C0D0A2O20466F63757352616964349O209O205O203D204D6163726F2822466F6375735261696434222C20222F666F63757320726169643422292C0D0A2O20466F63757352616964359O209O205O203D204D6163726F2822466F6375735261696435222C20222F666F63757320726169643522292C0D0A2O20466F63757352616964369O209O205O203D204D6163726F2822466F6375735261696436222C20222F666F63757320726169643622292C0D0A2O20466F63757352616964379O209O205O203D204D6163726F2822466F6375735261696437222C20222F666F63757320726169643722292C0D0A2O20466F63757352616964389O209O205O203D204D6163726F2822466F6375735261696438222C20222F666F63757320726169643822292C0D0A2O20466F63757352616964399O209O205O203D204D6163726F2822466F6375735261696439222C20222F666F63757320726169643922292C0D0A2O20466F6375735261696431309O209O204O203D204D6163726F2822466F637573526169643130222C20222F666F6375732072616964313022292C0D0A2O20466F637573526169642O319O209O204O203D204D6163726F2822466F637573526169642O31222C20222F666F63757320726169642O3122292C0D0A2O20466F6375735261696431329O209O204O203D204D6163726F2822466F637573526169643132222C20222F666F6375732072616964313222292C0D0A2O20466F6375735261696431339O209O204O203D204D6163726F2822466F637573526169643133222C20222F666F6375732072616964313322292C0D0A2O20466F6375735261696431349O209O204O203D204D6163726F2822466F637573526169643134222C20222F666F6375732072616964313422292C0D0A2O20466F6375735261696431359O209O204O203D204D6163726F2822466F637573526169643135222C20222F666F6375732072616964313522292C0D0A2O20466F6375735261696431369O209O204O203D204D6163726F2822466F637573526169643136222C20222F666F6375732072616964313622292C0D0A2O20466F6375735261696431379O209O204O203D204D6163726F2822466F637573526169643137222C20222F666F6375732072616964313722292C0D0A2O20466F6375735261696431389O209O204O203D204D6163726F2822466F637573526169643138222C20222F666F6375732072616964313822292C0D0A2O20466F6375735261696431399O209O204O203D204D6163726F2822466F637573526169643139222C20222F666F6375732072616964313922292C0D0A2O20466F6375735261696432309O209O204O203D204D6163726F2822466F637573526169643230222C20222F666F6375732072616964323022292C0D0A2O20466F6375735261696432319O209O204O203D204D6163726F2822466F637573526169643231222C20222F666F6375732072616964323122292C0D0A2O20466F637573526169642O329O209O204O203D204D6163726F2822466F637573526169642O32222C20222F666F63757320726169642O3222292C0D0A2O20466F6375735261696432339O209O204O203D204D6163726F2822466F637573526169643233222C20222F666F6375732072616964323322292C0D0A2O20466F6375735261696432349O209O204O203D204D6163726F2822466F637573526169643234222C20222F666F6375732072616964323422292C0D0A2O20466F6375735261696432359O209O204O203D204D6163726F2822466F637573526169643235222C20222F666F6375732072616964323522292C0D0A2O20466F6375735261696432369O209O204O203D204D6163726F2822466F637573526169643236222C20222F666F6375732072616964323622292C0D0A2O20466F6375735261696432379O209O204O203D204D6163726F2822466F637573526169643237222C20222F666F6375732072616964323722292C0D0A2O20466F6375735261696432389O209O204O203D204D6163726F2822466F637573526169643238222C20222F666F6375732072616964323822292C0D0A2O20466F6375735261696432399O209O204O203D204D6163726F2822466F637573526169643239222C20222F666F6375732072616964323922292C0D0A2O20466F6375735261696433309O209O204O203D204D6163726F2822466F637573526169643330222C20222F666F6375732072616964333022292C0D0A2O20466F6375735261696433319O209O204O203D204D6163726F2822466F637573526169643331222C20222F666F6375732072616964333122292C0D0A2O20466F6375735261696433329O209O204O203D204D6163726F2822466F637573526169643332222C20222F666F6375732072616964333222292C0D0A2O20466F637573526169642O339O209O204O203D204D6163726F2822466F637573526169642O33222C20222F666F63757320726169642O3322292C0D0A2O20466F6375735261696433349O209O204O203D204D6163726F2822466F637573526169643334222C20222F666F6375732072616964333422292C0D0A2O20466F6375735261696433359O209O204O203D204D6163726F2822466F637573526169643335222C20222F666F6375732072616964333522292C0D0A2O20466F6375735261696433369O209O204O203D204D6163726F2822466F637573526169643336222C20222F666F6375732072616964333622292C0D0A2O20466F6375735261696433379O209O204O203D204D6163726F2822466F637573526169643337222C20222F666F6375732072616964333722292C0D0A2O20466F6375735261696433389O209O204O203D204D6163726F2822466F637573526169643338222C20222F666F6375732072616964333822292C0D0A2O20466F6375735261696433399O209O204O203D204D6163726F2822466F637573526169643339222C20222F666F6375732072616964333922292C0D0A2O20466F6375735261696434309O209O204O203D204D6163726F2822466F637573526169643430222C20222F666F6375732072616964343022292C0D0A7D290D0A00063O0012033O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);