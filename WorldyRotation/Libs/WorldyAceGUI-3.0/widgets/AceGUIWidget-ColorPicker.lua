local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86==1) then v83[v85[2]]=v85[3];else local v119=v85[2];v83[v119]=v83[v119](v83[v119 + 1 ]);end elseif (v86<=3) then do return;end elseif (v86>4) then local v121=v85[2];v83[v121](v13(v83,v121 + 1 ,v78));elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86<=8) then if (v86<=6) then do return;end elseif (v86>7) then local v122=v85[2];v83[v122]=v83[v122](v83[v122 + 1 ]);else local v124=v85[2];v78=(v124 + v84) -1 ;for v129=v124,v78 do local v130=v79[v129-v124 ];v83[v129]=v130;end end elseif (v86<=9) then v83[v85[2]]=v85[3];elseif (v86>10) then local v125=v85[2];v83[v125](v13(v83,v125 + 1 ,v78));else local v126=v85[2];v78=(v126 + v84) -1 ;for v132=v126,v78 do local v133=v79[v132-v126 ];v83[v132]=v133;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E670378152O002O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A436F6C6F725069636B6572205769646765740D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C20547970652C2056657273696F6E203D2022436F6C6F725069636B6572222C2032350D0A6C6F63616C20416365475549203D204C69625374756220616E64204C6962537475622822576F726C64794163654755492D332E30222C2074727565290D0A6966206E6F7420416365475549206F7220284163654755493A47657457696467657456657273696F6E285479706529206F72203029203E3D2056657273696F6E207468656E2072657475726E20656E640D0A0D0A2O2D204C756120415049730D0A6C6F63616C207061697273203D2070616972730D0A0D0A2O2D20576F5720415049730D0A6C6F63616C204372656174654672616D652C205549506172656E74203D204372656174654672616D652C205549506172656E740D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A53752O706F72742066756E6374696F6E730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E20436F6C6F7243612O6C6261636B2873656C662C20722C20672C20622C20612C206973416C706861290D0A096966206E6F742073656C662E486173416C706861207468656E0D0A2O0961203D20310D0A09656E640D0A0973656C663A536574436F6C6F7228722C20672C20622C2061290D0A09696620436F6C6F725069636B65724672616D653A497356697369626C652829207468656E0D0A2O092O2D636F6C6F727069636B6572206973207374692O6C206F70656E0D0A2O0973656C663A4669726528224F6E56616C75654368616E676564222C20722C20672C20622C2061290D0A09656C73650D0A2O092O2D636F6C6F727069636B657220697320636C6F7365642C20636F6C6F722063612O6C6261636B2069732066697273742C2069676E6F72652069742C0D0A2O092O2D616C7068612063612O6C6261636B206973207468652066696E616C2063612O6C20616674657220697420636C6F73657320736F20636F6E6669726D206E6F770D0A2O096966206973416C706861207468656E0D0A3O0973656C663A4669726528224F6E56616C7565436F6E6669726D6564222C20722C20672C20622C2061290D0A2O09656E640D0A09656E640D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A536372697074730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E20436F6E74726F6C5F4F6E456E746572286672616D65290D0A096672616D652E6F626A3A4669726528224F6E456E74657222290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20436F6E74726F6C5F4F6E4C65617665286672616D65290D0A096672616D652E6F626A3A4669726528224F6E4C6561766522290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20436F6C6F725377617463685F4F6E436C69636B286672616D65290D0A09436F6C6F725069636B65724672616D653A4869646528290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A096966206E6F742073656C662E64697361626C6564207468656E0D0A2O09436F6C6F725069636B65724672616D653A5365744672616D65537472617461282246552O4C5343522O454E5F4449414C4F4722290D0A2O09436F6C6F725069636B65724672616D653A5365744672616D654C6576656C286672616D653A4765744672616D654C6576656C2829202B203130290D0A2O09436F6C6F725069636B65724672616D653A536574436C616D706564546F5363722O656E2874727565290D0A0D0A2O09436F6C6F725069636B65724672616D652E66756E63203D2066756E6374696F6E28290D0A3O096C6F63616C20722C20672C2062203D20436F6C6F725069636B65724672616D653A476574436F6C6F7252474228290D0A3O096C6F63616C2061203D2031202D204F706163697479536C696465724672616D653A47657456616C756528290D0A3O09436F6C6F7243612O6C6261636B2873656C662C20722C20672C20622C2061290D0A2O09656E640D0A0D0A2O09436F6C6F725069636B65724672616D652E6861734F706163697479203D2073656C662E486173416C7068610D0A2O09436F6C6F725069636B65724672616D652E6F70616369747946756E63203D2066756E6374696F6E28290D0A3O096C6F63616C20722C20672C2062203D20436F6C6F725069636B65724672616D653A476574436F6C6F7252474228290D0A3O096C6F63616C2061203D2031202D204F706163697479536C696465724672616D653A47657456616C756528290D0A3O09436F6C6F7243612O6C6261636B2873656C662C20722C20672C20622C20612C2074727565290D0A2O09656E640D0A0D0A2O096C6F63616C20722C20672C20622C2061203D2073656C662E722C2073656C662E672C2073656C662E622C2073656C662E610D0A2O0969662073656C662E486173416C706861207468656E0D0A3O09436F6C6F725069636B65724672616D652E6F706163697479203D2031202D202861206F722030290D0A2O09656E640D0A2O09436F6C6F725069636B65724672616D653A536574436F6C6F7252474228722C20672C2062290D0A0D0A2O09436F6C6F725069636B65724672616D652E63616E63656C46756E63203D2066756E6374696F6E28290D0A3O09436F6C6F7243612O6C6261636B2873656C662C20722C20672C20622C20612C2074727565290D0A2O09656E640D0A0D0A2O09436F6C6F725069636B65724672616D653A53686F7728290D0A09656E640D0A094163654755493A436C656172466F63757328290D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A4D6574686F64730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C206D6574686F6473203D207B0D0A095B224F6E41637175697265225D203D2066756E6374696F6E2873656C66290D0A2O0973656C663A536574486569676874283234290D0A2O0973656C663A536574576964746828322O30290D0A2O0973656C663A536574486173416C7068612866616C7365290D0A2O0973656C663A536574436F6C6F7228302C20302C20302C2031290D0A2O0973656C663A53657444697361626C6564286E696C290D0A2O0973656C663A5365744C6162656C286E696C290D0A09656E642C0D0A0D0A092O2D205B224F6E52656C65617365225D203D206E696C2C0D0A0D0A095B225365744C6162656C225D203D2066756E6374696F6E2873656C662C2074657874290D0A2O0973656C662E746578743A536574546578742874657874290D0A09656E642C0D0A0D0A095B22536574436F6C6F72225D203D2066756E6374696F6E2873656C662C20722C20672C20622C2061290D0A2O0973656C662E72203D20720D0A2O0973656C662E67203D20670D0A2O0973656C662E62203D20620D0A2O0973656C662E61203D2061206F7220310D0A2O0973656C662E636F6C6F725377617463683A536574566572746578436F6C6F7228722C20672C20622C2061290D0A09656E642C0D0A0D0A095B22536574486173416C706861225D203D2066756E6374696F6E2873656C662C20486173416C706861290D0A2O0973656C662E486173416C706861203D20486173416C7068610D0A09656E642C0D0A0D0A095B2253657444697361626C6564225D203D2066756E6374696F6E2873656C662C2064697361626C6564290D0A2O0973656C662E64697361626C6564203D2064697361626C65640D0A2O0969662073656C662E64697361626C6564207468656E0D0A3O0973656C662E6672616D653A44697361626C6528290D0A3O0973656C662E746578743A53657454657874436F6C6F7228302E352C20302E352C20302E35290D0A2O09656C73650D0A3O0973656C662E6672616D653A456E61626C6528290D0A3O0973656C662E746578743A53657454657874436F6C6F7228312C20312C2031290D0A2O09656E640D0A09656E640D0A7D0D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A436F6E7374727563746F720D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E20436F6E7374727563746F7228290D0A096C6F63616C206672616D65203D204372656174654672616D65282242752O746F6E222C206E696C2C205549506172656E74290D0A096672616D653A4869646528290D0A0D0A096672616D653A456E61626C654D6F7573652874727565290D0A096672616D653A53657453637269707428224F6E456E746572222C20436F6E74726F6C5F4F6E456E746572290D0A096672616D653A53657453637269707428224F6E4C65617665222C20436F6E74726F6C5F4F6E4C65617665290D0A096672616D653A53657453637269707428224F6E436C69636B222C20436F6C6F725377617463685F4F6E436C69636B290D0A0D0A096C6F63616C20636F6C6F72537761746368203D206672616D653A43726561746554657874757265286E696C2C20224F5645524C415922290D0A09636F6C6F725377617463683A5365745769647468283139290D0A09636F6C6F725377617463683A536574486569676874283139290D0A09636F6C6F725377617463683A536574546578747572652831333039333929202O2D20496E746572666163652O5C436861744672616D652O5C436861744672616D65436F6C6F725377617463680D0A09636F6C6F725377617463683A536574506F696E7428224C45465422290D0A0D0A096C6F63616C2074657874757265203D206672616D653A43726561746554657874757265286E696C2C20224241434B47524F554E4422290D0A09636F6C6F725377617463682E6261636B67726F756E64203D20746578747572650D0A09746578747572653A5365745769647468283136290D0A09746578747572653A536574486569676874283136290D0A09746578747572653A536574436F6C6F725465787475726528312C20312C2031290D0A09746578747572653A536574506F696E74282243454E544552222C20636F6C6F72537761746368290D0A09746578747572653A53686F7728290D0A0D0A096C6F63616C20636865636B657273203D206672616D653A43726561746554657874757265286E696C2C20224241434B47524F554E4422290D0A09636F6C6F725377617463682E636865636B657273203D20636865636B6572730D0A09636865636B6572733A5365745769647468283134290D0A09636865636B6572733A536574486569676874283134290D0A09636865636B6572733A5365745465787475726528312O3835323329202O2D2054696C657365742O5C47656E657269632O5C436865636B6572730D0A09636865636B6572733A536574546578432O6F7264282E32352C20302C20302E352C202E3235290D0A09636865636B6572733A53657444657361747572617465642874727565290D0A09636865636B6572733A536574566572746578436F6C6F7228312C20312C20312C20302E3735290D0A09636865636B6572733A536574506F696E74282243454E544552222C20636F6C6F72537761746368290D0A09636865636B6572733A53686F7728290D0A0D0A096C6F63616C2074657874203D206672616D653A437265617465466F6E74537472696E67286E696C2C224F5645524C4159222C2247616D65466F6E74486967686C6967687422290D0A09746578743A536574486569676874283234290D0A09746578743A5365744A7573746966794828224C45465422290D0A09746578743A53657454657874436F6C6F7228312C20312C2031290D0A09746578743A536574506F696E7428224C454654222C20636F6C6F725377617463682C20225249474854222C20322C2030290D0A09746578743A536574506F696E742822524947485422290D0A0D0A092O2D6C6F63616C20686967686C69676874203D206672616D653A43726561746554657874757265286E696C2C2022484947484C4947485422290D0A092O2D686967686C696768743A536574546578747572652831333638313029202O2D20496E746572666163652O5C51756573744672616D652O5C55492D51756573745469746C65486967686C696768740D0A092O2D686967686C696768743A536574426C656E644D6F64652822412O4422290D0A092O2D686967686C696768743A536574412O6C506F696E7473286672616D65290D0A0D0A096C6F63616C20776964676574203D207B0D0A2O09636F6C6F72537761746368203D20636F6C6F725377617463682C0D0A2O09746578748O203D20746578742C0D0A2O096672616D657O203D206672616D652C0D0A2O09747970658O203D20547970650D0A097D0D0A09666F72206D6574686F642C2066756E6320696E207061697273286D6574686F64732920646F0D0A2O097769646765745B6D6574686F645D203D2066756E630D0A09656E640D0A0D0A0972657475726E204163654755493A5265676973746572417357696467657428776964676574290D0A656E640D0A0D0A4163654755493A52656769737465725769646765745479706528547970652C20436F6E7374727563746F722C2056657273696F6E290D0A00063O00124O00013O001209000100024O00083O000200022O000A00016O000B5O00012O00033O00017O00",v9(),...);