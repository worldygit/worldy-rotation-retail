local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then v83[v85[2]]=v85[3];elseif (v86>1) then local v113;local v114;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v83[v114]=v83[v114](v83[v114 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v78=(v114 + v84) -1 ;for v128=v114,v78 do v113=v79[v128-v114 ];v83[v128]=v113;end v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v83[v114](v13(v83,v114 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else v83[v85[2]]=v59[v85[3]];end elseif (v86<=4) then if (v86==3) then local v123=v85[2];v83[v123]=v83[v123](v83[v123 + 1 ]);else do return;end end elseif (v86==5) then local v125=v85[2];v83[v125](v13(v83,v125 + 1 ,v78));else local v126=v85[2];v78=(v126 + v84) -1 ;for v131=v126,v78 do local v132=v79[v131-v126 ];v83[v131]=v132;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703093C2O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A3O2D207O3D204C4F43414C495A45207O3D0D0A2O2D20412O646F6E0D0A6C6F63616C20612O646F6E4E616D652C20612O646F6E5461626C65203D203O2E0D0A2O2D204865726F4442430D0A6C6F63616C20444243203D204865726F4442432E4442430D0A2O2D204865726F4C69620D0A6C6F63616C20484C9O203D204865726F4C69620D0A6C6F63616C2043616368656O203D204865726F43616368650D0A6C6F63616C20556E69747O203D20484C2E556E69740D0A6C6F63616C20506C617965725O203D20556E69742E506C617965720D0A6C6F63616C205461726765745O203D20556E69742E5461726765740D0A6C6F63616C205065748O203D20556E69742E5065740D0A6C6F63616C205370652O6C6O203D20484C2E5370652O6C0D0A6C6F63616C204D756C74695370652O6C203D20484C2E4D756C74695370652O6C0D0A6C6F63616C204974656D7O203D20484C2E4974656D0D0A6C6F63616C204D657267655461626C6542794B6579203D20484C2E5574696C732E4D657267655461626C6542794B65790D0A2O2D20576F726C6479526F746174696F6E0D0A6C6F63616C2057529O203D20576F726C6479526F746174696F6E0D0A6C6F63616C204D6163726F6O203D2057522E4D6163726F0D0A2O2D206C75610D0A6C6F63616C2047657454696D654O203D2047657454696D650D0A0D0A2O2D2046696C65204C6F63616C730D0A57522E436F2O6D6F6E732E4D616765203D207B7D0D0A6C6F63616C2053652O74696E6773203D2057522E47554953652O74696E67732E41504C2E4D6167652E436F2O6D6F6E730D0A6C6F63616C204D616765203D2057522E436F2O6D6F6E732E4D6167650D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D3D0D0A0D0A2O2D205370652O6C730D0A6966206E6F74205370652O6C2E4D616765207468656E205370652O6C2E4D616765203D207B7D20656E640D0A5370652O6C2E4D6167652E436F2O6D6F6E73203D207B0D0A2O202O2D2052616369616C730D0A2O20416E6365737472616C43612O6C9O209O207O203D205370652O6C28323734373338292C0D0A2O204261676F66547269636B739O209O209O203D205370652O6C28333132342O31292C0D0A2O204265727365726B696E679O209O209O20203D205370652O6C283236323937292C0D0A2O20426C2O6F64467572799O209O209O202O203D205370652O6C283230353732292C0D0A2O2046697265626C2O6F649O209O209O202O203D205370652O6C283236352O3231292C0D0A2O204C69676874734A7564676D656E749O209O206O203D205370652O6C28322O35363437292C0D0A2O202O2D204162696C69746965730D0A2O20417263616E654578706C6F73696F6E9O209O205O203D205370652O6C28312O3439292C202O2D4D656C2O652C2031300D0A2O20417263616E65496E74652O6C6563749O209O205O203D205370652O6C2831343539292C0D0A2O20426C696E6B9O209O209O206O203D204D756C74695370652O6C28313935332C20323132363533292C0D0A2O2046726F7374626F6C749O209O209O202O203D205370652O6C282O3136292C0D0A2O2046726F73744E6F76619O209O209O202O203D205370652O6C28312O32292C0D0A2O20506F6C796D6F7270689O209O209O202O203D205370652O6C282O3138292C0D0A2O20536C6F7746612O6C9O209O209O203O203D205370652O6C28313330292C0D0A2O2054696D65576172709O209O209O203O203D205370652O6C283830333533292C0D0A2O202O2D2054616C656E74730D0A2O20416C74657254696D659O209O209O202O203D205370652O6C2833342O323435292C0D0A2O20426C617374576176659O209O209O202O203D205370652O6C28313537393831292C0D0A2O20436F756E7465727370652O6C9O209O208O203D205370652O6C2832313339292C0D0A2O20447261676F6E734272656174689O209O207O203D205370652O6C2833312O3631292C0D0A2O20466F6375734D616769639O209O209O20203D205370652O6C28333231333538292C0D0A2O20496365426C6F636B9O209O209O203O203D205370652O6C283435343338292C0D0A2O20496365466C6F65739O209O209O203O203D205370652O6C2831302O383339292C0D0A2O204963654E6F76619O209O209O204O203D205370652O6C283135372O3937292C202O2D73706C6173682C20380D0A2O20496E7669736962696C6974799O209O208O203D205370652O6C282O36292C0D0A2O204D6574656F729O209O209O205O203D205370652O6C28313533353631292C0D0A2O204D692O726F72496D6167659O209O209O203D205370652O6C282O35333432292C0D0A2O2052656D6F766543757273659O209O209O203D205370652O6C28343735292C0D0A2O2052696E674F6646726F73749O209O209O203D205370652O6C282O3133373234292C0D0A2O2052756E656F66506F7765729O209O209O203D205370652O6C282O3136302O31292C0D0A2O205368696674696E67506F7765729O209O207O203D205370652O6C283338322O3430292C202O2D4D656C2O652031350D0A2O205370652O6C537465616C9O209O209O20203D205370652O6C2833302O3439292C0D0A2O2054656D706F72616C576172709O209O208O203D205370652O6C28333836353339292C0D0A2O202O2D2042752O66730D0A2O20417263616E65496E74652O6C65637442752O669O209O20203D205370652O6C2831343539292C0D0A2O204265727365726B696E6742752O669O209O206O203D205370652O6C283236323937292C0D0A2O20426C2O6F644675727942752O669O209O207O203D205370652O6C283230353732292C0D0A2O2052756E656F66506F77657242752O669O209O205O203D205370652O6C282O3136303134292C0D0A2O2054656D706F72616C5761727042752O669O209O204O203D205370652O6C28333836353430292C0D0A2O202O2D20446562752O66730D0A7D0D0A0D0A5370652O6C2E4D6167652E417263616E65203D204D657267655461626C6542794B6579285370652O6C2E4D6167652E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O20417263616E65426C6173749O209O209O203D205370652O6C283330343531292C0D0A2O2046697265426C6173749O209O209O202O203D205370652O6C28333139383336292C0D0A2O202O2D2054616C656E74730D0A2O20416D706C696669636174696F6E9O209O207O203D205370652O6C2832332O363238292C0D0A2O20417263616E6542612O726167659O209O207O203D205370652O6C283O343235292C202O2D53706C6173682C2031300D0A2O20417263616E65426F6D626172646D656E749O209O203O203D205370652O6C28333834353831292C0D0A2O20417263616E654563686F9O209O209O20203D205370652O6C2833342O323331292C202O2D53706C6173682C20380D0A2O20417263616E6546616D696C6961729O209O206O203D205370652O6C28323035302O32292C0D0A2O20417263616E654861726D6F6E799O209O207O203D205370652O6C2833382O343532292C0D0A2O20417263616E654D692O73696C65739O209O206O203D205370652O6C2835313433292C0D0A2O20417263616E654F72629O209O209O202O203D205370652O6C28313533363236292C202O2D53706C6173682C2031360D0A2O20417263616E65506F7765729O209O209O203D205370652O6C28333231373339292C0D0A2O20417263616E6553757267659O209O209O203D205370652O6C28333635333530292C0D0A2O20436173636164696E67506F7765729O209O206O203D205370652O6C28333834323736292C0D0A2O20436861726765644F72629O209O209O20203D205370652O6C28333834363531292C0D0A2O20436F6E6A7572654D616E6147656D9O209O206O203D205370652O6C28373539292C0D0A2O20436F6E63656E74726174696F6E9O209O207O203D205370652O6C28333834333734292C0D0A2O20456E6C69676874656E65649O209O209O203D205370652O6C28333231333837292C0D0A2O2045766F636174696F6E9O209O209O202O203D205370652O6C283132303531292C0D0A2O2047726561746572496E7669736962696C6974799O209O20203D205370652O6C282O3130393539292C0D0A2O204E657468657254656D706573749O209O207O203D205370652O6C282O3134393233292C202O2D53706C6173682C2031300D0A2O204E6574686572507265636973696F6E9O209O205O203D205370652O6C28333833373832292C0D0A2O204F726242612O726167659O209O209O20203D205370652O6C28333834383538292C0D0A2O204F766572706F77657265649O209O209O203D205370652O6C28312O35313437292C0D0A2O2050726573656E63656F664D696E649O209O206O203D205370652O6C28323035303235292C0D0A2O20507269736D6174696342612O726965729O209O204O203D205370652O6C28323335343530292C0D0A2O2052616469616E74537061726B9O209O208O203D205370652O6C28333736313033292C0D0A2O205265736F6E616E63659O209O209O202O203D205370652O6C28323035303238292C0D0A2O2052756C656F665468722O65739O209O208O203D205370652O6C28323634333534292C0D0A2O20536970686F6E53746F726D9O209O209O203D205370652O6C28333834313837292C0D0A2O20536C697073747265616D9O209O209O20203D205370652O6C28323336343537292C0D0A2O2053757065726E6F76619O209O209O202O203D205370652O6C28313537393830292C202O2D53706C6173682C20380D0A2O2054696D65416E6F6D616C799O209O209O203D205370652O6C28333833323433292C0D0A2O20546F7563686F667468654D6167699O209O206O203D205370652O6C28333231353037292C202O2D53706C6173682C20380D0A2O202O2D2042752O66730D0A2O20417263616E6546616D696C69617242752O669O209O202O203D205370652O6C28323130313236292C0D0A2O20417263616E654861726D6F6E7942752O669O209O203O203D205370652O6C2833382O342O35292C0D0A2O20417263616E654F7665726C6F616442752O669O209O202O203D205370652O6C28343039302O32292C202O2D2054696572203330203470630D0A2O20417263616E65537572676542752O669O209O205O203D205370652O6C28333635333632292C0D0A2O20436C65617263617374696E6742752O669O209O204O203D205370652O6C28323633373235292C0D0A2O20436F6E63656E74726174696F6E42752O669O209O203O203D205370652O6C28333834333739292C0D0A2O204E6574686572507265636973696F6E42752O669O209O20203D205370652O6C28333833373833292C0D0A2O2050726573656E63656F664D696E6442752O669O209O202O203D205370652O6C28323035303235292C0D0A2O2052756C656F665468722O657342752O669O209O204O203D205370652O6C283236342O3734292C0D0A2O20536970686F6E53746F726D42752O669O209O205O203D205370652O6C28333834323637292C0D0A2O202O2D20446562752O66730D0A2O204E657468657254656D70657374446562752O669O209O20203D205370652O6C282O3134393233292C202O2D53706C6173682C2031300D0A2O2052616469616E74537061726B446562752O669O209O202O203D205370652O6C28333736313033292C0D0A2O2052616469616E74537061726B56756C6E65726162696C6974799O204O203D205370652O6C28333736313034292C0D0A2O20546F7563686F667468654D616769446562752O669O209O203D205370652O6C28323130383234292C0D0A7D290D0A0D0A5370652O6C2E4D6167652E46697265203D204D657267655461626C6542794B6579285370652O6C2E4D6167652E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O204669726562612O6C9O209O209O203O203D205370652O6C28312O33292C0D0A2O20466C616D65737472696B659O209O209O203D205370652O6C2832313230292C0D0A2O202O2D2054616C656E74730D0A2O20416C657873747261737A6173467572799O209O204O203D205370652O6C28323335383730292C0D0A2O20426C617A696E6742612O726965729O209O206O203D205370652O6C28323335333133292C0D0A2O20436F6D62757374696F6E9O209O209O20203D205370652O6C28313930333139292C0D0A2O20462O656C7468654275726E9O209O209O203D205370652O6C2833382O333931292C0D0A2O2046697265426C6173749O209O209O202O203D205370652O6C2831302O383533292C0D0A2O2046697265737461727465729O209O209O203D205370652O6C28323035303236292C0D0A2O20466C616D654F6E9O209O209O204O203D205370652O6C28323035303239292C0D0A2O20466C616D6550617463689O209O209O20203D205370652O6C28323035303337292C0D0A2O2046726F6D54686541736865739O209O208O203D205370652O6C28333432332O34292C0D0A2O204879706572746865726D69619O209O208O203D205370652O6C28333833383630292C0D0A2O20496D70726F76656453636F7263689O209O206O203D205370652O6C28333833363034292C0D0A2O204B696E646C696E679O209O209O203O203D205370652O6C28312O35313438292C0D0A2O204C6976696E67426F6D629O209O209O20203D205370652O6C283O343537292C0D0A2O2050686F656E6978466C616D65739O209O207O203D205370652O6C28323537353431292C0D0A2O205079726F626C6173749O209O209O202O203D205370652O6C282O31332O36292C0D0A2O2053636F7263689O209O209O205O203D205370652O6C2832393438292C0D0A2O2053656172696E67546F7563689O209O208O203D205370652O6C28323639362O34292C0D0A2O2053756E4B696E6773426C652O73696E679O209O204O203D205370652O6C283338332O3836292C0D0A2O2054656D7065726564466C616D65739O209O206O203D205370652O6C28333833363539292C0D0A2O202O2D2042752O66730D0A2O20436F6D62757374696F6E42752O669O209O206O203D205370652O6C28313930333139292C0D0A2O20462O656C7468654275726E42752O669O209O205O203D205370652O6C2833382O333935292C0D0A2O20466C616D65412O63656C6572616E7442752O669O209O20203D205370652O6C28323033322O37292C0D0A2O20466C616D65734675727942752O669O209O206O203D205370652O6C2834302O393634292C202O2D205433302034706320626F6E75730D0A2O2048656174696E67557042752O669O209O207O203D205370652O6C283438313037292C0D0A2O20486F7453747265616B42752O669O209O207O203D205370652O6C283438313038292C0D0A2O204879706572746865726D696142752O669O209O204O203D205370652O6C28333833383734292C0D0A2O2053756E4B696E6773426C652O73696E6742752O669O209O203D205370652O6C283338332O3832292C0D0A2O20467572796F6674686553756E4B696E6742752O669O209O203D205370652O6C283338332O3833292C0D0A2O202O2D20446562752O66730D0A2O204368612O72696E67456D62657273446562752O669O209O203D205370652O6C283430382O3635292C202O2D205433302032706320626F6E75730D0A2O2049676E697465446562752O669O209O208O203D205370652O6C283132363534292C0D0A2O20496D70726F76656453636F726368446562752O669O209O203D205370652O6C28333833363038292C0D0A7D290D0A0D0A5370652O6C2E4D6167652E46726F7374203D204D657267655461626C6542794B6579285370652O6C2E4D6167652E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O20436F6E656F66436F6C649O209O209O20203D205370652O6C28313230292C2O2D4D656C2O652C2031320D0A2O20496369636C657342752O669O209O209O203D205370652O6C28323035343733292C0D0A2O2057696E746572734368692O6C446562752O669O209O202O203D205370652O6C282O3238333538292C0D0A2O2046697265426C6173749O209O209O202O203D205370652O6C28333139383336292C0D0A2O202O2D2054616C656E74730D0A2O20426C692O7A6172649O209O209O203O203D205370652O6C28313930333536292C202O2D73706C6173682C2031360D0A2O20426F6E654368692O6C696E679O209O208O203D205370652O6C28323035372O36292C0D0A2O20436861696E5265616374696F6E9O209O207O203D205370652O6C28323738333039292C0D0A2O20436F6D657453746F726D9O209O209O20203D205370652O6C28313533353935292C202O2D73706C6173682C20360D0A2O2045626F6E626F6C749O209O209O203O203D205370652O6C28323537353337292C202O2D73706C6173682C20382028776974682073706C692O74696E6720696365290D0A2O20466C752O72799O209O209O205O203D205370652O6C282O34363134292C0D0A2O2046722O657A696E675261696E9O209O208O203D205370652O6C28323730322O33292C0D0A2O2046722O657A696E6757696E64739O209O207O203D205370652O6C28333832313033292C0D0A2O2046726F7374626974659O209O209O202O203D205370652O6C28313938313231292C0D0A2O2046726F7A656E4F72629O209O209O202O203D205370652O6C283834373134292C202O2D73706C6173682C2031360D0A2O20476C616369616C5370696B659O209O208O203D205370652O6C28312O39373836292C202O2D73706C6173682C20382028776974682073706C692O74696E6720696365290D0A2O2049636542612O726965729O209O209O20203D205370652O6C282O31343236292C0D0A2O2049636543612O6C65729O209O209O202O203D205370652O6C2832333O3632292C0D0A2O204963654C616E63659O209O209O203O203D205370652O6C283330342O35292C202O2D73706C6173682C20382028776974682073706C692O74696E6720696365290D0A2O204963795665696E739O209O209O203O203D205370652O6C283132343732292C0D0A2O205261796F6646726F73749O209O209O20203D205370652O6C28323035303231292C0D0A2O20536C69636B4963659O209O209O203O203D205370652O6C28333832312O34292C0D0A2O20536E6F7773746F726D9O209O209O202O203D205370652O6C28333831373036292C0D0A2O2053706C692O74696E674963659O209O208O203D205370652O6C283536332O37292C202O2D73706C6173682C20380D0A2O2053752O6D6F6E5761746572456C656D656E74616C9O209O203D205370652O6C283331363837292C0D0A2O202O2D20506574204162696C69746965730D0A2O2046722O657A659O209O209O205O203D205370652O6C283O3339352C202270657422292C202O2D73706C6173682C20380D0A2O2057617465724A65749O209O209O203O203D205370652O6C283133353032392C202270657422292C0D0A2O202O2D2042752O66730D0A2O20427261696E46722O657A6542752O669O209O205O203D205370652O6C283139302O3436292C0D0A2O2046696E676572736F6646726F737442752O669O209O202O203D205370652O6C282O34352O34292C0D0A2O2046722O657A696E675261696E42752O669O209O204O203D205370652O6C28323730323332292C0D0A2O2046722O657A696E6757696E647342752O669O209O203O203D205370652O6C28333832313036292C0D0A2O20476C616369616C5370696B6542752O669O209O204O203D205370652O6C28312O39382O34292C0D0A2O204963795665696E7342752O669O209O208O203D205370652O6C283132343732292C0D0A2O20536E6F7773746F726D42752O669O209O207O203D205370652O6C28333831352O32292C0D0A2O202O2D20446562752O66730D0A7D290D0A0D0A2O2D204974656D730D0A6966206E6F74204974656D2E4D616765207468656E204974656D2E4D616765203D207B7D20656E640D0A4974656D2E4D6167652E436F2O6D6F6E73203D207B0D0A2O202O2D20506F74696F6E0D0A2O204865616C746873746F6E659O209O204O203D204974656D282O353132292C0D0A7D0D0A0D0A4974656D2E4D6167652E417263616E65203D204D657267655461626C6542794B6579284974656D2E4D6167652E436F2O6D6F6E732C207B0D0A2O204D616E6147656D9O209O208O203D204974656D283336372O39292C0D0A7D290D0A0D0A4974656D2E4D6167652E46697265203D204D657267655461626C6542794B6579284974656D2E4D6167652E436F2O6D6F6E732C207B0D0A7D290D0A0D0A4974656D2E4D6167652E46726F7374203D204D657267655461626C6542794B6579284974656D2E4D6167652E436F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D204D6163726F730D0A6966206E6F74204D6163726F2E4D616765207468656E204D6163726F2E4D616765203D207B7D20656E640D0A4D6163726F2E4D6167652E436F2O6D6F6E73203D207B0D0A2O202O2D204974656D730D0A2O205472696E6B6574319O209O207O203D204D6163726F28225472696E6B657431222C20222F75736520313322292C0D0A2O205472696E6B6574329O209O207O203D204D6163726F28225472696E6B657432222C20222F75736520313422292C0D0A2O204865616C746873746F6E659O209O204O203D204D6163726F28224865616C746873746F6E65222C20222F757365206974656D3A2O35313222292C0D0A2O202O2D205370652O6C730D0A2O20417263616E65496E74652O6C656374506C617965729O203O203D204D6163726F2822417263616E65496E74652O6C656374506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E4D6167652E436F2O6D6F6E732E417263616E65496E74652O6C6563743A4E616D65282O292C0D0A2O20436F756E7465727370652O6C4D6F7573656F7665729O203O203D204D6163726F2822436F756E7465727370652O6C4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E4D6167652E436F2O6D6F6E732E436F756E7465727370652O6C3A4E616D65282O292C0D0A2O20506F6C796D6F7270684D6F7573656F7665729O206O203D204D6163726F2822506F6C796D6F7270684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E4D6167652E436F2O6D6F6E732E506F6C796D6F7270683A4E616D65282O292C0D0A2O2052656D6F766543757273654D6F7573656F7665729O204O203D204D6163726F282252656D6F766543757273654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E4D6167652E436F2O6D6F6E732E52656D6F766543757273653A4E616D65282O292C0D0A2O2052696E674F6646726F7374437572736F729O207O203D204D6163726F282252696E674F6646726F7374437572736F72222C20222F63617374205B40637572736F725D2022202O2E205370652O6C2E4D6167652E436F2O6D6F6E732E52696E674F6646726F73743A4E616D65282O292C0D0A2O2053746F7043617374696E679O209O204O203D204D6163726F282253746F7043617374696E67222C20222F73746F7063617374696E6722292C0D0A7D0D0A0D0A4D6163726F2E4D6167652E417263616E65203D204D657267655461626C6542794B6579284D6163726F2E4D6167652E436F2O6D6F6E732C207B0D0A2O204D616E6147656D9O209O208O203D204D6163726F28224D616E6147656D222C20222F757365206974656D3A3336372O3922292C0D0A2O2043616E63656C50726573656E63656F664D696E649O204O203D204D6163726F282243616E63656C50726573656E63656F664D696E64222C20222F63616E63656C617572612022202O2E205370652O6C2E4D6167652E417263616E652E50726573656E63656F664D696E643A4E616D65282O292C0D0A7D290D0A0D0A4D6163726F2E4D6167652E46697265203D204D657267655461626C6542794B6579284D6163726F2E4D6167652E436F2O6D6F6E732C207B0D0A2O20466C616D65737472696B65437572736F729O207O203D204D6163726F2822466C616D65737472696B65437572736F72222C20222F63617374205B40637572736F725D2022202O2E205370652O6C2E4D6167652E466972652E466C616D65737472696B653A4E616D65282O292C0D0A2O204D6574656F72437572736F729O209O203O203D204D6163726F28224D6574656F72437572736F72222C20222F63617374205B40637572736F725D2022202O2E205370652O6C2E4D6167652E466972652E4D6574656F723A4E616D65282O292C0D0A7D290D0A0D0A4D6163726F2E4D6167652E46726F7374203D204D657267655461626C6542794B6579284D6163726F2E4D6167652E436F2O6D6F6E732C207B0D0A2O20426C692O7A617264437572736F729O209O20203D204D6163726F2822426C692O7A617264437572736F72222C20222F63617374205B40637572736F725D2022202O2E205370652O6C2E4D6167652E46726F73742E426C692O7A6172643A4E616D65282O292C0D0A2O204963654C616E63654D6F7573656F7665729O207O203D204D6163726F28224963654C616E63654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E4D6167652E46726F73742E4963654C616E63653A4E616D65282O292C0D0A2O2046722O657A65437572736F729O209O203O203D204D6163726F282246722O657A65437572736F72222C20222F63617374205B40637572736F725D2022202O2E205370652O6C2E4D6167652E46726F73742E46722O657A653A4E616D65282O292C0D0A7D290D0A0D0A2O2D205661726961626C65730D0A4D6167652E49465354203D207B0D0A2O2043752O72537461636B73203D20302C0D0A2O2043752O72537461636B7354696D65203D20302C0D0A2O204F6C64537461636B73203D20302C0D0A2O204F6C64537461636B7354696D65203D20302C0D0A2O20446972656374696F6E203D20300D0A7D0D0A6C6F63616C2053203D207B7D0D0A532E496E63616E74657273466C6F7742752O66203D205370652O6C282O3136323637290D0A0D0A484C3A5265676973746572466F724576656E742866756E6374696F6E28290D0A2O204D6167652E494653542E43752O72537461636B73203D20300D0A2O204D6167652E494653542E43752O72537461636B7354696D65203D20300D0A2O204D6167652E494653542E4F6C64537461636B73203D20300D0A2O204D6167652E494653542E4F6C64537461636B7354696D65203D20300D0A2O204D6167652E494653542E446972656374696F6E203D20300D0A656E642C2022504C415945525F524547454E5F454E41424C454422290D0A0D0A66756E6374696F6E204D6167652E4946547261636B657228290D0A2O20696620484C2E436F6D62617454696D652829202O3D2030207468656E2072657475726E3B20656E640D0A2O206C6F63616C205469636B44692O66203D204D6167652E494653542E43752O72537461636B7354696D65202D204D6167652E494653542E4F6C64537461636B7354696D650D0A2O206C6F63616C2043752O72537461636B73203D204D6167652E494653542E43752O72537461636B730D0A2O206C6F63616C2043752O72537461636B7354696D65203D204D6167652E494653542E43752O72537461636B7354696D650D0A2O206C6F63616C204F6C64537461636B73203D204D6167652E494653542E4F6C64537461636B730D0A2O2069662028506C617965723A42752O66557028532E496E63616E74657273466C6F7742752O662O29207468656E0D0A4O2069662028506C617965723A42752O66537461636B28532E496E63616E74657273466C6F7742752O6629207E3D2043752O72537461636B73206F722028506C617965723A42752O66537461636B28532E496E63616E74657273466C6F7742752O6629202O3D2043752O72537461636B7320616E64205469636B44692O66203E20312O29207468656E0D0A6O204D6167652E494653542E4F6C64537461636B73203D2043752O72537461636B730D0A6O204D6167652E494653542E4F6C64537461636B7354696D65203D2043752O72537461636B7354696D650D0A4O20656E640D0A4O204D6167652E494653542E43752O72537461636B73203D20506C617965723A42752O66537461636B28532E496E63616E74657273466C6F7742752O66290D0A4O204D6167652E494653542E43752O72537461636B7354696D65203D20484C2E436F6D62617454696D6528290D0A4O206966204D6167652E494653542E43752O72537461636B73203E204D6167652E494653542E4F6C64537461636B73207468656E0D0A6O206966204D6167652E494653542E43752O72537461636B73202O3D2035207468656E0D0A8O204D6167652E494653542E446972656374696F6E203D20300D0A6O20656C73650D0A8O204D6167652E494653542E446972656374696F6E203D20310D0A6O20656E640D0A4O20656C73656966204D6167652E494653542E43752O72537461636B73203C204D6167652E494653542E4F6C64537461636B73207468656E0D0A6O206966204D6167652E494653542E43752O72537461636B73202O3D2031207468656E0D0A8O204D6167652E494653542E446972656374696F6E203D20300D0A6O20656C73650D0A8O204D6167652E494653542E446972656374696F6E203D202D310D0A6O20656E640D0A4O20656C73650D0A6O206966204D6167652E494653542E43752O72537461636B73202O3D2031207468656E0D0A8O204D6167652E494653542E446972656374696F6E203D20310D0A6O20656C73650D0A8O204D6167652E494653542E446972656374696F6E203D202D310D0A6O20656E640D0A4O20656E640D0A2O20656C73650D0A4O204D6167652E494653542E4F6C64537461636B73203D20300D0A4O204D6167652E494653542E4F6C64537461636B7354696D65203D20300D0A4O204D6167652E494653542E43752O72537461636B73203D20300D0A4O204D6167652E494653542E43752O72537461636B7354696D65203D20300D0A4O204D6167652E494653542E446972656374696F6E203D20300D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E204D6167652E494654696D65546F5828636F756E742C20646972656374696F6E290D0A4O206C6F63616C206C6F770D0A4O206C6F63616C20686967680D0A4O206C6F63616C2062752O665F706F736974696F6E0D0A4O206966204D6167652E494653542E446972656374696F6E202O3D202D31206F7220284D6167652E494653542E446972656374696F6E202O3D203020616E64204D6167652E494653542E43752O72537461636B73202O3D203029207468656E0D0A6O2062752O665F706F736974696F6E203D203130202D204D6167652E494653542E43752O72537461636B73202B20310D0A4O20656C73650D0A6O2062752O665F706F736974696F6E203D204D6167652E494653542E43752O72537461636B730D0A4O20656E640D0A4O20696620646972656374696F6E202O3D2022757022207468656E0D0A8O206C6F77203D20636F756E740D0A8O2068696768203D20636F756E740D0A4O20656C7365696620646972656374696F6E202O3D2022646F776E22207468656E0D0A8O206C6F77203D203130202D20636F756E74202B20310D0A8O2068696768203D203130202D20636F756E74202B20310D0A4O20656C73650D0A8O206C6F77203D20636F756E740D0A8O2068696768203D203130202D20636F756E74202B20310D0A4O20656E640D0A4O206966206C6F77202O3D2062752O665F706F736974696F6E206F722068696768202O3D2062752O665F706F736974696F6E207468656E0D0A6O2072657475726E20300D0A4O20656E640D0A4O206C6F63616C207469636B735F6C6F77203D20283130202B206C6F77202D2062752O665F706F736974696F6E2920252031300D0A4O206C6F63616C207469636B735F68696768203D20283130202B2068696768202D2062752O665F706F736974696F6E2920252031300D0A4O2072657475726E20284D6167652E494653542E43752O72537461636B7354696D65202D204D6167652E494653542E4F6C64537461636B7354696D6529202B206D6174682E6D696E287469636B735F6C6F772C207469636B735F6869676829202D20310D0A656E640D0A00063O0012023O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);