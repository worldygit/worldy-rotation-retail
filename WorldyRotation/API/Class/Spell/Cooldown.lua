local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110](v13(v83,v110 + 1 ,v78));elseif (v86==1) then v83[v85[2]]=v85[3];else local v114=v85[2];v83[v114]=v83[v114](v83[v114 + 1 ]);end elseif (v86<=4) then if (v86==3) then local v116=v85[2];v78=(v116 + v84) -1 ;for v125=v116,v78 do local v126=v79[v125-v116 ];v83[v125]=v126;end elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86>5) then local v117;local v118;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v83[v118]=v83[v118](v83[v118 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v78=(v118 + v84) -1 ;for v128=v118,v78 do v117=v79[v128-v118 ];v83[v128]=v117;end v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v83[v118](v13(v83,v118 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703CB092O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A0D0A66756E6374696F6E207370652O6C3A432O6F6C646F776E496E666F28290D0A2O206C6F63616C207370652O6C4944203D2073656C663A494428290D0A0D0A2O2072657475726E204765745370652O6C432O6F6C646F776E287370652O6C4944290D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A43686172676573496E666F28290D0A2O206C6F63616C207370652O6C4944203D2073656C663A494428290D0A0D0A2O2072657475726E204765745370652O6C43686172676573287370652O6C4944290D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A432O6F6C646F776E28290D0A2O206C6F63616C205F2C205F2C205F2C206475726174696F6E203D2073656C663A43686172676573496E666F28290D0A2O206966206E6F74206475726174696F6E207468656E0D0A4O205F2C206475726174696F6E203D2073656C663A432O6F6C646F776E496E666F28290D0A2O20656E640D0A0D0A2O2072657475726E206475726174696F6E0D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A432O6F6C646F776E52656D61696E7328627970612O735265636F76657279290D0A2O206C6F63616C20737461727454696D652C206475726174696F6E203D2073656C663A432O6F6C646F776E496E666F28290D0A2O20696620737461727454696D65202O3D2030207468656E2072657475726E203020656E640D0A2O206C6F63616C206364203D20737461727454696D65202B206475726174696F6E202D2047657454696D652829202D206170692E5265636F766572794F2O6673657428627970612O735265636F76657279290D0A0D0A2O2072657475726E206364203E203020616E64206364206F7220300D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A432O6F6C646F776E52656D61696E734775652O7328627970612O735265636F76657279290D0A2O206C6F63616C20737461727454696D652C206475726174696F6E203D2073656C663A432O6F6C646F776E496E666F28290D0A2O20696620737461727454696D65202O3D2030207468656E2072657475726E203020656E640D0A0D0A2O206C6F63616C206364203D20737461727454696D65202B206475726174696F6E202D2047657454696D652829202D206170692E5265636F766572794F2O6673657428627970612O735265636F76657279290D0A2O206C6F63616C20726564756374696F6E203D20282047657454696D652829202D2073656C662E6C6173744361737454696D652029202F2028206475726174696F6E202D20636420293B0D0A2O206364203D206364202A20726564756374696F6E3B0D0A2O2072657475726E206364203E203020616E64206364206F7220300D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A432O6F6C646F776E557028627970612O735265636F76657279290D0A2O2072657475726E2073656C663A432O6F6C646F776E52656D61696E7328627970612O735265636F7665727929202O3D20300D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A432O6F6C646F776E446F776E28627970612O735265636F76657279290D0A2O2072657475726E2073656C663A432O6F6C646F776E52656D61696E7328627970612O735265636F7665727929207E3D20300D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A4368617267657328627970612O735265636F76657279290D0A2O206C6F63616C20636861726765732C206D617843686172676573203D2073656C663A43686172676573496E666F28290D0A2O2069662063686172676573203C206D61784368617267657320616E642073656C663A526563686172676528627970612O735265636F7665727929202O3D2030207468656E0D0A4O2063686172676573203D2063686172676573202B20310D0A2O20656E640D0A0D0A2O2072657475726E20636861726765730D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A4D61784368617267657328290D0A2O206C6F63616C205F2C206D617843686172676573203D2073656C663A43686172676573496E666F28290D0A2O200D0A2O2072657475726E206D6178436861726765730D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A526563686172676528627970612O735265636F76657279290D0A2O206C6F63616C20636861726765732C206D6178436861726765732C20737461727454696D652C206475726174696F6E203D2073656C663A43686172676573496E666F28290D0A2O2069662063686172676573202O3D206D617843686172676573207468656E2072657475726E203020656E640D0A2O206C6F63616C207265636861726765203D20737461727454696D65202B206475726174696F6E202D2047657454696D652829202D206170692E5265636F766572794F2O6673657428627970612O735265636F76657279290D0A0D0A2O2072657475726E207265636861726765203E203020616E64207265636861726765206F7220300D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A436861726765734672616374696F6E616C28627970612O735265636F76657279290D0A2O206C6F63616C20636861726765732C206D6178436861726765732C205F2C206475726174696F6E203D2073656C663A43686172676573496E666F28290D0A2O2069662063686172676573202O3D206D617843686172676573207468656E2072657475726E206368617267657320656E640D0A0D0A2O2072657475726E2063686172676573202B202O286475726174696F6E202D2073656C663A526563686172676528627970612O735265636F766572792O29202F206475726174696F6E290D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A46752O6C526563686172676554696D6528627970612O735265636F76657279290D0A2O206C6F63616C20636861726765732C206D6178436861726765732C205F2C206475726174696F6E203D2073656C663A43686172676573496E666F28290D0A2O2069662063686172676573202O3D206D617843686172676573207468656E2072657475726E203020656E640D0A0D0A2O2072657475726E20286D617843686172676573202D2073656C663A436861726765734672616374696F6E616C28627970612O735265636F766572792O29202A206475726174696F6E0D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A557361626C65496E28627970612O735265636F76657279290D0A2O2069662073656C663A436861726765732829203E2030207468656E2072657475726E203020656E640D0A0D0A2O2072657475726E2073656C663A526563686172676528627970612O735265636F76657279290D0A656E640D0A00063O0012063O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);