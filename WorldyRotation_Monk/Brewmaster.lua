local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110](v13(v83,v110 + 1 ,v78));elseif (v86>1) then do return;end else local v112=v85[2];v78=(v112 + v84) -1 ;for v128=v112,v78 do local v129=v79[v128-v112 ];v83[v128]=v129;end end elseif (v86<=4) then if (v86>3) then v83[v85[2]]=v85[3];else local v115;local v116;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v83[v116]=v83[v116](v83[v116 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v78=(v116 + v84) -1 ;for v131=v116,v78 do v115=v79[v131-v116 ];v83[v131]=v115;end v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v83[v116](v13(v83,v116 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86>5) then v83[v85[2]]=v59[v85[3]];else local v125=v85[2];v83[v125]=v83[v125](v83[v125 + 1 ]);end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703DE452O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A3O2D207O3D204C4F43414C495A45207O3D0D0A2O2D20412O646F6E0D0A6C6F63616C20612O646F6E4E616D652C20612O646F6E5461626C65203D203O2E0D0A2O2D204865726F4442430D0A6C6F63616C204442438O203D204865726F4442432E4442430D0A2O2D204865726F4C69620D0A6C6F63616C20484C9O203D204865726F4C69620D0A6C6F63616C2043616368656O203D204865726F43616368650D0A6C6F63616C20556E69747O203D20484C2E556E69740D0A6C6F63616C20506C617965725O203D20556E69742E506C617965720D0A6C6F63616C205461726765745O203D20556E69742E5461726765740D0A6C6F63616C205065748O203D20556E69742E5065740D0A6C6F63616C205370652O6C6O203D20484C2E5370652O6C0D0A6C6F63616C204D756C74695370652O6C203D20484C2E4D756C74695370652O6C0D0A6C6F63616C204974656D7O203D20484C2E4974656D0D0A2O2D20576F726C6479526F746174696F6E0D0A6C6F63616C2057529O203D20576F726C6479526F746174696F6E0D0A6C6F63616C20416F454F4E6O203D2057522E416F454F4E0D0A6C6F63616C204344734F4E6O203D2057522E4344734F4E0D0A6C6F63616C20436173747O203D2057522E436173740D0A6C6F63616C2042696E647O203D2057522E42696E640D0A6C6F63616C204D6163726F6O203D2057522E4D6163726F0D0A6C6F63616C205072652O736O203D2057522E5072652O730D0A2O2D204E756D2F422O6F6C2048656C7065722046756E6374696F6E730D0A6C6F63616C206E756D8O203D2057522E436F2O6D6F6E732E45766572796F6E652E6E756D0D0A6C6F63616C20622O6F6C7O203D2057522E436F2O6D6F6E732E45766572796F6E652E622O6F6C0D0A2O2D204C75610D0A2O2D20576F57204150490D0A6C6F63616C20556E69744865616C74684D6178203D20556E69744865616C74684D61780D0A0D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D0D0A3O2D207O3D2041504C204C4F43414C53207O3D0D0A2O2D206C7561636865636B3A206D61785F6C696E655F6C656E677468204O390D0A0D0A2O2D205370652O6C730D0A6C6F63616C2053203D205370652O6C2E4D6F6E6B2E427265776D61737465720D0A6C6F63616C2049203D204974656D2E4D6F6E6B2E427265776D61737465720D0A6C6F63616C204D203D204D6163726F2E4D6F6E6B2E427265776D61737465720D0A0D0A2O2D20437265617465207461626C6520746F206578636C7564652061626F7665207472696E6B6574732066726F6D204F6E205573652066756E6374696F6E0D0A6C6F63616C204F6E5573654578636C75646573203D207B0D0A2O20492E416C67657468617250752O7A6C65426F783A494428292C0D0A7D0D0A0D0A2O2D20526F746174696F6E205661720D0A6C6F63616C20456E656D69657335790D0A6C6F63616C20456E656D69657338790D0A6C6F63616C20456E656D696573436F756E74380D0A6C6F63616C20497354616E6B696E670D0A0D0A2O2D204755492053652O74696E67730D0A6C6F63616C2045766572796F6E65203D2057522E436F2O6D6F6E732E45766572796F6E650D0A6C6F63616C204D6F6E6B203D2057522E436F2O6D6F6E732E4D6F6E6B0D0A6C6F63616C2053652O74696E6773203D207B0D0A2O2047656E6572616C4O203D2057522E47554953652O74696E67732E47656E6572616C2C0D0A2O20436F2O6D6F6E734O203D2057522E47554953652O74696E67732E41504C2E4D6F6E6B2E436F2O6D6F6E732C0D0A2O20427265776D6173746572203D2057522E47554953652O74696E67732E41504C2E4D6F6E6B2E427265776D61737465720D0A7D0D0A0D0A6C6F63616C2066756E6374696F6E205472696E6B65747328290D0A2O202O2D207573655F6974656D732C736C6F74733D7472696E6B6574312C69663D62752O662E63612O6C5F6F665F7468655F77696C642E75707C2174616C656E742E63612O6C5F6F665F7468655F77696C64262862752O662E6265737469616C5F77726174682E7570262862752O662E626C2O6F646C7573742E75707C7461726765742E6865616C74682E7063743C32302O297C66696768745F72656D61696E733C33310D0A2O206C6F63616C205472696E6B657431546F557365203D20506C617965723A47657455736561626C654974656D73284F6E5573654578636C756465732C203133290D0A2O206966205472696E6B657431546F557365207468656E0D0A4O206966205072652O73284D2E5472696E6B6574312C206E696C2C206E696C2C207472756529207468656E2072657475726E20227472696E6B657431207472696E6B65742032223B20656E640D0A2O20656E640D0A2O202O2D207573655F6974656D732C736C6F74733D7472696E6B6574322C69663D62752O662E63612O6C5F6F665F7468655F77696C642E75707C2174616C656E742E63612O6C5F6F665F7468655F77696C64262862752O662E6265737469616C5F77726174682E7570262862752O662E626C2O6F646C7573742E75707C7461726765742E6865616C74682E7063743C32302O297C66696768745F72656D61696E733C33310D0A2O206C6F63616C205472696E6B657432546F557365203D20506C617965723A47657455736561626C654974656D73284F6E5573654578636C756465732C203134290D0A2O206966205472696E6B657432546F557365207468656E0D0A4O206966205072652O73284D2E5472696E6B6574322C206E696C2C206E696C2C207472756529207468656E2072657475726E20227472696E6B657432207472696E6B65742034223B20656E640D0A2O20656E640D0A2O202O2D207573655F6974656D2C6E616D653D616C6765746861725F70752O7A6C655F626F780D0A2O20696620492E416C67657468617250752O7A6C65426F783A4973457175692O706564416E6452656164792829207468656E0D0A4O206966205072652O73284D2E416C67657468617250752O7A6C65426F782C206E696C2C207472756529207468656E2072657475726E2022616C6765746861725F70752O7A6C655F626F78207472696E6B657473223B20656E640D0A2O20656E640D0A656E640D0A0D0A2O2D204920616D20676F696E67206B2O657020746869732066756E6374696F6E20696E20706C61636520696E2063617365206974206973206E2O6564656420696E20746865206675747572652E0D0A2O2D2054686520636F646520697320736F756E6420666F72206120736D2O6F7468696E67206F662064616D61676520696E74616B652E0D0A2O2D20486F77657665722074686973206973206E6F74206E2O6564656420696E207468652063752O72656E742041504C2E0D0A2O2D2048696A61636B656420746869732066756E6374696F6E20746F20656173696C792068616E646C65207468652041504C2773206D756C7469706C6520707572696679206C696E6573202O2D2043696C722O617A0D0A6C6F63616C2066756E6374696F6E2053686F756C6450757269667928290D0A2O202O2D204F6C642072657475726E2E204C656176696E672074686973206865617220666F72206E6F772C20696E20636173652077652077616E7420746F207265766572742E0D0A2O202O2D72657475726E20532E507572696679696E67427265773A436861726765734672616374696F6E616C2829203E3D20312E3820616E642028506C617965723A446562752O66557028532E48656176795374612O67657229206F7220506C617965723A446562752O66557028532E4D6F6465726174655374612O67657229206F7220506C617965723A446562752O66557028532E4C696768745374612O6765722O290D0A2O206C6F63616C205374612O67657246752O6C203D20506C617965723A5374612O67657246752O6C2829206F7220300D0A2O202O2D2069662074686572652773206E6F207374612O6765722C206A75737420657869737420736F20776520646F6E2774206861766520746F2063616C63756C61746520616E797468696E670D0A2O206966205374612O67657246752O6C202O3D2030207468656E2072657475726E2066616C736520656E640D0A2O206C6F63616C205374612O67657243752O72656E74203D20300D0A2O206C6F63616C205374612O6765725370652O6C203D206E696C0D0A2O20696620506C617965723A42752O66557028532E4C696768745374612O67657229207468656E0D0A4O205374612O6765725370652O6C203D20532E4C696768745374612O6765720D0A2O20656C7365696620506C617965723A42752O66557028532E4D6F6465726174655374612O67657229207468656E0D0A4O205374612O6765725370652O6C203D20532E4D6F6465726174655374612O6765720D0A2O20656C7365696620506C617965723A42752O66557028532E48656176795374612O67657229207468656E0D0A4O205374612O6765725370652O6C203D20532E48656176795374612O6765720D0A2O20656E640D0A2O206966205374612O6765725370652O6C207468656E0D0A4O206C6F63616C207370652O6C5461626C65203D20506C617965723A446562752O66496E666F285374612O6765725370652O6C2C2066616C73652C2074727565290D0A4O205374612O67657243752O72656E74203D207370652O6C5461626C652E706F696E74735B325D0D0A2O20656E640D0A2O202O2D2069663D7374612O6765722E616D6F756E2O746F746F74616C7063743E3D302E37263O287461726765742E632O6F6C646F776E2E70617573655F616374696F6E2E72656D61696E733E3D32307C74696D653C3D31307C7461726765742E632O6F6C646F776E2E70617573655F616374696F6E2E6475726174696F6E3D302926632O6F6C646F776E2E696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782E72656D61696E733C35297C62752O662E696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782E7570290D0A2O202O2D2041504C204E6F74653A204361737420504220647572696E6720746865204E69757A616F2077696E646F772C20627574206F6E6C7920696620726563656E746C79206869742E0D0A2O206966202O285374612O67657243752O72656E74203E203020616E64205374612O67657243752O72656E74203E3D205374612O67657246752O6C202A20302E372920616E642028532E496E766F6B654E69757A616F546865426C61636B4F783A432O6F6C646F776E52656D61696E732829203C2035206F7220506C617965723A42752O66557028532E496E766F6B654E69757A616F546865426C61636B4F783O29207468656E0D0A4O2072657475726E20747275650D0A2O20656E640D0A2O202O2D2069663D62752O662E696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782E75702662752O662E696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782E72656D61696E733C380D0A2O2069662028506C617965723A42752O66557028532E496E766F6B654E69757A616F546865426C61636B4F782920616E6420506C617965723A42752O6652656D61696E7328532E496E766F6B654E69757A616F546865426C61636B4F7829203C203829207468656E0D0A4O2072657475726E20747275650D0A2O20656E640D0A2O202O2D2069663D632O6F6C646F776E2E707572696679696E675F627265772E636861726765735F6672616374696F6E616C3E3D312E382628632O6F6C646F776E2E696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782E72656D61696E733E31307C62752O662E696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782E7570290D0A2O2069662028532E507572696679696E67427265773A436861726765734672616374696F6E616C2829203E3D20312E3820616E642028532E496E766F6B654E69757A616F546865426C61636B4F783A432O6F6C646F776E52656D61696E732829203E203130206F7220506C617965723A42752O66557028532E496E766F6B654E69757A616F546865426C61636B4F783O29207468656E0D0A4O2072657475726E20747275650D0A2O20656E640D0A2O2072657475726E2066616C73650D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20507265636F6D62617428290D0A2O202O2D20666C61736B0D0A2O202O2D20662O6F640D0A2O202O2D206175676D656E746174696F6E0D0A2O202O2D20736E617073686F745F73746174730D0A2O202O2D20706F74696F6E0D0A2O202O2D206368695F62757273742C69663D21636F76656E616E742E6E696768745F6661650D0A2O20696620532E43686942757273743A49734361737461626C65282920616E642028436F76656E616E744944207E3D203329207468656E0D0A4O206966205072652O7328532E43686942757273742C206E6F74205461726765743A4973496E4D656C2O6552616E67652838292C207472756529207468656E2072657475726E20226368695F627572737420707265636F6D6261742036223B20656E640D0A2O20656E640D0A2O202O2D206368695F776176650D0A2O20696620532E436869576176653A49734361737461626C652829207468656E0D0A4O206966205072652O7328532E436869576176652C206E6F74205461726765743A4973496E4D656C2O6552616E67652838292C207472756529207468656E2072657475726E20226368695F7761766520707265636F6D626174203130223B20656E640D0A2O20656E640D0A2O202O2D204D616E75612O6C7920612O646564206F70656E6572730D0A2O20696620532E52757368696E674A61646557696E643A49734361737461626C652829207468656E0D0A4O206966205072652O7328532E52757368696E674A61646557696E642C206E6F74205461726765743A4973496E4D656C2O6552616E676528382O29207468656E2072657475726E202272757368696E675F6A6164655F77696E6420707265636F6D6261742034223B20656E640D0A2O20656E640D0A2O20696620532E4B6567536D6173683A49734361737461626C652829207468656E200D0A4O206966205072652O7328532E4B6567536D6173682C206E6F74205461726765743A4973496E52616E67652834302O29207468656E2072657475726E20226B65675F736D61736820707265636F6D6261742038223B20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20446566656E736976657328290D0A2O20696620532E43656C65737469616C427265773A49734361737461626C65282920616E642028506C617965723A42752O66446F776E28532E426C61636B6F7574436F6D626F42752O662920616E6420506C617965723A496E636F6D696E6744616D61676554616B656E28313O3929203E2028556E69744865616C74684D61782822706C617965722229202A20302E31202B20506C617965723A5374612O6765724C6173745469636B44616D61676528342O2920616E6420506C617965723A42752O66537461636B28532E456C7573697665427261776C657242752O6629203C203229207468656E0D0A4O206966205072652O7328532E43656C65737469616C4272657729207468656E2072657475726E202243656C65737469616C2042726577223B20656E640D0A2O20656E640D0A2O20696620532E507572696679696E67427265773A49734361737461626C65282920616E642053686F756C645075726966792829207468656E0D0A4O206966205072652O7328532E507572696679696E674272657729207468656E2072657475726E2022507572696679696E672042726577223B20656E640D0A2O20656E640D0A2O20696620532E457870656C4861726D3A49734361737461626C65282920616E6420506C617965723A4865616C746850657263656E746167652829203C3D203830207468656E0D0A4O206966205072652O7328532E457870656C4861726D29207468656E2072657475726E2022457870656C204861726D223B20656E640D0A2O20656E640D0A2O20696620532E44616D70656E4861726D3A49734361737461626C65282920616E6420506C617965723A42752O66446F776E28532E466F7274696679696E674272657742752O662920616E6420506C617965723A4865616C746850657263656E746167652829203C3D2053652O74696E67732E436F2O6D6F6E732E48502E44616D70656E4861726D207468656E0D0A4O206966205072652O7328532E44616D70656E4861726D29207468656E2072657475726E202244616D70656E204861726D223B20656E640D0A2O20656E640D0A2O20696620532E466F7274696679696E67427265773A49734361737461626C65282920616E6420506C617965723A42752O66446F776E28532E44616D70656E4861726D42752O662920616E6420506C617965723A4865616C746850657263656E746167652829203C3D2053652O74696E67732E436F2O6D6F6E732E48502E466F7274696679696E6742726577207468656E0D0A4O206966205072652O7328532E466F7274696679696E674272657729207468656E2072657475726E2022466F7274696679696E672042726577223B20656E640D0A2O20656E640D0A656E640D0A0D0A3O2D207O3D20414354494F4E204C49535453207O3D0D0A6C6F63616C2066756E6374696F6E2041504C28290D0A2O202O2D20556E6974205570646174650D0A2O20456E656D6965733579203D20506C617965723A476574456E656D696573496E4D656C2O6552616E6765283529202O2D204D756C7469706C65204162696C69746965730D0A2O20456E656D6965733879203D20506C617965723A476574456E656D696573496E4D656C2O6552616E6765283829202O2D204D756C7469706C65204162696C69746965730D0A2O20456E656D696573436F756E7438203D2023456E656D6965733879202O2D20414F4520542O6F676C650D0A0D0A2O202O2D204172652077652074616E6B696E673F0D0A2O20497354616E6B696E67203D20506C617965723A497354616E6B696E67416F45283829206F7220506C617965723A497354616E6B696E6728546172676574290D0A0D0A2O203O2D20496E20436F6D6261740D0A2O2069662045766572796F6E652E546172676574497356616C69642829207468656E0D0A4O202O2D20507265636F6D6261740D0A4O206966206E6F7420506C617965723A412O66656374696E67436F6D6261742829207468656E0D0A6O206C6F63616C2053686F756C6452657475726E203D20507265636F6D62617428293B2069662053686F756C6452657475726E207468656E2072657475726E2053686F756C6452657475726E3B20656E640D0A4O20656E640D0A4O202O2D20496E74652O72757074730D0A4O206966206E6F7420506C617965723A497343617374696E67282920616E64206E6F7420506C617965723A49734368612O6E656C696E672829207468656E0D0A6O206C6F63616C2053686F756C6452657475726E203D2045766572796F6E652E496E74652O7275707428532E537065617248616E64537472696B652C20382C2074727565293B2069662053686F756C6452657475726E207468656E2072657475726E2053686F756C6452657475726E3B20656E640D0A6O2053686F756C6452657475726E203D2045766572796F6E652E496E74652O72757074576974685374756E28532E4C656753772O65702C2038293B2069662053686F756C6452657475726E207468656E2072657475726E2053686F756C6452657475726E3B20656E640D0A6O2053686F756C6452657475726E203D2045766572796F6E652E496E74652O7275707428532E537065617248616E64537472696B652C2034302C20747275652C204D6F7573656F7665722C204D2E537065617248616E64537472696B654D6F7573656F766572293B2069662053686F756C6452657475726E207468656E2072657475726E2053686F756C6452657475726E3B20656E640D0A4O20656E640D0A4O202O2D20446566656E73697665730D0A4O20696620497354616E6B696E67207468656E0D0A6O206C6F63616C2053686F756C6452657475726E203D20446566656E736976657328293B2069662053686F756C6452657475726E207468656E2072657475726E2053686F756C6452657475726E3B20656E640D0A4O20656E640D0A4O206966204344734F4E2829207468656E0D0A6O20696620532E53752O6D6F6E576869746554696765725374617475653A49734361737461626C652829207468656E0D0A8O206966205072652O73284D2E53752O6D6F6E57686974655469676572537461747565506C617965722C206E6F74205461726765743A4973496E4D656C2O6552616E676528352O29207468656E2072657475726E202273752O6D6F6E5F77686974655F74696765725F737461747565206D61696E2034223B20656E640D0A6O20656E640D0A6O202O2D207573655F6974656D730D0A6O2069662053652O74696E67732E47656E6572616C2E456E61626C65642E5472696E6B657473207468656E0D0A8O206C6F63616C2053686F756C6452657475726E203D205472696E6B65747328293B2069662053686F756C6452657475726E207468656E2072657475726E2053686F756C6452657475726E3B20656E640D0A6O20656E640D0A6O202O2D20626C2O6F645F667572790D0A6O20696620532E426C2O6F64467572793A49734361737461626C652829207468656E0D0A8O206966205072652O7328532E426C2O6F644675727929207468656E2072657475726E2022626C2O6F645F66757279206D61696E2036223B20656E640D0A6O20656E640D0A6O202O2D206265727365726B696E670D0A6O20696620532E4265727365726B696E673A49734361737461626C652829207468656E0D0A8O206966205072652O7328532E4265727365726B696E6729207468656E2072657475726E20226265727365726B696E67206D61696E2038223B20656E640D0A6O20656E640D0A6O202O2D206C69676874735F6A7564676D656E740D0A6O20696620532E4C69676874734A7564676D656E743A49734361737461626C652829207468656E0D0A8O206966205072652O7328532E4C69676874734A7564676D656E742C206E6F74205461726765743A4973496E52616E67652834302O29207468656E2072657475726E20226C69676874735F6A7564676D656E74206D61696E203130223B20656E640D0A6O20656E640D0A6O202O2D2066697265626C2O6F640D0A6O20696620532E46697265626C2O6F643A49734361737461626C652829207468656E0D0A8O206966205072652O7328532E46697265626C2O6F6429207468656E2072657475726E202266697265626C2O6F64206D61696E203132223B20656E640D0A6O20656E640D0A6O202O2D20616E6365737472616C5F63612O6C0D0A6O20696620532E416E6365737472616C43612O6C3A49734361737461626C652829207468656E0D0A8O206966205072652O7328532E416E6365737472616C43612O6C29207468656E2072657475726E2022616E6365737472616C5F63612O6C206D61696E203134223B20656E640D0A6O20656E640D0A6O202O2D206261675F6F665F747269636B730D0A6O20696620532E4261676F66547269636B733A49734361737461626C652829207468656E0D0A8O206966205072652O7328532E4261676F66547269636B732C206E6F74205461726765743A4973496E52616E67652834302O29207468656E2072657475726E20226261675F6F665F747269636B73206D61696E203136223B20656E640D0A6O20656E640D0A6O202O2D20696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782C69663D62752O662E726563656E745F70757269666965732E76616C75653E3D6865616C74682E6D61782A302E303526287461726765742E632O6F6C646F776E2E70617573655F616374696F6E2E72656D61696E733E3D32307C74696D653C3D31307C7461726765742E632O6F6C646F776E2E70617573655F616374696F6E2E6475726174696F6E3D30290D0A6O202O2D2041504C204E6F74653A2043617374204E69757A616F207768656E207765272O6C20676574206174206C65617374203230207365636F6E6473206F6620757074696D652E205468697320697320737065636966696320746F207468652064656661756C7420656E656D792041504C20616E642077692O6C206E2O65642061646A7573746D656E747320666F72206F7468657220656E656D6965732E0D0A6O202O2D204E6F74653A205573696E6720426F2O7346696C7465726564466967687452656D61696E7320696E7374656164206F66207468652061626F76652063616C63756C6174696F6E0D0A6O20696620532E496E766F6B654E69757A616F546865426C61636B4F783A49734361737461626C65282920616E6420484C2E426F2O7346696C7465726564466967687452656D61696E7328223E222C20323529207468656E0D0A8O206966205072652O7328532E496E766F6B654E69757A616F546865426C61636B4F782C206E6F74205461726765743A4973496E52616E67652834302O29207468656E2072657475726E2022696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F78206D61696E203138223B20656E640D0A6O20656E640D0A6O202O2D20746F7563685F6F665F64656174682C69663D7461726765742E6865616C74682E7063743C3D31350D0A6O20696620532E546F7563686F6644656174683A49734361737461626C65282920616E6420285461726765743A4865616C746850657263656E746167652829203C3D20313529207468656E0D0A8O206966205072652O7328532E546F7563686F6644656174682C206E6F74205461726765743A4973496E4D656C2O6552616E676528352O29207468656E2072657475726E2022746F7563685F6F665F6465617468206D61696E203230223B20656E640D0A6O20656E640D0A6O202O2D20776561706F6E735F6F665F6F726465720D0A6O20696620532E576561706F6E734F664F726465723A49734361737461626C652829207468656E0D0A8O206966205072652O7328532E576561706F6E734F664F7264657229207468656E2072657475726E2022776561706F6E735F6F665F6F72646572206D61696E202O32223B20656E640D0A6O20656E640D0A6O202O2D20626F6E65647573745F627265772C69663D21646562752O662E626F6E65647573745F627265775F646562752O662E75700D0A6O20696620532E426F6E6564757374427265773A49734361737461626C65282920616E6420285461726765743A446562752O66446F776E28532E426F6E6564757374427265772O29207468656E0D0A8O206966205072652O73284D2E426F6E654475737442726577506C617965722C206E6F74205461726765743A4973496E4D656C2O6552616E676528382O29207468656E2072657475726E2022626F6E65647573745F62726577206D61696E203236223B20656E640D0A6O20656E640D0A4O20656E640D0A4O202O2D20707572696679696E675F627265772C69663D7374612O6765722E616D6F756E2O746F746F74616C7063743E3D302E37263O287461726765742E632O6F6C646F776E2E70617573655F616374696F6E2E72656D61696E733E3D32307C74696D653C3D31307C7461726765742E632O6F6C646F776E2E70617573655F616374696F6E2E6475726174696F6E3D302926632O6F6C646F776E2E696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782E72656D61696E733C35297C62752O662E696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782E7570290D0A4O202O2D20707572696679696E675F627265772C69663D62752O662E696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782E75702662752O662E696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782E72656D61696E733C380D0A4O202O2D20707572696679696E675F627265772C69663D632O6F6C646F776E2E707572696679696E675F627265772E636861726765735F6672616374696F6E616C3E3D312E382628632O6F6C646F776E2E696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782E72656D61696E733E31307C62752O662E696E766F6B655F6E69757A616F5F7468655F626C61636B5F6F782E7570290D0A4O202O2D2048616E646C6564207669612053686F756C6450757269667928290D0A4O206966204344734F4E2829207468656E0D0A6O202O2D20626C61636B5F6F785F627265772C69663D632O6F6C646F776E2E707572696679696E675F627265772E636861726765735F6672616374696F6E616C3C302E350D0A6O20696620532E426C61636B4F78427265773A49734361737461626C65282920616E6420532E507572696679696E67427265773A436861726765734672616374696F6E616C2829203C20302E35207468656E0D0A8O206966205072652O7328532E426C61636B4F784272657729207468656E2072657475726E2022626C61636B5F6F785F62726577206D61696E203238223B20656E640D0A6O20656E640D0A6O202O2D20626C61636B5F6F785F627265772C69663D28656E657267792B28656E657267792E726567656E2A632O6F6C646F776E2E6B65675F736D6173682E72656D61696E732O293C34302662752O662E626C61636B6F75745F636F6D626F2E646F776E26632O6F6C646F776E2E6B65675F736D6173682E75700D0A6O20696620532E426C61636B4F78427265773A49734361737461626C65282920616E642028506C617965723A456E657267792829202B2028506C617965723A456E65726779526567656E2829202A20532E4B6567536D6173683A432O6F6C646F776E52656D61696E73283O29203C20343020616E6420506C617965723A42752O66446F776E28532E426C61636B6F7574436F6D626F42752O662920616E6420532E4B6567536D6173683A432O6F6C646F776E55702829207468656E0D0A8O206966205072652O7328532E426C61636B4F784272657729207468656E2072657475726E2022626C61636B5F6F785F62726577206D61696E203330223B20656E640D0A6O20656E640D0A4O20656E640D0A4O202O2D206B65675F736D6173682C69663D7370652O6C5F746172676574733E3D320D0A4O20696620532E4B6567536D6173683A49734361737461626C65282920616E642028456E656D696573436F756E7438203E3D203229207468656E0D0A6O206966205072652O7328532E4B6567536D6173682C206E6F74205461726765743A49735370652O6C496E52616E676528532E4B6567536D6173682O29207468656E2072657475726E20226B65675F736D617368206D61696E203334223B20656E640D0A4O20656E640D0A4O202O2D2063656C65737469616C5F627265772C69663D62752O662E626C61636B6F75745F636F6D626F2E646F776E26696E636F6D696E675F64616D6167655F313O396D733E286865616C74682E6D61782A302E312B7374612O6765722E6C6173745F7469636B5F64616D6167655F34292662752O662E656C75736976655F627261776C65722E737461636B3C320D0A4O202O2D2048616E646C65642076696120446566656E736976657328290D0A4O202O2D206578706C6F64696E675F6B65670D0A4O20696620532E4578706C6F64696E674B65673A49734361737461626C652829207468656E0D0A6O206966205072652O73284D2E4578706C6F64696E674B6567506C617965722C206E6F74205461726765743A4973496E4D656C2O6552616E676528382O29207468656E2072657475726E20226578706C6F64696E675F6B6567203339223B20656E640D0A4O20656E640D0A4O202O2D2074696765725F70616C6D2C69663D74616C656E742E72757368696E675F6A6164655F77696E642E656E61626C65642662752O662E626C61636B6F75745F636F6D626F2E75702662752O662E72757368696E675F6A6164655F77696E642E75700D0A4O20696620532E546967657250616C6D3A49735265616479282920616E642028532E52757368696E674A61646557696E643A4973417661696C61626C65282920616E6420506C617965723A42752O66557028532E426C61636B6F7574436F6D626F42752O662920616E6420506C617965723A42752O66557028532E52757368696E674A61646557696E642O29207468656E0D0A6O206966205072652O7328532E546967657250616C6D2C206E6F74205461726765743A4973496E4D656C2O6552616E676528352O29207468656E2072657475726E202274696765725F70616C6D206D61696E203430223B20656E640D0A4O20656E640D0A4O202O2D206272656174685F6F665F666972652C69663D62752O662E6368612O7265645F70612O73696F6E732E646F776E2672756E65666F7267652E6368612O7265645F70612O73696F6E732E657175692O7065640D0A4O20696620532E4272656174684F66466972653A49734361737461626C65282920616E6420284368612O72656450612O73696F6E73457175692O70656420616E6420506C617965723A42752O66446F776E28532E4368612O72656450612O73696F6E732O29207468656E0D0A6O206966205072652O7328532E4272656174684F66466972652C206E6F74205461726765743A4973496E52616E67652831322O29207468656E2072657475726E20226272656174685F6F665F66697265206D61696E203432223B20656E640D0A4O20656E640D0A4O202O2D20626C61636B6F75745F6B69636B0D0A4O20696620532E426C61636B6F75744B69636B3A49734361737461626C652829207468656E0D0A6O206966205072652O7328532E426C61636B6F75744B69636B2C206E6F74205461726765743A4973496E4D656C2O6552616E676528352O29207468656E2072657475726E2022626C61636B6F75745F6B69636B206D61696E202O34223B20656E640D0A4O20656E640D0A4O202O2D20726973696E675F73756E5F6B69636B0D0A4O20696620532E526973696E6753756E4B69636B3A49734361737461626C652829207468656E0D0A6O206966205072652O7328532E526973696E6753756E4B69636B2C206E6F74205461726765743A4973496E4D656C2O6552616E676528352O29207468656E2072657475726E2022726973696E675F73756E5F6B69636B206D61696E203436223B20656E640D0A4O20656E640D0A4O202O2D6B65675F736D6173680D0A4O20696620532E4B6567536D6173683A497352656164792829207468656E0D0A6O206966205072652O7328532E4B6567536D6173682C206E6F74205461726765743A49735370652O6C496E52616E676528532E4B6567536D6173682O29207468656E2072657475726E20226B65675F736D617368206D61696E203436223B20656E640D0A4O20656E640D0A4O202O2D206368695F62757273742C69663D632O6F6C646F776E2E6661656C696E655F73746F6D702E72656D61696E733E32267370652O6C5F746172676574733E3D320D0A4O20696620532E43686942757273743A49734361737461626C65282920616E642028532E4661656C696E6553746F6D703A432O6F6C646F776E52656D61696E732829203E203220616E6420456E656D696573436F756E7438203E3D203229207468656E0D0A6O206966205072652O7328532E43686942757273742C206E6F74205461726765743A4973496E4D656C2O6552616E676528382O29207468656E2072657475726E20226368695F6275727374206D61696E203438223B20656E640D0A4O20656E640D0A4O202O2D20746F7563685F6F665F64656174680D0A4O20696620532E546F7563686F6644656174683A49734361737461626C65282920616E64204344734F4E2829207468656E0D0A6O206966205072652O7328532E546F7563686F6644656174682C206E6F74205461726765743A4973496E4D656C2O6552616E676528352O29207468656E2072657475726E2022746F7563685F6F665F6465617468206D61696E203532223B20656E640D0A4O20656E640D0A2O202O2D2072757368696E675F6A6164655F77696E642C69663D62752O662E72757368696E675F6A6164655F77696E642E646F776E0D0A4O20696620532E52757368696E674A61646557696E643A49734361737461626C65282920616E642028506C617965723A42752O66446F776E28532E52757368696E674A61646557696E642O29207468656E0D0A6O206966205072652O7328532E52757368696E674A61646557696E642C206E6F74205461726765743A4973496E4D656C2O6552616E676528382O29207468656E2072657475726E202272757368696E675F6A6164655F77696E64206D61696E203534223B20656E640D0A4O20656E640D0A4O202O2D207370692O6E696E675F6372616E655F6B69636B2C69663D62752O662E6368612O7265645F70612O73696F6E732E75700D0A4O20696620532E5370692O6E696E674372616E654B69636B3A49735265616479282920616E642028506C617965723A42752O66557028532E4368612O72656450612O73696F6E732O29207468656E0D0A6O206966205072652O7328532E5370692O6E696E674372616E654B69636B2C206E6F74205461726765743A4973496E4D656C2O6552616E676528382O29207468656E2072657475726E20227370692O6E696E675F6372616E655F6B69636B206D61696E203536223B20656E640D0A4O20656E640D0A4O202O2D206272656174685F6F665F666972652C69663D62752O662E626C61636B6F75745F636F6D626F2E646F776E262862752O662E626C2O6F646C7573742E646F776E7C2862752O662E626C2O6F646C7573742E757026646F742E6272656174685F6F665F666972655F646F742E7265667265736861626C652O290D0A4O20696620532E4272656174684F66466972653A49734361737461626C65282920616E642028506C617965723A42752O66446F776E28532E426C61636B6F7574436F6D626F42752O662920616E642028506C617965723A426C2O6F646C757374446F776E2829206F722028506C617965723A426C2O6F646C7573745570282920616E64205461726765743A42752O665265667265736861626C6528532E4272656174684F6646697265446F74446562752O664O29207468656E0D0A6O206966205072652O7328532E4272656174684F66466972652C206E6F74205461726765743A4973496E4D656C2O6552616E676528382O29207468656E2072657475726E20226272656174685F6F665F66697265206D61696E203538223B20656E640D0A4O20656E640D0A4O202O2D206368695F62757273740D0A4O20696620532E43686942757273743A49734361737461626C652829207468656E0D0A6O206966205072652O7328532E43686942757273742C206E6F74205461726765743A4973496E4D656C2O6552616E676528382O29207468656E2072657475726E20226368695F6275727374206D61696E203630223B20656E640D0A4O20656E640D0A4O202O2D206368695F776176650D0A4O20696620532E436869576176653A49734361737461626C652829207468656E0D0A6O206966205072652O7328532E436869576176652C206E6F74205461726765743A4973496E4D656C2O6552616E676528382O29207468656E2072657475726E20226368695F77617665206D61696E203632223B20656E640D0A4O20656E640D0A4O202O2D207370692O6E696E675F6372616E655F6B69636B2C69663D2172756E65666F7267652E7368616F68616F735F6D696768742E657175692O706564266163746976655F656E656D6965733E3D3326632O6F6C646F776E2E6B65675F736D6173682E72656D61696E733E6763642628656E657267792B28656E657267792E726567656E2A28632O6F6C646F776E2E6B65675F736D6173682E72656D61696E732B657865637574655F74696D653O293E3D363526282174616C656E742E73706974666972652E656E61626C65647C2172756E65666F7267652E6368612O7265645F70612O73696F6E732E657175692O706564290D0A4O20696620532E5370692O6E696E674372616E654B69636B3A49734361737461626C65282920616E6420286E6F74205368616F68616F734D69676874457175692O70656420616E6420456E656D696573436F756E7438203E3D203320616E6420532E4B6567536D6173683A432O6F6C646F776E52656D61696E732829203E20506C617965723A474344282920616E642028506C617965723A456E657267792829202B2028506C617965723A456E65726779526567656E2829202A2028532E4B6567536D6173683A432O6F6C646F776E52656D61696E732829202B20532E5370692O6E696E674372616E654B69636B3A4578656375746554696D65284O29203E3D20363520616E64202O286E6F7420532E53706974666972653A4973417661696C61626C65282O29206F72206E6F74204368612O72656450612O73696F6E73457175692O7065642O29207468656E0D0A6O206966205072652O7328532E5370692O6E696E674372616E654B69636B2C206E6F74205461726765743A4973496E4D656C2O6552616E676528382O29207468656E2072657475726E20227370692O6E696E675F6372616E655F6B69636B206D61696E203634223B20656E640D0A4O20656E640D0A4O202O2D2074696765725F70616C6D2C69663D2174616C656E742E626C61636B6F75745F636F6D626F26632O6F6C646F776E2E6B65675F736D6173682E72656D61696E733E6763642628656E657267792B28656E657267792E726567656E2A28632O6F6C646F776E2E6B65675F736D6173682E72656D61696E732B6763643O293E3D36350D0A4O20696620532E546967657250616C6D3A49734361737461626C65282920616E6420286E6F7420532E426C61636B6F7574436F6D626F3A4973417661696C61626C65282920616E6420532E4B6567536D6173683A432O6F6C646F776E52656D61696E732829203E20506C617965723A474344282920616E642028506C617965723A456E657267792829202B2028506C617965723A456E65726779526567656E2829202A2028532E4B6567536D6173683A432O6F6C646F776E52656D61696E732829202B20506C617965723A474344284O29203E3D20363529207468656E0D0A6O206966205072652O7328532E546967657250616C6D2C206E6F74205461726765743A49735370652O6C496E52616E676528532E546967657250616C6D2O29207468656E2072657475726E202274696765725F70616C6D206D61696E202O36223B20656E640D0A4O20656E640D0A4O202O2D20617263616E655F746F2O72656E742C69663D656E657267793C33310D0A4O20696620532E417263616E65546F2O72656E743A49734361737461626C65282920616E64204344734F4E282920616E642028506C617965723A456E657267792829203C20333129207468656E0D0A6O206966205072652O7328532E417263616E65546F2O72656E742C206E6F74205461726765743A4973496E4D656C2O6552616E676528382O29207468656E2072657475726E2022617263616E655F746F2O72656E74206D61696E203638223B20656E640D0A4O20656E640D0A4O202O2D2072757368696E675F6A6164655F77696E640D0A4O20696620532E52757368696E674A61646557696E643A49734361737461626C652829207468656E0D0A6O206966205072652O7328532E52757368696E674A61646557696E642C206E6F74205461726765743A4973496E4D656C2O6552616E676528382O29207468656E2072657475726E202272757368696E675F6A6164655F77696E64206D61696E203732223B20656E640D0A4O20656E640D0A4O202O2D204D616E75612O6C7920612O64656420502O6F6C2066692O6C65720D0A4O206966205072652O7328532E502O6F6C456E6572677929207468656E2072657475726E2022502O6F6C20456E65726779223B20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204175746F42696E6428290D0A2O202O2D205370652O6C2042696E64730D0A2O2042696E6428532E417263616E65546F2O72656E74290D0A2O2042696E6428532E4261676F66547269636B73290D0A2O2042696E6428532E4272656174684F6646697265290D0A2O2042696E6428532E426C61636B4F7842726577290D0A2O2042696E6428532E426C2O6F6446757279290D0A2O2042696E6428532E426C61636B6F75744B69636B290D0A2O2042696E6428532E43656C65737469616C42726577290D0A2O2042696E6428532E4368694275727374290D0A2O2042696E6428532E43686957617665290D0A2O2042696E6428532E44616D70656E4861726D290D0A2O2042696E6428532E457870656C4861726D290D0A2O2042696E6428532E466F7274696679696E6742726577290D0A2O2042696E6428532E496E766F6B654E69757A616F546865426C61636B4F78290D0A2O2042696E6428532E4C656753772O6570290D0A2O2042696E6428532E4B6567536D617368290D0A2O2042696E6428532E526973696E6753756E4B69636B290D0A2O2042696E6428532E52757368696E674A61646557696E64290D0A2O2042696E6428532E507572696679696E6742726577290D0A2O2042696E6428532E546967657250616C6D290D0A2O2042696E6428532E537065617248616E64537472696B65290D0A2O2042696E6428532E5370692O6E696E674372616E654B69636B290D0A2O2042696E6428532E546F7563686F664465617468290D0A2O2042696E6428532E576561706F6E734F664F72646572290D0A2O202O2D2042696E64204974656D730D0A2O2042696E64284D2E5472696E6B657431290D0A2O2042696E64284D2E5472696E6B657432290D0A2O2042696E64284D2E4865616C746873746F6E65290D0A2O2042696E64284D2E416C67657468617250752O7A6C65426F78290D0A2O202O2D204D6163726F730D0A2O2042696E64284D2E426F6E654475737442726577506C61796572290D0A2O2042696E64284D2E4465746F784D6F7573656F766572290D0A2O2042696E64284D2E4578706C6F64696E674B6567506C61796572290D0A2O2042696E64284D2E52696E674F665065616365437572736F72290D0A2O2042696E64284D2E537065617248616E64537472696B654D6F7573656F766572290D0A2O2042696E64284D2E53752O6D6F6E57686974655469676572537461747565506C61796572290D0A2O2042696E64284D2E546967657250616C6D4D6F7573656F766572290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20496E697428290D0A2O2057522E5072696E742822427265776D6173746572204D6F6E6B20726F746174696F6E20627920576F726C64792E22290D0A2O204175746F42696E6428290D0A656E640D0A0D0A57522E53657441504C283236382C2041504C2C20496E6974290D0A00063O0012033O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);