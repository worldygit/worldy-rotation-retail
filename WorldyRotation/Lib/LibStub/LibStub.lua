local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then v83[v85[2]]=v85[3];elseif (v86==1) then local v113=v85[2];v78=(v113 + v84) -1 ;for v128=v113,v78 do local v129=v79[v128-v113 ];v83[v128]=v129;end else local v114=v85[2];v83[v114]=v83[v114](v83[v114 + 1 ]);end elseif (v86<=4) then if (v86>3) then do return;end else local v116=v85[2];v83[v116](v13(v83,v116 + 1 ,v78));end elseif (v86>5) then v83[v85[2]]=v59[v85[3]];else local v119;local v120;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v83[v120]=v83[v120](v83[v120 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v78=(v120 + v84) -1 ;for v131=v120,v78 do v119=v79[v131-v120 ];v83[v131]=v119;end v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v83[v120](v13(v83,v120 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703CB082O002O2D202449643A204C6962537475622E6C75612031303320323031342D31302D31362030333A30323A35305A206D692O6B20240D0A2O2D204C69625374756220697320612073696D706C652076657273696F6E696E672073747562206D65616E7420666F722075736520696E204C69627261726965732E2O20682O74703A2O2F3O772E776F776163652E636F6D2F612O646F6E732F6C6962737475622F20666F72206D6F726520696E666F0D0A2O2D204C6962537475622069732068657265627920706C6163656420696E20746865205075626C696320446F6D61696E0D0A2O2D20437265646974733A204B61656C74656E2C20436C616468616972652C20632O6B6E696768742C204D692O6B2C20412O6D6F2C204E65766361697269656C2C206A6F7368626F726B650D0A6C6F63616C204C4942535455425F4D414A4F522C204C4942535455425F4D494E4F52203D20224C696253747562222C20322O202O2D204E45564552204D414B45205448495320414E2053564E205245564953494F4E21204954204E2O45445320544F20424520555341424C4520494E20412O4C205245504F53210D0A6C6F63616C204C696253747562203D205F475B4C4942535455425F4D414A4F525D0D0A0D0A2O2D20436865636B20746F20732O6520697320746869732076657273696F6E206F66207468652073747562206973206F62736F6C6574650D0A6966206E6F74204C696253747562206F72204C6962537475622E6D696E6F72203C204C4942535455425F4D494E4F52207468656E0D0A094C696253747562203D204C696253747562206F72207B6C696273203D207B7D2C206D696E6F7273203D207B7D207D0D0A095F475B4C4942535455425F4D414A4F525D203D204C6962537475620D0A094C6962537475622E6D696E6F72203D204C4942535455425F4D494E4F520D0A090D0A092O2D204C6962537475623A4E65774C696272617279286D616A6F722C206D696E6F72290D0A092O2D206D616A6F722028737472696E6729202D20746865206D616A6F722076657273696F6E206F6620746865206C6962726172790D0A092O2D206D696E6F722028737472696E67206F72206E756D6265722029202D20746865206D696E6F722076657273696F6E206F6620746865206C6962726172790D0A092O2D200D0A092O2D2072657475726E73206E696C2069662061206E65776572206F722073616D652076657273696F6E206F6620746865206C696220697320616C72656164792070726573656E740D0A092O2D2072657475726E7320656D707479206C696272617279206F626A656374206F72206F6C64206C696272617279206F626A6563742069662075706772616465206973206E2O656465640D0A0966756E6374696F6E204C6962537475623A4E65774C696272617279286D616A6F722C206D696E6F72290D0A2O09612O736572742874797065286D616A6F7229202O3D2022737472696E67222C202242616420617267756D656E7420233220746F20604E65774C696272617279272028737472696E672065787065637465642922290D0A2O096D696E6F72203D20612O7365727428746F6E756D626572287374726D61746368286D696E6F722C202225642B222O292C20224D696E6F722076657273696F6E206D757374206569746865722062652061206E756D626572206F7220636F6E7461696E2061206E756D6265722E22290D0A2O090D0A2O096C6F63616C206F6C646D696E6F72203D2073656C662E6D696E6F72735B6D616A6F725D0D0A2O096966206F6C646D696E6F7220616E64206F6C646D696E6F72203E3D206D696E6F72207468656E2072657475726E206E696C20656E640D0A2O0973656C662E6D696E6F72735B6D616A6F725D2C2073656C662E6C6962735B6D616A6F725D203D206D696E6F722C2073656C662E6C6962735B6D616A6F725D206F72207B7D0D0A2O0972657475726E2073656C662E6C6962735B6D616A6F725D2C206F6C646D696E6F720D0A09656E640D0A090D0A092O2D204C6962537475623A4765744C696272617279286D616A6F722C205B73696C656E745D290D0A092O2D206D616A6F722028737472696E6729202D20746865206D616A6F722076657273696F6E206F6620746865206C6962726172790D0A092O2D2073696C656E742028622O6F6C65616E29202D20696620747275652C206C696272617279206973206F7074696F6E616C2C2073696C656E746C792072657475726E206E696C20696620697473206E6F7420666F756E640D0A092O2D0D0A092O2D207468726F777320616E20652O726F7220696620746865206C6962726172792063616E206E6F7420626520666F756E6420286578636570742073696C656E7420697320736574290D0A092O2D2072657475726E7320746865206C696272617279206F626A65637420696620666F756E640D0A0966756E6374696F6E204C6962537475623A4765744C696272617279286D616A6F722C2073696C656E74290D0A2O096966206E6F742073656C662E6C6962735B6D616A6F725D20616E64206E6F742073696C656E74207468656E0D0A3O09652O726F722O282243612O6E6F742066696E642061206C69627261727920696E7374616E6365206F662025712E22293A666F726D617428746F737472696E67286D616A6F722O292C2032290D0A2O09656E640D0A2O0972657475726E2073656C662E6C6962735B6D616A6F725D2C2073656C662E6D696E6F72735B6D616A6F725D0D0A09656E640D0A090D0A092O2D204C6962537475623A497465726174654C696272617269657328290D0A092O2D200D0A092O2D2052657475726E7320616E206974657261746F7220666F72207468652063752O72656E746C792072656769737465726564206C69627261726965730D0A0966756E6374696F6E204C6962537475623A497465726174654C69627261726965732829200D0A2O0972657475726E2070616972732873656C662E6C69627329200D0A09656E640D0A090D0A097365746D6574617461626C65284C6962537475622C207B202O5F63612O6C203D204C6962537475622E4765744C696272617279207D290D0A656E640D0A00063O0012053O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);