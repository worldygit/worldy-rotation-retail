local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110]=v83[v110](v83[v110 + 1 ]);elseif (v86==1) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v113;local v114;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v83[v114]=v83[v114](v83[v114 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v78=(v114 + v84) -1 ;for v125=v114,v78 do v113=v79[v125-v114 ];v83[v125]=v113;end v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v83[v114](v13(v83,v114 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=4) then if (v86==3) then local v120=v85[2];v83[v120](v13(v83,v120 + 1 ,v78));else v83[v85[2]]=v85[3];end elseif (v86>5) then do return;end else local v123=v85[2];v78=(v123 + v84) -1 ;for v128=v123,v78 do local v129=v79[v128-v123 ];v83[v128]=v129;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67030C1C2O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206D756C74695370652O6C203D206170692E6D756C74695370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C0D0A6966206E6F74207370652O6C2E64656D6F6E48756E746572207468656E0D0A2O207370652O6C2E64656D6F6E48756E746572203D207B7D0D0A656E640D0A7370652O6C2E64656D6F6E48756E7465722E636F2O6D6F6E73203D207B0D0A2O202O2D206162696C69746965730D0A2O206368616F734E6F7661203D207370652O6C28313739303537292C0D0A2O20636F2O6C656374697665416E6775697368203D207370652O6C28333930313532292C0D0A2O2064656D6F6E6963203D207370652O6C28323133343130292C0D0A2O2064697372757074203D207370652O6C28313833373532292C0D0A2O20656C797369616E446563722O65203D207370652O6C28333930313633292C0D0A2O2066656C626C616465203D207370652O6C28323332383933292C0D0A2O2066697273746F66546865492O6C6964617269203D207370652O6C28323335383933292C0D0A2O20666F2O646572546F546865466C616D65203D207370652O6C28333931343239292C0D0A2O20676C696465203D207370652O6C28313331333437292C0D0A2O20692O6D6F6C6174696F6E41757261203D207370652O6C28323538393230292C0D0A2O20696D707269736F6E203D207370652O6C28323137383332292C0D0A2O20736967696C6F66466C616D65203D206D756C74695370652O6C283230343539362C203230343531332C20333839383130292C0D0A2O20736F756C536967696C73203D207370652O6C283339352O3436292C0D0A2O2074686548756E74203D207370652O6C28333730393635292C0D0A2O202O2D2062752O66730D0A2O20692O6D6F6C6174696F6E4175726142752O66203D207370652O6C28323538393230292C0D0A2O202O2D20646562752O66730D0A2O20736967696C6F66466C616D65446562752O66203D207370652O6C28323034353938292C0D0A2O202O2D2072616369616C730D0A2O20617263616E65546F2O72656E74203D207370652O6C28323032373139292C0D0A2O202O2D206F746865720D0A2O20702O6F6C203D207370652O6C284O393130290D0A7D0D0A0D0A7370652O6C2E64656D6F6E48756E7465722E76656E6765616E6365203D204D657267655461626C6542794B6579287370652O6C2E64656D6F6E48756E7465722E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O2061676F6E697A696E67466C616D6573203D207370652O6C28323037353438292C0D0A2O2062756C6B45787472616374696F6E203D207370652O6C28333230333431292C0D0A2O206275726E696E67416C697665203D207370652O6C2832302O373339292C0D0A2O206275726E696E67426C2O6F64203D207370652O6C28333930323133292C0D0A2O206368612O726564466C657368203D207370652O6C282O332O363339292C0D0A2O20636F6E63656E747261746564536967696C73203D207370652O6C283230373O36292C0D0A2O206379636C656F6642696E64696E67203D207370652O6C28333839373138292C0D0A2O206461726B676C617265422O6F6E203D207370652O6C28333839373038292C0D0A2O2064656D6F6E5370696B6573203D207370652O6C28323033373230292C0D0A2O20646F776E696E466C616D6573203D207370652O6C28333839373332292C0D0A2O2066612O6C6F7574203D207370652O6C282O3237313734292C0D0A2O2066656C4465766173746174696F6E203D207370652O6C28323132303834292C0D0A2O2066696572794272616E64203D207370652O6C28323034303231292C0D0A2O20666965727944656D697365203D207370652O6C283338392O3230292C0D0A2O20666F6375736564436C65617665203D207370652O6C28333433323037292C0D0A2O20667261696C7479203D207370652O6C2833382O393538292C0D0A2O206672616374757265203D207370652O6C28323633363432292C0D0A2O20696E6665726E616C537472696B65203D207370652O6C283138392O3130292C0D0A2O206D6574616D6F7270686F736973203D207370652O6C28313837383237292C0D0A2O207368656172203D207370652O6C28323033373832292C0D0A2O20736865617246757279203D207370652O6C2833383O3937292C0D0A2O20736967696C6F66436861696E73203D207370652O6C28323032313338292C0D0A2O20736967696C6F664D6973657279203D207370652O6C28323037363834292C0D0A2O20736967696C6F6653696C656E6365203D207370652O6C28323032313337292C0D0A2O20736F756C436172766572203D207370652O6C28323037343037292C0D0A2O20736F756C436C65617665203D207370652O6C282O3238342O37292C0D0A2O20736F756C6372757368203D207370652O6C2833382O393835292C0D0A2O20736F756C467261676D656E7473203D207370652O6C28323033393831292C0D0A2O20736F756C42612O72696572203D207370652O6C28323633363438292C0D0A2O20737069726974426F6D62203D207370652O6C28323437343534292C0D0A2O2073746F6B65746865466C616D6573203D207370652O6C28333933383237292C0D0A2O207468726F77476C61697665203D207370652O6C28323034313537292C0D0A2O20746F726D656E74203D207370652O6C28313835323435292C0D0A2O2076756C6E65726162696C697479203D207370652O6C2833382O393736292C0D0A2O202O2D2062752O66730D0A2O2064656D6F6E5370696B657342752O66203D207370652O6C28323033383139292C0D0A2O206D6574616D6F7270686F73697342752O66203D207370652O6C28313837383237292C0D0A2O2072656372696D696E6174696F6E42752O66203D207370652O6C28343039382O37292C202O2D2074696572203330203470630D0A2O202O2D20646562752O66730D0A2O2066696572794272616E64446562752O66203D207370652O6C2832303O3731292C0D0A2O20667261696C7479446562752O66203D207370652O6C28323437343536292C0D0A7D290D0A0D0A7370652O6C2E64656D6F6E48756E7465722E6861766F63203D204D657267655461626C6542794B6579287370652O6C2E64656D6F6E48756E7465722E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O206146697265496E73696465203D207370652O6C2834323O3735292C0D0A2O20612O6E6968696C6174696F6E203D207370652O6C28323031343237292C0D0A2O20616E794D65616E734E6563652O73617279203D207370652O6C28332O382O3134292C0D0A2O20626C61646544616E6365203D207370652O6C28312O38342O39292C0D0A2O20626C696E6446757279203D207370652O6C283230332O3530292C0D0A2O20626C7572203D207370652O6C28313938353839292C0D0A2O206275726E696E67576F756E64203D207370652O6C2833392O313839292C0D0A2O206368616F73537472696B65203D207370652O6C28313632373934292C0D0A2O206368616F735468656F7279203D207370652O6C28333839363837292C0D0A2O206368616F7469635472616E73666F726D6174696F6E203D207370652O6C28332O382O3132292C0D0A2O206379636C656F66486174726564203D207370652O6C2832353O3837292C0D0A2O20646561746853772O6570203D207370652O6C28323130313532292C0D0A2O2064656D6F6E426C61646573203D207370652O6C283230333O35292C0D0A2O2064656D6F6E7342697465203D207370652O6C2831362O323433292C0D0A2O20652O73656E6365427265616B203D207370652O6C2832352O383630292C0D0A2O206579654265616D203D207370652O6C28313938303133292C0D0A2O2066656C42612O72616765203D207370652O6C28323538393235292C0D0A2O2066656C4572757074696F6E203D207370652O6C28322O312O3831292C0D0A2O2066656C52757368203D207370652O6C28313935303732292C0D0A2O206669727374426C2O6F64203D207370652O6C28323036343136292C0D0A2O20667572696F757347617A65203D207370652O6C2833342O332O31292C0D0A2O20667572696F75735468726F7773203D207370652O6C28333933303239292C0D0A2O20676C6169766554656D70657374203D207370652O6C28333432383137292C0D0A2O20696E6572746961203D207370652O6C28343237363430292C0D0A2O20696E6974696174697665203D207370652O6C28332O38313038292C0D0A2O20692O6E657244656D6F6E203D207370652O6C28333839363933292C0D0A2O2069736F6C6174656450726579203D207370652O6C28332O382O3133292C0D0A2O206D6574616D6F7270686F736973203D207370652O6C28313931343237292C0D0A2O206D6F6D656E74756D203D207370652O6C28323036343736292C0D0A2O207261676566697265203D207370652O6C28332O38313037292C0D0A2O20726573746C652O7348756E746572203D207370652O6C28333930313432292C0D0A2O2073652O7261746564476C61697665203D207370652O6C28333930313534292C0D0A2O207368612O746572656444657374696E79203D207370652O6C28332O382O3136292C0D0A2O20736F756C72656E64203D207370652O6C28332O38313036292C0D0A2O20736F756C73636172203D207370652O6C28332O38313036292C0D0A2O20746163746963616C52657472656174203D207370652O6C28333839362O38292C0D0A2O207468726F77476C61697665203D207370652O6C28313835313233292C0D0A2O20747261696C6F665275696E203D207370652O6C2832353O3831292C0D0A2O20756E626F756E644368616F73203D207370652O6C28333437343631292C0D0A2O2076656E676566756C52657472656174203D207370652O6C28313938373933292C0D0A2O202O2D2062752O66730D0A2O206368616F735468656F727942752O66203D207370652O6C28333930313935292C0D0A2O20667572696F757347617A6542752O66203D207370652O6C2833342O333132292C0D0A2O20696E657274696142752O66203D207370652O6C28343237363431292C0D0A2O20696E697469617469766542752O66203D207370652O6C28333931323135292C0D0A2O20692O6E657244656D6F6E42752O66203D207370652O6C28333930313435292C0D0A2O206D6574616D6F7270686F73697342752O66203D207370652O6C2831362O323634292C0D0A2O206D6F6D656E74756D42752O66203D207370652O6C28323038363238292C0D0A2O20746163746963616C5265747265617442752O66203D207370652O6C28333839383930292C0D0A2O20756E626F756E644368616F7342752O66203D207370652O6C28333437343632292C0D0A2O202O2D20646562752O66730D0A2O206275726E696E67576F756E64446562752O66203D207370652O6C2833392O313931292C0D0A2O20652O73656E6365427265616B446562752O66203D207370652O6C283332302O3338292C0D0A2O2073652O7261746564476C61697665446562752O66203D207370652O6C28333930312O35292C0D0A7D290D0A0D0A2O2D206974656D730D0A6966206E6F74206974656D2E64656D6F6E48756E746572207468656E0D0A2O206974656D2E64656D6F6E48756E746572203D207B7D0D0A656E640D0A6974656D2E64656D6F6E48756E7465722E636F2O6D6F6E73203D207B0D0A7D0D0A0D0A6974656D2E64656D6F6E48756E7465722E76656E6765616E6365203D204D657267655461626C6542794B6579286974656D2E64656D6F6E48756E7465722E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E64656D6F6E48756E7465722E6861766F63203D204D657267655461626C6542794B6579286974656D2E64656D6F6E48756E7465722E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F730D0A6966206E6F74206D6163726F2E64656D6F6E48756E746572207468656E0D0A2O206D6163726F2E64656D6F6E48756E746572203D207B7D0D0A656E640D0A6D6163726F2E64656D6F6E48756E7465722E636F2O6D6F6E73203D207B0D0A2O202O2D207370652O6C730D0A2O20646973727570744D6F7573656F766572203D206D6163726F2822646973727570744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E636F2O6D6F6E732E646973727570743A4E616D65282O292C0D0A2O20656C797369616E446563722O65506C61796572203D206D6163726F2822656C797369616E446563722O65506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E636F2O6D6F6E732E656C797369616E446563722O653A4E616D65282O292C0D0A2O20696D707269736F6E4D6F7573656F766572203D206D6163726F2822696D707269736F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E636F2O6D6F6E732E696D707269736F6E3A4E616D65282O292C0D0A2O20736967696C6F66466C616D65437572736F72203D206D6163726F2822736967696C6F66466C616D65437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E636F2O6D6F6E732E736967696C6F66466C616D653A4E616D65282O292C0D0A2O20736967696C6F66466C616D65506C61796572203D206D6163726F2822736967696C6F66466C616D65506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E636F2O6D6F6E732E736967696C6F66466C616D653A4E616D65282O292C0D0A7D0D0A0D0A6D6163726F2E64656D6F6E48756E7465722E6861766F63203D204D657267655461626C6542794B6579286D6163726F2E64656D6F6E48756E7465722E636F2O6D6F6E732C207B0D0A2O2064656D6F6E73426974654D6F7573656F766572203D206D6163726F282264656D6F6E73426974654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E6861766F632E64656D6F6E73426974653A4E616D65282O292C0D0A2O2066656C4572757074696F6E4D6F7573656F766572203D206D6163726F282266656C4572757074696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E6861766F632E66656C4572757074696F6E3A4E616D65282O292C0D0A2O206D6574616D6F7270686F736973506C61796572203D206D6163726F28226D6574616D6F7270686F736973506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E6861766F632E6D6574616D6F7270686F7369733A4E616D65282O292C0D0A2O207468726F77476C616976654D6F7573656F766572203D206D6163726F28227468726F77476C616976654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E6861766F632E7468726F77476C616976653A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E64656D6F6E48756E7465722E76656E6765616E6365203D204D657267655461626C6542794B6579286D6163726F2E64656D6F6E48756E7465722E636F2O6D6F6E732C207B0D0A2O20696E6665726E616C537472696B65437572736F72203D206D6163726F2822696E6665726E616C537472696B65437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E76656E6765616E63652E696E6665726E616C537472696B653A4E616D65282O292C0D0A2O20696E6665726E616C537472696B65506C61796572203D206D6163726F2822696E6665726E616C537472696B65506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E76656E6765616E63652E696E6665726E616C537472696B653A4E616D65282O292C0D0A2O20736967696C6F66436861696E73437572736F72203D206D6163726F2822736967696C6F66436861696E73437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E76656E6765616E63652E736967696C6F66436861696E733A4E616D65282O292C0D0A2O20736967696C6F66436861696E73506C61796572203D206D6163726F2822736967696C6F66436861696E73506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E76656E6765616E63652E736967696C6F66436861696E733A4E616D65282O292C0D0A2O20736967696C6F664D6973657279437572736F72203D206D6163726F2822736967696C6F664D6973657279437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E76656E6765616E63652E736967696C6F664D69736572793A4E616D65282O292C0D0A2O20736967696C6F664D6973657279506C61796572203D206D6163726F2822736967696C6F664D6973657279506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E76656E6765616E63652E736967696C6F664D69736572793A4E616D65282O292C0D0A2O20736967696C6F6653696C656E6365437572736F72203D206D6163726F2822736967696C6F6653696C656E6365437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E76656E6765616E63652E736967696C6F6653696C656E63653A4E616D65282O292C0D0A2O20736967696C6F6653696C656E6365506C61796572203D206D6163726F2822736967696C6F6653696C656E6365506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E76656E6765616E63652E736967696C6F6653696C656E63653A4E616D65282O292C0D0A2O207468726F77476C616976654D6F7573656F766572203D206D6163726F28227468726F77476C616976654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E76656E6765616E63652E7468726F77476C616976653A4E616D65282O292C0D0A2O2066726163747572654D6F7573656F766572203D206D6163726F282266726163747572654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656D6F6E48756E7465722E76656E6765616E63652E66726163747572653A4E616D65282O292C0D0A7D290D0A00063O0012023O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);