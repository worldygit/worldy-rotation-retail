local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then v83[v85[2]]=v85[3];elseif (v86==1) then do return;end else local v113=v85[2];v83[v113]=v83[v113](v83[v113 + 1 ]);end elseif (v86<=4) then if (v86>3) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v115=v85[2];v78=(v115 + v84) -1 ;for v125=v115,v78 do local v126=v79[v125-v115 ];v83[v125]=v126;end end elseif (v86==5) then local v116;local v117;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v83[v117]=v83[v117](v83[v117 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v78=(v117 + v84) -1 ;for v128=v117,v78 do v116=v79[v128-v117 ];v83[v128]=v116;end v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v83[v117](v13(v83,v117 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else local v123=v85[2];v83[v123](v13(v83,v123 + 1 ,v78));end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703880E2O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A0D0A66756E6374696F6E20756E69743A43617374696E67496E666F28290D0A2O206C6F63616C20756E69744944203D2073656C663A494428290D0A2O206966206E6F7420756E69744944207468656E2072657475726E20656E640D0A0D0A2O2072657475726E20556E697443617374696E67496E666F28756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A4368612O6E656C696E67496E666F28290D0A2O206C6F63616C20756E69744944203D2073656C663A494428290D0A2O206966206E6F7420756E69744944207468656E2072657475726E20656E640D0A0D0A2O2072657475726E20556E69744368612O6E656C496E666F28756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A436173744E616D6528290D0A2O206C6F63616C20636173744E616D65203D2073656C663A43617374696E67496E666F28290D0A0D0A2O2072657475726E20636173744E616D650D0A656E640D0A0D0A66756E6374696F6E20756E69743A4368612O6E656C4E616D6528290D0A2O206C6F63616C206368612O6E656C4E616D65203D2073656C663A4368612O6E656C696E67496E666F28290D0A0D0A2O2072657475726E206368612O6E656C4E616D650D0A656E640D0A0D0A66756E6374696F6E20756E69743A436173745370652O6C494428290D0A2O206C6F63616C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C20636173745370652O6C4944203D2073656C663A43617374696E67496E666F28290D0A0D0A2O2072657475726E20636173745370652O6C49440D0A656E640D0A0D0A66756E6374696F6E20756E69743A4368612O6E656C5370652O6C494428290D0A2O206C6F63616C205F2C205F2C205F2C205F2C205F2C205F2C205F2C206368612O6E656C5370652O6C4944203D2073656C663A4368612O6E656C696E67496E666F28290D0A0D0A2O2072657475726E206368612O6E656C5370652O6C49440D0A656E640D0A0D0A66756E6374696F6E20756E69743A43617374436F737428290D0A2O206C6F63616C20636173745370652O6C4944203D2073656C663A436173745370652O6C494428290D0A0D0A2O20696620636173745370652O6C4944207468656E0D0A4O2072657475726E207370652O6C28636173745370652O6C4944293A436F737428312C2022636F737422290D0A2O20656E640D0A0D0A2O2072657475726E20300D0A656E640D0A0D0A66756E6374696F6E20756E69743A497343617374696E6728746869735370652O6C290D0A2O206C6F63616C20636173744E616D652C205F2C205F2C205F2C205F2C205F2C205F2C205F2C20636173745370652O6C4944203D2073656C663A43617374696E67496E666F28290D0A0D0A2O20696620746869735370652O6C207468656E0D0A4O2072657475726E20636173745370652O6C4944202O3D20746869735370652O6C3A4944282920616E642074727565206F722066616C73650D0A2O20656E640D0A0D0A2O2072657475726E20636173744E616D6520616E642074727565206F722066616C73650D0A656E640D0A0D0A0D0A66756E6374696F6E20756E69743A49734368612O6E656C696E6728746869735370652O6C290D0A2O206C6F63616C206368612O6E656C4E616D652C205F2C205F2C205F2C205F2C205F2C205F2C206368612O6E656C5370652O6C4944203D2073656C663A4368612O6E656C696E67496E666F28290D0A0D0A2O20696620746869735370652O6C207468656E0D0A4O2072657475726E206368612O6E656C5370652O6C4944202O3D20746869735370652O6C3A4944282920616E642074727565206F722066616C73650D0A2O20656E640D0A0D0A2O2072657475726E206368612O6E656C4E616D6520616E642074727565206F722066616C73650D0A656E640D0A0D0A66756E6374696F6E20756E69743A4973496E74652O7275707469626C6528290D0A2O206C6F63616C205F2C205F2C205F2C205F2C205F2C205F2C205F2C20636173744E6F74496E74652O7275707469626C65203D2073656C663A43617374696E67496E666F28290D0A2O206C6F63616C205F2C205F2C205F2C205F2C205F2C205F2C206368612O6E656C4E6F74496E74652O7275707469626C65203D2073656C663A4368612O6E656C696E67496E666F28290D0A0D0A2O2072657475726E202O28636173744E6F74496E74652O7275707469626C65202O3D2066616C7365206F72206368612O6E656C4E6F74496E74652O7275707469626C65202O3D2066616C73652920616E64207472756529206F722066616C73650D0A656E640D0A0D0A66756E6374696F6E20756E69743A43617374537461727428290D0A2O206C6F63616C205F2C205F2C205F2C2063617374537461727454696D65203D2073656C663A43617374696E67496E666F28290D0A2O206C6F63616C205F2C205F2C205F2C206368612O6E656C537461727454696D65203D2073656C663A4368612O6E656C696E67496E666F28290D0A0D0A2O2069662063617374537461727454696D65207468656E2072657475726E2063617374537461727454696D65202F20313O3020656E640D0A2O206966206368612O6E656C537461727454696D65207468656E2072657475726E206368612O6E656C537461727454696D65202F20313O3020656E640D0A0D0A2O2072657475726E20300D0A656E640D0A0D0A66756E6374696F6E20756E69743A4368612O6E656C537461727428290D0A2O2072657475726E2073656C663A43617374537461727428290D0A656E640D0A0D0A66756E6374696F6E20756E69743A43617374456E6428290D0A2O206C6F63616C205F2C205F2C205F2C205F2C2063617374456E6454696D65203D2073656C663A43617374696E67496E666F28290D0A2O206C6F63616C205F2C205F2C205F2C205F2C206368612O6E656C456E6454696D65203D2073656C663A4368612O6E656C696E67496E666F28290D0A0D0A2O2069662063617374456E6454696D65207468656E2072657475726E2063617374456E6454696D65202F20313O3020656E640D0A2O206966206368612O6E656C456E6454696D65207468656E2072657475726E206368612O6E656C456E6454696D65202F20313O3020656E640D0A0D0A2O2072657475726E20300D0A656E640D0A0D0A66756E6374696F6E20756E69743A4368612O6E656C456E6428290D0A2O2072657475726E2073656C663A43617374456E6428290D0A656E640D0A0D0A66756E6374696F6E20756E69743A436173744475726174696F6E28290D0A2O206C6F63616C205F2C205F2C205F2C2063617374537461727454696D652C2063617374456E6454696D65203D2073656C663A43617374696E67496E666F28290D0A2O206C6F63616C205F2C205F2C205F2C206368612O6E656C537461727454696D652C206368612O6E656C456E6454696D65203D2073656C663A4368612O6E656C696E67496E666F28290D0A0D0A2O2069662063617374537461727454696D65207468656E0D0A4O2072657475726E202863617374456E6454696D65202D2063617374537461727454696D6529202F20313O300D0A2O20656E640D0A2O206966206368612O6E656C537461727454696D65207468656E0D0A4O2072657475726E20286368612O6E656C456E6454696D65202D206368612O6E656C537461727454696D6529202F20313O300D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E20756E69743A4368612O6E656C4475726174696F6E28290D0A2O2072657475726E2073656C663A436173744475726174696F6E28290D0A656E640D0A0D0A66756E6374696F6E20756E69743A4361737452656D61696E7328290D0A2O206C6F63616C2063617374456E64203D2073656C663A43617374456E6428290D0A0D0A2O2072657475726E202863617374456E6420616E64202863617374456E64202D2047657454696D65283O29206F7220300D0A656E640D0A0D0A66756E6374696F6E20756E69743A4368612O6E656C52656D61696E7328290D0A2O2072657475726E2073656C663A4361737452656D61696E7328290D0A656E640D0A0D0A66756E6374696F6E20756E69743A4361737450657263656E7461676528726576657273654368612O6E656C290D0A2O206C6F63616C205F2C205F2C205F2C2063617374537461727454696D652C2063617374456E6454696D65203D2073656C663A43617374696E67496E666F28290D0A2O206C6F63616C205F2C205F2C205F2C206368612O6E656C537461727454696D652C206368612O6E656C456E6454696D65203D2073656C663A4368612O6E656C696E67496E666F28290D0A0D0A2O2069662063617374537461727454696D65207468656E0D0A4O2072657475726E202847657454696D652829202A20313O30202D2063617374537461727454696D6529202F202863617374456E6454696D65202D2063617374537461727454696D6529202A20312O300D0A2O20656E640D0A0D0A2O206966206368612O6E656C537461727454696D65207468656E0D0A4O2072657475726E20726576657273654368612O6E656C20616E64202847657454696D652829202A20313O30202D206368612O6E656C537461727454696D6529202F20286368612O6E656C456E6454696D65202D206368612O6E656C537461727454696D6529202A20312O30206F7220312O30202D202847657454696D652829202A20313O30202D206368612O6E656C537461727454696D6529202F20286368612O6E656C456E6454696D65202D206368612O6E656C537461727454696D6529202A20312O300D0A2O20656E640D0A0D0A2O2072657475726E20300D0A656E640D0A0D0A66756E6374696F6E20756E69743A4368612O6E656C50657263656E7461676528726576657273654368612O6E656C290D0A2O2072657475726E2073656C663A4361737450657263656E7461676528726576657273654368612O6E656C290D0A656E640D0A00063O0012053O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);