local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110]=v83[v110](v83[v110 + 1 ]);elseif (v86==1) then local v113=v85[2];v78=(v113 + v84) -1 ;for v125=v113,v78 do local v126=v79[v125-v113 ];v83[v125]=v126;end else v83[v85[2]]=v85[3];end elseif (v86<=4) then if (v86==3) then local v116;local v117;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v83[v117]=v83[v117](v83[v117 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v78=(v117 + v84) -1 ;for v128=v117,v78 do v116=v79[v128-v117 ];v83[v128]=v116;end v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v83[v117](v13(v83,v117 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86==5) then local v123=v85[2];v83[v123](v13(v83,v123 + 1 ,v78));else do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67036A212O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C206361636865203D2057522E63616368650D0A6C6F63616C20646263203D2057522E6462630D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A0D0A6C6F63616C2072616E67655461626C65427954797065203D207B0D0A2O206D656C2O65203D207B0D0A4O20686F7374696C65203D207B0D0A6O2072616E6765496E646578203D207B7D2C0D0A6O206974656D52616E6765203D207B7D0D0A4O207D2C0D0A4O20667269656E646C79203D207B0D0A6O2072616E6765496E646578203D207B7D2C0D0A6O206974656D52616E6765203D207B7D0D0A4O207D0D0A2O207D2C0D0A2O2072616E676564203D207B0D0A4O20686F7374696C65203D207B0D0A6O2072616E6765496E646578203D207B7D2C0D0A6O206974656D52616E6765203D207B7D0D0A4O207D2C0D0A4O20667269656E646C79203D207B0D0A6O2072616E6765496E646578203D207B7D2C0D0A6O206974656D52616E6765203D207B7D0D0A4O207D0D0A2O207D0D0A7D0D0A0D0A646F0D0A2O206C6F63616C207479706573203D207B20226D656C2O65222C202272616E67656422207D0D0A0D0A2O206C6F63616C2066756E6374696F6E20536F72744D6978656441534328612C2062290D0A4O2069662074797065286129202O3D2022737472696E672220616E642074797065286229202O3D20226E756D62657222207468656E0D0A6O2072657475726E2061203C20746F737472696E672862290D0A4O20656C736569662074797065286129202O3D20226E756D6265722220616E642074797065286229202O3D2022737472696E6722207468656E0D0A6O2072657475726E2062203C20746F737472696E672861290D0A4O20656C73650D0A6O2072657475726E2061203C20620D0A4O20656E640D0A2O20656E640D0A0D0A2O20666F72205F2C207479706520696E2070616972732874797065732920646F0D0A4O206C6F63616C206974656D52616E6765203D206462632E6974656D52616E67655B747970655D0D0A4O206C6F63616C20686F7374696C652C20667269656E646C79203D2072616E67655461626C654279547970655B747970655D2E686F7374696C652C2072616E67655461626C654279547970655B747970655D2E667269656E646C790D0A0D0A4O202O2D204D6170207468652072616E676520696E646963657320616E6420736F7274207468656D2073696E636520746865206F72646572206973206E6F742067756172616E742O65642E0D0A4O20686F7374696C652E72616E6765496E646578203D207B20756E7061636B286974656D52616E67652E686F7374696C652E72616E6765496E64657829207D0D0A4O207461626C652E736F727428686F7374696C652E72616E6765496E6465782C20536F72744D69786564415343290D0A4O20667269656E646C792E72616E6765496E646578203D207B20756E7061636B286974656D52616E67652E667269656E646C792E72616E6765496E64657829207D0D0A4O207461626C652E736F727428667269656E646C792E72616E6765496E6465782C20536F72744D69786564415343290D0A0D0A4O202O2D2054616B652072616E646F6D6C79206F6E65206974656D20666F7220656163682072616E67652E0D0A4O20666F72206B2C207620696E207061697273286974656D52616E67652E686F7374696C652E6974656D52616E67652920646F0D0A6O20686F7374696C652E6974656D52616E67655B6B5D203D20765B6D6174682E72616E646F6D28312C202376295D0D0A4O20656E640D0A4O20666F72206B2C207620696E207061697273286974656D52616E67652E667269656E646C792E6974656D52616E67652920646F0D0A6O20667269656E646C792E6974656D52616E67655B6B5D203D20765B6D6174682E72616E646F6D28312C202376295D0D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2072616E67655461626C6542795370652O6C203D207B7D0D0A72616E67655461626C6542795370652O6C203D207B0D0A2O2057412O52494F52203D207B0D0A4O20667269656E646C79203D207B7D0D0A2O207D2C0D0A2O2050414C4144494E203D207B0D0A4O20667269656E646C79203D207B0D0A6O2072616E6765496E646578203D207B0D0A8O2034300D0A6O207D2C0D0A6O207370652O6C52616E6765203D207B0D0A8O205B34305D203D207B0D0A9O202031393735302C202O2D20466C617368206F66204C696768740D0A9O202038353637332C202O2D20576F7264206F6620476C6F72790D0A9O2020343938372C202O2D20436C65616E73652028486F6C79290D0A9O2020323133362O342C202O2D20436C65616E736520546F78696E73202852657472692C2050726F74290D0A9O202032303437332C202O2D20486F6C792053686F636B0D0A8O207D2C0D0A6O207D2C0D0A4O207D0D0A2O207D2C0D0A2O2048554E544552203D207B0D0A4O20667269656E646C79203D207B0D0A6O2072616E6765496E646578203D207B0D0A8O2034300D0A6O207D2C0D0A6O207370652O6C52616E6765203D207B0D0A8O205B34305D203D207B0D0A9O2020332O342O372C202O2D204D6973646972656374696F6E0D0A8O207D2C0D0A6O207D2C0D0A4O207D0D0A2O207D2C0D0A2O20524F475545203D207B0D0A4O20667269656E646C79203D207B0D0A6O2072616E6765496E646578203D207B0D0A8O2034300D0A6O207D2C0D0A6O207370652O6C52616E6765203D207B0D0A8O205B34305D203D207B0D0A9O202035373933342C202O2D20547269636B73206F66207468652054726164650D0A8O207D2C0D0A6O207D2C0D0A4O207D0D0A2O207D2C0D0A2O20505249455354203D207B0D0A4O20667269656E646C79203D207B0D0A6O2072616E6765496E646578203D207B0D0A8O2034300D0A6O207D2C0D0A6O207370652O6C52616E6765203D207B0D0A8O205B34305D203D207B0D0A9O202032313536322C202O2D20506F77657220576F72643A20466F727469747564650D0A9O202031372C202O2D20506F77657220576F72643A20536869656C640D0A9O2020323036312C202O2D20466C617368204865616C0D0A9O2020322O30362C202O2D20526573752O72656374696F6E0D0A8O207D2C0D0A6O207D2C0D0A4O207D0D0A2O207D2C0D0A2O2044454154484B4E49474854203D207B0D0A4O20667269656E646C79203D207B0D0A6O20667269656E646C79203D207B0D0A8O2072616E6765496E646578203D207B0D0A9O202034300D0A8O207D2C0D0A8O207370652O6C52616E6765203D207B0D0A9O20205B34305D203D207B0D0A9O203O2036313O392C202O2D20526169736520412O6C790D0A9O20207D2C0D0A8O207D2C0D0A6O207D2C0D0A4O207D0D0A2O207D2C0D0A2O205348414D414E203D207B0D0A4O20667269656E646C79203D207B0D0A6O2072616E6765496E646578203D207B0D0A8O2034300D0A6O207D2C0D0A6O207370652O6C52616E6765203D207B0D0A8O205B34305D203D207B0D0A9O2020382O30342C202O2D204865616C696E672053757267652028526573746F2C20456C65290D0A9O2020312O383037302C202O2D204865616C696E672053757267652028456E68616E636572290D0A8O207D2C0D0A6O207D2C0D0A4O207D0D0A2O207D2C0D0A2O204D414745203D207B0D0A4O20667269656E646C79203D207B7D0D0A2O207D2C0D0A2O205741524C4F434B203D207B0D0A4O20667269656E646C79203D207B7D0D0A2O207D2C0D0A2O204D4F4E4B203D207B0D0A4O20667269656E646C79203D207B0D0A6O2072616E6765496E646578203D207B0D0A8O2034300D0A6O207D2C0D0A6O207370652O6C52616E6765203D207B0D0A8O205B34305D203D207B0D0A9O20202O31353435302C202O2D204465746F780D0A9O20202O312O3637302C202O2D205669766966790D0A8O207D2C0D0A6O207D2C0D0A4O207D0D0A2O207D2C0D0A2O204452554944203D207B0D0A4O20667269656E646C79203D207B0D0A6O2072616E6765496E646578203D207B0D0A8O2034300D0A6O207D2C0D0A6O207370652O6C52616E6765203D207B0D0A8O205B34305D203D207B0D0A9O2020383933362C202O2D20526567726F7774680D0A8O207D2C0D0A6O207D2C0D0A4O207D0D0A2O207D2C0D0A2O2044454D4F4E48554E544552203D207B0D0A4O20667269656E646C79203D207B7D0D0A2O207D2C0D0A2O2045564F4B4552203D207B0D0A4O20667269656E646C79203D207B0D0A6O2072616E6765496E646578203D207B0D0A8O2032352C2033300D0A6O207D2C0D0A6O207370652O6C52616E6765203D207B0D0A8O205B32355D203D207B0D0A9O20203336313436392C202O2D204C6976696E6720466C616D650D0A8O207D2C0D0A8O205B33305D203D207B0D0A9O20203336303832332C202O2D204E61747572616C697A652028507265736572766572290D0A8O207D2C0D0A6O207D2C0D0A4O207D2C0D0A2O207D2C0D0A7D0D0A0D0A66756E6374696F6E20756E69743A4973496E52616E67652864697374616E6365290D0A2O20612O7365727428747970652864697374616E636529202O3D20226E756D626572222C202244697374616E6365206D7573742062652061206E756D6265722E22290D0A2O2064697374616E6365203D206D6174682E6D617828352C206D6174682E6D696E28312O302C2064697374616E63652O290D0A2O20612O736572742864697374616E6365203E3D203520616E642064697374616E6365203C3D20312O302C202244697374616E6365206D75737420626520626574772O656E203520616E6420312O302E22290D0A0D0A2O206C6F63616C2067756964203D2073656C663A4755494428290D0A2O206966206E6F742067756964207468656E0D0A4O2072657475726E2066616C73650D0A2O20656E640D0A0D0A2O206C6F63616C20756E6974496E666F203D2063616368652E756E6974496E666F5B677569645D0D0A2O206966206E6F7420756E6974496E666F207468656E0D0A4O20756E6974496E666F203D207B7D0D0A4O2063616368652E756E6974496E666F5B677569645D203D20756E6974496E666F0D0A2O20656E640D0A2O206C6F63616C20756E6974496E666F4973496E52616E6765203D20756E6974496E666F2E6973496E52616E67650D0A2O206966206E6F7420756E6974496E666F4973496E52616E6765207468656E0D0A4O20756E6974496E666F4973496E52616E6765203D207B7D0D0A4O20756E6974496E666F2E6973496E52616E6765203D20756E6974496E666F4973496E52616E67650D0A2O20656E640D0A0D0A2O206C6F63616C206964656E746966696572203D2064697374616E63650D0A2O206C6F63616C206973496E52616E6765203D20756E6974496E666F4973496E52616E67655B6964656E7469666965725D0D0A2O206966206973496E52616E6765202O3D206E696C207468656E0D0A4O206C6F63616C20636C612O73203D2063616368652E70657273697374656E742E706C617965722E636C612O735B325D0D0A4O206C6F63616C2072616E67655461626C65427952616E676564203D2072616E67655461626C654279547970652E72616E6765640D0A4O206C6F63616C2072616E67655461626C65203D20706C617965723A43616E412O7461636B2873656C662920616E642072616E67655461626C65427952616E6765642E686F7374696C65206F722028496E436F6D6261744C6F636B646F776E282920616E642072616E67655461626C6542795370652O6C5B636C612O735D2E667269656E646C79206F722072616E67655461626C65427952616E6765642E667269656E646C79290D0A4O206966206E6F742072616E67655461626C652E72616E6765496E646578207468656E0D0A6O2072657475726E2066616C73650D0A4O20656E640D0A4O206C6F63616C206974656D52616E6765203D2072616E67655461626C652E6974656D52616E67650D0A4O206C6F63616C207370652O6C52616E6765203D2072616E67655461626C652E7370652O6C52616E67650D0A0D0A4O206966206974656D52616E6765207E3D206E696C207468656E0D0A6O206966206E6F74206974656D52616E67655B64697374616E63655D207468656E0D0A8O206C6F63616C2072616E6765496E646578203D2072616E67655461626C652E72616E6765496E6465780D0A8O20666F722069203D202372616E6765496E6465782C20312C202D3120646F0D0A9O20206C6F63616C2072616E6765203D2072616E6765496E6465785B695D0D0A9O202069662072616E6765202O3D2064697374616E6365207468656E0D0A9O203O20627265616B0D0A9O2020656E640D0A9O202069662072616E6765203C2064697374616E6365207468656E0D0A9O203O2064697374616E6365203D2072616E67650D0A9O203O20627265616B0D0A9O2020656E640D0A8O20656E640D0A6O20656E640D0A0D0A6O206973496E52616E6765203D2049734974656D496E52616E6765286974656D52616E67655B64697374616E63655D2C2073656C663A4944282O290D0A4O20656C73656966207370652O6C52616E6765207E3D206E696C207468656E0D0A6O202O2D2044657465726D696E652077686174207370652O6C20746F2075736520746F20636865636B2072616E67650D0A6O206C6F63616C20636865636B5370652O6C0D0A6O206C6F63616C2072616E6765496E646578203D2072616E67655461626C652E72616E6765496E6465780D0A6O20666F722069203D202372616E6765496E6465782C20312C202D3120646F0D0A8O206C6F63616C2072616E6765203D2072616E6765496E6465785B695D0D0A8O2069662072616E6765203C3D2064697374616E6365207468656E0D0A9O2020666F72205F2C207370652O6C494420696E207061697273287370652O6C52616E67655B72616E67655D2920646F0D0A9O203O206966207370652O6C287370652O6C4944293A49734C6561726E65642829207468656E0D0A9O205O20636865636B5370652O6C203D207370652O6C287370652O6C4944290D0A9O205O20627265616B0D0A9O203O20656E640D0A9O2020656E640D0A9O202064697374616E6365203D2072616E6765202D20310D0A8O20656E640D0A8O20696620636865636B5370652O6C207468656E0D0A9O2020627265616B0D0A8O20656E640D0A6O20656E640D0A0D0A6O202O2D20436865636B207468652072616E67650D0A6O206966206E6F7420636865636B5370652O6C207468656E0D0A8O2072657475726E2066616C73650D0A6O20656E640D0A6O206973496E52616E6765203D2073656C663A49735370652O6C496E52616E676528636865636B5370652O6C290D0A4O20656E640D0A0D0A4O20756E6974496E666F4973496E52616E67655B6964656E7469666965725D203D206973496E52616E67650D0A2O20656E640D0A0D0A2O2072657475726E206973496E52616E67650D0A656E640D0A0D0A66756E6374696F6E20756E69743A4973496E4D656C2O6552616E67652864697374616E6365290D0A2O20612O7365727428747970652864697374616E636529202O3D20226E756D626572222C202244697374616E6365206D7573742062652061206E756D6265722E22290D0A2O2064697374616E6365203D206D6174682E6D617828352C206D6174682E6D696E28312O302C2064697374616E63652O290D0A2O20612O736572742864697374616E6365203E3D203520616E642064697374616E6365203C3D20312O302C202244697374616E6365206D75737420626520626574772O656E203520616E6420312O302E22290D0A0D0A2O202O2D2041742074686973206D6F6D656E742077652063612O6E6F7420636865636B206D756C7469706C65206D656C2O652072616E67652028352C20382C203130292C206F6E6C79207468652035796473206F6E652066726F6D20746865206974656D2E0D0A2O202O2D20536F20776520757365207468652072616E676564206974656D207768696C6520737562737472616374696E6720312E35792C2077686963682069732074686520706C6179657220686974626F78207261646975732E0D0A2O206966202864697374616E6365207E3D203529207468656E0D0A4O2072657475726E2073656C663A4973496E52616E67652864697374616E6365202D20312E35290D0A2O20656E640D0A0D0A2O206C6F63616C2067756964203D2073656C663A4755494428290D0A2O206966206E6F742067756964207468656E0D0A4O2072657475726E2066616C73650D0A2O20656E640D0A0D0A2O202O2D20496620696E20636F6D62617420616E642074617267657420697320667269656E646C792C2072657475726E2066616C736520666F72206E6F772E0D0A2O202O2D20544F444F3A20436F6D65207570207769746820667269656E646C7920747261636B696E67207768696C6520696E20636F6D6261742E0D0A2O20696620496E436F6D6261744C6F636B646F776E282920616E64206E6F7420706C617965723A43616E412O7461636B2873656C6629207468656E0D0A4O2072657475726E2066616C73650D0A2O20656E640D0A0D0A2O206C6F63616C2072616E67655461626C6542794D656C2O65203D2072616E67655461626C654279547970652E6D656C2O650D0A2O206C6F63616C2072616E67655461626C65203D20706C617965723A43616E412O7461636B2873656C662920616E642072616E67655461626C6542794D656C2O652E686F7374696C65206F722072616E67655461626C6542794D656C2O652E667269656E646C790D0A2O206C6F63616C206974656D52616E6765203D2072616E67655461626C652E6974656D52616E67650D0A0D0A2O2072657475726E2049734974656D496E52616E6765286974656D52616E67655B64697374616E63655D2C2073656C663A4944282O290D0A656E640D0A0D0A66756E6374696F6E20756E69743A49735370652O6C496E52616E676528746869735370652O6C290D0A2O206C6F63616C2067756964203D2073656C663A4755494428290D0A2O206966206E6F742067756964207468656E0D0A4O2072657475726E2066616C73650D0A2O20656E640D0A2O20696620746869735370652O6C3A422O6F6B496E6465782829202O3D206E696C207468656E0D0A4O2072657475726E2066616C73650D0A2O20656E640D0A0D0A2O2072657475726E2049735370652O6C496E52616E676528746869735370652O6C3A422O6F6B496E64657828292C20746869735370652O6C3A422O6F6B5479706528292C2073656C663A4944282O29202O3D20310D0A656E640D0A0D0A66756E6374696F6E20756E69743A4973416374696F6E496E52616E676528616374696F6E536C6F74290D0A2O2072657475726E204973416374696F6E496E52616E676528616374696F6E536C6F742C2073656C663A4944282O290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2046696E6452616E67652874686973556E69742C206D6178290D0A2O206C6F63616C20636C612O73203D2063616368652E70657273697374656E742E706C617965722E636C612O735B325D0D0A2O206C6F63616C2072616E67655461626C65427952616E676564203D2072616E67655461626C654279547970652E72616E6765640D0A2O206C6F63616C2072616E67655461626C65203D20706C617965723A43616E412O7461636B2874686973556E69742920616E642072616E67655461626C65427952616E6765642E686F7374696C65206F722028496E436F6D6261744C6F636B646F776E282920616E642072616E67655461626C6542795370652O6C5B636C612O735D2E667269656E646C79206F722072616E67655461626C65427952616E6765642E667269656E646C79290D0A2O206C6F63616C2072616E6765496E646578203D2072616E67655461626C652E72616E6765496E6465780D0A2O206966206E6F742072616E6765496E646578207468656E0D0A4O2072657475726E206E696C0D0A2O20656E640D0A0D0A2O20666F722069203D202372616E6765496E646578202D20286D617820616E642031206F722030292C20312C202D3120646F0D0A4O206966206E6F742074686973556E69743A4973496E52616E67652872616E6765496E6465785B695D29207468656E0D0A6O2072657475726E206D617820616E642072616E6765496E6465785B69202B20315D206F722072616E6765496E6465785B695D0D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E20756E69743A4D696E44697374616E636528290D0A2O2072657475726E2046696E6452616E67652873656C66290D0A656E640D0A0D0A66756E6374696F6E20756E69743A4D617844697374616E636528290D0A2O2072657475726E2046696E6452616E67652873656C662C2074727565290D0A656E640D0A00063O0012033O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);