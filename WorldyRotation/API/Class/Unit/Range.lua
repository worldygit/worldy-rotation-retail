local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110](v13(v83,v110 + 1 ,v78));elseif (v86>1) then local v112=v85[2];v78=(v112 + v84) -1 ;for v125=v112,v78 do local v126=v79[v125-v112 ];v83[v125]=v126;end elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86<=4) then if (v86>3) then v83[v85[2]]=v85[3];else do return;end end elseif (v86==5) then local v115;local v116;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v83[v116]=v83[v116](v83[v116 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v78=(v116 + v84) -1 ;for v128=v116,v78 do v115=v79[v128-v116 ];v83[v128]=v115;end v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v83[v116](v13(v83,v116 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else local v122=v85[2];v83[v122]=v83[v122](v83[v122 + 1 ]);end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703F5112O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C206361636865203D2057522E63616368650D0A6C6F63616C20646263203D2057522E6462630D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C206C7263203D204C69625374756228224C696252616E6765436865636B2D332E302D456C76554922290D0A0D0A6C6F63616C2072616E67655461626C65427954797065203D207B0D0A2O206D656C2O65203D207B0D0A4O20686F7374696C65203D207B0D0A6O2072616E6765496E646578203D207B7D2C0D0A6O206974656D52616E6765203D207B7D0D0A4O207D2C0D0A4O20667269656E646C79203D207B0D0A6O2072616E6765496E646578203D207B7D2C0D0A6O206974656D52616E6765203D207B7D0D0A4O207D0D0A2O207D2C0D0A2O2072616E676564203D207B0D0A4O20686F7374696C65203D207B0D0A6O2072616E6765496E646578203D207B7D2C0D0A6O206974656D52616E6765203D207B7D0D0A4O207D2C0D0A4O20667269656E646C79203D207B0D0A6O2072616E6765496E646578203D207B7D2C0D0A6O206974656D52616E6765203D207B7D0D0A4O207D0D0A2O207D0D0A7D0D0A646F0D0A2O206C6F63616C207479706573203D207B20226D656C2O65222C202272616E67656422207D0D0A2O200D0A2O206C6F63616C2066756E6374696F6E20536F72744D697841736328612C2062290D0A4O2069662074797065286129202O3D2022737472696E672220616E642074797065286229202O3D20226E756D62657222207468656E0D0A6O2072657475726E2061203C20746F737472696E672862290D0A4O20656C736569662074797065286129202O3D20226E756D6265722220616E642074797065286229202O3D2022737472696E6722207468656E0D0A6O2072657475726E2062203C20746F737472696E672861290D0A4O20656C73650D0A6O2072657475726E2061203C20620D0A4O20656E640D0A2O20656E640D0A0D0A2O20666F722069203D20312C2023747970657320646F0D0A4O206C6F63616C2074797065203D2074797065735B695D0D0A4O206C6F63616C206974656D52616E6765203D206462632E6974656D52616E67655B747970655D0D0A4O206C6F63616C20686F7374696C652C20667269656E646C79203D2072616E67655461626C654279547970655B747970655D2E686F7374696C652C2072616E67655461626C654279547970655B747970655D2E667269656E646C790D0A0D0A4O20686F7374696C652E72616E6765496E646578203D207B20756E7061636B286974656D52616E67652E686F7374696C652E72616E6765496E64657829207D0D0A4O207461626C652E736F727428686F7374696C652E72616E6765496E6465782C20536F72744D6978417363290D0A4O20667269656E646C792E72616E6765496E646578203D207B20756E7061636B286974656D52616E67652E667269656E646C792E72616E6765496E64657829207D0D0A4O207461626C652E736F727428667269656E646C792E72616E6765496E6465782C20536F72744D6978417363290D0A0D0A4O20666F72206B2C207620696E207061697273286974656D52616E67652E686F7374696C652E6974656D52616E67652920646F0D0A6O20686F7374696C652E6974656D52616E67655B6B5D203D20765B6D6174682E72616E646F6D28312C202376295D0D0A4O20656E640D0A4O20666F72206B2C207620696E207061697273286974656D52616E67652E667269656E646C792E6974656D52616E67652920646F0D0A6O20667269656E646C792E6974656D52616E67655B6B5D203D20765B6D6174682E72616E646F6D28312C202376295D0D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E20756E69743A4973496E52616E67652864697374616E6365290D0A2O20612O7365727428747970652864697374616E636529202O3D20226E756D626572222C202244697374616E6365206D7573742062652061206E756D6265722E22290D0A2O20612O736572742864697374616E6365203E3D203520616E642064697374616E6365203C3D20312O302C202244697374616E6365206D75737420626520626574772O656E203520616E6420312O302E22290D0A0D0A2O206C6F63616C2067756964203D2073656C663A4755494428290D0A2O206966206E6F742067756964207468656E0D0A4O2072657475726E2066616C73650D0A2O20656E640D0A0D0A2O206C6F63616C20756E6974496E666F203D2063616368652E756E6974496E666F5B677569645D0D0A2O206966206E6F7420756E6974496E666F207468656E0D0A4O20756E6974496E666F203D207B7D0D0A4O2063616368652E756E6974496E666F5B677569645D203D20756E6974496E666F0D0A2O20656E640D0A2O206C6F63616C20756E6974496E666F4973496E52616E6765203D20756E6974496E666F2E6973496E52616E67650D0A2O206966206E6F7420756E6974496E666F4973496E52616E6765207468656E0D0A4O20756E6974496E666F4973496E52616E6765203D207B7D0D0A4O20756E6974496E666F2E6973496E52616E6765203D20756E6974496E666F4973496E52616E67650D0A2O20656E640D0A0D0A2O206C6F63616C206964656E746966696572203D2064697374616E63650D0A2O206C6F63616C206973496E52616E6765203D20756E6974496E666F4973496E52616E67655B6964656E7469666965725D0D0A2O206966206973496E52616E6765202O3D206E696C207468656E0D0A4O206C6F63616C2072616E67655461626C6542795265616374696F6E203D2072616E67655461626C654279547970652E72616E6765640D0A4O206C6F63616C2072616E67655461626C65203D20706C617965723A43616E412O7461636B2873656C662920616E642072616E67655461626C6542795265616374696F6E2E686F7374696C65206F722072616E67655461626C6542795265616374696F6E2E667269656E646C790D0A4O206C6F63616C206974656D52616E6765203D2072616E67655461626C652E6974656D52616E67650D0A0D0A4O206966206E6F74206974656D52616E67655B64697374616E63655D207468656E0D0A6O206C6F63616C2072616E6765496E646578203D2072616E67655461626C652E72616E6765496E6465780D0A6O20666F722069203D202372616E6765496E6465782C20312C202D3120646F0D0A8O206C6F63616C2072616E6765203D2072616E6765496E6465785B695D0D0A8O2069662072616E6765202O3D2064697374616E6365207468656E0D0A9O2020627265616B0D0A8O20656E640D0A8O2069662072616E6765203C2064697374616E6365207468656E0D0A9O202064697374616E6365203D2072616E67650D0A9O2020627265616B0D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A0D0A4O206C6F63616C20756E69744D696E52616E67652C20756E69744D617852616E6765203D206C72633A47657452616E67652873656C663A4944282O290D0A4O206973496E52616E6765203D20756E69744D617852616E676520616E64202864697374616E6365203C3D20756E69744D617852616E6765206F7220756E69744D617852616E6765203C3D203130290D0A4O20756E6974496E666F4973496E52616E67655B6964656E7469666965725D203D206973496E52616E67650D0A2O20656E640D0A0D0A2O2072657475726E206973496E52616E67650D0A656E640D0A0D0A66756E6374696F6E20756E69743A4973496E4D656C2O6552616E67652864697374616E6365290D0A2O20612O7365727428747970652864697374616E636529202O3D20226E756D626572222C202244697374616E6365206D7573742062652061206E756D6265722E22290D0A2O20612O736572742864697374616E6365203E3D203520616E642064697374616E6365203C3D20312O302C202244697374616E6365206D75737420626520626574772O656E203520616E6420312O302E22290D0A0D0A2O206966202864697374616E6365207E3D203529207468656E0D0A4O2072657475726E2073656C663A4973496E52616E67652864697374616E6365202D20312E35290D0A2O20656E640D0A0D0A2O206C6F63616C2067756964203D2073656C663A4755494428290D0A2O206966206E6F742067756964207468656E0D0A4O2072657475726E2066616C73650D0A2O20656E640D0A0D0A2O206C6F63616C2072616E67655461626C6542795265616374696F6E203D2072616E67655461626C654279547970652E6D656C2O650D0A2O206C6F63616C2072616E67655461626C65203D20706C617965723A43616E412O7461636B2873656C662920616E642072616E67655461626C6542795265616374696F6E2E686F7374696C65206F722072616E67655461626C6542795265616374696F6E2E667269656E646C790D0A2O206C6F63616C206974656D52616E6765203D2072616E67655461626C652E6974656D52616E67650D0A2O200D0A2O206C6F63616C20756E69744D696E52616E67652C20756E69744D617852616E6765203D206C72633A47657452616E67652873656C663A4944282O290D0A2O2072657475726E20756E69744D617852616E676520616E64202864697374616E6365203C3D20756E69744D617852616E67652O206F7220756E69744D617852616E6765203C3D203130290D0A656E640D0A0D0A66756E6374696F6E20756E69743A49735370652O6C496E52616E676528746869735370652O6C290D0A2O206C6F63616C2067756964203D2073656C663A4755494428290D0A2O206966206E6F742067756964207468656E0D0A4O2072657475726E2066616C73650D0A2O20656E640D0A2O20696620746869735370652O6C3A422O6F6B496E6465782829202O3D206E696C207468656E0D0A4O2072657475726E2066616C73650D0A2O20656E640D0A0D0A2O2072657475726E2049735370652O6C496E52616E676528746869735370652O6C3A422O6F6B496E64657828292C20746869735370652O6C3A422O6F6B5479706528292C2073656C663A4944282O29202O3D20310D0A656E640D0A0D0A66756E6374696F6E20756E69743A4973416374696F6E496E52616E676528616374696F6E536C6F74290D0A2O2072657475726E204973416374696F6E496E52616E676528616374696F6E536C6F742C2073656C663A4944282O290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2046696E6452616E67652874686973556E69742C206D6178290D0A2O206C6F63616C2072616E67655461626C6542795265616374696F6E203D2072616E67655461626C654279547970652E72616E6765640D0A2O206C6F63616C2072616E67655461626C65203D20706C617965723A43616E412O7461636B2874686973556E69742920616E642072616E67655461626C6542795265616374696F6E2E686F7374696C65206F722072616E67655461626C6542795265616374696F6E2E667269656E646C790D0A2O206C6F63616C2072616E6765496E646578203D2072616E67655461626C652E72616E6765496E6465780D0A0D0A2O20666F722069203D202372616E6765496E646578202D20286D617820616E642031206F722030292C20312C202D3120646F0D0A4O206966206E6F742074686973556E69743A4973496E52616E67652872616E6765496E6465785B695D29207468656E0D0A6O2072657475726E206D617820616E642072616E6765496E6465785B69202B20315D206F722072616E6765496E6465785B695D0D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E20756E69743A4D696E44697374616E636528290D0A2O2072657475726E2046696E6452616E67652873656C66290D0A656E640D0A0D0A66756E6374696F6E20756E69743A4D617844697374616E636528290D0A2O2072657475726E2046696E6452616E67652873656C662C2074727565290D0A656E640D0A00063O0012053O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);