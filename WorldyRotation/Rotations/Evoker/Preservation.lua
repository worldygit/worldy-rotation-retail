local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111]=v83[v111](v83[v111 + 1 ]);elseif (v86==1) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86<=3) then local v113=v85[2];v83[v113](v13(v83,v113 + 1 ,v78));elseif (v86>4) then local v118=v85[2];v78=(v118 + v84) -1 ;for v126=v118,v78 do local v127=v79[v126-v118 ];v83[v126]=v127;end else v83[v85[2]]=v85[3];end elseif (v86<=8) then if (v86<=6) then v83[v85[2]]=v85[3];elseif (v86==7) then local v121=v85[2];v83[v121]=v83[v121](v83[v121 + 1 ]);else do return;end end elseif (v86<=9) then local v116=v85[2];v83[v116](v13(v83,v116 + 1 ,v78));elseif (v86==10) then do return;end else local v123=v85[2];v78=(v123 + v84) -1 ;for v129=v123,v78 do local v130=v79[v129-v123 ];v83[v129]=v130;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E670348442O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C206361636865203D2057522E63616368650D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A2O2D206170692066756E6374696F6E730D0A6C6F63616C20412O6441706C203D206170692E412O6441706C0D0A6C6F63616C20412O64546F2O676C65203D206170692E412O64546F2O676C650D0A6C6F63616C205072696E744465627567203D206170692E5072696E7444656275670D0A6C6F63616C2047657453652O74696E6773203D206170692E47657453652O74696E67730D0A6C6F63616C20416F454F6E203D206170692E416F454F6E0D0A6C6F63616C204344734F6E203D206170692E4344734F6E0D0A6C6F63616C2044697370656C42752O66734F6E203D206170692E44697370656C42752O66734F6E0D0A6C6F63616C2044697370656C446562752O66734F6E203D206170692E44697370656C446562752O66734F6E0D0A6C6F63616C2048616E646C65412O666C69637465644F6E203D206170692E48616E646C65412O666C69637465644F6E0D0A6C6F63616C204F70656E65724F6E203D206170692E4F70656E65724F6E0D0A6C6F63616C2052616369616C734F6E203D206170692E52616369616C734F6E0D0A6C6F63616C2042696E64203D206170692E42696E640D0A6C6F63616C2043617374203D206170692E436173740D0A0D0A2O2D2061706920636C612O7365730D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C20746172676574203D20756E69742E7461726765740D0A6C6F63616C20666F637573203D20756E69742E666F6375730D0A6C6F63616C206D6F7573656F766572203D20756E69742E6D6F7573656F7665720D0A0D0A2O2D207574696C730D0A6C6F63616C206E756D203D207574696C732E6E756D0D0A0D0A2O2D20646566696E65730D0A6C6F63616C2073203D207370652O6C2E65766F6B65722E707265736572766174696F6E0D0A6C6F63616C2069203D206974656D2E65766F6B65722E707265736572766174696F6E0D0A6C6F63616C206D203D206D6163726F2E65766F6B65722E707265736572766174696F6E0D0A0D0A6C6F63616C20737065634964203D20313436380D0A6C6F63616C2061706C4E616D65203D202264656661756C74220D0A6C6F63616C2064656661756C7453652O74696E6773203D207B0D0A2O20656E61626C6564203D207B0D0A4O20626C652O73696E674F6654686542726F6E7A65203D20747275652C0D0A4O20647265616D427265617468203D20747275652C0D0A4O206F75744F66436F6D6261744865616C696E67203D20747275652C0D0A2O207D2C0D0A2O206870203D207B0D0A4O20647265616D427265617468203D2037302C0D0A4O206563686F203D2036352C0D0A4O20656D6572616C64426C6F2O736F6D203D2037302C0D0A4O206C6976696E67466C616D65203D2038362C0D0A4O206F6273696469616E5363616C6573203D2036302C0D0A4O20726577696E64203D2035302C0D0A4O20726576657273696F6E203D2036352C0D0A4O20726576657273696F6E54616E6B203D202O392C0D0A4O20737069726974626C2O6F6D203D2037302C0D0A4O20737461736973203D2037352C0D0A4O2074656D706F72616C416E6F6D616C79203D2038302C0D0A4O2074696D6544696C6174696F6E203D2036302C0D0A4O2076657264616E74456D6272616365203D2037302C0D0A2O207D2C0D0A2O20746F2O676C6573203D207B0D0A4O207665203D20747275652C0D0A2O207D0D0A7D0D0A6C6F63616C2073652O74696E67730D0A0D0A2O2D20766172730D0A6C6F63616C206F6E5573654578636C75646573203D207B7D0D0A6C6F63616C2073686F756C6452657475726E0D0A6C6F63616C20656E656D6965733235790D0A6C6F63616C20656E656D696573387953706C6173680D0A6C6F63616C20656E656D696573387953706C617368436F756E740D0A6C6F63616C20626F2O73466967687452656D61696E73203D205O310D0A6C6F63616C20666967687452656D61696E73203D205O310D0A6C6F63616C20692O6D6F7661626C650D0A6C6F63616C206662456D706F776572203D20300D0A6C6F63616C206462456D706F776572203D20300D0A6C6F63616C207362456D706F776572203D20300D0A6C6F63616C206C6F77556E697473436F756E74203D20300D0A0D0A6C6F63616C2066756E6374696F6E20507265636F6D62617428290D0A2O202O2D206C6976696E675F666C616D650D0A2O20696620732E6C6976696E67466C616D653A49734361737461626C652829207468656E0D0A4O206966204361737428732E6C6976696E67466C616D652C206E6F74207461726765743A4973496E52616E6765283235292C20692O6D6F7661626C6529207468656E0D0A6O2072657475726E20226C6976696E675F666C616D6520707265636F6D626174220D0A4O20656E640D0A2O20656E640D0A2O202O2D20617A7572655F737472696B650D0A2O20696620732E617A757265537472696B653A49734361737461626C652829207468656E0D0A4O206966204361737428732E617A757265537472696B652C206E6F74207461726765743A49735370652O6C496E52616E676528732E617A757265537472696B652O29207468656E0D0A6O2072657475726E2022617A7572655F737472696B6520707265636F6D626174220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20446566656E7369766528290D0A2O202O2D206F6273696469616E5F7363616C65730D0A2O20696620732E6F6273696469616E5363616C65733A49734361737461626C65282920616E6420706C617965723A42752O66446F776E28732E6F6273696469616E5363616C65732920616E6420706C617965723A4865616C746850657263656E746167652829203C2073652O74696E67732E68702E6F6273696469616E5363616C6573207468656E0D0A4O206966204361737428732E6F6273696469616E5363616C657329207468656E0D0A6O2072657475726E20226F6273696469616E5F7363616C657320646566656E7369766573220D0A4O20656E640D0A2O20656E640D0A2O202O2D2073656C666865616C0D0A2O2073686F756C6452657475726E203D206170692E5573654865616C696E6728290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2044697370656C28290D0A2O206966206E6F74206170692E497344697370652O6C61626C6547726F7570556E697428666F6375732C20333029207468656E0D0A4O2072657475726E0D0A2O20656E640D0A2O202O2D206E61747572616C697A650D0A2O20696620732E6E61747572616C697A653A49735265616479282920616E6420286170692E556E69744861734D61676963446562752O6628666F63757329206F72206170692E556E6974486173506F69736F6E446562752O6628666F6375732O29207468656E0D0A4O2069662043617374286D2E6E61747572616C697A65466F63757329207468656E0D0A6O2072657475726E20226E61747572616C697A652064697370656C220D0A4O20656E640D0A2O20656E640D0A2O202O2D20636175746572697A696E675F666C616D650D0A2O20696620732E636175746572697A696E67466C616D653A49735265616479282920616E6420286170692E556E6974486173426C2O6564446562752O6628666F63757329206F72206170692E556E6974486173506F69736F6E446562752O6628666F63757329206F72206170692E556E69744861734375727365446562752O6628666F63757329206F72206170692E556E697448617344697365617365446562752O6628666F6375732O29207468656E0D0A4O2069662043617374286D2E636175746572697A696E67466C616D65466F63757329207468656E0D0A6O2072657475726E2022636175746572697A696E675F666C616D652064697370656C220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20496E74652O7275707428290D0A2O202O2D204D616E75612O6C7920612O6465643A20496E74652O72757074730D0A2O206966206E6F7420706C617965723A497343617374696E67282920616E64206E6F7420706C617965723A49734368612O6E656C696E672829207468656E0D0A4O2073686F756C6452657475726E203D206170692E496E74652O7275707428732E7175652O6C2C206D2E7175652O6C4D6F7573656F7665722C2031302C2074727565290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A4O2073686F756C6452657475726E203D206170692E496E74652O727570745374756E28732E7461696C53776970652C206E696C2C2038290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2044616D61676528290D0A2O202O2D206C6976696E675F666C616D652C69663D6C656170696E675F666C616D65732E75700D0A2O20696620732E6C6976696E67466C616D653A49734361737461626C65282920616E6420706C617965723A42752O66557028732E6C656170696E67466C616D657342752O6629207468656E0D0A4O206966204361737428732E6C6976696E67466C616D652C206E6F74207461726765743A49735370652O6C496E52616E676528732E6C6976696E67466C616D65292C20692O6D6F7661626C6529207468656E0D0A6O2072657475726E20226C6976696E675F666C616D655F6C656170696E675F666C616D65732064616D616765220D0A4O20656E640D0A2O20656E640D0A2O202O2D20666972655F6272656174680D0A2O20696620732E666972654272656174683A497352656164792829207468656E0D0A4O20696620656E656D696573387953706C617368436F756E74203C3D2032207468656E0D0A6O206662456D706F776572203D20310D0A4O20656C7365696620656E656D696573387953706C617368436F756E74203C3D2034207468656E0D0A6O206662456D706F776572203D20320D0A4O20656C7365696620656E656D696573387953706C617368436F756E74203C3D2036207468656E0D0A6O206662456D706F776572203D20330D0A4O20656C73650D0A6O206662456D706F776572203D20340D0A4O20656E640D0A4O2069662043617374286D2E666972654272656174684D6163726F2C206E6F74207461726765743A4973496E52616E6765283330292C20747275652C206E696C2C207472756529207468656E0D0A6O2072657475726E2022666972655F6272656174682064616D6167652022202O2E206662456D706F7765720D0A4O20656E640D0A2O20656E640D0A2O20696620732E646973696E746567726174653A49735265616479282920616E6420706C617965723A42752O66557028732E652O73656E6365427572737442752O6629207468656E0D0A4O206966204361737428732E646973696E746567726174652C206E6F74207461726765743A49735370652O6C496E52616E676528732E646973696E74656772617465292C20692O6D6F7661626C6529207468656E0D0A6O2072657475726E2022646973696E746567726174652064616D616765220D0A4O20656E640D0A2O20656E640D0A2O202O2D20642O65705F627265617468202D206D616E75616C2075736167650D0A2O202O2D206C6976696E675F666C616D650D0A2O20696620732E6C6976696E67466C616D653A49734361737461626C652829207468656E0D0A4O206966204361737428732E6C6976696E67466C616D652C206E6F74207461726765743A49735370652O6C496E52616E676528732E6C6976696E67466C616D65292C20692O6D6F7661626C6529207468656E0D0A6O2072657475726E20226C6976696E675F666C616D652064616D616765220D0A4O20656E640D0A2O20656E640D0A2O202O2D20617A7572655F737472696B650D0A2O20696620732E617A757265537472696B653A49734361737461626C652829207468656E0D0A4O206966204361737428732E617A757265537472696B652C206E6F74207461726765743A49735370652O6C496E52616E676528732E617A757265537472696B652O29207468656E0D0A6O2072657475726E2022617A7572655F737472696B652064616D616765220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20432O6F6C646F776E28290D0A2O206966206E6F7420666F637573206F72206E6F7420666F6375733A4578697374732829206F72206E6F7420666F6375733A4973496E52616E676528333029207468656E0D0A4O2072657475726E0D0A2O20656E640D0A2O202O2D207472696E6B65740D0A2O2073686F756C6452657475726E203D206170692E5573655472696E6B6574732832352C206F6E5573654578636C75646573290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A2O206966204344734F6E282920616E6420692E69726964616C3A4973457175692O706564416E645265616479282920616E64207461726765743A4865616C746850657263656E746167652829203C203335207468656E0D0A4O2069662043617374286D2E69726964616C2C206E6F74207461726765743A4973496E52616E6765283430292C207472756529207468656E0D0A6O2072657475726E202269726964616C220D0A4O20656E640D0A2O20656E640D0A2O202O2D207374617369730D0A2O20696620732E7374617369733A49735265616479282920616E64206170692E47726F75704865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E737461736973207468656E0D0A4O206966204361737428732E73746173697329207468656E0D0A6O2072657475726E202273746173697320632O6F6C646F776E220D0A4O20656E640D0A2O20656E640D0A2O202O2D207374617369735F726561637469766174650D0A2O20696620732E737461736973526561637469766174653A49735265616479282920616E6420286170692E47726F75704865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E737461736973206F722028706C617965723A42752O66557028732E73746173697342752O662920616E6420706C617965723A42752O6652656D61696E7328732E73746173697342752O6629203C20332O29207468656E0D0A4O206966204361737428732E7374617369735265616374697661746529207468656E0D0A6O2072657475726E20227374617369735F7265616374697661746520632O6F6C646F776E220D0A4O20656E640D0A2O20656E640D0A2O202O2D207469705F7468655F7363616C65730D0A2O20696620732E7469705468655363616C65733A49734361737461626C652829207468656E0D0A4O202O2D20647265616D5F6272656174680D0A4O20696620732E647265616D4272656174683A49735265616479282920616E64206170692E47726F75704865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E647265616D427265617468207468656E0D0A6O2069662043617374286D2E7469705468655363616C6573447265616D42726561746829207468656E0D0A8O2072657475726E2022647265616D5F62726561746820632O6F6C646F776E220D0A6O20656E640D0A6O202O2D207370697269745F626C2O6F6D0D0A4O20656C7365696620732E737069726974626C2O6F6D3A49735265616479282920616E64206170692E47726F75704865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E737069726974626C2O6F6D207468656E0D0A6O2069662043617374286D2E7469705468655363616C6573537069726974626C2O6F6D29207468656E0D0A8O2072657475726E20227370697269745F626C2O6F6D20632O6F6C646F776E220D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2O202O2D20647265616D5F666C69676874202D206D616E75616C2075736167650D0A2O202O2D20726577696E640D0A2O20696620732E726577696E643A49734361737461626C65282920616E64206170692E47726F75704865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E726577696E64207468656E0D0A4O206966204361737428732E726577696E6429207468656E0D0A6O2072657475726E2022726577696E6420632O6F6C646F776E220D0A4O20656E640D0A2O20656E640D0A2O202O2D2074696D655F64696C6174696F6E0D0A2O20696620732E74696D6544696C6174696F6E3A49734361737461626C65282920616E6420666F6375733A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E74696D6544696C6174696F6E207468656E0D0A4O2069662043617374286D2E74696D6544696C6174696F6E466F63757329207468656E0D0A6O2072657475726E202274696D655F64696C6174696F6E20632O6F6C646F776E220D0A4O20656E640D0A2O20656E640D0A2O202O2D20666972655F6272656174680D0A2O20696620732E666972654272656174683A497352656164792829207468656E0D0A4O20696620656E656D696573387953706C617368436F756E74203C3D2032207468656E0D0A6O206662456D706F776572203D20310D0A4O20656C7365696620656E656D696573387953706C617368436F756E74203C3D2034207468656E0D0A6O206662456D706F776572203D20320D0A4O20656C7365696620656E656D696573387953706C617368436F756E74203C3D2036207468656E0D0A6O206662456D706F776572203D20330D0A4O20656C73650D0A6O206662456D706F776572203D20340D0A4O20656E640D0A4O2069662043617374286D2E666972654272656174684D6163726F2C206E6F74207461726765743A4973496E52616E6765283330292C20747275652C206E696C2C207472756529207468656E0D0A6O2072657475726E2022666972655F627265617468206364732022202O2E206662456D706F7765720D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20416F454865616C696E6728290D0A2O202O2D20656D6572616C645F626C6F2O736F6D0D0A2O20696620732E656D6572616C64426C6F2O736F6D3A49734361737461626C65282920616E64206170692E47726F75704865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E656D6572616C64426C6F2O736F6D207468656E0D0A4O2069662043617374286D2E656D6572616C64426C6F2O736F6D466F63757329207468656E0D0A6O2072657475726E2022656D6572616C645F626C6F2O736F6D20616F655F6865616C696E67220D0A4O20656E640D0A2O20656E640D0A2O202O2D2076657264616E745F656D62726163650D0A2O2069662073652O74696E67732E746F2O676C65732E766520616E6420732E76657264616E74456D62726163653A49735265616479282920616E6420666F6375733A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E76657264616E74456D6272616365207468656E0D0A4O2069662043617374286D2E76657264616E74456D6272616365466F63757329207468656E0D0A6O2072657475726E202276657264616E745F656D627261636520616F655F6865616C696E67220D0A4O20656E640D0A2O20656E640D0A2O202O2D20647265616D5F6272656174680D0A2O20696620732E647265616D4272656174683A49735265616479282920616E64206170692E47726F75704865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E647265616D427265617468207468656E0D0A4O206966206C6F77556E697473436F756E74203C3D2032207468656E0D0A6O206462456D706F776572203D20310D0A4O20656C73650D0A6O206462456D706F776572203D20320D0A4O20656E640D0A4O2069662043617374286D2E647265616D4272656174684D6163726F2C206E696C2C207472756529207468656E0D0A6O2072657475726E2022647265616D5F62726561746820616F655F6865616C696E67220D0A4O20656E640D0A2O20656E640D0A2O202O2D207370697269745F626C2O6F6D0D0A2O20696620732E737069726974626C2O6F6D3A49735265616479282920616E64206170692E47726F75704865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E737069726974626C2O6F6D207468656E0D0A4O206966206C6F77556E697473436F756E74203E2032207468656E0D0A6O207362456D706F776572203D20330D0A4O20656C73650D0A6O207362456D706F776572203D20310D0A4O20656E640D0A4O2069662043617374286D2E737069726974626C2O6F6D466F6375732C206E696C2C207472756529207468656E0D0A6O2072657475726E20227370697269745F626C2O6F6D20616F655F6865616C696E67220D0A4O20656E640D0A2O20656E640D0A2O202O2D206C6976696E675F666C616D652C69663D6C656170696E675F666C616D65732E75700D0A2O20696620732E6C6976696E67466C616D653A49734361737461626C65282920616E6420706C617965723A42752O66557028732E6C656170696E67466C616D657342752O662920616E6420666F6375733A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E6C6976696E67466C616D65207468656E0D0A4O2069662043617374286D2E6C6976696E67466C616D65466F6375732C206E6F7420666F6375733A49735370652O6C496E52616E676528732E6C6976696E67466C616D65292C20692O6D6F7661626C6529207468656E0D0A6O2072657475726E20226C6976696E675F666C616D655F6C656170696E675F666C616D657320616F655F6865616C696E67220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2053544865616C696E6728290D0A2O202O2D20726576657273696F6E0D0A2O20696620732E726576657273696F6E3A49735265616479282920616E64206170692E556E6974526F6C6528666F63757329207E3D202254414E4B2220616E64206170692E47726F7570556E6974735769746842752O66436F756E7428732E726576657273696F6E29203C203120616E6420666F6375733A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E726576657273696F6E207468656E0D0A4O2069662043617374286D2E726576657273696F6E466F63757329207468656E0D0A6O2072657475726E2022726576657273696F6E5F74616E6B2073745F6865616C696E67220D0A4O20656E640D0A2O20656E640D0A2O202O2D20726576657273696F6E5F74616E6B0D0A2O20696620732E726576657273696F6E3A49735265616479282920616E64206170692E556E6974526F6C6528666F63757329202O3D202254414E4B2220616E64206170692E47726F7570556E6974735769746842752O66436F756E7428732E726576657273696F6E2C20747275652C2066616C736529203C203120616E6420666F6375733A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E726576657273696F6E54616E6B207468656E0D0A4O2069662043617374286D2E726576657273696F6E466F63757329207468656E0D0A6O2072657475726E2022726576657273696F6E5F74616E6B2073745F6865616C696E67220D0A4O20656E640D0A2O20656E640D0A2O202O2D2074656D706F72616C5F616E6F6D616C790D0A2O20696620732E74656D706F72616C416E6F6D616C793A49735265616479282920616E64206170692E47726F75704865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E74656D706F72616C416E6F6D616C79207468656E0D0A4O206966204361737428732E74656D706F72616C416E6F6D616C792C206E6F7420666F6375733A4973496E52616E6765283330292C20692O6D6F7661626C6529207468656E0D0A6O2072657475726E202274656D706F72616C5F616E6F6D616C792073745F6865616C696E67220D0A4O20656E640D0A2O20656E640D0A2O202O2D206563686F0D0A2O20696620732E6563686F3A49735265616479282920616E64206E6F7420666F6375733A42752O66557028732E6563686F2920616E6420666F6375733A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E6563686F207468656E0D0A4O2069662043617374286D2E6563686F466F63757329207468656E0D0A6O2072657475726E20226563686F2073745F6865616C696E67220D0A4O20656E640D0A2O20656E640D0A2O202O2D206C6976696E675F666C616D650D0A2O20696620732E6C6976696E67466C616D653A49735265616479282920616E6420666F6375733A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E6C6976696E67466C616D65207468656E0D0A4O2069662043617374286D2E6C6976696E67466C616D65466F6375732C206E6F7420666F6375733A49735370652O6C496E52616E676528732E6C6976696E67466C616D65292C20692O6D6F7661626C6529207468656E0D0A6O2072657475726E20226C6976696E675F666C616D652073745F6865616C696E67220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204865616C696E6728290D0A2O206966206E6F7420666F637573206F72206E6F7420666F6375733A4578697374732829206F72206E6F7420666F6375733A4973496E52616E676528333029207468656E0D0A4O2072657475726E0D0A2O20656E640D0A2O202O2D20616F655F6865616C696E670D0A2O2073686F756C6452657475726E203D20416F454865616C696E6728290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A2O202O2D2073745F6865616C696E670D0A2O2073686F756C6452657475726E203D2053544865616C696E6728290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20436F6D62617428290D0A2O202O2D2064697370656C0D0A2O2069662044697370656C446562752O66734F6E2829207468656E0D0A4O2073686F756C6452657475726E203D2044697370656C28290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A2O202O2D20646566656E736976650D0A2O2073686F756C6452657475726E203D20446566656E7369766528290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A2O202O2D20632O6F6C646F776E0D0A2O2073686F756C6452657475726E203D20432O6F6C646F776E28290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A2O202O2D20696E74652O727570740D0A2O2073686F756C6452657475726E203D20496E74652O7275707428290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A2O202O2D206865616C696E670D0A2O2073686F756C6452657475726E203D204865616C696E6728290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A2O202O2D2064616D6167650D0A2O206966206170692E556E6974497356616C69642874617267657429207468656E0D0A4O2073686F756C6452657475726E203D2044616D61676528290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204F75744F66436F6D62617428290D0A2O202O2D2064697370656C0D0A2O2069662044697370656C446562752O66734F6E2829207468656E0D0A4O2073686F756C6452657475726E203D2044697370656C28290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A2O202O2D20412O666C69637465640D0A2O2069662048616E646C65412O666C69637465644F6E2829207468656E0D0A4O2073686F756C6452657475726E203D206170692E48616E646C65412O666C696374656428732E6E61747572616C697A652C206D2E6E61747572616C697A654D6F7573656F7665722C203235290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A4O2073686F756C6452657475726E203D206170692E48616E646C65412O666C696374656428732E636175746572697A696E67466C616D652C206D2E636175746572697A696E67466C616D654D6F7573656F7665722C203235290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A4O2073686F756C6452657475726E203D206170692E48616E646C65412O666C696374656428732E6C6976696E67466C616D652C206D2E6C6976696E67466C616D654D6F7573656F7665722C203330290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A2O202O2D206865616C696E670D0A2O2069662073652O74696E67732E656E61626C65642E6F75744F66436F6D6261744865616C696E67207468656E0D0A4O2073686F756C6452657475726E203D204865616C696E6728290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A2O202O2D20626C652O73696E675F6F665F7468655F62726F6E7A650D0A2O2069662073652O74696E67732E656E61626C65642E626C652O73696E674F6654686542726F6E7A6520616E6420732E626C652O73696E676F6674686542726F6E7A653A49734361737461626C65282920616E64206170692E497347726F757042752O664D692O73696E6728732E626C652O73696E676F6674686542726F6E7A6542752O6629207468656E0D0A4O206966204361737428732E626C652O73696E676F6674686542726F6E7A6529207468656E0D0A6O2072657475726E2022626C652O73696E675F6F665F7468655F62726F6E7A6520707265636F6D626174220D0A4O20656E640D0A2O20656E640D0A2O202O2D20707265636F6D6261740D0A2O206966206170692E556E6974497356616C69642874617267657429207468656E0D0A4O206966204F70656E65724F6E2829207468656E0D0A6O2073686F756C6452657475726E203D20507265636F6D62617428290D0A6O2069662073686F756C6452657475726E207468656E0D0A8O2072657475726E2073686F756C6452657475726E0D0A6O20656E640D0A4O20656E640D0A4O2072657475726E0D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20466F63757343682O6F73696E672872616E6765290D0A2O2069662044697370656C446562752O66734F6E282920616E6420732E6E61747572616C697A653A497352656164792829207468656E0D0A4O206C6F63616C2064697370652O6C61626C6547726F7570556E6974203D206170692E44697370652O6C61626C6547726F7570556E69742872616E6765290D0A4O2069662064697370652O6C61626C6547726F7570556E6974207468656E0D0A6O2072657475726E2064697370652O6C61626C6547726F7570556E69740D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A2O2D2041504C204D61696E0D0A6C6F63616C2066756E6374696F6E2041504C28290D0A2O202O2D20466F637573556E69740D0A2O20696620706C617965723A412O66656374696E67436F6D6261742829206F722044697370656C446562752O66734F6E2829207468656E0D0A4O2073686F756C6452657475726E203D206170692E466F637573556E697428466F63757343682O6F73696E672C203330290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A0D0A2O20692O6D6F7661626C65203D20706C617965723A42752O6652656D61696E7328732E686F76657242752O6629203C20320D0A2O206C6F77556E697473436F756E74203D206170692E47726F7570556E69747342656C6F774865616C746850657263656E74616765436F756E74283835290D0A2O20656E656D696573323579203D20706C617965723A476574456E656D696573496E52616E6765283235290D0A2O20656E656D696573387953706C617368203D207461726765743A476574456E656D696573496E53706C61736852616E67652838290D0A2O20696620416F454F6E2829207468656E0D0A4O20656E656D696573387953706C617368436F756E74203D2023656E656D696573387953706C6173680D0A2O20656C73650D0A4O20656E656D696573387953706C617368436F756E74203D20310D0A2O20656E640D0A0D0A2O206966206170692E556E6974497356616C69642874617267657429206F7220706C617965723A412O66656374696E67436F6D6261742829207468656E0D0A4O202O2D2043616C63756C6174652066696768745F72656D61696E730D0A4O20626F2O73466967687452656D61696E73203D206170692E426F2O73466967687452656D61696E73286E696C2C2074727565290D0A4O20666967687452656D61696E73203D20626F2O73466967687452656D61696E730D0A4O20696620666967687452656D61696E73202O3D205O31207468656E0D0A6O20666967687452656D61696E73203D206170692E466967687452656D61696E7328656E656D6965733235792C2066616C7365290D0A4O20656E640D0A2O20656E640D0A0D0A2O20696620706C617965723A49734368612O6E656C696E6728732E6669726542726561746829207468656E0D0A4O20696620706C617965723A456D706F7765725374616765286662456D706F77657229207468656E0D0A6O2069662043617374286D2E666972654272656174684D6163726F2C206E696C2C206E696C2C207472756529207468656E0D0A8O2072657475726E202246422063616E63656C2022202O2E206662456D706F7765720D0A6O20656E640D0A4O20656E640D0A4O206966204361737428732E702O6F6C2C206E696C2C206E696C2C207472756529207468656E0D0A6O2072657475726E2022502O6F6C20666F722046422022202O2E206662456D706F7765720D0A4O20656E640D0A2O20656E640D0A2O20696620706C617965723A49734368612O6E656C696E6728732E647265616D42726561746829207468656E0D0A4O20696620706C617965723A456D706F7765725374616765286462456D706F77657229207468656E0D0A6O2069662043617374286D2E647265616D4272656174684D6163726F2C206E696C2C206E696C2C207472756529207468656E0D0A8O2072657475726E202244422063616E63656C2022202O2E206462456D706F7765720D0A6O20656E640D0A4O20656E640D0A4O206966204361737428732E702O6F6C2C206E696C2C206E696C2C207472756529207468656E0D0A6O2072657475726E2022502O6F6C20666F722044422022202O2E206462456D706F7765720D0A4O20656E640D0A2O20656E640D0A2O20696620706C617965723A49734368612O6E656C696E6728732E737069726974626C2O6F6D29207468656E0D0A4O20696620706C617965723A456D706F7765725374616765287362456D706F77657229207468656E0D0A6O2069662043617374286D2E737069726974626C2O6F6D466F6375732C206E696C2C206E696C2C207472756529207468656E0D0A8O2072657475726E202253422063616E63656C2022202O2E207362456D706F7765720D0A6O20656E640D0A4O20656E640D0A4O206966204361737428732E702O6F6C2C206E696C2C206E696C2C207472756529207468656E0D0A6O2072657475726E2022502O6F6C20666F722053422022202O2E207362456D706F7765720D0A4O20656E640D0A2O20656E640D0A0D0A2O202O2D207265766976650D0A2O206966206D6F7573656F76657220616E64206D6F7573656F7665723A457869737473282920616E64206D6F7573656F7665723A497341506C61796572282920616E64206D6F7573656F7665723A4973446561644F7247686F7374282920616E6420286E6F7420706C617965723A43616E412O7461636B286D6F7573656F7665722O29207468656E0D0A4O206C6F63616C206465616447726F7570556E697473436F756E74203D206170692E4465616447726F7570556E697473436F756E7428290D0A4O206966206E6F7420706C617965723A412O66656374696E67436F6D6261742829207468656E0D0A6O206966206465616447726F7570556E697473436F756E74203E2031207468656E0D0A8O206966204361737428732E6D612O7352657475726E2C206E6F74206D6F7573656F7665723A49735370652O6C496E52616E676528732E6D612O7352657475726E292C207472756529207468656E0D0A9O202072657475726E20226D612O735F72657475726E220D0A8O20656E640D0A6O20656C73650D0A8O2069662043617374286D2E72657475726E4D6F7573656F7665722C206E6F74206D6F7573656F7665723A49735370652O6C496E52616E676528732E72657475726E5F292C207472756529207468656E0D0A9O202072657475726E202272657475726E220D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A0D0A2O206966206E6F7420706C617965723A49734368612O6E656C696E672829207468656E0D0A4O20696620706C617965723A412O66656374696E67436F6D6261742829207468656E0D0A6O202O2D20436F6D6261740D0A6O2073686F756C6452657475726E203D20436F6D62617428290D0A6O2069662073686F756C6452657475726E207468656E0D0A8O2072657475726E2073686F756C6452657475726E0D0A6O20656E640D0A4O20656C73650D0A6O202O2D204F75744F66436F6D6261740D0A6O2073686F756C6452657475726E203D204F75744F66436F6D62617428290D0A6O2069662073686F756C6452657475726E207468656E0D0A8O2072657475726E2073686F756C6452657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20526567697374657228290D0A2O206170693A5265676973746572466F724576656E742866756E6374696F6E28290D0A4O20626F2O73466967687452656D61696E73203D205O310D0A4O20666967687452656D61696E73203D205O310D0A2O20656E642C2022504C415945525F524547454E5F454E41424C454422290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204175746F42696E6428290D0A2O202O2D205370652O6C2042696E64730D0A2O2042696E6428732E617A757265537472696B65290D0A2O2042696E6428732E626C652O73696E676F6674686542726F6E7A65290D0A2O2042696E6428732E636175746572697A696E67466C616D65290D0A2O2042696E6428732E642O6570427265617468290D0A2O2042696E6428732E647265616D427265617468290D0A2O2042696E6428732E647265616D466C69676874290D0A2O2042696E6428732E646973696E74656772617465290D0A2O2042696E6428732E66697265427265617468290D0A2O2042696E6428732E6C6976696E67466C616D65290D0A2O2042696E6428732E6E61747572616C697A65290D0A2O2042696E6428732E6F6273696469616E5363616C6573290D0A2O2042696E6428732E737461736973290D0A2O2042696E6428732E73746173697352656163746976617465290D0A2O2042696E6428732E7461696C5377697065290D0A2O2042696E6428732E74656D706F72616C416E6F6D616C79290D0A2O2042696E6428732E726577696E64290D0A2O2042696E6428732E72657475726E5F290D0A2O2042696E6428732E6D612O7352657475726E290D0A2O2042696E6428732E77696E6742752O666574290D0A2O2042696E6428732E7175652O6C290D0A0D0A2O202O2D2042696E64204974656D730D0A2O206170692E6D6163726F3A42696E644974656D7328290D0A2O2042696E64286D2E69726964616C290D0A0D0A2O202O2D204D6163726F730D0A2O2042696E64286D2E617A757265537472696B654D6F7573656F766572290D0A2O2042696E64286D2E636175746572697A696E67466C616D65466F637573290D0A2O2042696E64286D2E636175746572697A696E67466C616D654D6F7573656F766572290D0A2O2042696E64286D2E642O6570427265617468437572736F72290D0A2O2042696E64286D2E647265616D4272656174684D6163726F290D0A2O2042696E64286D2E647265616D466C69676874437572736F72290D0A2O2042696E64286D2E6563686F466F637573290D0A2O2042696E64286D2E656D6572616C64426C6F2O736F6D466F637573290D0A2O2042696E64286D2E666972654272656174684D6163726F290D0A2O2042696E64286D2E6C6976696E67466C616D65466F637573290D0A2O2042696E64286D2E6C6976696E67466C616D654D6F7573656F766572290D0A2O2042696E64286D2E6E61747572616C697A65466F637573290D0A2O2042696E64286D2E6E61747572616C697A654D6F7573656F766572290D0A2O2042696E64286D2E737069726974626C2O6F6D466F637573290D0A2O2042696E64286D2E726576657273696F6E466F637573290D0A2O2042696E64286D2E7175652O6C4D6F7573656F766572290D0A2O2042696E64286D2E7469705468655363616C6573447265616D427265617468290D0A2O2042696E64286D2E7469705468655363616C6573537069726974626C2O6F6D290D0A2O2042696E64286D2E74696D6544696C6174696F6E466F637573290D0A2O2042696E64286D2E76657264616E74456D6272616365466F637573290D0A0D0A2O202O2D2042696E6420466F637573204D6163726F730D0A2O206170692E6D6163726F3A42696E64466F63757328290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20496E697428290D0A2O205072696E7444656275672822507265736572766174696F6E2045766F6B6572206C6F616465642E22290D0A2O2073652O74696E6773203D2047657453652O74696E6773287370656349642C2061706C4E616D65290D0A2O204175746F42696E6428290D0A2O20526567697374657228290D0A2O206170692E64697370652O6C61626C65446562752O66494473203D207B7D0D0A2O206170692E64697370652O6C61626C65446562752O66494473203D207574696C732E4D657267655461626C65286170692E64697370652O6C61626C65446562752O664944732C206170692E64697370652O6C61626C654D61676963446562752O66494473290D0A2O206170692E64697370652O6C61626C65446562752O66494473203D207574696C732E4D657267655461626C65286170692E64697370652O6C61626C65446562752O664944732C206170692E64697370652O6C61626C6544697365617365446562752O66494473290D0A2O206170692E64697370652O6C61626C65446562752O66494473203D207574696C732E4D657267655461626C65286170692E64697370652O6C61626C65446562752O664944732C206170692E64697370652O6C61626C654375727365446562752O66494473290D0A2O206170692E64697370652O6C61626C65446562752O66494473203D207574696C732E4D657267655461626C65286170692E64697370652O6C61626C65446562752O664944732C206170692E64697370652O6C61626C65506F69736F6E446562752O66494473290D0A2O206170692E64697370652O6C61626C65446562752O66494473203D207574696C732E4D657267655461626C65286170692E64697370652O6C61626C65446562752O664944732C206170692E64697370652O6C61626C65426C2O6564446562752O66494473290D0A2O20412O64546F2O676C6528225645222C2073652O74696E67732E746F2O676C65732C2022766522290D0A656E640D0A0D0A412O6441706C287370656349642C2061706C4E616D652C2041504C2C20496E69742C2064656661756C7453652O74696E6773290D0A00063O0012013O00013O001206000100028O000200022O000500016O00095O00012O000A3O00017O00",v9(),...);