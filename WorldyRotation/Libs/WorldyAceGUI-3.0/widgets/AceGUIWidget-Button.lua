local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));elseif (v86>1) then local v115=v85[2];v78=(v115 + v84) -1 ;for v129=v115,v78 do local v130=v79[v129-v115 ];v83[v129]=v130;end elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86<=3) then v83[v85[2]]=v85[3];elseif (v86>4) then local v116=v85[2];v78=(v116 + v84) -1 ;for v132=v116,v78 do local v133=v79[v132-v116 ];v83[v132]=v133;end else local v117=v85[2];v83[v117]=v83[v117](v83[v117 + 1 ]);end elseif (v86<=8) then if (v86<=6) then do return;end elseif (v86>7) then local v119=v85[2];v83[v119]=v83[v119](v83[v119 + 1 ]);else v83[v85[2]]=v85[3];end elseif (v86<=9) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86>10) then do return;end else local v126=v85[2];v83[v126](v13(v83,v126 + 1 ,v78));end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703270B2O002O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A42752O746F6E205769646765740D0A47726170686963616C2042752O746F6E2E0D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C20547970652C2056657273696F6E203D202242752O746F6E222C2032340D0A6C6F63616C20416365475549203D204C69625374756220616E64204C6962537475622822576F726C64794163654755492D332E30222C2074727565290D0A6966206E6F7420416365475549206F7220284163654755493A47657457696467657456657273696F6E285479706529206F72203029203E3D2056657273696F6E207468656E2072657475726E20656E640D0A0D0A2O2D204C756120415049730D0A6C6F63616C207061697273203D2070616972730D0A0D0A2O2D20576F5720415049730D0A6C6F63616C205F47203D205F470D0A6C6F63616C20506C6179536F756E642C204372656174654672616D652C205549506172656E74203D20506C6179536F756E642C204372656174654672616D652C205549506172656E740D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A536372697074730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E2042752O746F6E5F4F6E436C69636B286672616D652C203O2E290D0A094163654755493A436C656172466F63757328290D0A09506C6179536F756E642838353229202O2D20534F554E444B49542E49475F4D41494E4D454E555F4F5054494F4E0D0A096672616D652E6F626A3A4669726528224F6E436C69636B222C203O2E290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20436F6E74726F6C5F4F6E456E746572286672616D65290D0A096672616D652E6F626A3A4669726528224F6E456E74657222290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20436F6E74726F6C5F4F6E4C65617665286672616D65290D0A096672616D652E6F626A3A4669726528224F6E4C6561766522290D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A4D6574686F64730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C206D6574686F6473203D207B0D0A095B224F6E41637175697265225D203D2066756E6374696F6E2873656C66290D0A2O092O2D20726573746F72652064656661756C742076616C7565730D0A2O0973656C663A536574486569676874283234290D0A2O0973656C663A536574576964746828322O30290D0A2O0973656C663A53657444697361626C65642866616C7365290D0A2O0973656C663A5365744175746F57696474682866616C7365290D0A2O0973656C663A5365745465787428290D0A09656E642C0D0A0D0A092O2D205B224F6E52656C65617365225D203D206E696C2C0D0A0D0A095B2253657454657874225D203D2066756E6374696F6E2873656C662C2074657874290D0A2O0973656C662E746578743A536574546578742874657874290D0A2O0969662073656C662E6175746F5769647468207468656E0D0A3O0973656C663A53657457696474682873656C662E746578743A476574537472696E6757696474682829202B203330290D0A2O09656E640D0A09656E642C0D0A0D0A095B225365744175746F5769647468225D203D2066756E6374696F6E2873656C662C206175746F5769647468290D0A2O0973656C662E6175746F5769647468203D206175746F57696474680D0A2O0969662073656C662E6175746F5769647468207468656E0D0A3O0973656C663A53657457696474682873656C662E746578743A476574537472696E6757696474682829202B203330290D0A2O09656E640D0A09656E642C0D0A0D0A095B2253657444697361626C6564225D203D2066756E6374696F6E2873656C662C2064697361626C6564290D0A2O0973656C662E64697361626C6564203D2064697361626C65640D0A2O0969662064697361626C6564207468656E0D0A3O0973656C662E6672616D653A44697361626C6528290D0A2O09656C73650D0A3O0973656C662E6672616D653A456E61626C6528290D0A2O09656E640D0A09656E640D0A7D0D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A436F6E7374727563746F720D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E20436F6E7374727563746F7228290D0A096C6F63616C206E616D65203D2022416365475549333042752O746F6E22202O2E204163654755493A4765744E6578745769646765744E756D2854797065290D0A096C6F63616C206672616D65203D204372656174654672616D65282242752O746F6E222C206E616D652C205549506172656E742C2022554950616E656C42752O746F6E54656D706C61746522290D0A096672616D653A4869646528290D0A0D0A096672616D653A456E61626C654D6F7573652874727565290D0A096672616D653A53657453637269707428224F6E436C69636B222C2042752O746F6E5F4F6E436C69636B290D0A096672616D653A53657453637269707428224F6E456E746572222C20436F6E74726F6C5F4F6E456E746572290D0A096672616D653A53657453637269707428224F6E4C65617665222C20436F6E74726F6C5F4F6E4C65617665290D0A0D0A096C6F63616C2074657874203D206672616D653A476574466F6E74537472696E6728290D0A09746578743A436C656172412O6C506F696E747328290D0A09746578743A536574506F696E742822544F504C454654222C2031352C202D31290D0A09746578743A536574506F696E742822424F2O544F4D5249474854222C202D31352C2031290D0A09746578743A5365744A7573746966795628224D492O444C4522290D0A0D0A096C6F63616C20776964676574203D207B0D0A2O09746578742O203D20746578742C0D0A2O096672616D65203D206672616D652C0D0A2O09747970652O203D20547970650D0A097D0D0A09666F72206D6574686F642C2066756E6320696E207061697273286D6574686F64732920646F0D0A2O097769646765745B6D6574686F645D203D2066756E630D0A09656E640D0A0D0A0972657475726E204163654755493A5265676973746572417357696467657428776964676574290D0A656E640D0A0D0A4163654755493A52656769737465725769646765745479706528547970652C20436F6E7374727563746F722C2056657273696F6E290D0A00063O0012013O00013O001207000100024O00043O000200022O000500019O003O00012O00063O00017O00",v9(),...);