local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then v83[v85[2]]=v85[3];elseif (v86>1) then local v117=v85[2];v83[v117]=v83[v117](v83[v117 + 1 ]);else do return;end end elseif (v86<=3) then if (v85[3]=="_ENV") then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86>4) then if (v85[3]=="_ENV") then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v122=v85[2];v83[v122]=v83[v122](v83[v122 + 1 ]);end elseif (v86<=8) then if (v86<=6) then local v113=v85[2];v83[v113](v13(v83,v113 + 1 ,v78));elseif (v86>7) then local v124=v85[2];v78=(v124 + v84) -1 ;for v129=v124,v78 do local v130=v79[v129-v124 ];v83[v129]=v130;end else local v125=v85[2];v78=(v125 + v84) -1 ;for v132=v125,v78 do local v133=v79[v132-v125 ];v83[v132]=v133;end end elseif (v86<=9) then v83[v85[2]]=v85[3];elseif (v86>10) then do return;end else local v126=v85[2];v83[v126](v13(v83,v126 + 1 ,v78));end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67039E272O006C6F63616C20416365475549203D204C69625374756228224163654755492D332E3022290D0A0D0A2O2D204C756120415049730D0A6C6F63616C2070616972732C20612O736572742C2074797065203D2070616972732C20612O736572742C20747970650D0A0D0A2O2D20576F5720415049730D0A6C6F63616C20506C6179536F756E64203D20506C6179536F756E640D0A6C6F63616C204372656174654672616D652C205549506172656E74203D204372656174654672616D652C205549506172656E740D0A0D0A9O2D7O2D0D0A2O2D204D61696E204672616D65202O2D0D0A9O2D7O2D0D0A2O2D2O5B0D0A094576656E7473203A0D0A2O094F6E436C6F73650D0A0D0A2O5D0D0A646F0D0A096C6F63616C2054797065203D202257696E646F77220D0A096C6F63616C2056657273696F6E203D20380D0A0D0A096C6F63616C2066756E6374696F6E206672616D654F6E53686F772874686973290D0A2O09746869732E6F626A3A4669726528224F6E53686F7722290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E206672616D654F6E436C6F73652874686973290D0A2O09746869732E6F626A3A4669726528224F6E436C6F736522290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E20636C6F73654F6E436C69636B2874686973290D0A2O09506C6179536F756E6428372O3929202O2D20534F554E444B49542E47535F5449544C455F4F5054494F4E5F455849540D0A2O09746869732E6F626A3A4869646528290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E206672616D654F6E4D6F757365446F776E2874686973290D0A2O094163654755493A436C656172466F63757328290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E207469746C654F6E4D6F757365446F776E2874686973290D0A2O09746869733A476574506172656E7428293A53746172744D6F76696E6728290D0A2O094163654755493A436C656172466F63757328290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E206672616D654F6E4D6F75736555702874686973290D0A2O096C6F63616C206672616D65203D20746869733A476574506172656E7428290D0A2O096672616D653A53746F704D6F76696E674F7253697A696E6728290D0A2O096C6F63616C2073656C66203D206672616D652E6F626A0D0A2O096C6F63616C20737461747573203D2073656C662E737461747573206F722073656C662E6C6F63616C7374617475730D0A2O097374617475732E7769647468203D206672616D653A476574576964746828290D0A2O097374617475732E686569676874203D206672616D653A47657448656967687428290D0A2O097374617475732E746F70203D206672616D653A476574546F7028290D0A2O097374617475732E6C656674203D206672616D653A4765744C65667428290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E2073697A657273654F6E4D6F757365446F776E2874686973290D0A2O09746869733A476574506172656E7428293A537461727453697A696E672822424F2O544F4D524947485422290D0A2O094163654755493A436C656172466F63757328290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E2073697A6572734F6E4D6F757365446F776E2874686973290D0A2O09746869733A476574506172656E7428293A537461727453697A696E672822424F2O544F4D22290D0A2O094163654755493A436C656172466F63757328290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E2073697A6572654F6E4D6F757365446F776E2874686973290D0A2O09746869733A476574506172656E7428293A537461727453697A696E672822524947485422290D0A2O094163654755493A436C656172466F63757328290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E2073697A65724F6E4D6F75736555702874686973290D0A2O09746869733A476574506172656E7428293A53746F704D6F76696E674F7253697A696E6728290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E205365745469746C652873656C662C7469746C65290D0A2O0973656C662E7469746C65746578743A53657454657874287469746C65290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E20536574537461747573546578742873656C662C74657874290D0A2O092O2D2073656C662E737461747573746578743A536574546578742874657874290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E20486964652873656C66290D0A2O0973656C662E6672616D653A4869646528290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E2053686F772873656C66290D0A2O0973656C662E6672616D653A53686F7728290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E204F6E416371756972652873656C66290D0A2O0973656C662E6672616D653A536574506172656E74285549506172656E74290D0A2O0973656C662E6672616D653A5365744672616D65537472617461282246552O4C5343522O454E5F4449414C4F4722290D0A2O0973656C663A412O706C7953746174757328290D0A2O0973656C663A456E61626C65526573697A652874727565290D0A2O0973656C663A53686F7728290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E204F6E52656C656173652873656C66290D0A2O0973656C662E737461747573203D206E696C0D0A2O09666F72206B20696E2070616972732873656C662E6C6F63616C7374617475732920646F0D0A3O0973656C662E6C6F63616C7374617475735B6B5D203D206E696C0D0A2O09656E640D0A09656E640D0A0D0A092O2D2063612O6C656420746F2073657420616E2065787465726E616C207461626C6520746F2073746F72652073746174757320696E0D0A096C6F63616C2066756E6374696F6E205365745374617475735461626C652873656C662C20737461747573290D0A2O09612O7365727428747970652873746174757329202O3D20227461626C6522290D0A2O0973656C662E737461747573203D207374617475730D0A2O0973656C663A412O706C7953746174757328290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E20412O706C795374617475732873656C66290D0A2O096C6F63616C20737461747573203D2073656C662E737461747573206F722073656C662E6C6F63616C7374617475730D0A2O096C6F63616C206672616D65203D2073656C662E6672616D650D0A2O0973656C663A5365745769647468287374617475732E7769647468206F7220372O30290D0A2O0973656C663A536574486569676874287374617475732E686569676874206F7220352O30290D0A2O096966207374617475732E746F7020616E64207374617475732E6C656674207468656E0D0A3O096672616D653A536574506F696E742822544F50222C5549506172656E742C22424F2O544F4D222C302C7374617475732E746F70290D0A3O096672616D653A536574506F696E7428224C454654222C5549506172656E742C224C454654222C7374617475732E6C6566742C30290D0A2O09656C73650D0A3O096672616D653A536574506F696E74282243454E544552222C5549506172656E742C2243454E54455222290D0A2O09656E640D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E204F6E57696474685365742873656C662C207769647468290D0A2O096C6F63616C20636F6E74656E74203D2073656C662E636F6E74656E740D0A2O096C6F63616C20636F6E74656E747769647468203D207769647468202D2033340D0A2O09696620636F6E74656E747769647468203C2030207468656E0D0A3O09636F6E74656E747769647468203D20300D0A2O09656E640D0A2O09636F6E74656E743A536574576964746828636F6E74656E747769647468290D0A2O09636F6E74656E742E7769647468203D20636F6E74656E7477696474680D0A09656E640D0A0D0A0D0A096C6F63616C2066756E6374696F6E204F6E4865696768745365742873656C662C20686569676874290D0A2O096C6F63616C20636F6E74656E74203D2073656C662E636F6E74656E740D0A2O096C6F63616C20636F6E74656E74686569676874203D20686569676874202D2035370D0A2O09696620636F6E74656E74686569676874203C2030207468656E0D0A3O09636F6E74656E74686569676874203D20300D0A2O09656E640D0A2O09636F6E74656E743A53657448656967687428636F6E74656E74686569676874290D0A2O09636F6E74656E742E686569676874203D20636F6E74656E746865696768740D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E20456E61626C65526573697A652873656C662C207374617465290D0A2O096C6F63616C2066756E63203D20737461746520616E64202253686F7722206F72202248696465220D0A2O0973656C662E73697A65725F73655B66756E635D2873656C662E73697A65725F7365290D0A2O0973656C662E73697A65725F735B66756E635D2873656C662E73697A65725F73290D0A2O0973656C662E73697A65725F655B66756E635D2873656C662E73697A65725F65290D0A09656E640D0A0D0A096C6F63616C2066756E6374696F6E20436F6E7374727563746F7228290D0A2O096C6F63616C206672616D65203D204372656174654672616D6528224672616D65222C6E696C2C5549506172656E74290D0A2O096C6F63616C2073656C66203D207B7D0D0A2O0973656C662E74797065203D202257696E646F77220D0A0D0A2O0973656C662E48696465203D20486964650D0A2O0973656C662E53686F77203D2053686F770D0A2O0973656C662E5365745469746C65203D2O205365745469746C650D0A2O0973656C662E4F6E52656C65617365203D204F6E52656C656173650D0A2O0973656C662E4F6E41637175697265203D204F6E416371756972650D0A2O0973656C662E53657453746174757354657874203D20536574537461747573546578740D0A2O0973656C662E5365745374617475735461626C65203D205365745374617475735461626C650D0A2O0973656C662E412O706C79537461747573203D20412O706C795374617475730D0A2O0973656C662E4F6E5769647468536574203D204F6E57696474685365740D0A2O0973656C662E4F6E486569676874536574203D204F6E4865696768745365740D0A2O0973656C662E456E61626C65526573697A65203D20456E61626C65526573697A650D0A0D0A2O0973656C662E6C6F63616C737461747573203D207B7D0D0A0D0A2O0973656C662E6672616D65203D206672616D650D0A2O096672616D652E6F626A203D2073656C660D0A2O096672616D653A536574576964746828372O30290D0A2O096672616D653A53657448656967687428352O30290D0A2O096672616D653A536574506F696E74282243454E544552222C5549506172656E742C2243454E544552222C302C30290D0A2O096672616D653A456E61626C654D6F75736528290D0A2O096672616D653A5365744D6F7661626C652874727565290D0A2O096672616D653A536574526573697A61626C652874727565290D0A2O096672616D653A5365744672616D65537472617461282246552O4C5343522O454E5F4449414C4F4722290D0A2O096672616D653A53657453637269707428224F6E4D6F757365446F776E222C206672616D654F6E4D6F757365446F776E290D0A0D0A2O096672616D653A53657453637269707428224F6E53686F77222C6672616D654F6E53686F77290D0A2O096672616D653A53657453637269707428224F6E48696465222C6672616D654F6E436C6F7365290D0A2O096966206672616D652E536574526573697A65426F756E6473207468656E202O2D20576F572031302E300D0A3O096672616D653A536574526573697A65426F756E6473283234302C323430290D0A2O09656C73650D0A3O096672616D653A5365744D696E526573697A65283234302C323430290D0A2O09656E640D0A2O096672616D653A536574546F706C6576656C2874727565290D0A0D0A2O096C6F63616C207469746C656267203D206672616D653A43726561746554657874757265286E696C2C20224241434B47524F554E4422290D0A2O097469746C6562673A5365745465787475726528323531392O3629202O2D20496E746572666163652O5C5061706572446F2O6C496E666F4672616D652O5C55492D476561724D616E616765722D5469746C652D4261636B67726F756E640D0A2O097469746C6562673A536574506F696E742822544F504C454654222C20392C202D36290D0A2O097469746C6562673A536574506F696E742822424F2O544F4D5249474854222C206672616D652C2022544F505249474854222C202D32382C202D3234290D0A0D0A2O096C6F63616C206469616C6F676267203D206672616D653A43726561746554657874757265286E696C2C20224241434B47524F554E4422290D0A2O096469616C6F6762673A536574546578747572652831333730353629202O2D20496E746572666163652O5C542O6F6C746970732O5C55492D542O6F6C7469702D4261636B67726F756E640D0A2O096469616C6F6762673A536574506F696E742822544F504C454654222C20382C202D3234290D0A2O096469616C6F6762673A536574506F696E742822424F2O544F4D5249474854222C202D362C2038290D0A2O096469616C6F6762673A536574566572746578436F6C6F7228302C20302C20302C202E3735290D0A0D0A2O096C6F63616C20746F706C656674203D206672616D653A43726561746554657874757265286E696C2C2022424F5244455222290D0A2O09746F706C6566743A536574546578747572652832353139363329202O2D20496E746572666163652O5C5061706572446F2O6C496E666F4672616D652O5C55492D476561724D616E616765722D426F726465720D0A2O09746F706C6566743A5365745769647468283634290D0A2O09746F706C6566743A536574486569676874283634290D0A2O09746F706C6566743A536574506F696E742822544F504C45465422290D0A2O09746F706C6566743A536574546578432O6F726428302E3530313935333132352C20302E3632352C20302C2031290D0A0D0A2O096C6F63616C20746F707269676874203D206672616D653A43726561746554657874757265286E696C2C2022424F5244455222290D0A2O09746F7072696768743A536574546578747572652832353139363329202O2D20496E746572666163652O5C5061706572446F2O6C496E666F4672616D652O5C55492D476561724D616E616765722D426F726465720D0A2O09746F7072696768743A5365745769647468283634290D0A2O09746F7072696768743A536574486569676874283634290D0A2O09746F7072696768743A536574506F696E742822544F50524947485422290D0A2O09746F7072696768743A536574546578432O6F726428302E3632352C20302E37352C20302C2031290D0A0D0A2O096C6F63616C20746F70203D206672616D653A43726561746554657874757265286E696C2C2022424F5244455222290D0A2O09746F703A536574546578747572652832353139363329202O2D20496E746572666163652O5C5061706572446F2O6C496E666F4672616D652O5C55492D476561724D616E616765722D426F726465720D0A2O09746F703A536574486569676874283634290D0A2O09746F703A536574506F696E742822544F504C454654222C20746F706C6566742C2022544F50524947485422290D0A2O09746F703A536574506F696E742822544F505249474854222C20746F7072696768742C2022544F504C45465422290D0A2O09746F703A536574546578432O6F726428302E32352C20302E3336393134303632352C20302C2031290D0A0D0A2O096C6F63616C20626F2O746F6D6C656674203D206672616D653A43726561746554657874757265286E696C2C2022424F5244455222290D0A2O09626F2O746F6D6C6566743A536574546578747572652832353139363329202O2D20496E746572666163652O5C5061706572446F2O6C496E666F4672616D652O5C55492D476561724D616E616765722D426F726465720D0A2O09626F2O746F6D6C6566743A5365745769647468283634290D0A2O09626F2O746F6D6C6566743A536574486569676874283634290D0A2O09626F2O746F6D6C6566743A536574506F696E742822424F2O544F4D4C45465422290D0A2O09626F2O746F6D6C6566743A536574546578432O6F726428302E3735313935333132352C20302E3837352C20302C2031290D0A0D0A2O096C6F63616C20626F2O746F6D7269676874203D206672616D653A43726561746554657874757265286E696C2C2022424F5244455222290D0A2O09626F2O746F6D72696768743A536574546578747572652832353139363329202O2D20496E746572666163652O5C5061706572446F2O6C496E666F4672616D652O5C55492D476561724D616E616765722D426F726465720D0A2O09626F2O746F6D72696768743A5365745769647468283634290D0A2O09626F2O746F6D72696768743A536574486569676874283634290D0A2O09626F2O746F6D72696768743A536574506F696E742822424F2O544F4D524947485422290D0A2O09626F2O746F6D72696768743A536574546578432O6F726428302E3837352C20312C20302C2031290D0A0D0A2O096C6F63616C20626F2O746F6D203D206672616D653A43726561746554657874757265286E696C2C2022424F5244455222290D0A2O09626F2O746F6D3A536574546578747572652832353139363329202O2D20496E746572666163652O5C5061706572446F2O6C496E666F4672616D652O5C55492D476561724D616E616765722D426F726465720D0A2O09626F2O746F6D3A536574486569676874283634290D0A2O09626F2O746F6D3A536574506F696E742822424F2O544F4D4C454654222C20626F2O746F6D6C6566742C2022424F2O544F4D524947485422290D0A2O09626F2O746F6D3A536574506F696E742822424F2O544F4D5249474854222C20626F2O746F6D72696768742C2022424F2O544F4D4C45465422290D0A2O09626F2O746F6D3A536574546578432O6F726428302E3337363935333132352C20302E3439383034363837352C20302C2031290D0A0D0A2O096C6F63616C206C656674203D206672616D653A43726561746554657874757265286E696C2C2022424F5244455222290D0A2O096C6566743A536574546578747572652832353139363329202O2D20496E746572666163652O5C5061706572446F2O6C496E666F4672616D652O5C55492D476561724D616E616765722D426F726465720D0A2O096C6566743A5365745769647468283634290D0A2O096C6566743A536574506F696E742822544F504C454654222C20746F706C6566742C2022424F2O544F4D4C45465422290D0A2O096C6566743A536574506F696E742822424F2O544F4D4C454654222C20626F2O746F6D6C6566742C2022544F504C45465422290D0A2O096C6566743A536574546578432O6F726428302E2O30313935333132352C20302E3132352C20302C2031290D0A0D0A2O096C6F63616C207269676874203D206672616D653A43726561746554657874757265286E696C2C2022424F5244455222290D0A2O0972696768743A536574546578747572652832353139363329202O2D20496E746572666163652O5C5061706572446F2O6C496E666F4672616D652O5C55492D476561724D616E616765722D426F726465720D0A2O0972696768743A5365745769647468283634290D0A2O0972696768743A536574506F696E742822544F505249474854222C20746F7072696768742C2022424F2O544F4D524947485422290D0A2O0972696768743A536574506F696E742822424F2O544F4D5249474854222C20626F2O746F6D72696768742C2022544F50524947485422290D0A2O0972696768743A536574546578432O6F726428302E2O3137313837352C20302E323432313837352C20302C2031290D0A0D0A2O096C6F63616C20636C6F7365203D204372656174654672616D65282242752O746F6E222C206E696C2C206672616D652C2022554950616E656C436C6F736542752O746F6E22290D0A2O09636C6F73653A536574506F696E742822544F505249474854222C20322C2031290D0A2O09636C6F73653A53657453637269707428224F6E436C69636B222C20636C6F73654F6E436C69636B290D0A2O0973656C662E636C6F736562752O746F6E203D20636C6F73650D0A2O09636C6F73652E6F626A203D2073656C660D0A0D0A2O096C6F63616C207469746C6574657874203D206672616D653A437265617465466F6E74537472696E67286E696C2C2022415254574F524B22290D0A2O097469746C65746578743A536574466F6E744F626A6563742847616D65466F6E744E6F726D616C290D0A2O097469746C65746578743A536574506F696E742822544F504C454654222C2031322C202D38290D0A2O097469746C65746578743A536574506F696E742822544F505249474854222C202D33322C202D38290D0A2O0973656C662E7469746C6574657874203D207469746C65746578740D0A0D0A2O096C6F63616C207469746C65203D204372656174654672616D65282242752O746F6E222C206E696C2C206672616D65290D0A2O097469746C653A536574506F696E742822544F504C454654222C207469746C656267290D0A2O097469746C653A536574506F696E742822424F2O544F4D5249474854222C207469746C656267290D0A2O097469746C653A456E61626C654D6F75736528290D0A2O097469746C653A53657453637269707428224F6E4D6F757365446F776E222C7469746C654F6E4D6F757365446F776E290D0A2O097469746C653A53657453637269707428224F6E4D6F7573655570222C206672616D654F6E4D6F7573655570290D0A2O0973656C662E7469746C65203D207469746C650D0A0D0A2O096C6F63616C2073697A65725F7365203D204372656174654672616D6528224672616D65222C6E696C2C6672616D65290D0A2O0973697A65725F73653A536574506F696E742822424F2O544F4D5249474854222C6672616D652C22424F2O544F4D5249474854222C302C30290D0A2O0973697A65725F73653A5365745769647468283235290D0A2O0973697A65725F73653A536574486569676874283235290D0A2O0973697A65725F73653A456E61626C654D6F75736528290D0A2O0973697A65725F73653A53657453637269707428224F6E4D6F757365446F776E222C73697A657273654F6E4D6F757365446F776E290D0A2O0973697A65725F73653A53657453637269707428224F6E4D6F7573655570222C2073697A65724F6E4D6F7573655570290D0A2O0973656C662E73697A65725F7365203D2073697A65725F73650D0A0D0A2O096C6F63616C206C696E6531203D2073697A65725F73653A43726561746554657874757265286E696C2C20224241434B47524F554E4422290D0A2O0973656C662E6C696E6531203D206C696E65310D0A2O096C696E65313A5365745769647468283134290D0A2O096C696E65313A536574486569676874283134290D0A2O096C696E65313A536574506F696E742822424F2O544F4D5249474854222C202D382C2038290D0A2O096C696E65313A536574546578747572652831333730353729202O2D20496E746572666163652O5C542O6F6C746970732O5C55492D542O6F6C7469702D426F726465720D0A2O096C6F63616C2078203D20302E31202A2031342F31370D0A2O096C696E65313A536574546578432O6F726428302E3035202D20782C20302E352C20302E30352C20302E35202B20782C20302E30352C20302E35202D20782C20302E35202B20782C20302E35290D0A0D0A2O096C6F63616C206C696E6532203D2073697A65725F73653A43726561746554657874757265286E696C2C20224241434B47524F554E4422290D0A2O0973656C662E6C696E6532203D206C696E65320D0A2O096C696E65323A53657457696474682838290D0A2O096C696E65323A5365744865696768742838290D0A2O096C696E65323A536574506F696E742822424F2O544F4D5249474854222C202D382C2038290D0A2O096C696E65323A536574546578747572652831333730353729202O2D20496E746572666163652O5C542O6F6C746970732O5C55492D542O6F6C7469702D426F726465720D0A2O0978203D20302E31202A20382F31370D0A2O096C696E65323A536574546578432O6F726428302E3035202D20782C20302E352C20302E30352C20302E35202B20782C20302E30352C20302E35202D20782C20302E35202B20782C20302E35290D0A0D0A2O096C6F63616C2073697A65725F73203D204372656174654672616D6528224672616D65222C6E696C2C6672616D65290D0A2O0973697A65725F733A536574506F696E742822424F2O544F4D5249474854222C6672616D652C22424F2O544F4D5249474854222C2D32352C30290D0A2O0973697A65725F733A536574506F696E742822424F2O544F4D4C454654222C6672616D652C22424F2O544F4D4C454654222C302C30290D0A2O0973697A65725F733A536574486569676874283235290D0A2O0973697A65725F733A456E61626C654D6F75736528290D0A2O0973697A65725F733A53657453637269707428224F6E4D6F757365446F776E222C73697A6572734F6E4D6F757365446F776E290D0A2O0973697A65725F733A53657453637269707428224F6E4D6F7573655570222C2073697A65724F6E4D6F7573655570290D0A2O0973656C662E73697A65725F73203D2073697A65725F730D0A0D0A2O096C6F63616C2073697A65725F65203D204372656174654672616D6528224672616D65222C6E696C2C6672616D65290D0A2O0973697A65725F653A536574506F696E742822424F2O544F4D5249474854222C6672616D652C22424F2O544F4D5249474854222C302C3235290D0A2O0973697A65725F653A536574506F696E742822544F505249474854222C6672616D652C22544F505249474854222C302C30290D0A2O0973697A65725F653A5365745769647468283235290D0A2O0973697A65725F653A456E61626C654D6F75736528290D0A2O0973697A65725F653A53657453637269707428224F6E4D6F757365446F776E222C73697A6572654F6E4D6F757365446F776E290D0A2O0973697A65725F653A53657453637269707428224F6E4D6F7573655570222C2073697A65724F6E4D6F7573655570290D0A2O0973656C662E73697A65725F65203D2073697A65725F650D0A0D0A2O092O2D436F6E7461696E65722053752O706F72740D0A2O096C6F63616C20636F6E74656E74203D204372656174654672616D6528224672616D65222C6E696C2C6672616D65290D0A2O0973656C662E636F6E74656E74203D20636F6E74656E740D0A2O09636F6E74656E742E6F626A203D2073656C660D0A2O09636F6E74656E743A536574506F696E742822544F504C454654222C6672616D652C22544F504C454654222C31322C2D3332290D0A2O09636F6E74656E743A536574506F696E742822424F2O544F4D5249474854222C6672616D652C22424F2O544F4D5249474854222C2D31322C3133290D0A0D0A2O094163654755493A52656769737465724173436F6E7461696E65722873656C66290D0A2O0972657475726E2073656C660D0A09656E640D0A0D0A094163654755493A52656769737465725769646765745479706528547970652C436F6E7374727563746F722C56657273696F6E290D0A656E640D0A00063O0012053O00013O001209000100024O00023O000200022O000700016O000A5O00012O00013O00017O00",v9(),...);