local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then v83[v85[2]]=v85[3];elseif (v86>1) then local v113=v85[2];v83[v113]=v83[v113](v83[v113 + 1 ]);else do return;end end elseif (v86<=4) then if (v86>3) then local v115=v85[2];v78=(v115 + v84) -1 ;for v125=v115,v78 do local v126=v79[v125-v115 ];v83[v125]=v126;end else local v116=v85[2];v83[v116](v13(v83,v116 + 1 ,v78));end elseif (v86==5) then local v117;local v118;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v83[v118]=v83[v118](v83[v118 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v78=(v118 + v84) -1 ;for v128=v118,v78 do v117=v79[v128-v118 ];v83[v128]=v117;end v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v83[v118](v13(v83,v118 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703750A2O002O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A496E7465726163746976654C6162656C205769646765740D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C20547970652C2056657273696F6E203D2022496E7465726163746976654C6162656C222C2032310D0A6C6F63616C20416365475549203D204C69625374756220616E64204C6962537475622822576F726C64794163654755492D332E30222C2074727565290D0A6966206E6F7420416365475549206F7220284163654755493A47657457696467657456657273696F6E285479706529206F72203029203E3D2056657273696F6E207468656E2072657475726E20656E640D0A0D0A2O2D204C756120415049730D0A6C6F63616C2073656C6563742C207061697273203D2073656C6563742C2070616972730D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A536372697074730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E20436F6E74726F6C5F4F6E456E746572286672616D65290D0A096672616D652E6F626A3A4669726528224F6E456E74657222290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20436F6E74726F6C5F4F6E4C65617665286672616D65290D0A096672616D652E6F626A3A4669726528224F6E4C6561766522290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204C6162656C5F4F6E436C69636B286672616D652C2062752O746F6E290D0A096672616D652E6F626A3A4669726528224F6E436C69636B222C2062752O746F6E290D0A094163654755493A436C656172466F63757328290D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A4D6574686F64730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C206D6574686F6473203D207B0D0A095B224F6E41637175697265225D203D2066756E6374696F6E2873656C66290D0A2O0973656C663A4C6162656C4F6E4163717569726528290D0A2O0973656C663A536574486967686C6967687428290D0A2O0973656C663A536574486967686C69676874546578432O6F726428290D0A2O0973656C663A53657444697361626C65642866616C7365290D0A09656E642C0D0A0D0A092O2D205B224F6E52656C65617365225D203D206E696C2C0D0A0D0A095B22536574486967686C69676874225D203D2066756E6374696F6E2873656C662C203O2E290D0A2O0973656C662E686967686C696768743A53657454657874757265283O2E290D0A09656E642C0D0A0D0A095B22536574486967686C69676874546578432O6F7264225D203D2066756E6374696F6E2873656C662C203O2E290D0A2O096C6F63616C2063203D2073656C656374282223222C203O2E290D0A2O0969662063202O3D2034206F722063202O3D2038207468656E0D0A3O0973656C662E686967686C696768743A536574546578432O6F7264283O2E290D0A2O09656C73650D0A3O0973656C662E686967686C696768743A536574546578432O6F726428302C20312C20302C2031290D0A2O09656E640D0A09656E642C0D0A0D0A095B2253657444697361626C6564225D203D2066756E6374696F6E2873656C662C64697361626C6564290D0A2O0973656C662E64697361626C6564203D2064697361626C65640D0A2O0969662064697361626C6564207468656E0D0A3O0973656C662E6672616D653A456E61626C654D6F7573652866616C7365290D0A3O0973656C662E6C6162656C3A53657454657874436F6C6F7228302E352C20302E352C20302E35290D0A2O09656C73650D0A3O0973656C662E6672616D653A456E61626C654D6F7573652874727565290D0A3O0973656C662E6C6162656C3A53657454657874436F6C6F7228312C20312C2031290D0A2O09656E640D0A09656E640D0A7D0D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A436F6E7374727563746F720D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E20436F6E7374727563746F7228290D0A092O2D206372656174652061204C6162656C207479706520746861742077652077692O6C2068696A61636B0D0A096C6F63616C206C6162656C203D204163654755493A43726561746528224C6162656C22290D0A0D0A096C6F63616C206672616D65203D206C6162656C2E6672616D650D0A096672616D653A456E61626C654D6F7573652874727565290D0A096672616D653A53657453637269707428224F6E456E746572222C20436F6E74726F6C5F4F6E456E746572290D0A096672616D653A53657453637269707428224F6E4C65617665222C20436F6E74726F6C5F4F6E4C65617665290D0A096672616D653A53657453637269707428224F6E4D6F757365446F776E222C204C6162656C5F4F6E436C69636B290D0A0D0A096C6F63616C20686967686C69676874203D206672616D653A43726561746554657874757265286E696C2C2022484947484C4947485422290D0A09686967686C696768743A53657454657874757265286E696C290D0A09686967686C696768743A536574412O6C506F696E747328290D0A09686967686C696768743A536574426C656E644D6F64652822412O4422290D0A0D0A096C6162656C2E686967686C69676874203D20686967686C696768740D0A096C6162656C2E74797065203D20547970650D0A096C6162656C2E4C6162656C4F6E41637175697265203D206C6162656C2E4F6E416371756972650D0A09666F72206D6574686F642C2066756E6320696E207061697273286D6574686F64732920646F0D0A2O096C6162656C5B6D6574686F645D203D2066756E630D0A09656E640D0A0D0A0972657475726E206C6162656C0D0A656E640D0A0D0A4163654755493A52656769737465725769646765745479706528547970652C20436F6E7374727563746F722C2056657273696F6E290D0A0D0A00063O0012053O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);