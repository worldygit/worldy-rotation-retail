local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then do return;end elseif (v86==1) then local v118=v85[2];v83[v118]=v83[v118](v83[v118 + 1 ]);else local v120=v85[2];v78=(v120 + v84) -1 ;for v130=v120,v78 do local v131=v79[v130-v120 ];v83[v130]=v131;end end elseif (v86<=3) then v83[v85[2]]=v85[3];elseif (v86==4) then v83[v85[2]]=v85[3];else local v123=v85[2];v83[v123](v13(v83,v123 + 1 ,v78));end elseif (v86<=8) then if (v86<=6) then v83[v85[2]]=v59[v85[3]];elseif (v86>7) then local v124=v85[2];v83[v124]=v83[v124](v83[v124 + 1 ]);else local v126=v85[2];v78=(v126 + v84) -1 ;for v133=v126,v78 do local v134=v79[v133-v126 ];v83[v133]=v134;end end elseif (v86<=9) then v83[v85[2]]=v59[v85[3]];elseif (v86>10) then do return;end else local v127=v85[2];v83[v127](v13(v83,v127 + 1 ,v78));end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67039E442O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A2O2D206170692066756E6374696F6E730D0A6C6F63616C20412O6441706C203D206170692E412O6441706C0D0A6C6F63616C205072696E744465627567203D206170692E5072696E7444656275670D0A6C6F63616C2047657453652O74696E6773203D206170692E47657453652O74696E67730D0A6C6F63616C20416F454F6E203D206170692E416F454F6E0D0A6C6F63616C204344734F6E203D206170692E4344734F6E0D0A6C6F63616C2044697370656C42752O66734F6E203D206170692E44697370656C42752O66734F6E0D0A6C6F63616C2048616E646C65412O666C69637465644F6E203D206170692E48616E646C65412O666C69637465644F6E0D0A6C6F63616C204F70656E65724F6E203D206170692E4F70656E65724F6E0D0A6C6F63616C2052616369616C734F6E203D206170692E52616369616C734F6E0D0A6C6F63616C205472696E6B6574734F6E203D206170692E5472696E6B6574734F6E0D0A6C6F63616C2042696E64203D206170692E42696E640D0A6C6F63616C2043617374203D206170692E436173740D0A6C6F63616C20436173744379636C65203D206170692E436173744379636C650D0A6C6F63616C20436173745461726765744966203D206170692E4361737454617267657449660D0A0D0A2O2D2061706920636C612O7365730D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C20746172676574203D20756E69742E7461726765740D0A6C6F63616C206D6F7573656F766572203D20756E69742E6D6F7573656F7665720D0A0D0A2O2D207574696C730D0A6C6F63616C206E756D203D207574696C732E6E756D0D0A0D0A2O2D20646566696E65730D0A6C6F63616C2073203D207370652O6C2E65766F6B65722E6175676D656E746174696F6E0D0A6C6F63616C2069203D206974656D2E65766F6B65722E6175676D656E746174696F6E0D0A6C6F63616C206D203D206D6163726F2E65766F6B65722E6175676D656E746174696F6E0D0A0D0A6C6F63616C20737065634964203D20313437330D0A6C6F63616C2061706C4E616D65203D202264656661756C74220D0A6C6F63616C2064656661756C7453652O74696E6773203D207B0D0A2O20656E61626C6564203D207B0D0A4O20626C652O73696E674F6654686542726F6E7A65203D20747275652C0D0A2O207D2C0D0A2O206870203D207B0D0A2O207D2C0D0A7D0D0A6C6F63616C2073652O74696E67730D0A0D0A2O2D20766172730D0A6C6F63616C206F6E5573654578636C75646573203D207B7D0D0A6C6F63616C2073686F756C6452657475726E0D0A6C6F63616C206D6178456D706F776572203D20732E666F6E746F664D616769633A4973417661696C61626C65282920616E642034206F7220330D0A6C6F63616C20666F4D456D706F7765724D6F64203D20732E666F6E746F664D616769633A4973417661696C61626C65282920616E6420302E38206F7220310D0A6C6F63616C20626F2O73466967687452656D61696E73203D205O310D0A6C6F63616C20666967687452656D61696E73203D205O310D0A0D0A6C6F63616C2066756E6374696F6E20536F4D436865636B28290D0A2O206C6F63616C2067726F75700D0A2O20696620706C617965723A4973496E526169642829207468656E0D0A4O2067726F7570203D20756E69742E726169640D0A2O20656C7365696620706C617965723A4973496E50617274792829207468656E0D0A4O2067726F7570203D20756E69742E70617274790D0A2O20656C73650D0A4O2072657475726E2066616C73650D0A2O20656E640D0A0D0A2O206C6F63616C20736F4D5461726765740D0A2O20666F72205F2C206368617220696E2070616972732867726F75702920646F0D0A4O20696620636861723A457869737473282920616E6420636861723A42752O66557028732E736F757263656F664D6167696342752O6629207468656E0D0A6O20736F4D546172676574203D20636861720D0A4O20656E640D0A2O20656E640D0A0D0A2O20696620736F4D546172676574202O3D206E696C207468656E0D0A4O2072657475726E20747275650D0A2O20656E640D0A2O2072657475726E2066616C73650D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20426C6973746572696E675363616C6573436865636B28290D0A2O206C6F63616C2067726F75700D0A2O20696620706C617965723A4973496E526169642829207468656E0D0A4O2067726F7570203D20756E69742E726169640D0A2O20656C7365696620706C617965723A4973496E50617274792829207468656E0D0A4O2067726F7570203D20756E69742E70617274790D0A2O20656C73650D0A4O2067726F7570203D20706C617965720D0A2O20656E640D0A0D0A2O2069662067726F7570202O3D20706C61796572207468656E0D0A4O2072657475726E20706C617965723A42752O66537461636B28732E626C6973746572696E675363616C657342752O66290D0A2O20656C73650D0A4O20666F7220756E697449442C206368617220696E2070616972732867726F75702920646F0D0A6O20696620636861723A457869737473282920616E642028636861723A497354616E6B696E67416F45283829206F7220636861723A497354616E6B696E67287461726765742O2920616E64206170692E556E6974526F6C6528756E6974494429202O3D202254414E4B22207468656E0D0A8O2072657475726E20636861723A42752O66537461636B28732E626C6973746572696E675363616C657342752O66290D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A0D0A2O2072657475726E20300D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20507265636F6D62617428290D0A2O202O2D2047726F75702062752O6620636865636B0D0A2O20696620732E626C652O73696E676F6674686542726F6E7A653A49734361737461626C65282920616E642073652O74696E67732E656E61626C65642E626C652O73696E674F6654686542726F6E7A6520616E64206170692E497347726F757042752O664D692O73696E6728732E626C652O73696E676F6674686542726F6E7A6542752O6629207468656E0D0A4O206966204361737428732E626C652O73696E676F6674686542726F6E7A6529207468656E0D0A6O2072657475726E2022626C652O73696E675F6F665F7468655F62726F6E7A6520707265636F6D626174220D0A4O20656E640D0A2O20656E640D0A2O202O2D20736F757263655F6F665F6D616769632C69663D67726F7570266163746976655F646F742E736F757263655F6F665F6D616769633D300D0A2O20696620732E736F757263656F664D616769633A49734361737461626C65282920616E6420536F4D436865636B2829207468656E0D0A4O206966204361737428732E736F757263656F664D6167696329207468656E0D0A6O2072657475726E2022736F757263655F6F665F6D6167696320707265636F6D626174220D0A4O20656E640D0A2O20656E640D0A2O202O2D20626C61636B5F612O74756E656D656E742C69663D62752O662E626C61636B5F612O74756E656D656E742E646F776E0D0A2O20696620732E626C61636B412O74756E656D656E743A49734361737461626C65282920616E6420706C617965723A42752O66446F776E28732E626C61636B412O74756E656D656E7442752O6629207468656E0D0A4O206966204361737428732E626C61636B412O74756E656D656E7429207468656E0D0A6O2072657475726E2022626C61636B5F612O74756E656D656E7420707265636F6D626174220D0A4O20656E640D0A2O20656E640D0A2O202O2D2062726F6E7A655F612O74756E656D656E742C69663D62752O662E62726F6E7A655F612O74756E656D656E742E646F776E2662752O662E626C61636B5F612O74756E656D656E742E7570262162752O662E626C61636B5F612O74756E656D656E742E6D696E650D0A2O20696620732E62726F6E7A65412O74756E656D656E743A49734361737461626C65282920616E642028706C617965723A42752O66446F776E28732E62726F6E7A65412O74756E656D656E7442752O662920616E6420706C617965723A42752O66557028732E626C61636B412O74756E656D656E7442752O662920616E64206E6F7420706C617965723A42752O66557028732E626C61636B412O74756E656D656E7442752O662C2066616C73652O29207468656E0D0A4O206966204361737428732E62726F6E7A65412O74756E656D656E7429207468656E0D0A6O2072657475726E202262726F6E7A655F612O74756E656D656E7420707265636F6D626174220D0A4O20656E640D0A2O20656E640D0A2O202O2D20626C6973746572696E675F7363616C65732C69663D62752O662E626C6973746572696E675F7363616C65732E737461636B3C3130266163746976655F646F742E626C6973746572696E675F7363616C65733D300D0A2O20696620732E626C6973746572696E675363616C65733A49734361737461626C65282920616E642028426C6973746572696E675363616C6573436865636B2829203C20313029207468656E0D0A4O206966204361737428732E626C6973746572696E675363616C657329207468656E0D0A6O2072657475726E2022626C6973746572696E675F7363616C657320707265636F6D6261742032220D0A4O20656E640D0A2O20656E640D0A2O202O2D20707265736369656E63650D0A2O20696620732E707265736369656E63653A49734361737461626C652829207468656E0D0A4O206966204361737428732E707265736369656E636529207468656E0D0A6O2072657475726E2022707265736369656E636520707265636F6D6261742034220D0A4O20656E640D0A2O20656E640D0A2O202O2D207469705F7468655F7363616C65730D0A2O206966204344734F6E282920616E6420732E7469705468655363616C65733A49734361737461626C652829207468656E0D0A4O206966204361737428732E7469705468655363616C657329207468656E0D0A6O2072657475726E20227469705F7468655F7363616C657320707265636F6D6261742036220D0A4O20656E640D0A2O20656E640D0A2O202O2D2065626F6E5F6D696768740D0A2O20696620732E65626F6E4D696768743A497352656164792829207468656E0D0A4O206966204361737428732E65626F6E4D6967687429207468656E0D0A6O2072657475726E202265626F6E5F6D6967687420707265636F6D6261742038220D0A4O20656E640D0A2O20656E640D0A2O202O2D206C6976696E675F666C616D650D0A2O20696620732E6C6976696E67466C616D653A49734361737461626C652829207468656E0D0A4O206966204361737428732E6C6976696E67466C616D652C206E6F74207461726765743A49735370652O6C496E52616E676528732E6C6976696E67466C616D65292C207472756529207468656E0D0A6O2072657475726E20226C6976696E675F666C616D6520707265636F6D626174203130220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A2O2D2041504C204D61696E0D0A6C6F63616C2066756E6374696F6E2041504C28290D0A2O20656E656D696573323579203D20706C617965723A476574456E656D696573496E52616E6765283235290D0A2O20656E656D696573387953706C617368203D207461726765743A476574456E656D696573496E53706C61736852616E67652838290D0A2O20696620416F454F6E2829207468656E0D0A4O20656E656D696573387953706C617368436F756E74203D207461726765743A476574456E656D696573496E53706C61736852616E6765436F756E742838290D0A2O20656C73650D0A4O20656E656D696573387953706C617368436F756E74203D20310D0A2O20656E640D0A0D0A2O206966206170692E556E6974497356616C69642874617267657429206F7220706C617965723A412O66656374696E67436F6D6261742829207468656E0D0A4O202O2D2043616C63756C6174652066696768745F72656D61696E730D0A4O20626F2O73466967687452656D61696E73203D206170692E426F2O73466967687452656D61696E7328290D0A4O20666967687452656D61696E73203D20626F2O73466967687452656D61696E730D0A4O20696620666967687452656D61696E73202O3D205O31207468656E0D0A6O20666967687452656D61696E73203D206170692E466967687452656D61696E7328656E656D6965733235792C2066616C7365290D0A4O20656E640D0A2O20656E640D0A0D0A2O206966206E6F7420706C617965723A412O66656374696E67436F6D6261742829207468656E0D0A4O202O2D207265766976650D0A4O206966206D6F7573656F76657220616E64206D6F7573656F7665723A457869737473282920616E64206D6F7573656F7665723A497341506C61796572282920616E64206D6F7573656F7665723A4973446561644F7247686F7374282920616E6420286E6F7420706C617965723A43616E412O7461636B286D6F7573656F7665722O29207468656E0D0A6O2069662043617374286D2E72657475726E4D6F7573656F7665722C206E6F74206D6F7573656F7665723A4973496E52616E6765283330292C207472756529207468656E0D0A8O2072657475726E202272657475726E220D0A6O20656E640D0A4O20656E640D0A4O202O2D204D616E75612O6C7920612O6465643A2047726F75702062752O6620636865636B0D0A4O2069662073652O74696E67732E656E61626C65642E626C652O73696E674F6654686542726F6E7A6520616E6420732E626C652O73696E676F6674686542726F6E7A653A49734361737461626C65282920616E64206170692E497347726F757042752O664D692O73696E6728732E626C652O73696E676F6674686542726F6E7A6542752O6629207468656E0D0A6O206966204361737428732E626C652O73696E676F6674686542726F6E7A6529207468656E0D0A8O2072657475726E2022626C652O73696E675F6F665F7468655F62726F6E7A6520707265636F6D626174220D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A0D0A2O206966206170692E556E6974497356616C69642874617267657429207468656E0D0A4O202O2D20507265636F6D6261740D0A4O206966206E6F7420706C617965723A412O66656374696E67436F6D626174282920616E64206E6F7420706C617965723A497343617374696E672829207468656E0D0A6O206C6F63616C2053686F756C6452657475726E203D20507265636F6D62617428290D0A6O2069662053686F756C6452657475726E207468656E0D0A8O2072657475726E2053686F756C6452657475726E0D0A6O20656E640D0A4O20656E640D0A4O202O2D20696E74652O72757074730D0A4O2073686F756C6452657475726E203D206170692E496E74652O727570742832352C20732E7175652O6C2C2053652O74696E67732E436F2O6D6F6E732E4F2O6647434461734F2O664743442E5175652O6C2C205374756E496E74652O7275707473290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A4O202O2D20756E726176656C0D0A4O20696620732E756E726176656C3A497352656164792829207468656E0D0A6O206966204361737428732E756E726176656C2C206E6F74207461726765743A49735370652O6C496E52616E676528732E756E726176656C2O29207468656E0D0A8O2072657475726E2022756E726176656C206D61696E2032220D0A6O20656E640D0A4O20656E640D0A4O202O2D20636175746572697A696E675F666C616D650D0A4O202O2D204E6F74653A20542O6F20736974756174696F6E616C2E204E6F742073752O67657374696E672043462E0D0A4O202O2D206C6976696E675F666C616D652C69663D74696D653C636173745F74696D652A320D0A4O20696620732E6C6976696E67466C616D653A49735265616479282920616E642028484C2E436F6D62617454696D652829203C20732E6C6976696E67466C616D653A4361737454696D652829202A2053652O74696E67732E4175676D656E746174696F6E2E4C656164696E674C467329207468656E0D0A6O206966204361737428732E6C6976696E67466C616D652C206E696C2C206E696C2C206E6F74207461726765743A49735370652O6C496E52616E676528732E6C6976696E67466C616D652O29207468656E0D0A8O2072657475726E20226C6976696E675F666C616D65206D61696E2034220D0A6O20656E640D0A4O20656E640D0A4O202O2D20686F7665722C69663D6D6F76696E672662752O662E686F7665722E646F776E2662752O662E6272656174685F6F665F656F6E732E646F776E0D0A4O202O2D204E6F74653A204E6F742068616E646C696E6720686F7665722E204A757374206B2O6570696E67207468652041504C206C696E6520666F7220636F6D706C6574656E652O732E0D0A4O202O2D20707265736369656E63650D0A4O20696620732E707265736369656E63653A49734361737461626C652829207468656E0D0A6O206966204361737428732E707265736369656E63652C206E696C2C2053652O74696E67732E4175676D656E746174696F6E2E446973706C61795374796C652E41756742752O667329207468656E0D0A8O2072657475726E2022707265736369656E6365206D61696E2036220D0A6O20656E640D0A4O20656E640D0A4O202O2D2065626F6E5F6D696768742C69663D7265667265736861626C650D0A4O20696620732E65626F6E4D696768743A49735265616479282920616E6420706C617965723A42752O665265667265736861626C6528732E65626F6E4D6967687453656C6642752O662C203429207468656E0D0A6O206966204361737428732E65626F6E4D696768742C2053652O74696E67732E4175676D656E746174696F6E2E47434461734F2O664743442E45626F6E4D6967687429207468656E0D0A8O2072657475726E202265626F6E5F6D69676874206D61696E2038220D0A6O20656E640D0A4O20656E640D0A4O202O2D207469705F7468655F7363616C65732C69663D632O6F6C646F776E2E666972655F6272656174682E72656D61696E733C6763640D0A4O206966204344734F6E282920616E6420732E7469705468655363616C65733A49734361737461626C65282920616E642028732E666972654272656174683A432O6F6C646F776E52656D61696E732829203C20706C617965723A474344282O29207468656E0D0A6O206966204361737428732E7469705468655363616C65732C2053652O74696E67732E436F2O6D6F6E732E47434461734F2O664743442E5469705468655363616C657329207468656E0D0A8O2072657475726E20227469705F7468655F7363616C6573206D61696E203130220D0A6O20656E640D0A4O20656E640D0A4O202O2D20666972655F6272656174682C656D706F7765725F746F3D312C69663D2174616C656E742E6C656170696E675F666C616D65732674616C656E742E74696D655F736B6970262174616C656E742E696E746572776F76656E5F7468726561647326632O6F6C646F776E2E74696D655F736B69702E72656D61696E733C3D636173745F74696D652662752O662E65626F6E5F6D696768742E72656D61696E733E636173745F74696D650D0A4O20696620732E666972654272656174683A49734361737461626C65282920616E6420286E6F7420732E6C656170696E67466C616D65733A4973417661696C61626C65282920616E6420732E74696D65536B69703A4973417661696C61626C65282920616E64206E6F7420732E696E746572776F76656E546872656164733A4973417661696C61626C65282920616E6420732E74696D65536B69703A432O6F6C646F776E52656D61696E732829203C3D20706C617965723A456D706F7765724361737454696D6528312920616E6420706C617965723A42752O6652656D61696E7328732E65626F6E4D6967687453656C6642752O6629203E20706C617965723A456D706F7765724361737454696D6528312O29207468656E0D0A6O2069662043617374412O6E6F746174656428732E666972654272656174682C2066616C73652C202231222C206E6F74207461726765743A4973496E52616E6765283235292C2053652O74696E67732E436F2O6D6F6E732E456D706F7765726564466F6E7453697A6529207468656E0D0A8O2072657475726E2022666972655F62726561746820656D706F7765722031206D61696E203132220D0A6O20656E640D0A4O20656E640D0A4O202O2D20666972655F6272656174682C656D706F7765725F746F3D6D61782C69663D74616C656E742E6C656170696E675F666C616D65732674616C656E742E74696D655F736B6970262174616C656E742E696E746572776F76656E5F7468726561647326632O6F6C646F776E2E74696D655F736B69702E72656D61696E733C3D636173745F74696D652662752O662E65626F6E5F6D696768742E72656D61696E733E636173745F74696D650D0A4O20696620732E666972654272656174683A49734361737461626C65282920616E642028732E6C656170696E67466C616D65733A4973417661696C61626C65282920616E6420732E74696D65536B69703A4973417661696C61626C65282920616E64206E6F7420732E696E746572776F76656E546872656164733A4973417661696C61626C65282920616E6420732E74696D65536B69703A432O6F6C646F776E52656D61696E732829203C3D20706C617965723A456D706F7765724361737454696D65286D6178456D706F7765722920616E6420706C617965723A42752O6652656D61696E7328732E65626F6E4D6967687453656C6642752O6629203E20706C617965723A456D706F7765724361737454696D65286D6178456D706F7765722O29207468656E0D0A6O2069662043617374412O6E6F746174656428732E666972654272656174682C2066616C73652C206D6178456D706F7765722C206E6F74207461726765743A4973496E52616E6765283235292C2053652O74696E67732E436F2O6D6F6E732E456D706F7765726564466F6E7453697A6529207468656E0D0A8O2072657475726E2022666972655F62726561746820656D706F7765722022202O2E206D6178456D706F776572202O2E2022206D61696E203134220D0A6O20656E640D0A4O20656E640D0A4O202O2D20757068656176616C2C656D706F7765725F746F3D312C69663D74616C656E742E74696D655F736B6970262174616C656E742E696E746572776F76656E5F7468726561647326632O6F6C646F776E2E74696D655F736B69702E72656D61696E733C3D636173745F74696D652662752O662E65626F6E5F6D696768742E72656D61696E733E636173745F74696D650D0A4O20696620732E757068656176616C3A49734361737461626C65282920616E642028732E74696D65536B69703A4973417661696C61626C65282920616E64206E6F7420732E696E746572776F76656E546872656164733A4973417661696C61626C65282920616E6420732E74696D65536B69703A432O6F6C646F776E52656D61696E732829203C3D20706C617965723A456D706F7765724361737454696D6528312920616E6420706C617965723A42752O6652656D61696E7328732E65626F6E4D6967687453656C6642752O6629203E20706C617965723A456D706F7765724361737454696D6528312O29207468656E0D0A6O2069662043617374412O6E6F746174656428732E757068656176616C2C2066616C73652C202231222C206E6F74207461726765743A4973496E52616E6765283235292C2053652O74696E67732E436F2O6D6F6E732E456D706F7765726564466F6E7453697A6529207468656E0D0A8O2072657475726E2022757068656176616C20656D6F707765722031206D61696E203136220D0A6O20656E640D0A4O20656E640D0A4O202O2D206272656174685F6F665F656F6E732C69663D62752O662E65626F6E5F6D696768742E75707C632O6F6C646F776E2E65626F6E5F6D696768742E72656D61696E733C340D0A4O206966204344734F6E282920616E6420732E6272656174686F66456F6E733A49734361737461626C65282920616E642028706C617965723A42752O66557028732E65626F6E4D6967687453656C6642752O6629206F7220732E65626F6E4D696768743A432O6F6C646F776E52656D61696E732829203C203429207468656E0D0A6O206966204361737428732E6272656174686F66456F6E732C2053652O74696E67732E4175676D656E746174696F6E2E47434461734F2O664743442E4272656174684F66456F6E732C206E696C2C206E6F74207461726765743A4973496E52616E67652835302O29207468656E0D0A8O2072657475726E20226272656174685F6F665F656F6E73206D61696E203138220D0A6O20656E640D0A4O20656E640D0A4O202O2D207573655F6974656D732C69663D6163746976655F646F742E74656D706F72616C5F776F756E643E307C632O6F6C646F776E2E6272656174685F6F665F656F6E732E72656D61696E733E33307C626F2O732666696768745F72656D61696E733C33300D0A4O206966202853652O74696E67732E436F2O6D6F6E732E456E61626C65642E5472696E6B657473206F722053652O74696E67732E436F2O6D6F6E732E456E61626C65642E4974656D732920616E642028732E74656D706F72616C576F756E64446562752O663A41757261416374697665436F756E742829203E2030206F7220732E6272656174686F66456F6E733A432O6F6C646F776E52656D61696E732829203E203330206F7220666967687452656D61696E73203C20333029207468656E0D0A6O206C6F63616C204974656D546F5573652C204974656D536C6F742C204974656D52616E6765203D20706C617965723A47657455736561626C654974656D73284F6E5573654578636C75646573290D0A6O206966204974656D546F557365207468656E0D0A8O206C6F63616C20446973706C61795374796C65203D2053652O74696E67732E436F2O6D6F6E732E446973706C61795374796C652E5472696E6B6574730D0A8O206966204974656D536C6F74207E3D20313320616E64204974656D536C6F74207E3D203134207468656E0D0A9O2020446973706C61795374796C65203D2053652O74696E67732E436F2O6D6F6E732E446973706C61795374796C652E4974656D730D0A8O20656E640D0A8O206966202O284974656D536C6F74202O3D203133206F72204974656D536C6F74202O3D2031342920616E642053652O74696E67732E436F2O6D6F6E732E456E61626C65642E5472696E6B65747329206F7220284974656D536C6F74207E3D20313320616E64204974656D536C6F74207E3D20313420616E642053652O74696E67732E436F2O6D6F6E732E456E61626C65642E4974656D7329207468656E0D0A9O202069662043617374284974656D546F5573652C206E696C2C20446973706C61795374796C652C206E6F74207461726765743A4973496E52616E6765284974656D52616E67652O29207468656E0D0A9O203O2072657475726E202247656E65726963207573655F6974656D7320666F722022202O2E204974656D546F5573653A4E616D6528290D0A9O2020656E640D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A4O202O2D20706F74696F6E2C69663D6163746976655F646F742E74656D706F72616C5F776F756E643E307C632O6F6C646F776E2E6272656174685F6F665F656F6E732E72656D61696E733E33307C626F2O732666696768745F72656D61696E733C33300D0A4O2069662053652O74696E67732E436F2O6D6F6E732E456E61626C65642E506F74696F6E7320616E642028732E74656D706F72616C576F756E64446562752O663A41757261416374697665436F756E742829203E2030206F7220732E6272656174686F66456F6E733A432O6F6C646F776E52656D61696E732829203E203330206F7220666967687452656D61696E73203C20333029207468656E0D0A6O206C6F63616C20506F74696F6E53656C6563746564203D2045766572796F6E652E506F74696F6E53656C656374656428290D0A6O20696620506F74696F6E53656C656374656420616E6420506F74696F6E53656C65637465643A497352656164792829207468656E0D0A8O206966204361737428506F74696F6E53656C65637465642C206E696C2C2053652O74696E67732E436F2O6D6F6E732E446973706C61795374796C652E506F74696F6E7329207468656E0D0A9O202072657475726E2022706F74696F6E206D61696E203230220D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A4O202O2D206C6976696E675F666C616D652C69663D62752O662E6C656170696E675F666C616D65732E7570266163746976655F646F742E666972655F6272656174683E300D0A4O20696620732E6C6976696E67466C616D653A49735265616479282920616E642028706C617965723A42752O66557028732E6C656170696E67466C616D657342752O662920616E6420732E66697265427265617468446562752O663A41757261416374697665436F756E742829203E203029207468656E0D0A6O206966204361737428732E6C6976696E67466C616D652C206E696C2C206E696C2C206E6F74207461726765743A49735370652O6C496E52616E676528732E6C6976696E67466C616D652O29207468656E0D0A8O2072657475726E20226C6976696E675F666C616D65206D61696E202O32220D0A6O20656E640D0A4O20656E640D0A4O202O2D2074696D655F736B69702C69663D632O6F6C646F776E2E666972655F6272656174682E747275655F72656D61696E732B632O6F6C646F776E2E757068656176616C2E747275655F72656D61696E732B632O6F6C646F776E2E707265736369656E63652E747275655F72656D61696E733E33350D0A4O206966204344734F6E282920616E6420732E74696D65536B69703A49734361737461626C65282920616E642028732E666972654272656174683A432O6F6C646F776E52656D61696E732829202B20732E757068656176616C3A432O6F6C646F776E52656D61696E732829202B20732E707265736369656E63653A432O6F6C646F776E52656D61696E732829203E20333529207468656E0D0A6O206966204361737428732E74696D65536B69702C2053652O74696E67732E4175676D656E746174696F6E2E47434461734F2O664743442E54696D65536B697029207468656E0D0A8O2072657475726E202274696D655F736B6970206D61696E203234220D0A6O20656E640D0A4O20656E640D0A4O202O2D20666972655F6272656174682C656D706F7765725F746F3D312C69663D2174616C656E742E616E6369656E745F666C616D65262862752O662E65626F6E5F6D696768742E72656D61696E733E636173745F74696D657C656D706F776572696E672E666972655F627265617468290D0A4O20696620732E666972654272656174683A49734361737461626C65282920616E6420286E6F7420732E616E6369656E74466C616D653A4973417661696C61626C65282920616E642028706C617965723A42752O6652656D61696E7328732E65626F6E4D6967687453656C6642752O6629203E20706C617965723A456D706F7765724361737454696D6528313O29207468656E0D0A6O2069662043617374412O6E6F746174656428732E666972654272656174682C2066616C73652C202231222C206E6F74207461726765743A4973496E52616E6765283235292C2053652O74696E67732E436F2O6D6F6E732E456D706F7765726564466F6E7453697A6529207468656E0D0A8O2072657475726E2022666972655F62726561746820656D706F7765722031206D61696E203236220D0A6O20656E640D0A4O20656E640D0A4O202O2D20666972655F6272656174682C656D706F7765725F746F3D6D61782C69663D74616C656E742E616E6369656E745F666C616D65262862752O662E65626F6E5F6D696768742E72656D61696E733E636173745F74696D657C656D706F776572696E672E666972655F627265617468290D0A4O20696620732E666972654272656174683A49734361737461626C65282920616E642028732E616E6369656E74466C616D653A4973417661696C61626C65282920616E642028706C617965723A42752O6652656D61696E7328732E65626F6E4D6967687453656C6642752O6629203E20706C617965723A456D706F7765724361737454696D65286D6178456D706F7765723O29207468656E0D0A6O2069662043617374412O6E6F746174656428732E666972654272656174682C2066616C73652C206D6178456D706F7765722C206E6F74207461726765743A4973496E52616E6765283235292C2053652O74696E67732E436F2O6D6F6E732E456D706F7765726564466F6E7453697A6529207468656E0D0A8O2072657475726E2022666972655F62726561746820656D706F7765722022202O2E206D6178456D706F776572202O2E2022206D61696E203238220D0A6O20656E640D0A4O20656E640D0A4O202O2D20757068656176616C2C656D706F7765725F746F3D312C69663D6163746976655F656E656D6965733C322628656D706F776572696E672E757068656176616C7C62752O662E65626F6E5F6D696768742E72656D61696E733E636173745F74696D65290D0A4O202O2D20757068656176616C2C656D706F7765725F746F3D322C69663D6163746976655F656E656D6965733C342628656D706F776572696E672E757068656176616C7C62752O662E65626F6E5F6D696768742E72656D61696E733E636173745F74696D65290D0A4O202O2D20757068656176616C2C656D706F7765725F746F3D332C69663D6163746976655F656E656D6965733C362628656D706F776572696E672E757068656176616C7C62752O662E65626F6E5F6D696768742E72656D61696E733E636173745F74696D65290D0A4O202O2D20757068656176616C2C656D706F7765725F746F3D6D61782C69663D6163746976655F656E656D6965733E352628656D706F776572696E672E757068656176616C7C62752O662E65626F6E5F6D696768742E72656D61696E733E636173745F74696D65290D0A4O20696620732E757068656176616C3A49734361737461626C65282920616E642028706C617965723A42752O6652656D61696E7328732E65626F6E4D6967687453656C6642752O6629203E20706C617965723A456D706F7765724361737454696D6528312O29207468656E0D0A6O206C6F63616C20757068656176616C456D706F776572203D20310D0A6O20696620656E656D696573387953706C617368436F756E74203E203120616E6420656E656D696573387953706C617368436F756E74203C203420616E6420706C617965723A42752O6652656D61696E7328732E65626F6E4D6967687453656C6642752O6629203E20706C617965723A456D706F7765724361737454696D65283229207468656E0D0A8O20757068656176616C456D706F776572203D20320D0A6O20656C7365696620656E656D696573387953706C617368436F756E74203E203320616E6420656E656D696573387953706C617368436F756E74203C203620616E6420706C617965723A42752O6652656D61696E7328732E65626F6E4D6967687453656C6642752O6629203E20706C617965723A456D706F7765724361737454696D65283329207468656E0D0A8O20757068656176616C456D706F776572203D20330D0A6O20656C7365696620656E656D696573387953706C617368436F756E74203E203520616E6420706C617965723A42752O6652656D61696E7328732E65626F6E4D6967687453656C6642752O6629203E20706C617965723A456D706F7765724361737454696D65286D6178456D706F77657229207468656E0D0A8O20757068656176616C456D706F776572203D206D6178456D706F7765720D0A6O20656E640D0A6O206966204361737428732E757068656176616C2C2066616C73652C20757068656176616C456D706F7765722C206E6F74207461726765743A4973496E52616E6765283235292C2053652O74696E67732E436F2O6D6F6E732E456D706F7765726564466F6E7453697A6529207468656E0D0A8O2072657475726E2022757068656176616C20656D706F7765722022202O2E20757068656176616C456D706F776572202O2E2022206D61696E203330220D0A6O20656E640D0A4O20656E640D0A4O202O2D20642O65705F6272656174682C69663D2174616C656E742E6272656174685F6F665F656F6E730D0A4O20696620732E642O65704272656174683A49734361737461626C65282920616E6420286E6F7420732E6272656174686F66456F6E733A4973417661696C61626C65282O29207468656E0D0A6O206966204361737428732E642O65704272656174682C2053652O74696E67732E4175676D656E746174696F6E2E47434461734F2O664743442E4272656174684F66456F6E732C206E696C2C206E6F74207461726765743A4973496E52616E67652835302O29207468656E0D0A8O2072657475726E2022642O65705F627265617468206D61696E203332220D0A6O20656E640D0A4O20656E640D0A4O202O2D20626C6973746572696E675F7363616C65732C69663D62752O662E626C6973746572696E675F7363616C65732E646F776E266163746976655F646F742E626C6973746572696E675F7363616C65733D300D0A4O20696620732E626C6973746572696E675363616C65733A49734361737461626C65282920616E642028426C6973746572696E675363616C6573436865636B2829202O3D203029207468656E0D0A6O206966204361737428732E626C6973746572696E675363616C65732C206E696C2C2053652O74696E67732E4175676D656E746174696F6E2E446973706C61795374796C652E41756742752O667329207468656E0D0A8O2072657475726E2022626C6973746572696E675F7363616C6573206D61696E203334220D0A6O20656E640D0A4O20656E640D0A4O202O2D206572757074696F6E2C69663D62752O662E65626F6E5F6D696768742E72656D61696E733E636173745F74696D657C652O73656E63652E74696D655F746F5F6D61783C636173745F74696D657C62752O662E652O73656E63655F62757273742E75700D0A4O20696620732E6572757074696F6E3A49735265616479282920616E642028706C617965723A42752O6652656D61696E7328732E65626F6E4D6967687453656C6642752O6629203E20732E6572757074696F6E3A4361737454696D652829206F7220706C617965723A452O73656E636554696D65546F4D61782829203C20732E6572757074696F6E3A4361737454696D652829206F7220706C617965723A42752O66557028732E652O73656E6365427572737442752O662O29207468656E0D0A6O206966204361737428732E6572757074696F6E2C206E696C2C206E696C2C206E6F74207461726765743A4973496E52616E67652832352O29207468656E0D0A8O2072657475726E20226572757074696F6E206D61696E203336220D0A6O20656E640D0A4O20656E640D0A4O202O2D20656D6572616C645F626C6F2O736F6D2C69663D2174616C656E742E647265616D5F6F665F737072696E672674616C656E742E736361726C65745F61646170746174696F6E2662752O662E65626F6E5F6D696768742E72656D61696E733C636173745F74696D652662752O662E616E6369656E745F666C616D652E646F776E0D0A4O20696620732E656D6572616C64426C6F2O736F6D3A49735265616479282920616E6420286E6F7420732E647265616D6F66537072696E673A4973417661696C61626C65282920616E6420732E736361726C657441646170746174696F6E3A4973417661696C61626C65282920616E6420706C617965723A42752O6652656D61696E7328732E65626F6E4D6967687453656C6642752O6629203C20732E656D6572616C64426C6F2O736F6D3A4361737454696D65282920616E6420706C617965723A42752O66446F776E28732E616E6369656E74466C616D6542752O662O29207468656E0D0A6O206966204361737428732E656D6572616C64426C6F2O736F6D2C2053652O74696E67732E4175676D656E746174696F6E2E47434461734F2O664743442E456D6572616C64426C6F2O736F6D29207468656E0D0A8O2072657475726E2022656D6572616C645F626C6F2O736F6D206D61696E203338220D0A6O20656E640D0A4O20656E640D0A4O202O2D2076657264616E745F656D62726163652C69663D74616C656E742E736361726C65745F61646170746174696F6E2662752O662E65626F6E5F6D696768742E646F776E2662752O662E616E6369656E745F666C616D652E646F776E0D0A4O20696620732E76657264616E74456D62726163653A49735265616479282920616E642028732E736361726C657441646170746174696F6E3A4973417661696C61626C65282920616E6420706C617965723A42752O66446F776E28732E65626F6E4D6967687453656C6642752O662920616E6420706C617965723A42752O66446F776E28732E616E6369656E74466C616D6542752O662O29207468656E0D0A6O206966204361737428732E76657264616E74456D62726163652C2053652O74696E67732E4175676D656E746174696F6E2E47434461734F2O664743442E56657264616E74456D627261636529207468656E0D0A8O2072657475726E202276657264616E745F656D6272616365206D61696E203430220D0A6O20656E640D0A4O20656E640D0A4O202O2D206C6976696E675F666C616D652C69663D216D6F76696E677C62752O662E686F7665722E75707C74616C656E742E707570696C5F6F665F616C657873747261737A610D0A4O20696620732E6C6976696E67466C616D653A49734361737461626C65282920616E6420286E6F7420706C617965723A49734D6F76696E672829206F7220732E707570696C6F66416C657873747261737A613A4973417661696C61626C65282O29207468656E0D0A6O206966204361737428732E6C6976696E67466C616D652C206E696C2C206E696C2C206E6F74207461726765743A49735370652O6C496E52616E676528732E6C6976696E67466C616D652O29207468656E0D0A8O2072657475726E20226C6976696E675F666C616D65206D61696E203432220D0A6O20656E640D0A4O20656E640D0A4O202O2D20617A7572655F737472696B652C69663D2174616C656E742E707570696C5F6F665F616C657873747261737A612628632O6F6C646F776E2E686F7665722E72656D61696E733E307C616374696F6E2E686F7665722E64697361626C6564290D0A4O20696620732E617A757265537472696B653A49734361737461626C65282920616E6420286E6F7420732E707570696C6F66416C657873747261737A613A4973417661696C61626C65282O29207468656E0D0A6O206966204361737428732E617A757265537472696B652C206E696C2C206E696C2C206E6F74207461726765743A49735370652O6C496E52616E676528732E617A757265537472696B652O29207468656E0D0A8O2072657475726E2022617A7572655F737472696B65206D61696E202O34220D0A6O20656E640D0A4O20656E640D0A4O202O2D20702O6F6C206966206E6F7468696E6720656C736520746F20646F0D0A4O206966204361737428732E702O6F6C2C206E696C2C206E696C2C207472756529207468656E0D0A6O2072657475726E2022576169742F502O6F6C220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20526567697374657228290D0A2O206170693A5265676973746572466F724576656E742866756E6374696F6E28290D0A4O20626F2O73466967687452656D61696E73203D205O310D0A4O20666967687452656D61696E73203D205O310D0A2O20656E642C2022504C415945525F524547454E5F454E41424C454422290D0A0D0A2O206170693A5265676973746572466F724576656E742866756E6374696F6E28290D0A4O206D6178456D706F776572203D20732E666F6E746F664D616769633A4973417661696C61626C65282920616E642034206F7220330D0A4O20666F4D456D706F7765724D6F64203D20732E666F6E746F664D616769633A4973417661696C61626C65282920616E6420302E38206F7220310D0A2O20656E642C20225350452O4C535F4348414E474544222C20224C4541524E45445F5350452O4C5F494E5F54414222290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204175746F42696E6428290D0A0D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20496E697428290D0A2O205072696E74446562756728224175676D656E746174696F6E2045766F6B6572206C6F616465642E22290D0A2O2073652O74696E6773203D2047657453652O74696E6773287370656349642C2061706C4E616D65290D0A2O204175746F42696E6428290D0A2O20526567697374657228290D0A2O20732E66697265427265617468446562752O663A526567697374657241757261547261636B696E6728290D0A2O20732E74656D706F72616C576F756E64446562752O663A526567697374657241757261547261636B696E6728290D0A656E640D0A0D0A412O6441706C287370656349642C2061706C4E616D652C2041504C2C20496E69742C2064656661756C7453652O74696E6773290D0A00063O0012063O00013O001204000100024O00013O000200022O000700016O00055O00012O000B3O00017O00",v9(),...);