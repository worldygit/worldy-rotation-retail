local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));elseif (v86==1) then local v116=v85[2];v83[v116]=v83[v116](v83[v116 + 1 ]);else local v118=v85[2];v78=(v118 + v84) -1 ;for v129=v118,v78 do local v130=v79[v129-v118 ];v83[v129]=v130;end end elseif (v86<=3) then if (v85[3]=="_ENV") then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86>4) then v83[v85[2]]=v85[3];else local v124=v85[2];v78=(v124 + v84) -1 ;for v132=v124,v78 do local v133=v79[v132-v124 ];v83[v132]=v133;end end elseif (v86<=8) then if (v86<=6) then local v112=v85[2];v83[v112]=v83[v112](v83[v112 + 1 ]);elseif (v86>7) then v83[v85[2]]=v85[3];elseif (v85[3]=="_ENV") then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86<=9) then local v114=v85[2];v83[v114](v13(v83,v114 + 1 ,v78));elseif (v86==10) then do return;end else do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67039E202O002O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A536C69646572205769646765740D0A47726170686963616C20536C696465722C206C696B652C20666F722052616E67652076616C7565732E0D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C20547970652C2056657273696F6E203D2022536C69646572222C2032330D0A6C6F63616C20416365475549203D204C69625374756220616E64204C69625374756228224163654755492D332E30222C2074727565290D0A6966206E6F7420416365475549206F7220284163654755493A47657457696467657456657273696F6E285479706529206F72203029203E3D2056657273696F6E207468656E2072657475726E20656E640D0A0D0A2O2D204C756120415049730D0A6C6F63616C206D696E2C206D61782C20666C2O6F72203D206D6174682E6D696E2C206D6174682E6D61782C206D6174682E666C2O6F720D0A6C6F63616C20746F6E756D6265722C207061697273203D20746F6E756D6265722C2070616972730D0A0D0A2O2D20576F5720415049730D0A6C6F63616C20506C6179536F756E64203D20506C6179536F756E640D0A6C6F63616C204372656174654672616D652C205549506172656E74203D204372656174654672616D652C205549506172656E740D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A53752O706F72742066756E6374696F6E730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E20557064617465546578742873656C66290D0A096C6F63616C2076616C7565203D2073656C662E76616C7565206F7220300D0A0969662073656C662E697370657263656E74207468656E0D0A2O0973656C662E65646974626F783A536574546578742O282225732O2522293A666F726D617428666C2O6F722876616C7565202A20313O30202B20302E3529202F2031302O290D0A09656C73650D0A2O0973656C662E65646974626F783A5365745465787428666C2O6F722876616C7565202A20312O30202B20302E3529202F20312O30290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E205570646174654C6162656C732873656C66290D0A096C6F63616C206D696E5F76616C75652C206D61785F76616C7565203D202873656C662E6D696E206F722030292C202873656C662E6D6178206F7220312O30290D0A0969662073656C662E697370657263656E74207468656E0D0A2O0973656C662E6C6F77746578743A536574466F726D612O74656454657874282225732O25222C20286D696E5F76616C7565202A20312O302O290D0A2O0973656C662E68696768746578743A536574466F726D612O74656454657874282225732O25222C20286D61785F76616C7565202A20312O302O290D0A09656C73650D0A2O0973656C662E6C6F77746578743A53657454657874286D696E5F76616C7565290D0A2O0973656C662E68696768746578743A53657454657874286D61785F76616C7565290D0A09656E640D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A536372697074730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E20436F6E74726F6C5F4F6E456E746572286672616D65290D0A096672616D652E6F626A3A4669726528224F6E456E74657222290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20436F6E74726F6C5F4F6E4C65617665286672616D65290D0A096672616D652E6F626A3A4669726528224F6E4C6561766522290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204672616D655F4F6E4D6F757365446F776E286672616D65290D0A096672616D652E6F626A2E736C696465723A456E61626C654D6F75736557682O656C2874727565290D0A094163654755493A436C656172466F63757328290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20536C696465725F4F6E56616C75654368616E676564286672616D652C206E657776616C7565290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A096966206E6F74206672616D652E7365747570207468656E0D0A2O0969662073656C662E7374657020616E642073656C662E73746570203E2030207468656E0D0A3O096C6F63616C206D696E5F76616C7565203D2073656C662E6D696E206F7220300D0A3O096E657776616C7565203D20666C2O6F722O286E657776616C7565202D206D696E5F76616C756529202F2073656C662E73746570202B20302E3529202A2073656C662E73746570202B206D696E5F76616C75650D0A2O09656E640D0A2O096966206E657776616C7565207E3D2073656C662E76616C756520616E64206E6F742073656C662E64697361626C6564207468656E0D0A3O0973656C662E76616C7565203D206E657776616C75650D0A3O0973656C663A4669726528224F6E56616C75654368616E676564222C206E657776616C7565290D0A2O09656E640D0A2O0969662073656C662E76616C7565207468656E0D0A3O09557064617465546578742873656C66290D0A2O09656E640D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20536C696465725F4F6E4D6F7573655570286672616D65290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A0973656C663A4669726528224F6E4D6F7573655570222C2073656C662E76616C7565290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20536C696465725F4F6E4D6F75736557682O656C286672616D652C2076290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A096966206E6F742073656C662E64697361626C6564207468656E0D0A2O096C6F63616C2076616C7565203D2073656C662E76616C75650D0A2O0969662076203E2030207468656E0D0A3O0976616C7565203D206D696E2876616C7565202B202873656C662E73746570206F722031292C2073656C662E6D6178290D0A2O09656C73650D0A3O0976616C7565203D206D61782876616C7565202D202873656C662E73746570206F722031292C2073656C662E6D696E290D0A2O09656E640D0A2O0973656C662E736C696465723A53657456616C75652876616C7565290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E4573636170655072652O736564286672616D65290D0A096672616D653A436C656172466F63757328290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E456E7465725072652O736564286672616D65290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A096C6F63616C2076616C7565203D206672616D653A4765745465787428290D0A0969662073656C662E697370657263656E74207468656E0D0A2O0976616C7565203D2076616C75653A6773756228272O25272C202O27290D0A2O0976616C7565203D20746F6E756D6265722876616C756529202F20312O300D0A09656C73650D0A2O0976616C7565203D20746F6E756D6265722876616C7565290D0A09656E640D0A0D0A0969662076616C7565207468656E0D0A2O09506C6179536F756E642838353629202O2D20534F554E444B49542E49475F4D41494E4D454E555F4F5054494F4E5F434845434B424F585F4F4E0D0A2O0973656C662E736C696465723A53657456616C75652876616C7565290D0A2O0973656C663A4669726528224F6E4D6F7573655570222C2076616C7565290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E456E746572286672616D65290D0A096672616D653A5365744261636B64726F70426F72646572436F6C6F7228302E352C20302E352C20302E352C2031290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E4C65617665286672616D65290D0A096672616D653A5365744261636B64726F70426F72646572436F6C6F7228302E332C20302E332C20302E332C20302E38290D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A4D6574686F64730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C206D6574686F6473203D207B0D0A095B224F6E41637175697265225D203D2066756E6374696F6E2873656C66290D0A2O0973656C663A536574576964746828322O30290D0A2O0973656C663A536574486569676874282O34290D0A2O0973656C663A53657444697361626C65642866616C7365290D0A2O0973656C663A536574497350657263656E74286E696C290D0A2O0973656C663A536574536C6964657256616C75657328302C312O302C31290D0A2O0973656C663A53657456616C75652830290D0A2O0973656C662E736C696465723A456E61626C654D6F75736557682O656C2866616C7365290D0A09656E642C0D0A0D0A092O2D205B224F6E52656C65617365225D203D206E696C2C0D0A0D0A095B2253657444697361626C6564225D203D2066756E6374696F6E2873656C662C2064697361626C6564290D0A2O0973656C662E64697361626C6564203D2064697361626C65640D0A2O0969662064697361626C6564207468656E0D0A3O0973656C662E736C696465723A456E61626C654D6F7573652866616C7365290D0A3O0973656C662E6C6162656C3A53657454657874436F6C6F72282E352C202E352C202E35290D0A3O0973656C662E68696768746578743A53657454657874436F6C6F72282E352C202E352C202E35290D0A3O0973656C662E6C6F77746578743A53657454657874436F6C6F72282E352C202E352C202E35290D0A3O092O2D73656C662E76616C7565746578743A53657454657874436F6C6F72282E352C202E352C202E35290D0A3O0973656C662E65646974626F783A53657454657874436F6C6F72282E352C202E352C202E35290D0A3O0973656C662E65646974626F783A456E61626C654D6F7573652866616C7365290D0A3O0973656C662E65646974626F783A436C656172466F63757328290D0A2O09656C73650D0A3O0973656C662E736C696465723A456E61626C654D6F7573652874727565290D0A3O0973656C662E6C6162656C3A53657454657874436F6C6F7228312C202E38322C2030290D0A3O0973656C662E68696768746578743A53657454657874436F6C6F7228312C20312C2031290D0A3O0973656C662E6C6F77746578743A53657454657874436F6C6F7228312C20312C2031290D0A3O092O2D73656C662E76616C7565746578743A53657454657874436F6C6F7228312C20312C2031290D0A3O0973656C662E65646974626F783A53657454657874436F6C6F7228312C20312C2031290D0A3O0973656C662E65646974626F783A456E61626C654D6F7573652874727565290D0A2O09656E640D0A09656E642C0D0A0D0A095B2253657456616C7565225D203D2066756E6374696F6E2873656C662C2076616C7565290D0A2O0973656C662E736C696465722E7365747570203D20747275650D0A2O0973656C662E736C696465723A53657456616C75652876616C7565290D0A2O0973656C662E76616C7565203D2076616C75650D0A2O09557064617465546578742873656C66290D0A2O0973656C662E736C696465722E7365747570203D206E696C0D0A09656E642C0D0A0D0A095B2247657456616C7565225D203D2066756E6374696F6E2873656C66290D0A2O0972657475726E2073656C662E76616C75650D0A09656E642C0D0A0D0A095B225365744C6162656C225D203D2066756E6374696F6E2873656C662C2074657874290D0A2O0973656C662E6C6162656C3A536574546578742874657874290D0A09656E642C0D0A0D0A095B22536574536C6964657256616C756573225D203D2066756E6374696F6E2873656C662C206D696E5F76616C75652C206D61785F76616C75652C2073746570290D0A2O096C6F63616C206672616D65203D2073656C662E736C696465720D0A2O096672616D652E7365747570203D20747275650D0A2O0973656C662E6D696E203D206D696E5F76616C75650D0A2O0973656C662E6D6178203D206D61785F76616C75650D0A2O0973656C662E73746570203D20737465700D0A2O096672616D653A5365744D696E4D617856616C756573286D696E5F76616C7565206F7220302C6D61785F76616C7565206F7220312O30290D0A2O095570646174654C6162656C732873656C66290D0A2O096672616D653A53657456616C7565537465702873746570206F722031290D0A2O0969662073656C662E76616C7565207468656E0D0A3O096672616D653A53657456616C75652873656C662E76616C7565290D0A2O09656E640D0A2O096672616D652E7365747570203D206E696C0D0A09656E642C0D0A0D0A095B22536574497350657263656E74225D203D2066756E6374696F6E2873656C662C2076616C7565290D0A2O0973656C662E697370657263656E74203D2076616C75650D0A2O095570646174654C6162656C732873656C66290D0A2O09557064617465546578742873656C66290D0A09656E640D0A7D0D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A436F6E7374727563746F720D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C20536C696465724261636B64726F702O203D207B0D0A09626746696C65203D2022496E746572666163652O5C42752O746F6E732O5C55492D536C696465724261722D4261636B67726F756E64222C0D0A096564676546696C65203D2022496E746572666163652O5C42752O746F6E732O5C55492D536C696465724261722D426F72646572222C0D0A0974696C65203D20747275652C2074696C6553697A65203D20382C206564676553697A65203D20382C0D0A09696E73657473203D207B206C656674203D20332C207269676874203D20332C20746F70203D20362C20626F2O746F6D203D2036207D0D0A7D0D0A0D0A6C6F63616C204D616E75616C4261636B64726F70203D207B0D0A09626746696C65203D2022496E746572666163652O5C436861744672616D652O5C436861744672616D654261636B67726F756E64222C0D0A096564676546696C65203D2022496E746572666163652O5C436861744672616D652O5C436861744672616D654261636B67726F756E64222C0D0A0974696C65203D20747275652C206564676553697A65203D20312C2074696C6553697A65203D20352C0D0A7D0D0A0D0A6C6F63616C2066756E6374696F6E20436F6E7374727563746F7228290D0A096C6F63616C206672616D65203D204372656174654672616D6528224672616D65222C206E696C2C205549506172656E74290D0A0D0A096672616D653A456E61626C654D6F7573652874727565290D0A096672616D653A53657453637269707428224F6E4D6F757365446F776E222C204672616D655F4F6E4D6F757365446F776E290D0A0D0A096C6F63616C206C6162656C203D206672616D653A437265617465466F6E74537472696E67286E696C2C20224F5645524C4159222C202247616D65466F6E744E6F726D616C22290D0A096C6162656C3A536574506F696E742822544F504C45465422290D0A096C6162656C3A536574506F696E742822544F50524947485422290D0A096C6162656C3A5365744A75737469667948282243454E54455222290D0A096C6162656C3A536574486569676874283135290D0A0D0A096C6F63616C20736C69646572203D204372656174654672616D652822536C69646572222C206E696C2C206672616D652C20224261636B64726F7054656D706C61746522290D0A09736C696465723A5365744F7269656E746174696F6E2822484F52495A4F4E54414C22290D0A09736C696465723A536574486569676874283135290D0A09736C696465723A53657448697452656374496E7365747328302C20302C202D31302C2030290D0A09736C696465723A5365744261636B64726F7028536C696465724261636B64726F70290D0A09736C696465723A5365745468756D62546578747572652822496E746572666163652O5C42752O746F6E732O5C55492D536C696465724261722D42752O746F6E2D486F72697A6F6E74616C22290D0A09736C696465723A536574506F696E742822544F50222C206C6162656C2C2022424F2O544F4D22290D0A09736C696465723A536574506F696E7428224C454654222C20332C2030290D0A09736C696465723A536574506F696E7428225249474854222C202D332C2030290D0A09736C696465723A53657456616C75652830290D0A09736C696465723A53657453637269707428224F6E56616C75654368616E676564222C536C696465725F4F6E56616C75654368616E676564290D0A09736C696465723A53657453637269707428224F6E456E746572222C20436F6E74726F6C5F4F6E456E746572290D0A09736C696465723A53657453637269707428224F6E4C65617665222C20436F6E74726F6C5F4F6E4C65617665290D0A09736C696465723A53657453637269707428224F6E4D6F7573655570222C20536C696465725F4F6E4D6F7573655570290D0A09736C696465723A53657453637269707428224F6E4D6F75736557682O656C222C20536C696465725F4F6E4D6F75736557682O656C290D0A0D0A096C6F63616C206C6F7774657874203D20736C696465723A437265617465466F6E74537472696E67286E696C2C2022415254574F524B222C202247616D65466F6E74486967686C69676874536D612O6C22290D0A096C6F77746578743A536574506F696E742822544F504C454654222C20736C696465722C2022424F2O544F4D4C454654222C20322C2033290D0A0D0A096C6F63616C206869676874657874203D20736C696465723A437265617465466F6E74537472696E67286E696C2C2022415254574F524B222C202247616D65466F6E74486967686C69676874536D612O6C22290D0A0968696768746578743A536574506F696E742822544F505249474854222C20736C696465722C2022424F2O544F4D5249474854222C202D322C2033290D0A0D0A096C6F63616C2065646974626F78203D204372656174654672616D65282245646974426F78222C206E696C2C206672616D652C20224261636B64726F7054656D706C61746522290D0A0965646974626F783A5365744175746F466F6375732866616C7365290D0A0965646974626F783A536574466F6E744F626A6563742847616D65466F6E74486967686C69676874536D612O6C290D0A0965646974626F783A536574506F696E742822544F50222C20736C696465722C2022424F2O544F4D22290D0A0965646974626F783A536574486569676874283134290D0A0965646974626F783A5365745769647468283730290D0A0965646974626F783A5365744A75737469667948282243454E54455222290D0A0965646974626F783A456E61626C654D6F7573652874727565290D0A0965646974626F783A5365744261636B64726F70284D616E75616C4261636B64726F70290D0A0965646974626F783A5365744261636B64726F70436F6C6F7228302C20302C20302C20302E35290D0A0965646974626F783A5365744261636B64726F70426F72646572436F6C6F7228302E332C20302E332C20302E33302C20302E3830290D0A0965646974626F783A53657453637269707428224F6E456E746572222C2045646974426F785F4F6E456E746572290D0A0965646974626F783A53657453637269707428224F6E4C65617665222C2045646974426F785F4F6E4C65617665290D0A0965646974626F783A53657453637269707428224F6E456E7465725072652O736564222C2045646974426F785F4F6E456E7465725072652O736564290D0A0965646974626F783A53657453637269707428224F6E4573636170655072652O736564222C2045646974426F785F4F6E4573636170655072652O736564290D0A0D0A096C6F63616C20776964676574203D207B0D0A2O096C6162656C7O203D206C6162656C2C0D0A2O09736C696465726O203D20736C696465722C0D0A2O096C6F77746578745O203D206C6F77746578742C0D0A2O0968696768746578744O203D2068696768746578742C0D0A2O0965646974626F785O203D2065646974626F782C0D0A2O09616C69676E6F2O66736574203D2032352C0D0A2O096672616D657O203D206672616D652C0D0A2O09747970658O203D20547970650D0A097D0D0A09666F72206D6574686F642C2066756E6320696E207061697273286D6574686F64732920646F0D0A2O097769646765745B6D6574686F645D203D2066756E630D0A09656E640D0A09736C696465722E6F626A2C2065646974626F782E6F626A203D207769646765742C207769646765740D0A0D0A0972657475726E204163654755493A5265676973746572417357696467657428776964676574290D0A656E640D0A0D0A4163654755493A52656769737465725769646765745479706528547970652C436F6E7374727563746F722C56657273696F6E290D0A00063O0012073O00013O001205000100024O00013O000200022O000400016O00095O00012O000B3O00017O00",v9(),...);