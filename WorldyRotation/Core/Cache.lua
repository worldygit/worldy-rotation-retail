local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));elseif (v86>1) then local v116=v85[2];v83[v116]=v83[v116](v83[v116 + 1 ]);else v83[v85[2]]=v59[v85[3]];end elseif (v86<=3) then local v112=v85[2];v83[v112]=v83[v112](v83[v112 + 1 ]);elseif (v86>4) then v83[v85[2]]=v85[3];else v83[v85[2]]=v85[3];end elseif (v86<=8) then if (v86<=6) then do return;end elseif (v86>7) then v83[v85[2]]=v59[v85[3]];else do return;end end elseif (v86<=9) then local v114=v85[2];v83[v114](v13(v83,v114 + 1 ,v78));elseif (v86==10) then local v126=v85[2];v78=(v126 + v84) -1 ;for v130=v126,v78 do local v131=v79[v130-v126 ];v83[v130]=v131;end else local v127=v85[2];v78=(v127 + v84) -1 ;for v133=v127,v78 do local v134=v79[v133-v127 ];v83[v133]=v134;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67037B1A2O006C6F63616C206361636865203D2057522E63616368650D0A0D0A63616368652E61706C566172203D207B7D0D0A63616368652E656E656D696573203D207B206974656D416374696F6E203D207B7D2C206D656C2O65203D207B7D2C2072616E676564203D207B7D2C207370652O6C203D207B7D2C207370652O6C416374696F6E203D207B7D207D0D0A63616368652E67756964496E666F203D207B7D0D0A63616368652E6D697363496E666F203D207B7D0D0A63616368652E7370652O6C496E666F203D207B7D0D0A63616368652E6974656D496E666F203D207B7D0D0A63616368652E756E6974496E666F203D207B7D0D0A63616368652E70657273697374656E74203D207B0D0A2O2065717569706D656E74203D207B7D2C0D0A2O20706C61796572203D207B0D0A4O20636C612O73203D207B20556E6974436C612O732822706C617965722229207D2C0D0A4O2073706563203D207B7D0D0A2O207D2C0D0A2O20622O6F6B496E646578203D207B20706574203D207B7D2C20706C61796572203D207B7D207D2C0D0A2O207370652O6C4C6561726E6564203D207B20706574203D207B7D2C20706C61796572203D207B7D207D2C0D0A2O2074657874757265203D207B207370652O6C203D207B7D2C206974656D203D207B7D2C20637573746F6D203D207B7D207D2C0D0A2O20656C765549506167696E67203D207B20506167696E67537472696E672C20706167696E67537472696E6773203D207B7D2C20706167696E6742617273203D207B7D207D2C0D0A2O2074616C656E7473203D207B2052616E6B207D0D0A7D0D0A0D0A63616368652E686173422O656E5265736574203D2066616C73650D0A66756E6374696F6E2063616368652E526573657428290D0A2O206966206E6F742063616368652E686173422O656E5265736574207468656E0D0A4O207461626C652E776970652863616368652E61706C566172290D0A4O207461626C652E776970652863616368652E656E656D6965732E6974656D416374696F6E290D0A4O207461626C652E776970652863616368652E656E656D6965732E6D656C2O65290D0A4O207461626C652E776970652863616368652E656E656D6965732E72616E676564290D0A4O207461626C652E776970652863616368652E656E656D6965732E7370652O6C290D0A4O207461626C652E776970652863616368652E656E656D6965732E7370652O6C416374696F6E290D0A4O207461626C652E776970652863616368652E67756964496E666F290D0A4O207461626C652E776970652863616368652E6D697363496E666F290D0A4O207461626C652E776970652863616368652E7370652O6C496E666F290D0A4O207461626C652E776970652863616368652E6974656D496E666F290D0A4O207461626C652E776970652863616368652E756E6974496E666F290D0A0D0A4O2063616368652E686173422O656E5265736574203D20747275650D0A2O20656E640D0A656E640D0A0D0A6C6F63616C206D616B6543616368650D0A646F0D0A2O206C6F63616C2073656C656374203D2073656C6563740D0A0D0A2O206C6F63616C2066756E6374696F6E206D616B6541726773286E290D0A4O206C6F63616C2061726773203D207B7D0D0A4O20666F722069203D20312C206E20646F0D0A6O20617267735B695D203D20737472696E672E666F726D61742822612564222C2069290D0A4O20656E640D0A4O2072657475726E20617267730D0A2O20656E640D0A0D0A2O206C6F63616C2066756E6374696F6E206D616B65496E6974537472696E6728617267732C207374617274290D0A4O206C6F63616C206E203D2023617267730D0A4O206C6F63616C2074203D207B7D0D0A4O20666F722069203D2073746172742C206E202D203120646F0D0A6O20745B2374202B20315D203D20275B27202O2E20617267735B695D202O2E20275D203D207B20270D0A4O20656E640D0A4O20745B2374202B20315D203D20275B27202O2E20617267735B6E5D202O2E20275D203D2076616C270D0A4O20666F722069203D2073746172742C206E202D203120646F0D0A6O20745B2374202B20315D203D2027207D270D0A4O20656E640D0A4O2072657475726E207461626C652E636F6E6361742874290D0A2O20656E640D0A0D0A2O206C6F63616C2066756E6374696F6E206D616B6547652O746572286E290D0A4O206966206E202O3D2031207468656E0D0A6O2072657475726E202272657475726E2066756E6374696F6E28617267292072657475726E2063616368655B6172675D20656E64220D0A4O20656E640D0A0D0A4O206C6F63616C2061726773203D206D616B6541726773286E290D0A4O206C6F63616C20636865636B73203D207B7D0D0A4O20666F722069203D20312C206E202D203120646F0D0A6O20636865636B735B695D203D20737472696E672E666F726D617428226C6F63616C20632564203D206325645B25735D206966206E6F7420632564207468656E2072657475726E206E696C20656E64222C0D0A9O2020692C2069202D20312C20617267735B695D2C2069290D0A4O20656E640D0A0D0A4O2072657475726E20737472696E672E666F726D6174285B3D5B0D0A72657475726E2066756E6374696F6E282573290D0A2O206C6F63616C206330203D2063616368650D0A2O2025730D0A2O2072657475726E206325645B25735D0D0A656E645D3D5D2C0D0A8O207461626C652E636F6E63617428617267732C20272C27292C0D0A8O207461626C652E636F6E63617428636865636B732C20275C6E2O2027292C0D0A8O206E202D20312C20617267735B23617267735D290D0A2O20656E640D0A0D0A2O206C6F63616C2066756E6374696F6E206D616B6553652O746572286E290D0A4O206966206E202O3D2031207468656E0D0A6O2072657475726E202272657475726E2066756E6374696F6E2876616C2C20617267292063616368655B6172675D203D2076616C2072657475726E2076616C20656E64220D0A4O20656E640D0A0D0A4O206C6F63616C2061726773203D206D616B6541726773286E290D0A4O206C6F63616C20696E697469616C697A657273203D207B7D0D0A4O20666F722069203D20312C206E202D203120646F0D0A6O20696E697469616C697A6572735B695D203D20737472696E672E666F726D617428226C6F63616C20632564203D206325645B25735D206966206E6F7420632564207468656E206325645B25735D203D207B202573207D2072657475726E2076616C20656E64222C0D0A9O2020692C2069202D20312C20617267735B695D2C20692C2069202D20312C20617267735B695D2C206D616B65496E6974537472696E6728617267732C2069202B20312O290D0A4O20656E640D0A0D0A4O2072657475726E20737472696E672E666F726D6174285B3D5B0D0A72657475726E2066756E6374696F6E2876616C2C202573290D0A2O206C6F63616C206330203D2063616368650D0A2O2025730D0A2O206325645B25735D203D2076616C0D0A2O2072657475726E2076616C0D0A656E645D3D5D2C0D0A8O207461626C652E636F6E63617428617267732C20272C27292C0D0A8O207461626C652E636F6E63617428696E697469616C697A6572732C20275C6E2O2027292C0D0A8O206E202D20312C20617267735B23617267735D290D0A2O20656E640D0A0D0A2O206C6F63616C2066756E6374696F6E206D616B6547657453652O746572286E290D0A4O206C6F63616C2061726773203D206D616B6541726773286E290D0A4O206C6F63616C20696E697469616C697A657273203D207B7D0D0A4O20666F722069203D20312C206E202D203120646F0D0A6O20696E697469616C697A6572735B695D203D20737472696E672E666F726D617428226C6F63616C20632564203D206325645B25735D206966206E6F7420632564207468656E206C6F63616C2076616C203D2066756E632829206325645B25735D203D207B202573207D2072657475726E2076616C20656E64222C0D0A9O2020692C2069202D20312C20617267735B695D2C20692C2069202D20312C20617267735B695D2C206D616B65496E6974537472696E6728617267732C2069202B20312O290D0A4O20656E640D0A0D0A4O2072657475726E20737472696E672E666F726D6174285B3D5B0D0A72657475726E2066756E6374696F6E2866756E632C202573290D0A2O206C6F63616C206330203D2063616368650D0A2O2025730D0A2O206C6F63616C2076616C203D206325645B25735D0D0A2O2069662076616C202O3D206E696C207468656E0D0A4O2076616C203D2066756E6328290D0A4O206325645B25735D203D2076616C0D0A2O20656E640D0A2O2072657475726E2076616C0D0A656E645D3D5D2C0D0A8O207461626C652E636F6E63617428617267732C20272C27292C0D0A8O207461626C652E636F6E63617428696E697469616C697A6572732C20275C6E2O2027292C0D0A8O206E202D20312C20617267735B23617267735D2C206E202D20312C20617267735B23617267735D290D0A2O20656E640D0A0D0A2O206C6F63616C2066756E6374696F6E20696E6974476C6F62616C2866756E63290D0A4O2072657475726E207365746D6574617461626C65287B7D2C207B0D0A6O202O5F696E646578203D2066756E6374696F6E2874626C2C206B6579290D0A8O2074626C5B6B65795D203D206C6F6164737472696E672866756E63286B65792O290D0A8O2072657475726E2074626C5B6B65795D0D0A6O20656E640D0A4O207D290D0A2O20656E640D0A0D0A2O206C6F63616C20636163686547652O74657273203D20696E6974476C6F62616C286D616B6547652O746572290D0A2O206C6F63616C20636163686553652O74657273203D20696E6974476C6F62616C286D616B6553652O746572290D0A2O206C6F63616C20636163686547657453652O74657273203D20696E6974476C6F62616C286D616B6547657453652O746572290D0A0D0A2O202O2D2O5B0D0A4O204D61696E206361636865206372656174696F6E2066756E6374696F6E0D0A4O2052657475726E732061207461626C65207769746820332066756E6374696F6E733A0D0A0D0A6O20476574283O2E290D0A8O2052657475726E73207468652076616C7565206F72206E696C2069662069742773206E6F74206361636865640D0A0D0A6O20536574283O2E2C2076616C290D0A8O2053657473207468652076616C756520617420676976656E207061746820746F204076616C2C2072657475726E73204076616C0D0A0D0A6O20476574536574283O2E2C205B66756E635D290D0A8O205370656369616C2067652O74657220746861742063616E20616C736F202A7365742A207468652076616C75652069662069742773206E696C2C2063612O6C696E67204066756E6320696E207468652070726F63652O7320286C617A696C79290D0A8O20546865206265686176696F72206973207472692O6765726564206F6E6C7920696620746865206C61737420617267756D656E7420746F20697420697320612066756E6374696F6E2C20776F726B7320617320476574206F74686572776973650D0A0D0A4O2043612O6C696E670D0A6O202E536574282741272C202742272C20322C202743272C203432290D0A4O206973206261736963612O6C79206571756976616C656E7420746F0D0A6O2063616368655B2741275D5B2742275D5B325D5B2743275D203D2034320D0A4O2077686963682063726561746573207461626C6573206173206E2O656465640D0A0D0A4O205479706963616C2075736167652069733A0D0A6O202E476574536574282741272C2035332C202742272C0D0A9O205O2066756E6374696F6E28292072657475726E204765745370652O6C506F776572436F7374283533295B315D20656E64290D0A4O2077686963682077692O6C2072657475726E207468652076616C756520696620697427732063616368656420616E64206C617A696C7920696E697469616C697A652069742069662069742773206E6F740D0A2O202O5D0D0A2O206D616B654361636865203D2066756E6374696F6E286361636865290D0A4O206C6F63616C2066756E6374696F6E20696E69742870726F746F290D0A6O206C6F63616C2066756E6374696F6E206D616B6546756E63286E290D0A8O206C6F63616C2066756E63203D2070726F746F5B6E5D0D0A8O2073657466656E762866756E632C207B205B276361636865275D203D206361636865207D290D0A8O2072657475726E2073656C65637428322C207063612O6C2866756E632O290D0A6O20656E640D0A0D0A6O206C6F63616C206D6170203D207B7D0D0A6O20666F722069203D20312C203720646F0D0A8O206D61705B236D6170202B20315D203D206D616B6546756E632869290D0A6O20656E640D0A6O2072657475726E207365746D6574617461626C65286D61702C207B0D0A8O202O5F696E646578203D2066756E6374696F6E2874626C2C206B6579290D0A9O202074626C5B6B65795D203D206D616B6546756E63286B6579290D0A9O202072657475726E2074626C5B6B65795D0D0A8O20656E640D0A6O207D290D0A4O20656E640D0A0D0A4O206C6F63616C2067652O74657273203D20696E697428636163686547652O74657273290D0A4O206C6F63616C2073652O74657273203D20696E697428636163686553652O74657273290D0A4O206C6F63616C2067657473652O74657273203D20696E697428636163686547657453652O74657273290D0A4O2072657475726E207B0D0A6O20476574203D2066756E6374696F6E283O2E290D0A8O2072657475726E2067652O746572735B73656C656374282723272C203O2E295D283O2E290D0A6O20656E642C0D0A6O20536574203D2066756E6374696F6E283O2E290D0A8O206C6F63616C206E203D2073656C656374282723272C203O2E290D0A8O20612O73657274286E203E20312C202273652O7465722065787065637473206174206C65617374203220706172616D657465727322290D0A8O2072657475726E2073652O746572735B6E202D20315D2873656C656374286E2C203O2E292C203O2E290D0A6O20656E642C0D0A6O20476574536574203D2066756E6374696F6E283O2E290D0A8O206C6F63616C206E203D2073656C656374282723272C203O2E290D0A8O206C6F63616C206C617374203D2073656C656374286E2C203O2E290D0A8O206966206E203E203120616E642074797065286C61737429202O3D202766756E6374696F6E27207468656E0D0A9O202072657475726E2067657473652O746572735B6E202D20315D286C6173742C203O2E290D0A8O20656C73650D0A9O202072657475726E2067652O746572735B6E5D283O2E290D0A8O20656E640D0A6O20656E642C0D0A4O207D0D0A2O20656E640D0A656E640D0A0D0A6C6F63616C206361636865496D706C203D206D616B654361636865286361636865290D0A0D0A2O2D205075626C69632066756E6374696F6E20746F2074727920746F2067657420612076616C75652066726F6D207468652063616368652066726F6D206120676976656E20706174682E0D0A2O2D2052657475726E73207468652076616C7565206F72206E696C2069662069742773206E6F74206361636865642E0D0A2O2D20496620746865206C61737420617267756D656E7420697320612066756E6374696F6E207468656E207468652076616C75652069732073657420746F206974732072657475726E2069662069742773206E696C2E0D0A2O2D205479706963616C2075736167652069733A0D0A2O2D4O2072657475726E2063616368652E47657428225370652O6C496E666F222C2035332C2022436F73745461626C652229202O2D20696620796F75206E2O6564206F6E6C7920746865206361636865642076616C75650D0A2O2D4O2072657475726E2063616368652E47657428225370652O6C496E666F222C2035332C2022436F73745461626C65222C0D0A2O2D9O209O203O2066756E6374696F6E28292072657475726E204765745370652O6C506F776572436F7374283533295B315D20656E6429202O2D20696620796F7520686176652061202266612O6C6261636B222076616C75650D0A66756E6374696F6E2063616368652E476574283O2E290D0A2O2072657475726E206361636865496D706C2E476574536574283O2E290D0A656E640D0A0D0A2O2D205075626C69632066756E6374696F6E20746F20612O7369676E20612076616C756520696E207468652063616368652066726F6D206120676976656E20706174682E0D0A2O2D20416C776179732072657475726E732074686520556E63616368656456616C7565202862757420636163686520697420666F722066757475726520757361676520776974682063616368652E476574292E0D0A2O2D205479706963616C207573616765206973203A2072657475726E2063616368652E53657428225370652O6C496E666F222C2035332C2022436F73745461626C65222C204765745370652O6C506F776572436F7374283533295B315D290D0A66756E6374696F6E2063616368652E536574283O2E290D0A2O2072657475726E206361636865496D706C2E536574283O2E290D0A656E640D0A00063O0012013O00013O001204000100024O00033O000200022O000B00016O00095O00012O00063O00017O00",v9(),...);