local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then do return;end elseif (v86==1) then v83[v85[2]]=v85[3];else local v117=v85[2];v83[v117]=v83[v117](v83[v117 + 1 ]);end elseif (v86<=3) then local v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));elseif (v86==4) then do return;end else local v119=v85[2];v83[v119](v13(v83,v119 + 1 ,v78));end elseif (v86<=8) then if (v86<=6) then if (v85[3]=="_ENV") then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86==7) then local v123=v85[2];v78=(v123 + v84) -1 ;for v129=v123,v78 do local v130=v79[v129-v123 ];v83[v129]=v130;end elseif (v85[3]=="_ENV") then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86<=9) then local v112=v85[2];v83[v112]=v83[v112](v83[v112 + 1 ]);elseif (v86==10) then local v124=v85[2];v78=(v124 + v84) -1 ;for v132=v124,v78 do local v133=v79[v132-v124 ];v83[v132]=v133;end else v83[v85[2]]=v85[3];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67033A1C2O002O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A45646974426F78205769646765740D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C20547970652C2056657273696F6E203D202245646974426F78222C2032380D0A6C6F63616C20416365475549203D204C69625374756220616E64204C69625374756228224163654755492D332E30222C2074727565290D0A6966206E6F7420416365475549206F7220284163654755493A47657457696467657456657273696F6E285479706529206F72203029203E3D2056657273696F6E207468656E2072657475726E20656E640D0A0D0A2O2D204C756120415049730D0A6C6F63616C20746F737472696E672C207061697273203D20746F737472696E672C2070616972730D0A0D0A2O2D20576F5720415049730D0A6C6F63616C20506C6179536F756E64203D20506C6179536F756E640D0A6C6F63616C20476574437572736F72496E666F2C20436C656172437572736F722C204765745370652O6C496E666F203D20476574437572736F72496E666F2C20436C656172437572736F722C204765745370652O6C496E666F0D0A6C6F63616C204372656174654672616D652C205549506172656E74203D204372656174654672616D652C205549506172656E740D0A6C6F63616C205F47203D205F470D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A53752O706F72742066756E6374696F6E730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6966206E6F742041636547554945646974426F78496E736572744C696E6B207468656E0D0A092O2D207570677261646561626C6520682O6F6B0D0A09682O6F6B73656375726566756E63282243686174456469745F496E736572744C696E6B222C2066756E6374696F6E283O2E292072657475726E205F472E41636547554945646974426F78496E736572744C696E6B283O2E2920656E64290D0A656E640D0A0D0A66756E6374696F6E205F472E41636547554945646974426F78496E736572744C696E6B2874657874290D0A09666F722069203D20312C204163654755493A476574576964676574436F756E7428547970652920646F0D0A2O096C6F63616C2065646974626F78203D205F475B224163654755492D332E3045646974426F78222O2E695D0D0A2O0969662065646974626F7820616E642065646974626F783A497356697369626C65282920616E642065646974626F783A486173466F6375732829207468656E0D0A3O0965646974626F783A496E736572742874657874290D0A3O0972657475726E20747275650D0A2O09656E640D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2053686F7742752O746F6E2873656C66290D0A096966206E6F742073656C662E64697361626C6562752O746F6E207468656E0D0A2O0973656C662E62752O746F6E3A53686F7728290D0A2O0973656C662E65646974626F783A53657454657874496E7365747328302C2032302C20332C2033290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204869646542752O746F6E2873656C66290D0A0973656C662E62752O746F6E3A4869646528290D0A0973656C662E65646974626F783A53657454657874496E7365747328302C20302C20332C2033290D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A536372697074730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E20436F6E74726F6C5F4F6E456E746572286672616D65290D0A096672616D652E6F626A3A4669726528224F6E456E74657222290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20436F6E74726F6C5F4F6E4C65617665286672616D65290D0A096672616D652E6F626A3A4669726528224F6E4C6561766522290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204672616D655F4F6E53686F77466F637573286672616D65290D0A096672616D652E6F626A2E65646974626F783A536574466F63757328290D0A096672616D653A53657453637269707428224F6E53686F77222C206E696C290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E4573636170655072652O736564286672616D65290D0A094163654755493A436C656172466F63757328290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E456E7465725072652O736564286672616D65290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A096C6F63616C2076616C7565203D206672616D653A4765745465787428290D0A096C6F63616C2063616E63656C203D2073656C663A4669726528224F6E456E7465725072652O736564222C2076616C7565290D0A096966206E6F742063616E63656C207468656E0D0A2O09506C6179536F756E642838353629202O2D20534F554E444B49542E49475F4D41494E4D454E555F4F5054494F4E5F434845434B424F585F4F4E0D0A2O094869646542752O746F6E2873656C66290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E5265636569766544726167286672616D65290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A096C6F63616C20747970652C2069642C20696E666F203D20476574437572736F72496E666F28290D0A096C6F63616C206E616D650D0A0969662074797065202O3D20226974656D22207468656E0D0A2O096E616D65203D20696E666F0D0A09656C736569662074797065202O3D20227370652O6C22207468656E0D0A2O096E616D65203D204765745370652O6C496E666F2869642C20696E666F290D0A09656C736569662074797065202O3D20226D6163726F22207468656E0D0A2O096E616D65203D204765744D6163726F496E666F286964290D0A09656E640D0A096966206E616D65207468656E0D0A2O0973656C663A53657454657874286E616D65290D0A2O0973656C663A4669726528224F6E456E7465725072652O736564222C206E616D65290D0A2O09436C656172437572736F7228290D0A2O094869646542752O746F6E2873656C66290D0A2O094163654755493A436C656172466F63757328290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E546578744368616E676564286672616D65290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A096C6F63616C2076616C7565203D206672616D653A4765745465787428290D0A09696620746F737472696E672876616C756529207E3D20746F737472696E672873656C662E6C61732O7465787429207468656E0D0A2O0973656C663A4669726528224F6E546578744368616E676564222C2076616C7565290D0A2O0973656C662E6C61732O74657874203D2076616C75650D0A2O0953686F7742752O746F6E2873656C66290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2045646974426F785F4F6E466F6375734761696E6564286672616D65290D0A094163654755493A536574466F637573286672616D652E6F626A290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2042752O746F6E5F4F6E436C69636B286672616D65290D0A096C6F63616C2065646974626F78203D206672616D652E6F626A2E65646974626F780D0A0965646974626F783A436C656172466F63757328290D0A0945646974426F785F4F6E456E7465725072652O7365642865646974626F78290D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A4D6574686F64730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C206D6574686F6473203D207B0D0A095B224F6E41637175697265225D203D2066756E6374696F6E2873656C66290D0A2O092O2D2068656967687420697320636F6E74726F2O6C6564206279205365744C6162656C0D0A2O0973656C663A536574576964746828322O30290D0A2O0973656C663A53657444697361626C65642866616C7365290D0A2O0973656C663A5365744C6162656C28290D0A2O0973656C663A5365745465787428290D0A2O0973656C663A44697361626C6542752O746F6E2866616C7365290D0A2O0973656C663A5365744D61784C652O746572732830290D0A09656E642C0D0A0D0A095B224F6E52656C65617365225D203D2066756E6374696F6E2873656C66290D0A2O0973656C663A436C656172466F63757328290D0A09656E642C0D0A0D0A095B2253657444697361626C6564225D203D2066756E6374696F6E2873656C662C2064697361626C6564290D0A2O0973656C662E64697361626C6564203D2064697361626C65640D0A2O0969662064697361626C6564207468656E0D0A3O0973656C662E65646974626F783A456E61626C654D6F7573652866616C7365290D0A3O0973656C662E65646974626F783A436C656172466F63757328290D0A3O0973656C662E65646974626F783A53657454657874436F6C6F7228302E352C302E352C302E35290D0A3O0973656C662E6C6162656C3A53657454657874436F6C6F7228302E352C302E352C302E35290D0A2O09656C73650D0A3O0973656C662E65646974626F783A456E61626C654D6F7573652874727565290D0A3O0973656C662E65646974626F783A53657454657874436F6C6F7228312C312C31290D0A3O0973656C662E6C6162656C3A53657454657874436F6C6F7228312C2E38322C30290D0A2O09656E640D0A09656E642C0D0A0D0A095B2253657454657874225D203D2066756E6374696F6E2873656C662C2074657874290D0A2O0973656C662E6C61732O74657874203D2074657874206F72202O220D0A2O0973656C662E65646974626F783A536574546578742874657874206F72202O22290D0A2O0973656C662E65646974626F783A536574437572736F72506F736974696F6E2830290D0A2O094869646542752O746F6E2873656C66290D0A09656E642C0D0A0D0A095B2247657454657874225D203D2066756E6374696F6E2873656C662C2074657874290D0A2O0972657475726E2073656C662E65646974626F783A4765745465787428290D0A09656E642C0D0A0D0A095B225365744C6162656C225D203D2066756E6374696F6E2873656C662C2074657874290D0A2O096966207465787420616E642074657874207E3D202O22207468656E0D0A3O0973656C662E6C6162656C3A536574546578742874657874290D0A3O0973656C662E6C6162656C3A53686F7728290D0A3O0973656C662E65646974626F783A536574506F696E742822544F504C454654222C73656C662E6672616D652C22544F504C454654222C372C2D3138290D0A3O0973656C663A536574486569676874282O34290D0A3O0973656C662E616C69676E6F2O66736574203D2033300D0A2O09656C73650D0A3O0973656C662E6C6162656C3A53657454657874282O22290D0A3O0973656C662E6C6162656C3A4869646528290D0A3O0973656C662E65646974626F783A536574506F696E742822544F504C454654222C73656C662E6672616D652C22544F504C454654222C372C30290D0A3O0973656C663A536574486569676874283236290D0A3O0973656C662E616C69676E6F2O66736574203D2031320D0A2O09656E640D0A09656E642C0D0A0D0A095B2244697361626C6542752O746F6E225D203D2066756E6374696F6E2873656C662C2064697361626C6564290D0A2O0973656C662E64697361626C6562752O746F6E203D2064697361626C65640D0A2O0969662064697361626C6564207468656E0D0A3O094869646542752O746F6E2873656C66290D0A2O09656E640D0A09656E642C0D0A0D0A095B225365744D61784C652O74657273225D203D2066756E6374696F6E202873656C662C206E756D290D0A2O0973656C662E65646974626F783A5365744D61784C652O74657273286E756D206F722030290D0A09656E642C0D0A0D0A095B22436C656172466F637573225D203D2066756E6374696F6E2873656C66290D0A2O0973656C662E65646974626F783A436C656172466F63757328290D0A2O0973656C662E6672616D653A53657453637269707428224F6E53686F77222C206E696C290D0A09656E642C0D0A0D0A095B22536574466F637573225D203D2066756E6374696F6E2873656C66290D0A2O0973656C662E65646974626F783A536574466F63757328290D0A2O096966206E6F742073656C662E6672616D653A497353686F776E2829207468656E0D0A3O0973656C662E6672616D653A53657453637269707428224F6E53686F77222C204672616D655F4F6E53686F77466F637573290D0A2O09656E640D0A09656E642C0D0A0D0A095B22486967686C6967687454657874225D203D2066756E6374696F6E2873656C662C2066726F6D2C20746F290D0A2O0973656C662E65646974626F783A486967686C69676874546578742866726F6D2C20746F290D0A09656E640D0A7D0D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A436F6E7374727563746F720D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E20436F6E7374727563746F7228290D0A096C6F63616C206E756D2O203D204163654755493A4765744E6578745769646765744E756D2854797065290D0A096C6F63616C206672616D65203D204372656174654672616D6528224672616D65222C206E696C2C205549506172656E74290D0A096672616D653A4869646528290D0A0D0A096C6F63616C2065646974626F78203D204372656174654672616D65282245646974426F78222C20224163654755492D332E3045646974426F78222O2E6E756D2C206672616D652C2022496E707574426F7854656D706C61746522290D0A0965646974626F783A5365744175746F466F6375732866616C7365290D0A0965646974626F783A536574466F6E744F626A6563742843686174466F6E744E6F726D616C290D0A0965646974626F783A53657453637269707428224F6E456E746572222C20436F6E74726F6C5F4F6E456E746572290D0A0965646974626F783A53657453637269707428224F6E4C65617665222C20436F6E74726F6C5F4F6E4C65617665290D0A0965646974626F783A53657453637269707428224F6E4573636170655072652O736564222C2045646974426F785F4F6E4573636170655072652O736564290D0A0965646974626F783A53657453637269707428224F6E456E7465725072652O736564222C2045646974426F785F4F6E456E7465725072652O736564290D0A0965646974626F783A53657453637269707428224F6E546578744368616E676564222C2045646974426F785F4F6E546578744368616E676564290D0A0965646974626F783A53657453637269707428224F6E5265636569766544726167222C2045646974426F785F4F6E5265636569766544726167290D0A0965646974626F783A53657453637269707428224F6E4D6F757365446F776E222C2045646974426F785F4F6E5265636569766544726167290D0A0965646974626F783A53657453637269707428224F6E45646974466F6375734761696E6564222C2045646974426F785F4F6E466F6375734761696E6564290D0A0965646974626F783A53657454657874496E7365747328302C20302C20332C2033290D0A0965646974626F783A5365744D61784C652O7465727328323536290D0A0965646974626F783A536574506F696E742822424F2O544F4D4C454654222C20362C2030290D0A0965646974626F783A536574506F696E742822424F2O544F4D524947485422290D0A0965646974626F783A536574486569676874283139290D0A0D0A096C6F63616C206C6162656C203D206672616D653A437265617465466F6E74537472696E67286E696C2C20224F5645524C4159222C202247616D65466F6E744E6F726D616C536D612O6C22290D0A096C6162656C3A536574506F696E742822544F504C454654222C20302C202D32290D0A096C6162656C3A536574506F696E742822544F505249474854222C20302C202D32290D0A096C6162656C3A5365744A7573746966794828224C45465422290D0A096C6162656C3A536574486569676874283138290D0A0D0A096C6F63616C2062752O746F6E203D204372656174654672616D65282242752O746F6E222C206E696C2C2065646974626F782C2022554950616E656C42752O746F6E54656D706C61746522290D0A0962752O746F6E3A5365745769647468283430290D0A0962752O746F6E3A536574486569676874283230290D0A0962752O746F6E3A536574506F696E7428225249474854222C202D322C2030290D0A0962752O746F6E3A53657454657874284F4B4159290D0A0962752O746F6E3A53657453637269707428224F6E436C69636B222C2042752O746F6E5F4F6E436C69636B290D0A0962752O746F6E3A4869646528290D0A0D0A096C6F63616C20776964676574203D207B0D0A2O09616C69676E6F2O66736574203D2033302C0D0A2O0965646974626F785O203D2065646974626F782C0D0A2O096C6162656C7O203D206C6162656C2C0D0A2O0962752O746F6E6O203D2062752O746F6E2C0D0A2O096672616D657O203D206672616D652C0D0A2O09747970658O203D20547970650D0A097D0D0A09666F72206D6574686F642C2066756E6320696E207061697273286D6574686F64732920646F0D0A2O097769646765745B6D6574686F645D203D2066756E630D0A09656E640D0A0965646974626F782E6F626A2C2062752O746F6E2E6F626A203D207769646765742C207769646765740D0A0D0A0972657475726E204163654755493A5265676973746572417357696467657428776964676574290D0A656E640D0A0D0A4163654755493A52656769737465725769646765745479706528547970652C20436F6E7374727563746F722C2056657273696F6E290D0A00063O0012083O00013O001201000100024O00023O000200022O000700016O00035O00012O00043O00017O00",v9(),...);