local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111]=v83[v111](v83[v111 + 1 ]);elseif (v86==1) then local v118=v85[2];v83[v118](v13(v83,v118 + 1 ,v78));else local v119=v85[2];v78=(v119 + v84) -1 ;for v126=v119,v78 do local v127=v79[v126-v119 ];v83[v126]=v127;end end elseif (v86<=3) then v83[v85[2]]=v85[3];elseif (v86>4) then local v120=v85[2];v78=(v120 + v84) -1 ;for v129=v120,v78 do local v130=v79[v129-v120 ];v83[v129]=v130;end else do return;end end elseif (v86<=8) then if (v86<=6) then do return;end elseif (v86>7) then if (v85[3]=="_ENV") then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v85[3]=="_ENV") then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86<=9) then local v115=v85[2];v83[v115]=v83[v115](v83[v115 + 1 ]);elseif (v86>10) then v83[v85[2]]=v85[3];else local v123=v85[2];v83[v123](v13(v83,v123 + 1 ,v78));end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703A9112O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C206361636865203D2057522E63616368650D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A0D0A6C6F63616C206974656D416374696F6E456E656D696573203D2063616368652E656E656D6965732E6974656D416374696F6E0D0A6C6F63616C206D656C2O65456E656D696573203D2063616368652E656E656D6965732E6D656C2O650D0A6C6F63616C2072616E676564456E656D696573203D2063616368652E656E656D6965732E72616E6765640D0A6C6F63616C207370652O6C416374696F6E456E656D696573203D2063616368652E656E656D6965732E7370652O6C416374696F6E0D0A6C6F63616C207370652O6C456E656D696573203D2063616368652E656E656D6965732E7370652O6C0D0A6C6F63616C20756E6974494473203D207B0D0A2O20226172656E61222C0D0A2O2022626F2O73222C0D0A2O20226E616D65706C617465220D0A7D0D0A0D0A6C6F63616C2066756E6374696F6E20496E73657274417661696C61626C65556E69747328656E656D6965735461626C652C2072616E6765436865636B290D0A2O206C6F63616C20696E736572746564556E697473203D207B7D0D0A2O20666F722069203D20312C2023756E697449447320646F0D0A4O206C6F63616C20756E697473203D20756E69745B756E69744944735B692O5D0D0A4O20666F72205F2C2074686973556E697420696E20706169727328756E6974732920646F0D0A6O206C6F63616C2067756964203D2074686973556E69743A4755494428290D0A6O206966206E6F7420696E736572746564556E6974735B677569645D20616E642074686973556E69743A457869737473282920616E64206E6F742074686973556E69743A4973426C61636B6C6973746564282920616E64206E6F742074686973556E69743A497355736572426C61636B6C697374656428290D0A8O20616E64206E6F742074686973556E69743A4973446561644F7247686F7374282920616E6420706C617965723A43616E412O7461636B2874686973556E69742920616E642072616E6765436865636B2874686973556E697429207468656E0D0A8O207461626C652E696E7365727428656E656D6965735461626C652C2074686973556E6974290D0A8O20696E736572746564556E6974735B677569645D203D20747275650D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A646F0D0A2O206C6F63616C2072616E6765436865636B4279526164697573203D207B7D0D0A0D0A2O2066756E6374696F6E20706C617965723A476574456E656D696573496E52616E676528726164697573290D0A4O206C6F63616C20656E656D696573203D2072616E676564456E656D6965730D0A0D0A4O20696620656E656D6965735B7261646975735D207468656E2072657475726E20656E656D6965735B7261646975735D20656E640D0A4O206C6F63616C20656E656D6965735461626C65203D207B7D0D0A4O20656E656D6965735B7261646975735D203D20656E656D6965735461626C650D0A4O2069662023656E656D696573203E3D2031207468656E0D0A6O206C6F63616C207261646975736573203D207B7D0D0A6O20666F72206B65792C205F20696E20706169727328656E656D6965732920646F0D0A8O206966206B6579203E3D20726164697573207468656E207461626C652E696E736572742872616469757365732C206B65792920656E640D0A6O20656E640D0A6O20696620237261646975736573203E3D2031207468656E0D0A8O20696620237261646975736573203E3D2032207468656E207461626C652E736F72742872616469757365732C2066756E6374696F6E28612C2062292072657475726E2061203C206220656E642920656E640D0A8O20666F72205F2C2074686973556E697420696E20706169727328656E656D6965735B72616469757365735B312O5D2920646F0D0A9O202069662074686973556E69743A4973496E52616E67652872616469757329207468656E207461626C652E696E7365727428656E656D6965735461626C652C20756E69742920656E640D0A8O20656E640D0A0D0A8O2072657475726E20656E656D6965735461626C650D0A6O20656E640D0A4O20656E640D0A0D0A4O206C6F63616C2072616E6765436865636B203D2072616E6765436865636B42795261646975735B7261646975735D0D0A4O206966206E6F742072616E6765436865636B207468656E0D0A6O2072616E6765436865636B203D2066756E6374696F6E202874686973556E6974292072657475726E2074686973556E69743A4973496E52616E6765287261646975732920656E640D0A6O2072616E6765436865636B42795261646975735B7261646975735D203D2072616E6765436865636B0D0A4O20656E640D0A4O20496E73657274417661696C61626C65556E69747328656E656D6965735461626C652C2072616E6765436865636B290D0A0D0A4O2072657475726E20656E656D6965735461626C650D0A2O20656E640D0A656E640D0A0D0A646F0D0A2O206C6F63616C2072616E6765436865636B4279526164697573203D207B7D0D0A0D0A2O2066756E6374696F6E20706C617965723A476574456E656D696573496E4D656C2O6552616E676528726164697573290D0A4O206C6F63616C20656E656D696573203D206D656C2O65456E656D6965730D0A0D0A4O20696620656E656D6965735B7261646975735D207468656E2072657475726E20656E656D6965735B7261646975735D20656E640D0A0D0A4O206C6F63616C20656E656D6965735461626C65203D207B7D0D0A4O20656E656D6965735B7261646975735D203D20656E656D6965735461626C650D0A0D0A4O206C6F63616C2072616E6765436865636B203D2072616E6765436865636B42795261646975735B7261646975735D0D0A4O206966206E6F742072616E6765436865636B207468656E0D0A6O2072616E6765436865636B203D2066756E6374696F6E202874686973556E6974292072657475726E2074686973556E69743A4973496E4D656C2O6552616E6765287261646975732920656E640D0A6O2072616E6765436865636B42795261646975735B7261646975735D203D2072616E6765436865636B0D0A4O20656E640D0A4O20496E73657274417661696C61626C65556E69747328656E656D6965735461626C652C2072616E6765436865636B290D0A0D0A4O2072657475726E20656E656D6965735461626C650D0A2O20656E640D0A656E640D0A0D0A646F0D0A2O206C6F63616C2072616E6765436865636B42794964656E746966696572203D207B7D0D0A0D0A2O2066756E6374696F6E20706C617965723A476574456E656D696573496E5370652O6C52616E676528746869735370652O6C290D0A4O206C6F63616C206964656E746966696572203D20746869735370652O6C2E7370652O6C49440D0A4O206C6F63616C20656E656D696573203D207370652O6C456E656D6965730D0A0D0A4O20696620656E656D6965735B6964656E7469666965725D207468656E2072657475726E20656E656D6965735B6964656E7469666965725D20656E640D0A0D0A4O206C6F63616C20656E656D6965735461626C65203D207B7D0D0A4O20656E656D6965735B6964656E7469666965725D203D20656E656D6965735461626C650D0A0D0A4O206C6F63616C2072616E6765436865636B203D2072616E6765436865636B42794964656E7469666965725B6964656E7469666965725D0D0A4O206966206E6F742072616E6765436865636B207468656E0D0A6O2072616E6765436865636B203D2066756E6374696F6E202874686973556E6974292072657475726E2074686973556E69743A49735370652O6C496E52616E676528746869735370652O6C2920656E640D0A6O2072616E6765436865636B42794964656E7469666965725B6964656E7469666965725D203D2072616E6765436865636B0D0A4O20656E640D0A4O20496E73657274417661696C61626C65556E69747328656E656D6965735461626C652C2072616E6765436865636B290D0A0D0A4O2072657475726E20656E656D6965735461626C650D0A2O20656E640D0A656E640D0A0D0A646F0D0A2O206C6F63616C2072616E6765436865636B42794964656E746966696572203D207B7D0D0A0D0A2O2066756E6374696F6E20706C617965723A476574456E656D696573496E4974656D416374696F6E52616E676528746869734974656D290D0A4O206C6F63616C206964656E746966696572203D20746869734974656D2E6974656D49440D0A4O206C6F63616C20656E656D696573203D206974656D416374696F6E456E656D6965730D0A0D0A4O20696620656E656D6965735B6964656E7469666965725D207468656E2072657475726E20656E656D6965735B6964656E7469666965725D20656E640D0A0D0A4O206C6F63616C20656E656D6965735461626C65203D207B7D0D0A4O20656E656D6965735B6964656E7469666965725D203D20656E656D6965735461626C650D0A0D0A4O206C6F63616C2072616E6765436865636B203D2072616E6765436865636B42794964656E7469666965725B6964656E7469666965725D0D0A4O206966206E6F742072616E6765436865636B207468656E0D0A6O2072616E6765436865636B203D2066756E6374696F6E202874686973556E6974292072657475726E2074686973556E69743A49734974656D496E416374696F6E52616E676528746869734974656D2920656E640D0A6O2072616E6765436865636B42794964656E7469666965725B6964656E7469666965725D203D2072616E6765436865636B0D0A4O20656E640D0A4O20496E73657274417661696C61626C65556E69747328656E656D6965735461626C652C2072616E6765436865636B290D0A0D0A4O2072657475726E20656E656D6965735461626C650D0A2O20656E640D0A656E640D0A0D0A646F0D0A2O206C6F63616C2072616E6765436865636B42794964656E746966696572203D207B7D0D0A0D0A2O2066756E6374696F6E20706C617965723A476574456E656D696573496E5370652O6C416374696F6E52616E676528746869735370652O6C290D0A4O206C6F63616C206964656E746966696572203D20746869735370652O6C2E7370652O6C49440D0A4O206C6F63616C20656E656D696573203D207370652O6C416374696F6E456E656D6965730D0A0D0A4O20696620656E656D6965735B6964656E7469666965725D207468656E2072657475726E20656E656D6965735B6964656E7469666965725D20656E640D0A0D0A4O206C6F63616C20656E656D6965735461626C65203D207B7D0D0A4O20656E656D6965735B6964656E7469666965725D203D20656E656D6965735461626C650D0A0D0A4O206C6F63616C2072616E6765436865636B203D2072616E6765436865636B42794964656E7469666965725B6964656E7469666965725D0D0A4O206966206E6F742072616E6765436865636B207468656E0D0A6O2072616E6765436865636B203D2066756E6374696F6E202874686973556E6974292072657475726E2074686973556E69743A49735370652O6C496E416374696F6E52616E676528746869735370652O6C2920656E640D0A6O2072616E6765436865636B42794964656E7469666965725B6964656E7469666965725D203D2072616E6765436865636B0D0A4O20656E640D0A4O20496E73657274417661696C61626C65556E69747328656E656D6965735461626C652C2072616E6765436865636B290D0A0D0A4O2072657475726E20656E656D6965735461626C650D0A2O20656E640D0A656E640D0A00063O0012083O00013O001203000100024O00093O000200022O000500016O00015O00012O00063O00017O00",v9(),...);