local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v78=(v110 + v84) -1 ;for v112=v110,v78 do local v113=v79[v112-v110 ];v83[v112]=v113;end elseif (v86>1) then v83[v85[2]]=v85[3];else do return;end end elseif (v86<=4) then if (v86==3) then local v117;local v118;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v83[v118]=v83[v118](v83[v118 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v78=(v118 + v84) -1 ;for v128=v118,v78 do v117=v79[v128-v118 ];v83[v128]=v117;end v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v83[v118](v13(v83,v118 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else local v124=v85[2];v83[v124](v13(v83,v124 + 1 ,v78));end elseif (v86>5) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v125=v85[2];v83[v125]=v83[v125](v83[v125 + 1 ]);end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703FD112O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C20646263203D2057522E6462630D0A6C6F63616C206361636865203D2057522E63616368650D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A0D0A66756E6374696F6E206974656D3A494428290D0A2O2072657475726E2073656C662E6974656D49440D0A656E640D0A0D0A66756E6374696F6E206974656D3A4E616D6528290D0A2O2072657475726E2073656C662E6974656D4E616D650D0A656E640D0A0D0A2O2D204974656D205261726974790D0A2O2D2030203D20502O6F720D0A2O2D2031203D20436F2O6D6F6E0D0A2O2D2032203D20556E636F2O6D6F6E0D0A2O2D2033203D20526172650D0A2O2D2034203D20457069630D0A2O2D2035203D204C6567656E646172790D0A2O2D2036203D2041727469666163740D0A2O2D2037203D20486569726C2O6F6D0D0A2O2D2038203D20576F5720546F6B656E0D0A66756E6374696F6E206974656D3A52617269747928290D0A2O2072657475726E2073656C662E6974656D5261726974790D0A656E640D0A0D0A66756E6374696F6E206974656D3A4C6576656C28290D0A2O2072657475726E2073656C662E6974656D4C6576656C0D0A656E640D0A0D0A66756E6374696F6E206974656D3A4D696E4C6576656C28290D0A2O2072657475726E2073656C662E6974656D4D696E4C6576656C0D0A656E640D0A0D0A66756E6374696F6E206974656D3A536C6F7449447328290D0A2O2072657475726E2073656C662E6974656D536C6F744944730D0A656E640D0A0D0A66756E6374696F6E206974656D3A496E666F4279494428290D0A2O2072657475726E204765744974656D496E666F2873656C663A4944282O290D0A656E640D0A0D0A2O2D2047657420746865206974656D20496E666F2066726F6D20746865206974656D204E616D652E0D0A66756E6374696F6E206974656D3A496E666F42794E616D6528290D0A2O2072657475726E204765744974656D496E666F2873656C663A4E616D65282O290D0A656E640D0A0D0A66756E6374696F6E206974656D3A49734C6567656E6461727928290D0A2O2072657475726E2073656C662E6974656D526172697479202O3D20350D0A656E640D0A0D0A66756E6374696F6E206974656D3A45786973747328290D0A2O2072657475726E204765744974656D436F756E742873656C663A4944282O29203E20300D0A656E640D0A0D0A66756E6374696F6E206974656D3A4973557361626C6528290D0A2O2072657475726E204973557361626C654974656D2873656C663A4944282O290D0A656E640D0A0D0A66756E6374696F6E206974656D3A4F6E5573655370652O6C28290D0A2O2072657475726E2073656C662E6974656D5573655370652O6C0D0A656E640D0A0D0A2O2D20496E76656E746F727920736C6F74730D0A2O2D20494E56534C4F545F484541447O203D20310D0A2O2D20494E56534C4F545F4E45434B7O203D20320D0A2O2D20494E56534C4F545F53484F554C4441433O203D20330D0A2O2D20494E56534C4F545F424F44597O203D20340D0A2O2D20494E56534C4F545F43484553546O203D20350D0A2O2D20494E56534C4F545F57414953546O203D20360D0A2O2D20494E56534C4F545F4C4547537O203D20370D0A2O2D20494E56534C4F545F462O45547O203D20380D0A2O2D20494E56534C4F545F57524953546O203D20390D0A2O2D20494E56534C4F545F48414E447O203D2031300D0A2O2D20494E56534C4F545F46494E474143314O203D202O310D0A2O2D20494E56534C4F545F46494E474143324O203D2031320D0A2O2D20494E56534C4F545F5452494E4B4554313O203D2031330D0A2O2D20494E56534C4F545F5452494E4B4554323O203D2031340D0A2O2D20494E56534C4F545F4241434B7O203D2031350D0A2O2D20494E56534C4F545F4D41494E48414E443O203D2031360D0A2O2D20494E56534C4F545F4F2O4648414E444O203D2031370D0A2O2D20494E56534C4F545F52414E4745445O203D2031380D0A2O2D20494E56534C4F545F5441424152445O203D2031390D0A66756E6374696F6E206974656D3A4973457175692O70656428290D0A2O206C6F63616C206974656D536C6F74494473203D2073656C663A536C6F7449447328290D0A2O206966206E6F74206974656D536C6F74494473207468656E2072657475726E2066616C736520656E640D0A0D0A2O206C6F63616C206974656D4944203D2073656C663A494428290D0A2O206C6F63616C206974656D496E666F203D2063616368652E6974656D496E666F5B6974656D49445D0D0A2O206966206E6F74206974656D496E666F207468656E0D0A4O206974656D496E666F203D207B7D0D0A4O2063616368652E7370652O6C496E666F5B6974656D49445D203D206974656D496E666F0D0A2O20656E640D0A0D0A2O206966206974656D496E666F2E6973457175692O706564202O3D206E696C207468656E0D0A4O206C6F63616C206974656D4973457175692O706564203D2066616C73650D0A4O206C6F63616C2065717569706D656E74203D20706C617965723A47657445717569706D656E7428290D0A0D0A4O20666F722069203D20302C20236974656D536C6F7449447320646F0D0A6O206C6F63616C206974656D536C6F744944203D206974656D536C6F744944735B695D0D0A6O2069662065717569706D656E745B6974656D536C6F7449445D202O3D2073656C662E6974656D4944207468656E0D0A8O206974656D4973457175692O706564203D20747275650D0A8O20627265616B0D0A6O20656E640D0A4O20656E640D0A0D0A4O206974656D496E666F2E6973457175692O706564203D206974656D4973457175692O7065640D0A2O20656E640D0A2O2072657475726E206974656D496E666F2E6973457175692O7065640D0A656E640D0A0D0A66756E6374696F6E206974656D3A432O6F6C646F776E28290D0A2O2072657475726E20286462632E6974656D5370652O6C5B73656C663A494428295D20616E64204765745370652O6C42617365432O6F6C646F776E286462632E6974656D5370652O6C5B73656C663A494428295D29202F20313O30206F722030290D0A656E640D0A0D0A66756E6374696F6E206974656D3A432O6F6C646F776E496E666F28290D0A2O2072657475726E204765744974656D432O6F6C646F776E2873656C663A4944282O290D0A656E640D0A0D0A646F0D0A2O206C6F63616C2066756E6374696F6E20436F6D70757465432O6F6C646F776E28746869734974656D290D0A4O206C6F63616C20636454696D652C20636456616C7565203D20746869734974656D3A432O6F6C646F776E496E666F28290D0A4O20696620636454696D65202O3D2030207468656E2072657475726E203020656E640D0A4O206C6F63616C206364203D20636454696D65202B20636456616C7565202D2047657454696D652829202D206170692E4C6174656E637928290D0A4O2072657475726E206364203E203020616E64206364206F7220300D0A2O20656E640D0A0D0A2O2066756E6374696F6E206974656D3A432O6F6C646F776E52656D61696E7328290D0A4O206C6F63616C206974656D4944203D2073656C663A494428290D0A0D0A4O206C6F63616C206974656D496E666F203D2063616368652E6974656D496E666F5B6974656D49445D0D0A4O206966206E6F74206974656D496E666F207468656E0D0A6O206974656D496E666F203D207B7D0D0A6O2063616368652E7370652O6C496E666F5B6974656D49445D203D206974656D496E666F0D0A4O20656E640D0A0D0A4O206C6F63616C20632O6F6C646F776E203D206974656D496E666F2E632O6F6C646F776E0D0A4O206966206E6F7420632O6F6C646F776E207468656E0D0A6O20632O6F6C646F776E203D20436F6D70757465432O6F6C646F776E2873656C66290D0A6O206974656D496E666F2E632O6F6C646F776E203D20632O6F6C646F776E0D0A4O20656E640D0A0D0A4O2072657475726E20632O6F6C646F776E0D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206974656D3A486173432O6F6C646F776E28290D0A2O2072657475726E2073656C663A432O6F6C646F776E2829203E20300D0A656E640D0A0D0A66756E6374696F6E206974656D3A432O6F6C646F776E557028290D0A2O2072657475726E2073656C663A432O6F6C646F776E52656D61696E732829202O3D20300D0A656E640D0A0D0A66756E6374696F6E206974656D3A432O6F6C646F776E446F776E28290D0A2O2072657475726E2073656C663A432O6F6C646F776E52656D61696E732829207E3D20300D0A656E640D0A0D0A66756E6374696F6E206974656D3A4973526561647928290D0A2O2072657475726E202873656C663A4973557361626C65282920616E642073656C663A432O6F6C646F776E5570282O290D0A656E640D0A0D0A66756E6374696F6E206974656D3A4973457175692O706564416E64526561647928290D0A2O206C6F63616C206571756970203D20706C617965723A47657445717569706D656E7428290D0A2O206C6F63616C207472696E6B657431203D2065717569705B31335D20616E64206974656D2865717569705B31335D29206F72206974656D2830290D0A2O206C6F63616C207472696E6B657432203D2065717569705B31345D20616E64206974656D2865717569705B31345D29206F72206974656D2830290D0A2O206C6F63616C207472696E6B6574557361626C65203D20287472696E6B6574313A49442829202O3D2073656C663A4944282920616E64206170692E5472696E6B6574314F6E282O29206F7220287472696E6B6574323A49442829202O3D2073656C663A4944282920616E64206170692E5472696E6B6574324F6E282O290D0A2O2072657475726E202873656C663A4973457175692O706564282920616E642073656C663A49735265616479282920616E64207472696E6B6574557361626C65290D0A656E640D0A0D0A66756E6374696F6E206974656D3A54696D6553696E63654C6173744361737428290D0A2O2072657475726E2073656C663A4F6E5573655370652O6C282920616E642073656C663A4F6E5573655370652O6C28293A54696D6553696E63654C617374436173742829206F7220300D0A656E640D0A0D0A66756E6374696F6E206974656D3A48617353746174416E7944707328290D0A2O206C6F63616C206F6E5573655370652O6C203D2073656C663A4F6E5573655370652O6C28290D0A2O206966206F6E5573655370652O6C207468656E0D0A4O2072657475726E206462632E7370652O6C41757261537461745B73656C663A4F6E5573655370652O6C28293A494428295D0D0A2O20656E640D0A2O2072657475726E2066616C73650D0A656E640D0A0D0A66756E6374696F6E206974656D3A48617355736542752O6628290D0A2O2072657475726E2073656C663A4973557361626C65282920616E642073656C663A48617353746174416E7944707328290D0A656E640D0A0D0A66756E6374696F6E206974656D3A42752O664475726174696F6E28290D0A2O206966206E6F742073656C663A4973557361626C652829207468656E2072657475726E203020656E640D0A2O206966206E6F742073656C663A4F6E5573655370652O6C2829207468656E2072657475726E203020656E640D0A2O206C6F63616C2062752O664C656E6774680D0A2O206966206462632E7370652O6C4475726174696F6E5B73656C663A4F6E5573655370652O6C28293A494428295D207468656E0D0A4O2062752O664C656E677468203D206462632E7370652O6C4475726174696F6E5B73656C663A4F6E5573655370652O6C28293A494428295D5B315D0D0A2O20656E640D0A2O206966206E6F742062752O664C656E677468207468656E2072657475726E203020656E640D0A2O2069662062752O664C656E677468203E20313O30207468656E2062752O664C656E677468203D2062752O664C656E677468202F20313O3020656E640D0A2O2072657475726E2062752O664C656E6774680D0A656E640D0A00063O0012033O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);