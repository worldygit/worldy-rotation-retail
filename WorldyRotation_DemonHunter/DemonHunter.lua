local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110;local v111;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v111=v85[2];v83[v111]=v83[v111](v83[v111 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v111=v85[2];v78=(v111 + v84) -1 ;for v119=v111,v78 do v110=v79[v119-v111 ];v83[v119]=v110;end v77=v77 + 1 ;v85=v73[v77];v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end elseif (v86==1) then local v122=v85[2];v83[v122]=v83[v122](v83[v122 + 1 ]);else do return;end end elseif (v86<=4) then if (v86==3) then v83[v85[2]]=v85[3];else v83[v85[2]]=v59[v85[3]];end elseif (v86>5) then local v128=v85[2];v78=(v128 + v84) -1 ;for v131=v128,v78 do local v132=v79[v131-v128 ];v83[v131]=v132;end else local v129=v85[2];v83[v129](v13(v83,v129 + 1 ,v78));end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E670355222O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A3O2D207O3D204C4F43414C495A45207O3D0D0A2O2D20412O646F6E0D0A6C6F63616C20612O646F6E4E616D652C20612O646F6E5461626C65203D203O2E0D0A2O2D204865726F4442430D0A6C6F63616C20444243203D204865726F4442432E4442430D0A2O2D204865726F4C69620D0A6C6F63616C20484C9O203D204865726F4C69620D0A6C6F63616C2043616368656O203D204865726F43616368650D0A6C6F63616C20556E69747O203D20484C2E556E69740D0A6C6F63616C20506C617965725O203D20556E69742E506C617965720D0A6C6F63616C205461726765745O203D20556E69742E5461726765740D0A6C6F63616C205065748O203D20556E69742E5065740D0A6C6F63616C205370652O6C6O203D20484C2E5370652O6C0D0A6C6F63616C204D756C74695370652O6C203D20484C2E4D756C74695370652O6C0D0A6C6F63616C204974656D7O203D20484C2E4974656D0D0A6C6F63616C204D657267655461626C6542794B6579203D20484C2E5574696C732E4D657267655461626C6542794B65790D0A2O2D20576F726C6479526F746174696F6E0D0A6C6F63616C2057529O203D20576F726C6479526F746174696F6E0D0A6C6F63616C204D6163726F6O203D2057522E4D6163726F0D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D3D0D0A0D0A2O2D205370652O6C0D0A6966206E6F74205370652O6C2E44656D6F6E48756E746572207468656E205370652O6C2E44656D6F6E48756E746572203D207B7D20656E640D0A5370652O6C2E44656D6F6E48756E7465722E436F2O6D6F6E73203D207B0D0A2O202O2D2052616369616C730D0A2O20417263616E65546F2O72656E749O209O207O203D205370652O6C283238373330292C0D0A2O202O2D204162696C69746965730D0A2O20476C6964659O209O209O206O203D205370652O6C28313331333437292C0D0A2O20492O6D6F6C6174696F6E417572619O209O206O203D205370652O6C28323538393230292C0D0A2O202O2D2054616C656E74730D0A2O204368616F734E6F76619O209O209O202O203D205370652O6C28313739303537292C0D0A2O2044656D6F6E69639O209O209O204O203D205370652O6C28323133343130292C0D0A2O20456C797369616E446563722O659O209O207O203D205370652O6C28333930313633292C0D0A2O2046656C626C6164659O209O209O203O203D205370652O6C28323332383933292C0D0A2O20466F2O646572546F546865466C616D659O209O204O203D205370652O6C28333931343239292C0D0A2O20496D707269736F6E9O209O209O203O203D205370652O6C28323137383332292C0D0A2O20536967696C4F66466C616D659O209O208O203D204D756C74695370652O6C283230343539362C203230343531332C20333839383130292C202O2D203230343539363A20426173652049442C203230343531333A20436F6E63656E7472617465642C203338393831303A20507265636973650D0A2O2054686548756E749O209O209O204O203D205370652O6C28333730393635292C0D0A2O202O2D205574696C6974790D0A2O20446973727570749O209O209O204O203D205370652O6C28313833373532292C0D0A2O202O2D2042752O66730D0A2O20492O6D6F6C6174696F6E4175726142752O669O209O202O203D205370652O6C28323538393230292C0D0A2O202O2D20446562752O66730D0A2O20536967696C4F66466C616D65446562752O669O209O202O203D205370652O6C28323034353938292C0D0A2O202O2D204F746865720D0A2O20502O6F6C9O209O209O207O203D205370652O6C284O393130290D0A7D0D0A0D0A5370652O6C2E44656D6F6E48756E7465722E4861766F63203D204D657267655461626C6542794B6579285370652O6C2E44656D6F6E48756E7465722E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O20412O6E6968696C6174696F6E9O209O208O203D205370652O6C28323031343237292C0D0A2O20426C61646544616E63659O209O209O20203D205370652O6C28312O38342O39292C0D0A2O20426C75729O209O209O207O203D205370652O6C28313938353839292C0D0A2O204368616F73537472696B659O209O209O203D205370652O6C28313632373934292C0D0A2O20446561746853772O65709O209O209O20203D205370652O6C28323130313532292C0D0A2O2044656D6F6E73426974659O209O209O20203D205370652O6C2831362O323433292C0D0A2O2046656C527573689O209O209O204O203D205370652O6C28313935303732292C0D0A2O204D6574616D6F7270686F7369739O209O207O203D205370652O6C28313931343237292C0D0A2O205468726F77476C616976659O209O209O203D205370652O6C28313835313233292C0D0A2O202O2D2054616C656E74730D0A2O20426C696E64467572799O209O209O202O203D205370652O6C283230332O3530292C0D0A2O204275726E696E67576F756E649O209O208O203D205370652O6C2833392O313839292C0D0A2O204368616F735468656F72799O209O209O203D205370652O6C28333839363837292C0D0A2O204368616F7469635472616E73666F726D6174696F6E9O208O203D205370652O6C28332O382O3132292C0D0A2O204379636C656F664861747265649O209O207O203D205370652O6C2832353O3837292C0D0A2O2044656D6F6E426C616465739O209O209O203D205370652O6C283230333O35292C0D0A2O20452O73656E6365427265616B9O209O208O203D205370652O6C2832352O383630292C0D0A2O204579654265616D9O209O209O204O203D205370652O6C28313938303133292C0D0A2O2046656C42612O726167659O209O209O20203D205370652O6C28323538393235292C0D0A2O2046656C4572757074696F6E9O209O209O203D205370652O6C28322O312O3831292C0D0A2O204669727374426C2O6F649O209O209O20203D205370652O6C28323036343136292C0D0A2O20467572696F757347617A659O209O209O203D205370652O6C2833342O332O31292C0D0A2O20467572696F75735468726F77739O209O207O203D205370652O6C28333933303239292C0D0A2O20476C6169766554656D706573749O209O207O203D205370652O6C28333432383137292C0D0A2O20496E69746961746976659O209O209O20203D205370652O6C28332O38313038292C0D0A2O20492O6E657244656D6F6E9O209O209O20203D205370652O6C28333839363933292C0D0A2O2049736F6C61746564507265799O209O208O203D205370652O6C28332O382O3133292C0D0A2O204D6F6D656E74756D9O209O209O203O203D205370652O6C28323036343736292C0D0A2O2052616765666972659O209O209O203O203D205370652O6C28332O38313037292C0D0A2O2053652O7261746564476C616976659O209O206O203D205370652O6C28333930313534292C0D0A2O20536967696C4F664D69736572799O209O207O203D205370652O6C28333839383133292C0D0A2O20536F756C72656E649O209O209O203O203D205370652O6C28332O38313036292C0D0A2O20546163746963616C526574726561749O209O205O203D205370652O6C28333839362O38292C0D0A2O20547261696C6F665275696E9O209O209O203D205370652O6C2832353O3831292C0D0A2O20556E626F756E644368616F739O209O208O203D205370652O6C28333437343631292C0D0A2O2056656E676566756C526574726561749O209O205O203D205370652O6C28313938373933292C0D0A2O202O2D2042752O66730D0A2O204368616F735468656F727942752O669O209O205O203D205370652O6C28333930313935292C0D0A2O20467572696F757347617A6542752O669O209O205O203D205370652O6C2833342O333132292C0D0A2O20492O6E657244656D6F6E42752O669O209O206O203D205370652O6C28333930313435292C0D0A2O204D6574616D6F7270686F73697342752O669O209O203O203D205370652O6C2831362O323634292C0D0A2O204D6F6D656E74756D42752O669O209O208O203D205370652O6C28323038363238292C0D0A2O20546163746963616C5265747265617442752O669O209O20203D205370652O6C28333839383930292C0D0A2O20556E626F756E644368616F7342752O669O209O204O203D205370652O6C28333437343632292C0D0A2O202O2D20446562752O66730D0A2O204275726E696E67576F756E64446562752O669O209O202O203D205370652O6C2833392O313931292C0D0A2O20452O73656E6365427265616B446562752O669O209O202O203D205370652O6C283332302O3338292C0D0A2O2053652O7261746564476C61697665446562752O669O209O203D205370652O6C28333930312O35292C0D0A7D290D0A0D0A5370652O6C2E44656D6F6E48756E7465722E56656E6765616E6365203D204D657267655461626C6542794B6579285370652O6C2E44656D6F6E48756E7465722E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O20496E6665726E616C537472696B659O209O206O203D205370652O6C283138392O3130292C0D0A2O2053686561729O209O209O206O203D205370652O6C28323033373832292C0D0A2O20536F756C436C656176659O209O209O20203D205370652O6C282O3238342O37292C0D0A2O20536F756C467261676D656E74739O209O207O203D205370652O6C28323033393831292C0D0A2O205468726F77476C616976659O209O209O203D205370652O6C28323034313537292C0D0A2O202O2D20446566656E736976650D0A2O2044656D6F6E5370696B65739O209O209O203D205370652O6C28323033373230292C0D0A2O20546F726D656E749O209O209O204O203D205370652O6C28313835323435292C0D0A2O202O2D2054616C656E74730D0A2O2041676F6E697A696E67466C616D65739O209O205O203D205370652O6C28323037353438292C0D0A2O2042756C6B45787472616374696F6E9O209O206O203D205370652O6C28333230333431292C0D0A2O204275726E696E67416C6976659O209O208O203D205370652O6C2832302O373339292C0D0A2O204368612O726564466C6573689O209O208O203D205370652O6C282O332O363339292C0D0A2O20436F6E63656E747261746564536967696C739O209O202O203D205370652O6C283230373O36292C0D0A2O204461726B676C617265422O6F6E9O209O207O203D205370652O6C28333839373038292C0D0A2O20446F776E696E466C616D65739O209O208O203D205370652O6C28333839373332292C0D0A2O2046612O6C6F75749O209O209O204O203D205370652O6C282O3237313734292C0D0A2O2046656C4465766173746174696F6E9O209O206O203D205370652O6C28323132303834292C0D0A2O2046696572794272616E649O209O209O20203D205370652O6C28323034303231292C0D0A2O20466965727944656D6973659O209O209O203D205370652O6C283338392O3230292C0D0A2O20467261696C74799O209O209O204O203D205370652O6C2833382O393538292C0D0A2O2046726163747572659O209O209O203O203D205370652O6C28323633363432292C0D0A2O20536967696C4F6653696C656E63659O209O206O203D205370652O6C28323032313337292C0D0A2O20536F756C42612O726965729O209O209O203D205370652O6C28323633363438292C0D0A2O20536F756C4361727665729O209O209O20203D205370652O6C28323037343037292C0D0A2O20536F756C43727573689O209O209O202O203D205370652O6C2833382O393835292C0D0A2O20537069726974426F6D629O209O209O20203D205370652O6C28323437343534292C0D0A2O2056756C6E65726162696C6974799O209O207O203D205370652O6C2833382O393736292C0D0A2O202O2D205574696C6974790D0A2O204D6574616D6F7270686F7369739O209O207O203D205370652O6C28313837383237292C0D0A2O202O2D2042752O66730D0A2O2044656D6F6E5370696B657342752O669O209O205O203D205370652O6C28323033383139292C0D0A2O204D6574616D6F7270686F73697342752O669O209O203O203D205370652O6C28313837383237292C0D0A2O202O2D20446562752O66730D0A2O2046696572794272616E64446562752O669O209O204O203D205370652O6C2832303O3731292C0D0A2O20467261696C7479446562752O669O209O207O203D205370652O6C28323437343536292C0D0A7D290D0A0D0A2O2D204974656D730D0A6966206E6F74204974656D2E44656D6F6E48756E746572207468656E204974656D2E44656D6F6E48756E746572203D207B7D20656E640D0A4974656D2E44656D6F6E48756E7465722E436F2O6D6F6E73203D207B0D0A2O20416C67657468617250752O7A6C65426F789O209O203O203D204974656D283139333730312C207B31332C2031347D292C0D0A2O204865616C746873746F6E659O209O209O203D204974656D282O353132292C0D0A7D0D0A0D0A4974656D2E44656D6F6E48756E7465722E4861766F63203D204D657267655461626C6542794B6579284974656D2E44656D6F6E48756E7465722E436F2O6D6F6E732C207B0D0A7D290D0A0D0A4974656D2E44656D6F6E48756E7465722E56656E6765616E6365203D204D657267655461626C6542794B6579284974656D2E44656D6F6E48756E7465722E436F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D204D6163726F730D0A6966206E6F74204D6163726F2E44656D6F6E48756E746572207468656E204D6163726F2E44656D6F6E48756E746572203D207B7D3B20656E640D0A4D6163726F2E44656D6F6E48756E7465722E436F2O6D6F6E73203D207B0D0A2O202O2D204974656D730D0A2O205472696E6B6574319O209O207O203D204D6163726F28225472696E6B657431222C20222F75736520313322292C0D0A2O205472696E6B6574329O209O207O203D204D6163726F28225472696E6B657432222C20222F75736520313422292C0D0A2O204865616C746873746F6E659O209O204O203D204D6163726F28224865616C746873746F6E65222C20222F757365206974656D3A2O35313222292C0D0A2O200D0A2O202O2D205370652O6C730D0A2O20446973727570744D6F7573656F7665729O208O203D204D6163726F2822446973727570744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44656D6F6E48756E7465722E436F2O6D6F6E732E446973727570743A4E616D65282O292C0D0A2O20496D707269736F6E4D6F7573656F7665729O207O203D204D6163726F2822496D707269736F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44656D6F6E48756E7465722E436F2O6D6F6E732E496D707269736F6E3A4E616D65282O292C0D0A2O20536967696C4F66466C616D65506C617965729O206O203D204D6163726F2822536967696C4F66466C616D65506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E44656D6F6E48756E7465722E436F2O6D6F6E732E536967696C4F66466C616D653A4E616D65282O292C0D0A7D0D0A0D0A4D6163726F2E44656D6F6E48756E7465722E4861766F63203D204D657267655461626C6542794B6579284D6163726F2E44656D6F6E48756E7465722E436F2O6D6F6E732C207B0D0A2O204D6574616D6F7270686F736973506C617965729O205O203D204D6163726F28224D6574616D6F7270686F736973506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E44656D6F6E48756E7465722E4861766F632E4D6574616D6F7270686F7369733A4E616D65282O292C0D0A2O20536967696C4F664D6973657279506C617965729O205O203D204D6163726F2822536967696C4F664D6973657279506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E44656D6F6E48756E7465722E4861766F632E536967696C4F664D69736572793A4E616D65282O292C0D0A2O205468726F77476C616976654D6F7573656F7665729O204O203D204D6163726F28225468726F77476C616976654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44656D6F6E48756E7465722E4861766F632E5468726F77476C616976653A4E616D65282O292C0D0A7D290D0A0D0A4D6163726F2E44656D6F6E48756E7465722E56656E6765616E6365203D204D657267655461626C6542794B6579284D6163726F2E44656D6F6E48756E7465722E436F2O6D6F6E732C207B0D0A2O20496E6665726E616C537472696B65506C617965729O204O203D204D6163726F2822496E6665726E616C537472696B65506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E44656D6F6E48756E7465722E56656E6765616E63652E496E6665726E616C537472696B653A4E616D65282O292C0D0A2O20536967696C4F6653696C656E6365506C617965729O204O203D204D6163726F2822536967696C4F6653696C656E6365506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E44656D6F6E48756E7465722E56656E6765616E63652E536967696C4F6653696C656E63653A4E616D65282O292C0D0A2O205468726F77476C616976654D6F7573656F7665729O204O203D204D6163726F28225468726F77476C616976654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44656D6F6E48756E7465722E56656E6765616E63652E5468726F77476C616976653A4E616D65282O292C0D0A2O2046726163747572654D6F7573656F7665729O207O203D204D6163726F282246726163747572654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E44656D6F6E48756E7465722E56656E6765616E63652E46726163747572653A4E616D65282O292C0D0A7D290D0A00063O00124O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);