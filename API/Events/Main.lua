local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110]=v83[v110](v83[v110 + 1 ]);elseif (v86>1) then local v113=v85[2];v78=(v113 + v84) -1 ;for v125=v113,v78 do local v126=v79[v125-v113 ];v83[v125]=v126;end else local v114;local v115;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v115=v85[2];v83[v115]=v83[v115](v83[v115 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v115=v85[2];v78=(v115 + v84) -1 ;for v128=v115,v78 do v114=v79[v128-v115 ];v83[v128]=v114;end v77=v77 + 1 ;v85=v73[v77];v115=v85[2];v83[v115](v13(v83,v115 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=4) then if (v86==3) then local v121=v85[2];v83[v121](v13(v83,v121 + 1 ,v78));else do return;end end elseif (v86==5) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else v83[v85[2]]=v85[3];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703A6202O006C6F63616C20612O646F6E4E616D65203D203O2E0D0A0D0A6C6F63616C20617069203D2057522E6170690D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C20706574203D20756E69742E7065740D0A0D0A6C6F63616C206576656E744672616D65203D204372656174654672616D6528224672616D65222C20612O646F6E4E616D65202O2E20225F4576656E744672616D65222C205549506172656E74290D0A6C6F63616C2068616E646C657273203D207B7D0D0A6C6F63616C20636F6D62617448616E646C657273203D207B7D0D0A6C6F63616C2073656C66436F6D62617448616E646C657273203D207B7D0D0A6C6F63616C20706574436F6D62617448616E646C657273203D207B7D0D0A6C6F63616C20707265666978436F6D62617448616E646C657273203D207B7D0D0A6C6F63616C2073752O666978436F6D62617448616E646C657273203D207B7D0D0A6C6F63616C20636F6D6261745072656669786573203D207B0D0A2O2022454E5649524F4E4D454E54414C222C0D0A2O202252414E4745222C0D0A2O20225350452O4C5F4255494C44494E47222C0D0A2O20225350452O4C5F504552494F444943222C0D0A2O20225350452O4C222C0D0A2O20225357494E47220D0A7D0D0A6C6F63616C20636F6D6261745072656669786573436F756E74203D2023636F6D62617450726566697865730D0A0D0A66756E6374696F6E206170693A5265676973746572466F724576656E742868616E646C65722C203O2E290D0A2O206C6F63616C206576656E74735461626C65203D207B203O2E207D0D0A2O20666F722069203D20312C20236576656E74735461626C6520646F0D0A4O206C6F63616C206576656E74203D206576656E74735461626C655B695D0D0A4O206966206E6F742068616E646C6572735B6576656E745D207468656E0D0A6O2068616E646C6572735B6576656E745D203D207B2068616E646C6572207D0D0A6O206576656E744672616D653A52656769737465724576656E74286576656E74290D0A4O20656C73650D0A6O207461626C652E696E736572742868616E646C6572735B6576656E745D2C2068616E646C6572290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A556E7265676973746572466F724576656E742868616E646C65722C206576656E74290D0A2O2069662068616E646C6572735B6576656E745D207468656E0D0A4O20666F7220696E6465782C20666E20696E2070616972732868616E646C6572735B6576656E745D2920646F0D0A6O20696620666E202O3D2068616E646C6572207468656E0D0A8O207461626C652E72656D6F76652868616E646C6572735B6576656E745D2C20696E646578290D0A8O206966202368616E646C6572735B6576656E745D202O3D2030207468656E0D0A9O20206576656E744672616D653A556E72656769737465724576656E74286576656E74290D0A8O20656E640D0A8O2072657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6576656E744672616D653A53657453637269707428224F6E4576656E74222C0D0A2O2066756E6374696F6E2873656C662C206576656E742C203O2E290D0A4O20666F72205F2C2068616E646C657220696E2070616972732868616E646C6572735B6576656E745D2920646F0D0A6O2068616E646C6572286576656E742C203O2E290D0A4O20656E640D0A2O20656E640D0A290D0A0D0A66756E6374696F6E206170693A5265676973746572466F72436F6D6261744576656E742868616E646C65722C203O2E290D0A2O206C6F63616C206576656E74735461626C65203D207B203O2E207D0D0A2O20666F722069203D20312C20236576656E74735461626C6520646F0D0A4O206C6F63616C206576656E74203D206576656E74735461626C655B695D0D0A4O206966206E6F7420636F6D62617448616E646C6572735B6576656E745D207468656E0D0A6O20636F6D62617448616E646C6572735B6576656E745D203D207B2068616E646C6572207D0D0A4O20656C73650D0A6O207461626C652E696E7365727428636F6D62617448616E646C6572735B6576656E745D2C2068616E646C6572290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A5265676973746572466F7253656C66436F6D6261744576656E742868616E646C65722C203O2E290D0A2O206C6F63616C206576656E74735461626C65203D207B203O2E207D0D0A2O20666F722069203D20312C20236576656E74735461626C6520646F0D0A4O206C6F63616C206576656E74203D206576656E74735461626C655B695D0D0A4O206966206E6F742073656C66436F6D62617448616E646C6572735B6576656E745D207468656E0D0A6O2073656C66436F6D62617448616E646C6572735B6576656E745D203D207B2068616E646C6572207D0D0A4O20656C73650D0A6O207461626C652E696E736572742873656C66436F6D62617448616E646C6572735B6576656E745D2C2068616E646C6572290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A5265676973746572466F72506574436F6D6261744576656E742868616E646C65722C203O2E290D0A2O206C6F63616C206576656E74735461626C65203D207B203O2E207D0D0A2O20666F722069203D20312C20236576656E74735461626C6520646F0D0A4O206C6F63616C206576656E74203D206576656E74735461626C655B695D0D0A4O206966206E6F7420706574436F6D62617448616E646C6572735B6576656E745D207468656E0D0A6O20706574436F6D62617448616E646C6572735B6576656E745D203D207B2068616E646C6572207D0D0A4O20656C73650D0A6O207461626C652E696E7365727428706574436F6D62617448616E646C6572735B6576656E745D2C2068616E646C6572290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A5265676973746572466F72436F6D6261745072656669784576656E742868616E646C65722C203O2E290D0A2O206C6F63616C206576656E74735461626C65203D207B203O2E207D0D0A2O20666F722069203D20312C20236576656E74735461626C6520646F0D0A4O206C6F63616C206576656E74203D206576656E74735461626C655B695D0D0A4O206966206E6F7420707265666978436F6D62617448616E646C6572735B6576656E745D207468656E0D0A6O20707265666978436F6D62617448616E646C6572735B6576656E745D203D207B2068616E646C6572207D0D0A4O20656C73650D0A6O207461626C652E696E7365727428707265666978436F6D62617448616E646C6572735B6576656E745D2C2068616E646C6572290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A5265676973746572466F72436F6D62617453752O6669784576656E742868616E646C65722C203O2E290D0A2O206C6F63616C206576656E74735461626C65203D207B203O2E207D0D0A2O20666F722069203D20312C20236576656E74735461626C6520646F0D0A4O206C6F63616C206576656E74203D206576656E74735461626C655B695D0D0A4O206966206E6F742073752O666978436F6D62617448616E646C6572735B6576656E745D207468656E0D0A6O2073752O666978436F6D62617448616E646C6572735B6576656E745D203D207B2068616E646C6572207D0D0A4O20656C73650D0A6O207461626C652E696E736572742873752O666978436F6D62617448616E646C6572735B6576656E745D2C2068616E646C6572290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A556E7265676973746572466F72436F6D6261744576656E742868616E646C65722C206576656E74290D0A2O20696620636F6D62617448616E646C6572735B6576656E745D207468656E0D0A4O20666F7220696E6465782C20666E20696E20706169727328636F6D62617448616E646C6572735B6576656E745D2920646F0D0A6O20696620666E202O3D2068616E646C6572207468656E0D0A8O207461626C652E72656D6F766528636F6D62617448616E646C6572735B6576656E745D2C20696E646578290D0A8O2072657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A556E7265676973746572466F7253656C66436F6D6261744576656E742868616E646C65722C206576656E74290D0A2O2069662073656C66436F6D62617448616E646C6572735B6576656E745D207468656E0D0A4O20666F7220696E6465782C20666E20696E2070616972732873656C66436F6D62617448616E646C6572735B6576656E745D2920646F0D0A6O20696620666E202O3D2068616E646C6572207468656E0D0A8O207461626C652E72656D6F76652873656C66436F6D62617448616E646C6572735B6576656E745D2C20696E646578290D0A8O2072657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A556E7265676973746572466F72506574436F6D6261744576656E742868616E646C65722C206576656E74290D0A2O20696620706574436F6D62617448616E646C6572735B6576656E745D207468656E0D0A4O20666F7220696E6465782C20666E20696E20706169727328706574436F6D62617448616E646C6572735B6576656E745D2920646F0D0A6O20696620666E202O3D2068616E646C6572207468656E0D0A8O207461626C652E72656D6F766528706574436F6D62617448616E646C6572735B6576656E745D2C20696E646578290D0A8O2072657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A556E7265676973746572466F72436F6D6261745072656669784576656E742868616E646C65722C206576656E74290D0A2O20696620707265666978436F6D62617448616E646C6572735B6576656E745D207468656E0D0A4O20666F7220696E6465782C20666E20696E20706169727328707265666978436F6D62617448616E646C6572735B6576656E745D2920646F0D0A6O20696620666E202O3D2068616E646C6572207468656E0D0A8O207461626C652E72656D6F766528707265666978436F6D62617448616E646C6572732C20696E646578290D0A8O2072657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170693A556E7265676973746572466F72436F6D62617453752O6669784576656E742868616E646C65722C206576656E74290D0A2O2069662073752O666978436F6D62617448616E646C6572735B6576656E745D207468656E0D0A4O20666F7220696E6465782C20666E20696E2070616972732873752O666978436F6D62617448616E646C6572735B6576656E745D2920646F0D0A6O20696620666E202O3D2068616E646C6572207468656E0D0A8O207461626C652E72656D6F76652873752O666978436F6D62617448616E646C6572735B6576656E745D2C20696E646578290D0A8O2072657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204C697374656E6572436F6D6261744C6F674576656E74556E66696C7465726564286576656E742C2074696D655374616D702C207375624576656E742C203O2E290D0A2O20696620636F6D62617448616E646C6572735B7375624576656E745D207468656E0D0A4O202O2D20556E66696C746572656420436F6D626174204C6F670D0A4O20666F72205F2C2068616E646C657220696E20706169727328636F6D62617448616E646C6572735B7375624576656E745D2920646F0D0A6O2068616E646C65722874696D655374616D702C207375624576656E742C203O2E290D0A4O20656E640D0A2O20656E640D0A2O2069662073656C66436F6D62617448616E646C6572735B7375624576656E745D207468656E0D0A4O202O2D20556E66696C746572656420436F6D626174204C6F67207769746820536F7572636547554944202O3D20506C61796572475549442066696C7465720D0A4O2069662073656C65637428322C203O2E29202O3D20706C617965723A475549442829207468656E0D0A6O20666F72205F2C2068616E646C657220696E2070616972732873656C66436F6D62617448616E646C6572735B7375624576656E745D2920646F0D0A8O2068616E646C65722874696D655374616D702C207375624576656E742C203O2E290D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2O20696620706574436F6D62617448616E646C6572735B7375624576656E745D207468656E0D0A4O202O2D20556E66696C746572656420436F6D626174204C6F67207769746820536F7572636547554944202O3D20506574475549442066696C7465720D0A4O2069662073656C65637428322C203O2E29202O3D207065743A475549442829207468656E0D0A6O20666F72205F2C2068616E646C657220696E20706169727328706574436F6D62617448616E646C6572735B7375624576656E745D2920646F0D0A8O2068616E646C65722874696D655374616D702C207375624576656E742C203O2E290D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2O20666F722069203D20312C20636F6D6261745072656669786573436F756E7420646F0D0A4O202O2D20544F444F203A204F7074696D697A6520746865207374722066696E640D0A4O206966207375624576656E74207468656E0D0A6O206C6F63616C2073746172742C20656E64696E67203D20737472696E672E66696E64287375624576656E742C20636F6D62617450726566697865735B695D290D0A6O20696620737461727420616E6420656E64696E67207468656E0D0A8O202O2D20544F444F3A204F7074696D697A652074686520646F75626C6520737472207375620D0A8O206C6F63616C207072656669782C2073752O666978203D20737472696E672E737562287375624576656E742C2073746172742C20656E64696E67292C20737472696E672E737562287375624576656E742C20656E64696E67202B2031290D0A8O20696620707265666978436F6D62617448616E646C6572735B7072656669785D207468656E0D0A9O20202O2D20556E66696C746572656420436F6D626174204C6F67207769746820507265666978206F6E6C790D0A9O2020666F72205F2C2068616E646C657220696E20706169727328707265666978436F6D62617448616E646C6572735B7072656669785D2920646F0D0A9O203O2068616E646C65722874696D655374616D702C207375624576656E742C203O2E290D0A9O2020656E640D0A8O20656E640D0A8O2069662073752O666978436F6D62617448616E646C6572735B73752O6669785D207468656E0D0A9O20202O2D20556E66696C746572656420436F6D626174204C6F6720776974682053752O666978206F6E6C790D0A9O2020666F72205F2C2068616E646C657220696E2070616972732873752O666978436F6D62617448616E646C6572735B73752O6669785D2920646F0D0A9O203O2068616E646C65722874696D655374616D702C207375624576656E742C203O2E290D0A9O2020656E640D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6170693A5265676973746572466F724576656E742866756E6374696F6E286576656E74290D0A2O204C697374656E6572436F6D6261744C6F674576656E74556E66696C7465726564286576656E742C20436F6D6261744C6F6747657443752O72656E744576656E74496E666F282O290D0A656E642C2022434F4D4241545F4C4F475F4556454E545F554E46494C544552454422290D0A0D0A3O2D207O3D20434F4D4241544C4F47207O3D0D0A3O2D20436F6D626174204C6F6720417267756D656E74730D0A7O2D2042617365207O2D0D0A2O2D20319O2020326O20339O202O20349O202O20359O202O20369O203O20379O207O20389O20399O2031309O202O310D0A2O2D2054696D655374616D702C204576656E742C20486964654361737465722C20536F75726365475549442C20536F757263654E616D652C20536F75726365466C6167732C20536F7572636552616964466C6167732C2044657374475549442C20446573744E616D652C2044657374466C6167732C204465737452616964466C6167730D0A0D0A7O2D205072656669786573207O2D0D0A3O2D205357494E470D0A2O2D204E2F410D0A0D0A3O2D205350452O4C2026205350452O4C5F504552494F4449430D0A2O2D2031328O2031339O202031340D0A2O2D205370652O6C49442C205370652O6C4E616D652C205370652O6C5363682O6F6C0D0A0D0A3O2D205350452O4C5F4142534F524245442A202D205768656E206162736F726265642064616D616765206F726967696E617465642066726F6D2061207370652O6C2C2077692O6C206861766520612O646974696F6E616C203320636F6C756D6E732077697468207370652O6C20696E666F2E0D0A2O2D2031329O207O2031339O207O2031349O208O2031359O209O203O2031367O2031379O2031389O202O2031390D0A2O2D204162736F7262536F75726365475549442C204162736F7262536F757263654E616D652C204162736F7262536F75726365466C6167732C204162736F7262536F7572636552616964466C6167732C205370652O6C49442C205370652O6C4E616D652C205370652O6C5363682O6F6C2C20416D6F756E740D0A0D0A3O2D205350452O4C5F4142534F524245440D0A2O2D2031329O204O2031339O206O2031349O208O2031359O207O2031369O207O2031379O208O2031389O209O203O2031397O2032309O2032319O202O202O320D0A2O2D204162736F72625370652O6C49642C204162736F72625370652O6C4E616D652C204162736F72625370652O6C5363682O6F6C2C204162736F7262536F75726365475549442C204162736F7262536F757263654E616D652C204162736F7262536F75726365466C6167732C204162736F7262536F7572636552616964466C6167732C205370652O6C49442C205370652O6C4E616D652C205370652O6C5363682O6F6C2C20416D6F756E740D0A0D0A7O2D2053752O6669786573207O2D0D0A3O2D205F434153545F53544152542026205F434153545F53552O43452O532026205F53552O4D4F4E2026205F524553552O524543540D0A2O2D204E2F410D0A0D0A3O2D205F434153545F4641494C45440D0A2O2D2031350D0A2O2D204661696C6564547970650D0A0D0A3O2D205F415552415F412O504C4945442026205F415552415F52454D4F5645442026205F415552415F524546524553480D0A2O2D2031350D0A2O2D2041757261547970650D0A0D0A3O2D205F415552415F412O504C4945445F444F53450D0A2O2D2031358O2031360D0A2O2D2041757261547970652C20436861726765730D0A0D0A3O2D205F494E54452O525550540D0A2O2D2031359O203O2031369O205O2031370D0A2O2D2045787472615370652O6C49442C2045787472615370652O6C4E616D652C2045787472615363682O6F6C0D0A0D0A3O2D205F4845414C0D0A2O2D2031356O2031369O202O2031378O2031380D0A2O2D20416D6F756E742C204F7665726865616C696E672C204162736F726265642C20437269746963616C0D0A0D0A3O2D205F44414D4147450D0A2O2D2031356O2031368O2031376O2031388O2031397O2032308O2032318O202O328O2032330D0A2O2D20416D6F756E742C204F7665726B692O6C2C205363682O6F6C2C2052657369737465642C20426C6F636B65642C204162736F726265642C20437269746963616C2C20476C616E63696E672C204372757368696E670D0A0D0A3O2D205F4D492O5345440D0A2O2D2031358O2031369O2031370D0A2O2D204D692O73547970652C2049734F2O6648616E642C20416D6F756E744D692O7365640D0A0D0A7O2D205370656369616C207O2D0D0A3O2D20554E49545F444945442C20554E49545F44455354524F5945440D0A2O2D204E2F410D0A0D0A3O2D20456E6420436F6D626174204C6F6720417267756D656E74730D0A0D0A2O2D20417267756D656E7473205661726961626C65730D0A0D0A00063O0012013O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);