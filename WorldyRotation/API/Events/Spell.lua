local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v78=(v111 + v84) -1 ;for v118=v111,v78 do local v119=v79[v118-v111 ];v83[v118]=v119;end elseif (v86==1) then if (v85[3]=="_ENV") then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else v83[v85[2]]=v85[3];end elseif (v86<=3) then local v112=v85[2];v83[v112]=v83[v112](v83[v112 + 1 ]);elseif (v86==4) then do return;end else v83[v85[2]]=v85[3];end elseif (v86<=8) then if (v86<=6) then local v114=v85[2];v83[v114](v13(v83,v114 + 1 ,v78));elseif (v86>7) then local v125=v85[2];v83[v125](v13(v83,v125 + 1 ,v78));else local v126=v85[2];v78=(v126 + v84) -1 ;for v129=v126,v78 do local v130=v79[v129-v126 ];v83[v129]=v130;end end elseif (v86<=9) then local v115=v85[2];v83[v115]=v83[v115](v83[v115 + 1 ]);elseif (v86==10) then if (v85[3]=="_ENV") then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67036F112O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206D756C74695370652O6C203D206170692E6D756C74695370652O6C0D0A0D0A6C6F63616C20706C617965725370656373203D207B7D0D0A6C6F63616C206C697374656E65645370652O6C73203D207B7D0D0A6C6F63616C206C697374656E65644974656D5370652O6C73203D207B7D0D0A6C6F63616C206C697374656E6564537065634974656D5370652O6C73203D207B7D0D0A6C6F63616C20637573746F6D203D207B0D0A2O2077686974656C697374203D207B7D2C0D0A2O20626C61636B6C697374203D207B7D0D0A7D0D0A6C6F63616C206D756C74695370652O6C73203D207B7D0D0A0D0A646F0D0A2O206C6F63616C206C697374656E65645370652O6C0D0A2O206170693A5265676973746572466F7253656C66436F6D6261744576656E74280D0A6O2066756E6374696F6E285F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C207370652O6C4944290D0A8O20666F722069203D20312C2023706C61796572537065637320646F0D0A9O20206C697374656E65645370652O6C203D206C697374656E65645370652O6C735B706C6179657253706563735B692O5D5B7370652O6C49445D0D0A9O20206966206C697374656E65645370652O6C207468656E0D0A9O203O206C697374656E65645370652O6C2E6C6173744361737454696D65203D2047657454696D6528290D0A9O203O206C697374656E65645370652O6C2E6C61737448697454696D65203D2047657454696D652829202B206C697374656E65645370652O6C3A54726176656C54696D6528290D0A9O2020656E640D0A8O20656E640D0A8O206C697374656E65645370652O6C203D206C697374656E65644974656D5370652O6C735B7370652O6C49445D0D0A8O206966206C697374656E65645370652O6C207468656E0D0A9O20206C697374656E65645370652O6C2E6C6173744361737454696D65203D2047657454696D6528290D0A8O20656E640D0A8O206C697374656E65645370652O6C203D206C697374656E6564537065634974656D5370652O6C735B7370652O6C49445D0D0A8O206966206C697374656E65645370652O6C207468656E0D0A9O20206C697374656E65645370652O6C2E6C6173744361737454696D65203D2047657454696D6528290D0A8O20656E640D0A6O20656E642C0D0A6O20225350452O4C5F434153545F53552O43452O53220D0A2O20290D0A656E640D0A0D0A646F0D0A2O206C6F63616C206C697374656E65645370652O6C0D0A2O206170693A5265676973746572466F72506574436F6D6261744576656E74280D0A6O2066756E6374696F6E285F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C207370652O6C4944290D0A8O20666F722069203D20312C2023706C61796572537065637320646F0D0A9O20206C697374656E65645370652O6C203D206C697374656E65645370652O6C735B706C6179657253706563735B692O5D5B7370652O6C49445D0D0A9O20206966206C697374656E65645370652O6C207468656E0D0A9O203O206C697374656E65645370652O6C2E6C6173744361737454696D65203D2047657454696D6528290D0A9O203O206C697374656E65645370652O6C2E6C61737448697454696D65203D2047657454696D652829202B206C697374656E65645370652O6C3A54726176656C54696D6528290D0A9O2020656E640D0A8O20656E640D0A6O20656E642C0D0A6O20225350452O4C5F434153545F53552O43452O53220D0A2O20290D0A656E640D0A0D0A646F0D0A2O206C6F63616C206C697374656E65645370652O6C0D0A2O206170693A5265676973746572466F7253656C66436F6D6261744576656E74280D0A6O2066756E6374696F6E285F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C207370652O6C4944290D0A8O20666F722069203D20312C2023706C61796572537065637320646F0D0A9O20206C697374656E65645370652O6C203D206C697374656E65645370652O6C735B706C6179657253706563735B692O5D5B7370652O6C49445D0D0A9O20206966206C697374656E65645370652O6C207468656E0D0A9O203O206C697374656E65645370652O6C2E6C617374412O706C6965644F6E506C6179657254696D65203D2047657454696D6528290D0A9O2020656E640D0A8O20656E640D0A6O20656E642C0D0A6O20225350452O4C5F415552415F412O504C494544220D0A2O20290D0A656E640D0A0D0A646F0D0A2O206C6F63616C206C697374656E65645370652O6C0D0A2O206170693A5265676973746572466F7253656C66436F6D6261744576656E74280D0A6O2066756E6374696F6E285F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C207370652O6C4944290D0A8O20666F722069203D20312C2023706C61796572537065637320646F0D0A9O20206C697374656E65645370652O6C203D206C697374656E65645370652O6C735B706C6179657253706563735B692O5D5B7370652O6C49445D0D0A9O20206966206C697374656E65645370652O6C207468656E0D0A9O203O206C697374656E65645370652O6C2E6C61737452656D6F76656446726F6D506C6179657254696D65203D2047657454696D6528290D0A9O2020656E640D0A8O20656E640D0A6O20656E642C0D0A6O20225350452O4C5F415552415F52454D4F564544220D0A2O20290D0A656E640D0A0D0A66756E6374696F6E20706C617965723A52656769737465724C697374656E65644974656D5370652O6C7328290D0A2O206C697374656E65644974656D5370652O6C73203D207B7D0D0A2O206C6F63616C20757361626C654974656D73203D2073656C663A4765744F6E5573654974656D7328290D0A2O20666F72205F2C206974656D20696E2069706169727328757361626C654974656D732920646F0D0A4O206C6F63616C207370652O6C203D206974656D3A4F6E5573655370652O6C28290D0A4O206966207370652O6C207468656E0D0A6O202O2D2057523A5072696E74446562756728224C697374656E696E6720746F207370652O6C2022202O2E207370652O6C3A49442829202O2E202220666F72206974656D2022202O2E207472696E6B65744974656D3A4E616D65282920290D0A6O206C697374656E65644974656D5370652O6C735B7370652O6C3A494428295D203D207370652O6C0D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E20706C617965723A52656769737465724C697374656E65645370652O6C7328737065634944290D0A2O20706C617965725370656373203D207B7D0D0A2O206C697374656E65645370652O6C73203D207B7D0D0A2O206C697374656E6564537065634974656D5370652O6C73203D207B7D0D0A2O206C6F63616C20706C61796572436C612O73203D206170692E636C612O736573537065637342795370656349445B7370656349445D5B315D0D0A0D0A2O20666F7220737065632C207370652O6C7320696E207061697273286170692E7370652O6C5B706C61796572436C612O735D2920646F0D0A4O207461626C652E696E7365727428706C6179657253706563732C2073706563290D0A4O206C697374656E65645370652O6C735B737065635D203D207B7D0D0A4O20666F72205F2C207370652O6C20696E207061697273287370652O6C732920646F0D0A6O206C697374656E65645370652O6C735B737065635D5B7370652O6C3A494428295D203D207370652O6C0D0A4O20656E640D0A2O20656E640D0A0D0A2O20666F72207370652O6C49442C207370652O6C20696E20706169727328637573746F6D2E77686974656C6973742920646F0D0A4O20666F722069203D20312C2023706C61796572537065637320646F0D0A6O206C697374656E65645370652O6C735B706C6179657253706563735B692O5D5B7370652O6C49445D203D207370652O6C0D0A4O20656E640D0A2O20656E640D0A0D0A2O20666F722069203D20312C2023637573746F6D2E626C61636B6C69737420646F0D0A4O206C6F63616C207370652O6C4944203D20637573746F6D2E626C61636B6C6973745B695D0D0A4O20666F72206B203D20312C2023706C61796572537065637320646F0D0A6O206C6F63616C2073706563203D20706C6179657253706563735B6B5D0D0A6O206966206C697374656E65645370652O6C735B737065635D5B7370652O6C49445D207468656E0D0A8O206C697374656E65645370652O6C735B737065635D5B7370652O6C49445D203D206E696C0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A0D0A2O206966206170692E6974656D5B706C61796572436C612O735D207468656E0D0A4O20666F7220737065632C206974656D7320696E207061697273286170692E6974656D5B706C61796572436C612O735D2920646F0D0A6O20666F72205F2C206974656D20696E207061697273286974656D732920646F0D0A8O206C6F63616C207370652O6C203D206974656D3A4F6E5573655370652O6C28290D0A8O206966207370652O6C207468656E0D0A9O20202O2D2057523A5072696E74446562756728224C697374656E696E6720746F207370652O6C2022202O2E205370652O6C3A49442829202O2E202220666F722073706563206974656D2022202O2E204974656D3A4E616D65282920290D0A9O20206C697374656E6564537065634974656D5370652O6C735B7370652O6C3A494428295D203D207370652O6C0D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A412O64546F4C697374656E65645370652O6C7328290D0A2O20637573746F6D2E77686974656C6973745B73656C662E7370652O6C49445D203D2073656C660D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A52656D6F766546726F6D4C697374656E65645370652O6C7328290D0A2O207461626C652E696E7365727428637573746F6D2E626C61636B6C6973742C2073656C662E7370652O6C4944290D0A656E640D0A0D0A66756E6374696F6E206D756C74695370652O6C3A412O64546F4D756C74695370652O6C7328290D0A2O207461626C652E696E73657274286D756C74695370652O6C732C2073656C66290D0A656E640D0A0D0A6170693A5265676973746572466F724576656E74280D0A4O2066756E6374696F6E286576656E742C2061726731290D0A6O20666F72205F2C20746869734D756C74695370652O6C20696E207061697273286D756C74695370652O6C732920646F0D0A8O20746869734D756C74695370652O6C3A55706461746528290D0A6O20656E640D0A4O20656E642C0D0A4O2022504C415945525F4C4F47494E222C20225350452O4C535F4348414E474544220D0A290D0A00063O0012013O00013O001202000100024O00093O000200022O000700016O00085O00012O000B3O00017O00",v9(),...);