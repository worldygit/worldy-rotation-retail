local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110](v13(v83,v110 + 1 ,v78));elseif (v86==1) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else do return;end end elseif (v86<=4) then if (v86>3) then local v112=v85[2];v78=(v112 + v84) -1 ;for v125=v112,v78 do local v126=v79[v125-v112 ];v83[v125]=v126;end else local v113=v85[2];v83[v113]=v83[v113](v83[v113 + 1 ]);end elseif (v86>5) then v83[v85[2]]=v85[3];else local v117;local v118;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v83[v118]=v83[v118](v83[v118 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v78=(v118 + v84) -1 ;for v128=v118,v78 do v117=v79[v128-v118 ];v83[v128]=v117;end v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v83[v118](v13(v83,v118 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703170C2O002O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A496E6C696E6547726F757020436F6E7461696E65720D0A53696D706C6520636F6E7461696E6572207769646765742074686174206372656174657320612076697369626C652022626F7822207769746820616E206F7074696F6E616C207469746C652E0D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C20547970652C2056657273696F6E203D2022496E6C696E6547726F7570222C202O320D0A6C6F63616C20416365475549203D204C69625374756220616E64204C6962537475622822576F726C64794163654755492D332E30222C2074727565290D0A6966206E6F7420416365475549206F7220284163654755493A47657457696467657456657273696F6E285479706529206F72203029203E3D2056657273696F6E207468656E2072657475726E20656E640D0A0D0A2O2D204C756120415049730D0A6C6F63616C207061697273203D2070616972730D0A0D0A2O2D20576F5720415049730D0A6C6F63616C204372656174654672616D652C205549506172656E74203D204372656174654672616D652C205549506172656E740D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A4D6574686F64730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C206D6574686F6473203D207B0D0A095B224F6E41637175697265225D203D2066756E6374696F6E2873656C66290D0A2O0973656C663A536574576964746828332O30290D0A2O0973656C663A53657448656967687428312O30290D0A2O0973656C663A5365745469746C65282O22290D0A09656E642C0D0A0D0A092O2D205B224F6E52656C65617365225D203D206E696C2C0D0A0D0A095B225365745469746C65225D203D2066756E6374696F6E2873656C662C7469746C65290D0A2O0973656C662E7469746C65746578743A53657454657874287469746C65290D0A09656E642C0D0A0D0A0D0A095B224C61796F757446696E6973686564225D203D2066756E6374696F6E2873656C662C2077696474682C20686569676874290D0A2O0969662073656C662E6E6F4175746F486569676874207468656E2072657475726E20656E640D0A2O0973656C663A5365744865696768742O28686569676874206F72203029202B203430290D0A09656E642C0D0A0D0A095B224F6E5769647468536574225D203D2066756E6374696F6E2873656C662C207769647468290D0A2O096C6F63616C20636F6E74656E74203D2073656C662E636F6E74656E740D0A2O096C6F63616C20636F6E74656E747769647468203D207769647468202D2032300D0A2O09696620636F6E74656E747769647468203C2030207468656E0D0A3O09636F6E74656E747769647468203D20300D0A2O09656E640D0A2O09636F6E74656E743A536574576964746828636F6E74656E747769647468290D0A2O09636F6E74656E742E7769647468203D20636F6E74656E7477696474680D0A09656E642C0D0A0D0A095B224F6E486569676874536574225D203D2066756E6374696F6E2873656C662C20686569676874290D0A2O096C6F63616C20636F6E74656E74203D2073656C662E636F6E74656E740D0A2O096C6F63616C20636F6E74656E74686569676874203D20686569676874202D2032300D0A2O09696620636F6E74656E74686569676874203C2030207468656E0D0A3O09636F6E74656E74686569676874203D20300D0A2O09656E640D0A2O09636F6E74656E743A53657448656967687428636F6E74656E74686569676874290D0A2O09636F6E74656E742E686569676874203D20636F6E74656E746865696768740D0A09656E640D0A7D0D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A436F6E7374727563746F720D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2050616E654261636B64726F702O203D207B0D0A09626746696C65203D2022496E746572666163652O5C436861744672616D652O5C436861744672616D654261636B67726F756E64222C0D0A096564676546696C65203D2022496E746572666163652O5C542O6F6C746970732O5C55492D542O6F6C7469702D426F72646572222C0D0A0974696C65203D20747275652C2074696C6553697A65203D2031362C206564676553697A65203D2031362C0D0A09696E73657473203D207B206C656674203D20332C207269676874203D20332C20746F70203D20352C20626F2O746F6D203D2033207D0D0A7D0D0A0D0A6C6F63616C2066756E6374696F6E20436F6E7374727563746F7228290D0A096C6F63616C206672616D65203D204372656174654672616D6528224672616D65222C206E696C2C205549506172656E74290D0A096672616D653A5365744672616D65537472617461282246552O4C5343522O454E5F4449414C4F4722290D0A0D0A096C6F63616C207469746C6574657874203D206672616D653A437265617465466F6E74537472696E67286E696C2C20224F5645524C4159222C202247616D65466F6E744E6F726D616C22290D0A097469746C65746578743A536574506F696E742822544F504C454654222C2031342C2030290D0A097469746C65746578743A536574506F696E742822544F505249474854222C202D31342C2030290D0A097469746C65746578743A5365744A7573746966794828224C45465422290D0A097469746C65746578743A536574486569676874283138290D0A0D0A096C6F63616C20626F72646572203D204372656174654672616D6528224672616D65222C206E696C2C206672616D652C20224261636B64726F7054656D706C61746522290D0A09626F726465723A536574506F696E742822544F504C454654222C20302C202D3137290D0A09626F726465723A536574506F696E742822424F2O544F4D5249474854222C202D312C2033290D0A09626F726465723A5365744261636B64726F702850616E654261636B64726F70290D0A09626F726465723A5365744261636B64726F70436F6C6F7228302E312C20302E312C20302E312C20302E35290D0A09626F726465723A5365744261636B64726F70426F72646572436F6C6F7228302E342C20302E342C20302E34290D0A0D0A092O2D436F6E7461696E65722053752O706F72740D0A096C6F63616C20636F6E74656E74203D204372656174654672616D6528224672616D65222C206E696C2C20626F72646572290D0A09636F6E74656E743A536574506F696E742822544F504C454654222C2031302C202D3130290D0A09636F6E74656E743A536574506F696E742822424F2O544F4D5249474854222C202D31302C203130290D0A0D0A096C6F63616C20776964676574203D207B0D0A2O096672616D655O203D206672616D652C0D0A2O09636F6E74656E743O203D20636F6E74656E742C0D0A2O097469746C6574657874203D207469746C65746578742C0D0A2O09747970656O203D20547970650D0A097D0D0A09666F72206D6574686F642C2066756E6320696E207061697273286D6574686F64732920646F0D0A2O097769646765745B6D6574686F645D203D2066756E630D0A09656E640D0A0D0A0972657475726E204163654755493A52656769737465724173436F6E7461696E657228776964676574290D0A656E640D0A0D0A4163654755493A52656769737465725769646765745479706528547970652C20436F6E7374727563746F722C2056657273696F6E290D0A00063O0012053O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);