local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then v83[v85[2]]=v85[3];elseif (v86>1) then do return;end else local v118=v85[2];v83[v118](v13(v83,v118 + 1 ,v78));end elseif (v86<=3) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86==4) then do return;end else local v122=v85[2];v78=(v122 + v84) -1 ;for v129=v122,v78 do local v130=v79[v129-v122 ];v83[v129]=v130;end end elseif (v86<=8) then if (v86<=6) then local v113=v85[2];v83[v113]=v83[v113](v83[v113 + 1 ]);elseif (v86>7) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v123=v85[2];v83[v123](v13(v83,v123 + 1 ,v78));end elseif (v86<=9) then local v115=v85[2];v83[v115]=v83[v115](v83[v115 + 1 ]);elseif (v86==10) then local v124=v85[2];v78=(v124 + v84) -1 ;for v132=v124,v78 do local v133=v79[v132-v124 ];v83[v132]=v133;end else v83[v85[2]]=v85[3];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703C01D2O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A2O2D206170692066756E6374696F6E730D0A6C6F63616C20412O6441706C203D206170692E412O6441706C0D0A6C6F63616C20412O64437573746F6D436F2O6D616E64203D206170692E412O64437573746F6D436F2O6D616E640D0A6C6F63616C20412O64546F2O676C65203D206170692E412O64546F2O676C650D0A6C6F63616C205072696E744465627567203D206170692E5072696E7444656275670D0A6C6F63616C2047657453652O74696E6773203D206170692E47657453652O74696E67730D0A6C6F63616C20416F454F6E203D206170692E416F454F6E0D0A6C6F63616C204344734F6E203D206170692E4344734F6E0D0A6C6F63616C2044697370656C42752O66734F6E203D206170692E44697370656C42752O66734F6E0D0A6C6F63616C2044697370656C446562752O66734F6E203D206170692E44697370656C446562752O66734F6E0D0A6C6F63616C2048616E646C65496E636F72706F7265616C4F6E203D206170692E48616E646C65496E636F72706F7265616C4F6E0D0A6C6F63616C204F70656E65724F6E203D206170692E4F70656E65724F6E0D0A6C6F63616C2052616369616C734F6E203D206170692E52616369616C734F6E0D0A6C6F63616C2042696E64203D206170692E42696E640D0A6C6F63616C2043617374203D206170692E436173740D0A6C6F63616C2043617374437572736F72203D206170692E43617374437572736F720D0A6C6F63616C20436173745461726765744F724D6F7573656F766572203D206170692E436173745461726765744F724D6F7573656F7665720D0A0D0A2O2D2061706920636C612O7365730D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C20746172676574203D20756E69742E7461726765740D0A6C6F63616C20666F637573203D20756E69742E666F6375730D0A6C6F63616C206D6F7573656F766572203D20756E69742E6D6F7573656F7665720D0A0D0A2O2D20646566696E65730D0A6C6F63616C2073203D207370652O6C2E7368616D616E2E726573746F726174696F6E0D0A6C6F63616C2069203D206974656D2E7368616D616E2E726573746F726174696F6E0D0A6C6F63616C206D203D206D6163726F2E7368616D616E2E726573746F726174696F6E0D0A0D0A6C6F63616C20737065634964203D203236340D0A6C6F63616C2061706C4E616D65203D202264656661756C74220D0A6C6F63616C2064656661756C7453652O74696E6773203D207B0D0A2O20656E61626C6564203D207B0D0A2O207D2C0D0A2O206870203D207B0D0A2O207D2C0D0A7D0D0A6C6F63616C2073652O74696E67730D0A0D0A2O2D20766172730D0A6C6F63616C206F6E5573654578636C75646573203D207B7D0D0A6C6F63616C2073686F756C6452657475726E0D0A6C6F63616C20656E656D6965733430790D0A0D0A6C6F63616C2066756E6374696F6E2046692O6C44697370656C7328290D0A2O20696620732E696D70726F7665644E617475726573437572653A4973417661696C61626C652829207468656E0D0A4O206170692E64697370652O6C61626C65446562752O66494473203D207574696C732E4D657267655461626C65286170692E64697370652O6C61626C654D61676963446562752O664944732C206170692E64697370652O6C61626C654375727365446562752O66494473290D0A2O20656C73650D0A4O206170692E64697370652O6C61626C65446562752O66494473203D206170692E64697370652O6C61626C654D61676963446562752O664944730D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2044616D61676528290D0A2O202O2D207472696E6B6574730D0A2O2073686F756C6452657475726E203D206170692E5573655472696E6B6574732834302C206F6E5573654578636C75646573290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A0D0A2O202O2D20612O645F616374696F6E2820746869732C2022466C616D652053686F636B222C202269663D217469636B696E672220293B0D0A2O202O2D20612O645F616374696F6E2820746869732C2022456172746820456C656D656E74616C2220293B0D0A2O202O2D20612O645F616374696F6E2820746869732C202253706972697477616C6B65722773204772616365222C20226D6F76696E673D312C69663D6D6F76656D656E742E64697374616E63653E362220293B0D0A0D0A2O202O2D20612O645F616374696F6E282022626C2O6F645F667572792220293B0D0A2O202O2D20612O645F616374696F6E2820226265727365726B696E672220293B0D0A2O202O2D20612O645F616374696F6E28202266697265626C2O6F642220293B0D0A2O202O2D20612O645F616374696F6E282022616E6365737472616C5F63612O6C2220293B0D0A2O202O2D20612O645F616374696F6E2820226261675F6F665F747269636B732220293B0D0A2O200D0A2O202O2D20612O645F616374696F6E2820746869732C20224C617661204275727374222C202269663D646F742E666C616D655F73686F636B2E72656D61696E733E636173745F74696D6526632O6F6C646F776E5F72656163742220293B0D0A2O202O2D20612O645F616374696F6E2820227072696D6F726469616C5F776176652220293B0D0A2O202O2D20612O645F616374696F6E2820746869732C20224C696768746E696E6720426F6C74222C202269663D7370652O6C5F746172676574732E636861696E5F6C696768746E696E673C332220293B0D0A2O202O2D20612O645F616374696F6E2820746869732C2022436861696E204C696768746E696E67222C202269663D7370652O6C5F746172676574732E636861696E5F6C696768746E696E673E322220293B0D0A2O202O2D20612O645F616374696F6E2820746869732C2022466C616D652053686F636B222C20226D6F76696E673D312220293B0D0A2O202O2D20612O645F616374696F6E2820746869732C202246726F73742053686F636B222C20226D6F76696E673D312220293B0D0A2O200D0A2O202O2D204D616E75612O6C7920612O6465643A20502O6F6C206966206E6F7468696E6720746F20646F0D0A2O206966204361737428732E702O6F6C29207468656E0D0A4O2072657475726E2022576169742F502O6F6C205265736F7572636573220D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2044697370656C28290D0A2O202O2D207075726966795F7370697269740D0A2O20696620732E6E617475726573437572653A49735265616479282920616E64206170692E497344697370652O6C61626C6547726F7570556E697428666F63757329207468656E0D0A4O2069662043617374286D2E707572696679537069726974466F63757329207468656E0D0A6O2072657475726E20227075726966795F7370697269742064697370656C220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20446566656E7369766528290D0A2O202O2D20746F646F0D0A2O202O2D2073656C666865616C0D0A2O2073686F756C6452657475726E203D206170692E5573654865616C696E6728290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204865616C696E6728290D0A2O206966206E6F7420666F6375733A4578697374732829206F7220666F6375733A4973446561644F7247686F73742829206F72206E6F7420666F6375733A4973496E52616E676528343029207468656E0D0A4O2072657475726E0D0A2O20656E640D0A2O202O2D207472696E6B6574730D0A2O2073686F756C6452657475726E203D206170692E5573655472696E6B6574732834302C206F6E5573654578636C756465732C2066756E6374696F6E2875290D0A4O2072657475726E206170692E556E6974497356616C696428752920616E6420706C617965723A412O66656374696E67436F6D62617428290D0A2O20656E64290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A2O202O2D20746F646F0D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20436F6D62617428290D0A2O202O2D2064697370656C0D0A2O2069662044697370656C42752O66734F6E2829206F722044697370656C446562752O66734F6E2829207468656E0D0A4O2073686F756C6452657475726E203D2044697370656C28290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A4O2073686F756C6452657475726E203D206170692E4465736E61726528732E73706972697457616C6B2C20732E73706972697457616C6B2C203430290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E20227370697269745F77616C6B206465736E617265220D0A4O20656E640D0A2O20656E640D0A2O202O2D20646566656E736976650D0A2O2073686F756C6452657475726E203D20446566656E7369766528290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A2O202O2D20496E636F72706F7265616C0D0A2O2069662048616E646C65496E636F72706F7265616C4F6E2829207468656E0D0A4O2073686F756C6452657475726E203D206170692E48616E646C65496E636F72706F7265616C28732E6865782C206D2E6865784D6F7573656F7665722C2033302C2074727565290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A2O202O2D20496E74652O72757074730D0A2O206966206E6F7420706C617965723A497343617374696E67282920616E64206E6F7420706C617965723A49734368612O6E656C696E672829207468656E0D0A4O2073686F756C6452657475726E203D206170692E496E74652O7275707428732E77696E6453686561722C206D2E77696E6453686561724D6F7573656F7665722C2033302C206E696C2C2074727565290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A2O202O2D2044697370656C730D0A2O2069662044697370656C42752O66734F6E282920616E6420732E70757267653A49735265616479282920616E64206E6F7420706C617965723A497343617374696E67282920616E64206E6F7420706C617965723A49734368612O6E656C696E67282920616E64206170692E556E6974486173456E7261676542752O662874617267657429207468656E0D0A4O206966204361737428732E70757267652C206E6F74207461726765743A4973496E52616E67652833302O29207468656E0D0A6O2072657475726E202270757267652064697370656C220D0A4O20656E640D0A2O20656E640D0A2O2069662044697370656C42752O66734F6E282920616E6420732E6772656174657250757267653A49735265616479282920616E64206E6F7420706C617965723A497343617374696E67282920616E64206E6F7420706C617965723A49734368612O6E656C696E67282920616E64206170692E556E6974486173456E7261676542752O662874617267657429207468656E0D0A4O206966204361737428732E6772656174657250757267652C206E6F74207461726765743A4973496E52616E67652833302O29207468656E0D0A6O2072657475726E2022677265617465725F70757267652064697370656C220D0A4O20656E640D0A2O20656E640D0A2O202O2D206865616C696E670D0A2O2073686F756C6452657475726E203D204865616C696E6728290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A2O202O2D2064616D6167650D0A2O206966206170692E556E6974497356616C69642874617267657429207468656E0D0A4O2073686F756C6452657475726E203D2044616D61676528290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204F75744F66436F6D62617428290D0A2O202O2D2064697370656C0D0A2O2069662044697370656C42752O66734F6E2829206F722044697370656C446562752O66734F6E2829207468656E0D0A4O2073686F756C6452657475726E203D2044697370656C28290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A2O202O2D206865616C696E670D0A2O2073686F756C6452657475726E203D204865616C696E6728290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A2O206966206170692E556E6974497356616C6964287461726765742920616E64204F70656E65724F6E2829207468656E0D0A4O2073686F756C6452657475726E203D2044616D61676528290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20466F63757343682O6F73696E672872616E6765290D0A2O2069662044697370656C446562752O66734F6E282920616E6420732E6E617475726573437572653A497352656164792829207468656E0D0A4O206C6F63616C2064697370652O6C61626C65467269656E646C79556E6974203D206170692E44697370652O6C61626C6547726F7570556E69742872616E6765290D0A4O2069662064697370652O6C61626C65467269656E646C79556E6974207468656E0D0A6O2072657475726E2064697370652O6C61626C65467269656E646C79556E69740D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2041504C28290D0A2O202O2D20466F637573556E69740D0A2O20696620706C617965723A412O66656374696E67436F6D6261742829206F722044697370656C446562752O66734F6E2829207468656E0D0A4O2073686F756C6452657475726E203D206170692E466F637573556E697428466F63757343682O6F73696E672C203430290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A2O20656E640D0A0D0A2O202O2D69662O207468656E0D0A2O202O2D2O2069662043617374286D2E73746F7043617374696E672C206E696C2C206E696C2C207472756529207468656E0D0A2O202O2D4O2072657475726E202263616E63656C5F63617374220D0A2O202O2D2O20656E640D0A2O202O2D656E640D0A0D0A2O202O2D20456E656D696573205570646174650D0A2O20696620416F454F6E2829207468656E0D0A4O20656E656D696573343079203D20706C617965723A476574456E656D696573496E52616E6765283430290D0A2O20656C73650D0A4O20656E656D696573343079203D207B7D0D0A2O20656E640D0A0D0A2O202O2D207265766976650D0A2O206966206E6F7420706C617965723A412O66656374696E67436F6D6261742829207468656E0D0A4O206966206D6F7573656F76657220616E64206D6F7573656F7665723A457869737473282920616E64206D6F7573656F7665723A497341506C61796572282920616E64206D6F7573656F7665723A4973446561644F7247686F7374282920616E64206E6F7420706C617965723A43616E412O7461636B286D6F7573656F76657229207468656E0D0A6O206C6F63616C206465616447726F7570556E697473436F756E74203D206170692E4465616447726F7570556E697473436F756E7428290D0A6O206966206465616447726F7570556E697473436F756E74203E2031207468656E0D0A8O206966204361737428732E616E6365737472616C566973696F6E2C206E6F74206D6F7573656F7665723A49735370652O6C496E52616E676528732E616E6365737472616C566973696F6E292C207472756529207468656E0D0A9O202072657475726E2022616E6365737472616C5F766973696F6E220D0A8O20656E640D0A6O20656C73650D0A8O2069662043617374286D2E616E6365737472616C5370697269744D6F7573656F7665722C206E6F74206D6F7573656F7665723A49735370652O6C496E52616E676528732E616E6365737472616C537069726974292C207472756529207468656E0D0A9O202072657475726E2022616E6365737472616C5F737069726974220D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A0D0A2O206966206E6F7420706C617965723A49734368612O6E656C696E672829207468656E0D0A4O20696620706C617965723A412O66656374696E67436F6D6261742829207468656E0D0A6O202O2D20436F6D6261740D0A6O2073686F756C6452657475726E203D20436F6D62617428290D0A6O2069662073686F756C6452657475726E207468656E0D0A8O2072657475726E2073686F756C6452657475726E0D0A6O20656E640D0A4O20656C73650D0A6O202O2D204F75744F66436F6D6261740D0A6O2073686F756C6452657475726E203D204F75744F66436F6D62617428290D0A6O2069662073686F756C6452657475726E207468656E0D0A8O2072657475726E2073686F756C6452657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20526567697374657228290D0A2O206170693A5265676973746572466F724576656E742866756E6374696F6E28290D0A4O2046692O6C44697370656C7328290D0A2O20656E642C202254524149545F434F4E4649475F5550444154454422290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204175746F42696E6428290D0A2O202O2D2072616369616C730D0A2O2042696E6428732E616E6365737472616C43612O6C290D0A2O2042696E6428732E6261676F66547269636B73290D0A2O2042696E6428732E6265727365726B696E67290D0A2O2042696E6428732E626C2O6F6446757279290D0A2O2042696E6428732E66697265626C2O6F64290D0A2O200D0A2O202O2D207370652O6C730D0A0D0A2O202O2D206D6163726F730D0A2O2042696E64286D2E73746F7043617374696E67290D0A0D0A2O202O2D206974656D730D0A2O206170692E6D6163726F3A42696E644974656D7328290D0A0D0A2O202O2D20666F6375730D0A2O206170692E6D6163726F3A42696E64466F63757328290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20496E697428290D0A2O205072696E7444656275672822526573746F726174696F6E205368616D616E206C6F616465642E22290D0A2O2073652O74696E6773203D2047657453652O74696E6773287370656349642C2061706C4E616D65290D0A2O204175746F42696E6428290D0A2O20526567697374657228290D0A2O2046692O6C44697370656C7328290D0A656E640D0A0D0A412O6441706C287370656349642C2061706C4E616D652C2041504C2C20496E69742C2064656661756C7453652O74696E6773290D0A00063O0012033O00013O00120B000100024O00063O000200022O000500016O00075O00012O00023O00017O00",v9(),...);