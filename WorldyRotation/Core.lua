local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then v83[v85[2]]=v85[3];elseif (v86==1) then local v113=v85[2];v83[v113]=v83[v113](v83[v113 + 1 ]);else local v115=v85[2];v83[v115](v13(v83,v115 + 1 ,v78));end elseif (v86<=4) then if (v86==3) then v83[v85[2]]=v59[v85[3]];else local v118=v85[2];v78=(v118 + v84) -1 ;for v128=v118,v78 do local v129=v79[v128-v118 ];v83[v128]=v129;end end elseif (v86>5) then local v119;local v120;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v83[v120]=v83[v120](v83[v120 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v78=(v120 + v84) -1 ;for v131=v120,v78 do v119=v79[v131-v120 ];v83[v131]=v119;end v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v83[v120](v13(v83,v120 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703C6442O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A3O2D207O3D204C4F43414C495A45207O3D0D0A2O202O2D20412O646F6E0D0A2O206C6F63616C20612O646F6E4E616D652C205752203D203O2E3B0D0A2O202O2D204865726F4C69620D0A2O206C6F63616C20484C203D204865726F4C69623B0D0A2O206C6F63616C2043616368652C205574696C73203D204865726F43616368652C20484C2E5574696C733B0D0A2O206C6F63616C20556E6974203D20484C2E556E69743B0D0A2O206C6F63616C20506C61796572203D20556E69742E506C617965723B0D0A2O206C6F63616C20546172676574203D20556E69742E5461726765743B0D0A2O206C6F63616C204D6F7573656F766572203D20556E69742E4D6F7573654F7665720D0A2O206C6F63616C205370652O6C203D20484C2E5370652O6C3B0D0A2O206C6F63616C204974656D203D20484C2E4974656D3B0D0A2O202O2D204C75610D0A2O206C6F63616C20652O726F72203D20652O726F720D0A2O206C6F63616C207461626C65696E73657274203D207461626C652E696E736572743B0D0A2O206C6F63616C207461626C6572656D6F7665203D207461626C652E72656D6F76653B0D0A2O206C6F63616C206D6174686D696E203D206D6174682E6D696E3B0D0A2O206C6F63616C206D6174686D6178203D206D6174682E6D61783B0D0A2O206C6F63616C207061697273203D2070616972733B0D0A2O206C6F63616C207072696E74203D207072696E743B0D0A2O206C6F63616C2073656C656374203D2073656C6563743B0D0A2O206C6F63616C207365746D6574617461626C65203D207365746D6574617461626C650D0A2O206C6F63616C20737472696E676C6F776572203D20737472696E672E6C6F7765723B0D0A2O206C6F63616C2073747273706C6974203D2073747273706C69743B0D0A2O206C6F63616C2073747273706C692O7461626C65203D2073747273706C692O7461626C653B0D0A2O206C6F63616C20746F737472696E67203D20746F737472696E673B0D0A2O206C6F63616C2074797065203D20747970650D0A2O202O2D2046696C65204C6F63616C730D0A0D0A0D0A3O2D207O3D20474C4F42414C495A45207O3D0D0A2O202O2D20412O646F6E0D0A2O20576F726C6479526F746174696F6E203D2057523B0D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D3D0D0A3O2D207O3D20434F5245207O3D0D0A2O202O2D205072696E742077697468205752205072656669780D0A2O2066756E6374696F6E2057522E5072696E7420283O2E290D0A4O207072696E7428225B7C634O462O362O30576F726C647920526F746174696F6E7C725D222C203O2E293B0D0A2O20656E640D0A0D0A2O202O2D20446566696E6573207468652041504C0D0A2O2057522E41504C73203D207B7D3B0D0A2O2057522E41504C496E697473203D207B7D3B0D0A2O2066756E6374696F6E2057522E53657441504C2028537065632C2041504C2C2041504C496E6974290D0A4O2057522E41504C735B537065635D203D2041504C3B0D0A4O2057522E41504C496E6974735B537065635D203D2041504C496E69743B0D0A2O20656E640D0A0D0A2O202O2D20446566696E65204D6163726F0D0A2O206C6F63616C2066756E6374696F6E20436C612O7328290D0A4O206C6F63616C20436C612O73203D207B7D0D0A4O20436C612O732E2O5F696E646578203D20436C612O730D0A4O207365746D6574617461626C6528436C612O732C207B0D0A6O202O5F63612O6C203D0D0A6O2066756E6374696F6E2873656C662C203O2E290D0A8O206C6F63616C204F626A656374203D207B7D0D0A8O207365746D6574617461626C65284F626A6563742C2073656C66290D0A8O204F626A6563743A4E6577283O2E290D0A8O2072657475726E204F626A6563740D0A6O20656E640D0A4O207D290D0A4O2072657475726E20436C612O730D0A2O20656E640D0A0D0A2O206C6F63616C204D6163726F203D20436C612O7328290D0A2O2057522E4D6163726F203D204D6163726F0D0A2O200D0A2O2066756E6374696F6E204D6163726F3A4E6577284D6163726F49442C204D6163726F54657874290D0A4O2069662074797065284D6163726F494429207E3D2022737472696E6722207468656E20652O726F722822496E76616C6964204D6163726F49442E222920656E640D0A4O2069662074797065284D6163726F5465787429207E3D2022737472696E6722207468656E20652O726F722822496E76616C6964204D6163726F546578742E222920656E640D0A2O200D0A4O202O2D20412O74726962757465730D0A4O2073656C662E4D6163726F4944203D204D6163726F49440D0A4O2073656C662E4D6163726F54657874203D204D6163726F546578740D0A2O20656E640D0A0D0A3O2D207O3D204341535453207O3D0D0A2O202O2D204D61696E20436173740D0A646F0D0A2O206C6F63616C2053696C656E6365494473203D207B0D0A4O20332O372O30342C0D0A4O203339373839322C0D0A4O203139363534332C0D0A4O203338313531362C0D0A2O207D3B0D0A2O206C6F63616C205175616B696E67446562752O664964203D205370652O6C283234302O3437293B0D0A2O206C6F63616C20502O6F6C5265736F75726365203D204O3931303B0D0A2O206C6F63616C205370652O6C517565756557696E646F77203D20746F6E756D62657228435F435661722E4765744356617228225370652O6C517565756557696E646F77222O293B0D0A2O2066756E6374696F6E2057522E5072652O73284F626A6563742C204F75746F6652616E67652C20492O6D6F7661626C652C204F2O66474344290D0A4O206C6F63616C205370652O6C4944203D204F626A6563742E5370652O6C49443B0D0A4O206C6F63616C204974656D4944203D204F626A6563742E4974656D49443B0D0A4O206C6F63616C204D6163726F4944203D204F626A6563742E4D6163726F49443B0D0A4O206C6F63616C20557361626C65203D204D6163726F4944206F72204F626A6563743A4973557361626C6528293B0D0A4O206C6F63616C2053686F77502O6F6C696E67203D204F626A6563742E5370652O6C4944202O3D20502O6F6C5265736F757263653B0D0A4O206C6F63616C20546172676574497343617374696E6753696C656E6365203D205461726765743A457869737473282920616E64205574696C732E56616C75654973496E412O7261792853696C656E63654944732C205461726765743A436173745370652O6C4944282O293B0D0A4O200D0A4O206966205370652O6C494420616E6420497343752O72656E745370652O6C285370652O6C494429207468656E0D0A6O2053686F77502O6F6C696E67203D20747275653B0D0A4O20656E640D0A4O200D0A4O2069662053686F77502O6F6C696E67207468656E0D0A6O2057522E4D61696E4672616D653A4368616E676542696E64286E696C293B0D0A6O204F626A6563742E4C617374446973706C617954696D65203D2047657454696D6528293B0D0A6O2072657475726E20747275653B0D0A4O20656E640D0A4O200D0A4O206C6F63616C205072656361737457696E646F77203D206D6174686D696E286D6174686D6178285370652O6C517565756557696E646F77202D20484C2E4C6174656E637928292C203735292C20313530293B0D0A4O20696620286E6F7420557361626C6529206F72204F75746F6652616E6765206F722028492O6D6F7661626C6520616E642028506C617965723A49734D6F76696E672829206F7220506C617965723A446562752O665570285175616B696E67446562752O6649642C207472756529206F7220546172676574497343617374696E6753696C656E63652O29206F72202O286E6F74204F2O664743442920616E64202O28506C617965723A43617374456E642829202D205072656361737457696E646F77203E203029206F722028506C617965723A47434452656D61696E732829202D205072656361737457696E646F77203E20303O29207468656E0D0A6O2057522E4D61696E4672616D653A4368616E676542696E64286E696C293B0D0A6O204F626A6563742E4C617374446973706C617954696D65203D2047657454696D6528293B0D0A6O2072657475726E2066616C73653B0D0A4O20656E640D0A0D0A4O206C6F63616C2042696E643B0D0A4O206966205370652O6C4944207468656E0D0A6O2042696E64203D2057522E5370652O6C42696E64735B5370652O6C49445D3B0D0A6O206966206E6F742042696E64207468656E0D0A8O2057522E5072696E74284F626A6563743A4E616D652829202O2E2022206973206E6F7420626F756E642E22293B0D0A6O20656E640D0A4O20656C73656966204974656D4944207468656E0D0A6O2042696E64203D2057522E4974656D42696E64735B4974656D49445D3B0D0A6O206966206E6F742042696E64207468656E0D0A8O2057522E5072696E74284F626A6563743A4E616D652829202O2E2022206973206E6F7420626F756E642E22293B0D0A6O20656E640D0A4O20656C73656966204D6163726F4944207468656E0D0A6O2042696E64203D2057522E4D6163726F42696E64735B4D6163726F49445D3B0D0A6O206966206E6F742042696E64207468656E0D0A8O2057522E5072696E74284F626A6563742E4D6163726F4944202O2E2022206973206E6F7420626F756E642E22293B0D0A6O20656E640D0A4O20656E640D0A0D0A4O2057522E4D61696E4672616D653A4368616E676542696E642842696E64293B0D0A4O204F626A6563742E4C617374446973706C617954696D65203D2047657454696D6528293B0D0A4O2072657475726E20747275653B0D0A2O20656E640D0A2O2066756E6374696F6E2057522E5072652O73437572736F72285370652O6C2C204D6163726F2C204F75746F6652616E67652C20492O6D6F7661626C652C204F2O66474344290D0A4O206966204D6F7573656F76657220616E642054617267657420616E64204D6F7573656F7665723A457869737473282920616E64205461726765743A457869737473282920616E6420506C617965723A43616E412O7461636B284D6F7573656F7665722920616E6420286E6F74204D6F7573656F7665723A4973446561644F7247686F7374282O29207468656E0D0A6O206966205370652O6C3A4973557361626C652829207468656E0D0A8O2072657475726E2057522E5072652O73284D6163726F2C204F75746F6652616E67652C20492O6D6F7661626C652C204F2O66474344293B0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2O2066756E6374696F6E2057522E43617374284F626A6563742C204F2O664743442C20446973706C61795374796C652C204F75746F6652616E67652C20437573746F6D54696D65290D0A4O2072657475726E2057522E5072652O73284F626A6563742C204F75746F6652616E67652C206E696C2C204F2O66474344293B0D0A2O20656E640D0A2O2066756E6374696F6E2057522E43617374412O6E6F7461746564284F626A6563742C204F2O664743442C20546578742C204F75746F6652616E6765290D0A4O2072657475726E2057522E5072652O73284F626A6563742C204F75746F6652616E67652C206E696C2C204F2O66474344293B0D0A2O20656E640D0A2O2066756E6374696F6E2057522E43617374502O6F6C696E67284F626A6563742C20437573746F6D54696D652C204F75746F6652616E6765290D0A4O2072657475726E2057522E5072652O73284F626A6563742C204F75746F6652616E6765293B0D0A2O20656E640D0A2O2066756E6374696F6E2057522E4361737453752O676573746564284F626A6563742C204F75746F6652616E6765290D0A4O2072657475726E2057522E5072652O73284F626A6563742C204F75746F6652616E6765293B0D0A2O20656E640D0A656E640D0A0D0A3O2D207O3D2042494E4453207O3D0D0A2O202O2D204D61696E2042696E640D0A2O20646F0D0A4O206C6F63616C204B6579436F646573203D207B0D0A6O205B225348494654225D203D20307831302C0D0A6O205B224354524C225D203D2030782O312C0D0A6O205B22414C54225D203D20307841342C0D0A6O205B2230225D203D20307833302C0D0A6O205B2231225D203D20307833312C0D0A6O205B2232225D203D20307833322C0D0A6O205B2233225D203D2030782O332C0D0A6O205B2234225D203D20307833342C0D0A6O205B2235225D203D20307833352C0D0A6O205B2236225D203D20307833362C0D0A6O205B2237225D203D20307833372C0D0A6O205B2238225D203D20307833382C0D0A6O205B2239225D203D20307833392C0D0A6O205B2241225D203D20307834312C0D0A6O205B2242225D203D20307834322C0D0A6O205B2243225D203D20307834332C0D0A6O205B2244225D203D2030782O342C0D0A6O205B2245225D203D20307834352C0D0A6O205B2246225D203D20307834362C0D0A6O205B2247225D203D20307834372C0D0A6O205B2248225D203D20307834382C0D0A6O205B2249225D203D20307834392C0D0A6O205B224A225D203D20307834412C0D0A6O205B224B225D203D20307834422C0D0A6O205B224C225D203D20307834432C0D0A6O205B224D225D203D20307834442C0D0A6O205B224E225D203D20307834452C0D0A6O205B224F225D203D20307834462C0D0A6O205B2250225D203D20307835302C0D0A6O205B2251225D203D20307835312C0D0A6O205B2252225D203D20307835322C0D0A6O205B2253225D203D20307835332C0D0A6O205B2254225D203D20307835342C0D0A6O205B2255225D203D2030782O352C0D0A6O205B2256225D203D20307835362C0D0A6O205B2257225D203D20307835372C0D0A6O205B2258225D203D20307835382C0D0A6O205B2259225D203D20307835392C0D0A6O205B225A225D203D20307835412C0D0A6O205B224E756D7061642030225D203D20307836302C0D0A6O205B224E756D7061642031225D203D20307836312C0D0A6O205B224E756D7061642032225D203D20307836322C0D0A6O205B224E756D7061642033225D203D20307836332C0D0A6O205B224E756D7061642034225D203D20307836342C0D0A6O205B224E756D7061642035225D203D20307836352C0D0A6O205B224E756D7061642036225D203D2030782O362C0D0A6O205B224E756D7061642037225D203D20307836372C0D0A6O205B224E756D7061642038225D203D20307836382C0D0A6O205B224E756D7061642039225D203D20307836392C0D0A6O205B224E756D706164202A225D203D20307836412C0D0A6O205B224E756D706164202B225D203D20307836422C0D0A6O205B224E756D706164202D225D203D20307836442C0D0A6O205B224E756D706164202E225D203D20307836452C0D0A6O205B224E756D706164202F225D203D20307836462C0D0A6O205B224631225D203D20307837302C0D0A6O205B224632225D203D20307837312C0D0A6O205B224633225D203D20307837322C0D0A6O205B224634225D203D20307837332C0D0A6O205B224635225D203D20307837342C0D0A6O205B224636225D203D20307837352C0D0A6O205B224637225D203D20307837362C0D0A6O205B224638225D203D2030782O372C0D0A6O205B224639225D203D20307837382C0D0A6O205B22463130225D203D20307837392C0D0A6O205B22462O31225D203D20307837412C0D0A6O205B22463132225D203D20307837422C0D0A6O205B22463133225D203D20307837432C0D0A6O205B22463134225D203D20307837442C0D0A6O205B22463135225D203D20307837452C0D0A6O205B22463136225D203D20307837462C0D0A6O205B22463137225D203D20307838302C0D0A6O205B22463138225D203D20307838312C0D0A6O205B22463139225D203D20307838322C0D0A6O205B22463230225D203D20307838332C0D0A6O205B22463231225D203D20307838342C0D0A6O205B22462O32225D203D20307838352C0D0A6O205B22463233225D203D20307838362C0D0A6O205B22463234225D203D20307838372C0D0A6O205B222C225D203D20307842432C0D0A6O205B222E225D203D20307842452C0D0A4O207D0D0A4O206C6F63616C20436F2O6D6F6E4B657973203D207B0D0A6O202231222C202232222C202233222C202234222C202235222C202236222C0D0A4O207D3B0D0A4O206C6F63616C20556E636F2O6D6F6E4B657973203D207B0D0A6O20224631222C20224632222C20224633222C20224635222C20224636222C0D0A2O2D7O20224E756D7061642030222C20224E756D7061642031222C20224E756D7061642032222C20224E756D7061642033222C20224E756D7061642034222C20224E756D7061642035222C20224E756D7061642036222C20224E756D7061642037222C20224E756D7061642038222C20224E756D7061642039222C20224E756D706164202F222C20224E756D706164202A222C20224E756D706164202D222C20224E756D706164202B222C0D0A6O20222C222C20222E222C0D0A4O207D3B0D0A4O206C6F63616C20526172654B657973203D207B0D0A6O202237222C202238222C202239222C202230222C0D0A6O20224637222C20224638222C20224639222C2022463130222C2022462O31222C2022463132220D0A4O207D0D0A4O206C6F63616C20526172655370656369616C4B657973203D207B0D0A6O20224354524C3A4634222C202253484946543A4634222C20224634220D0A4O207D0D0A4O206C6F63616C204D6F6469666965724B657973203D207B0D0A6O202253484946543A222C20224354524C3A222C2022414C543A220D0A4O207D3B0D0A4O206C6F63616C204D6F6469666965724B6579436F6D6273203D207B0D0A6O20224354524C3A53484946543A222C2022414C543A53484946543A220D0A4O207D3B0D0A4O2057522E5370652O6C42696E6473203D207B7D3B0D0A4O2057522E4974656D42696E6473203D207B7D3B0D0A4O2057522E4D6163726F42696E6473203D207B7D3B0D0A4O2057522E5370652O6C4F626A65637473203D207B7D3B0D0A4O2057522E4974656D4F626A65637473203D207B7D3B0D0A4O2057522E4D6163726F4F626A65637473203D207B7D3B0D0A4O2057522E46722O6542696E6473203D207B7D3B0D0A4O2057522E536574757046722O6542696E6473203D20747275653B0D0A0D0A4O20484C3A5265676973746572466F724576656E742866756E6374696F6E28290D0A6O2057522E526562696E6428293B0D0A4O20656E642C202254524149545F434F4E4649475F5550444154454422293B0D0A4O200D0A2O2D5O20484C3A5265676973746572466F724576656E742866756E6374696F6E28290D0A2O2D7O206966206E6F7420506C617965723A412O66656374696E67436F6D6261742829207468656E0D0A2O2D9O2057522E526562696E6428293B0D0A2O2D7O20656E640D0A2O2D5O20656E642C2022414354494F4E4241525F534C4F545F4348414E47454422290D0A0D0A2O2D5O20484C3A5265676973746572466F724576656E742866756E6374696F6E28290D0A2O2D7O206966206E6F7420506C617965723A412O66656374696E67436F6D6261742829207468656E0D0A2O2D9O2057522E526562696E6428293B0D0A2O2D7O20656E640D0A2O2D5O20656E642C20225A4F4E455F4348414E4745445F4E45575F41524541222C2022504C415945525F5350454349414C495A4154494F4E5F4348414E474544222C2022504C415945525F54414C454E545F555044415445222C20225550444154455F42494E44494E4753222C20224C4541524E45445F5350452O4C5F494E5F544142222C20225350452O4C5F5550444154455F49434F4E222C20225550444154455F534841504553484946545F464F524D222C2022414354494F4E4241525F5550444154455F555341424C4522290D0A0D0A4O2066756E6374696F6E2057522E42696E6420284F626A656374290D0A6O2069662057522E536574757046722O6542696E6473207468656E0D0A8O2057522E412O6446722O6542696E647328436F2O6D6F6E4B657973293B0D0A8O2057522E412O6446722O6542696E647328556E636F2O6D6F6E4B657973293B0D0A2O2D9O20666F722069203D20312C2023526172655370656369616C4B65797320646F0D0A2O2D9O202O207461626C65696E736572742857522E46722O6542696E64732C20526172655370656369616C4B6579735B695D293B0D0A2O2D9O20656E640D0A8O2057522E412O6446722O6542696E647328526172654B657973293B0D0A8O2057522E536574757046722O6542696E6473203D2066616C73653B0D0A6O20656E640D0A6O206966204F626A6563742E5370652O6C5461626C65207E3D206E696C207468656E0D0A8O20666F7220692C205370652O6C20696E207061697273284F626A6563742E5370652O6C5461626C652920646F0D0A9O202057522E42696E64285370652O6C293B0D0A8O20656E640D0A8O2072657475726E3B0D0A6O20656E640D0A6O20696620506C617965723A412O66656374696E67436F6D6261742829207468656E0D0A8O2057522E5072696E7428224661696C656420746F2062696E642022202O2E203O284F626A6563742E5370652O6C4944206F72204F626A6563742E4974656D49442920616E64204F626A6563743A4E616D65282O29206F72204F626A6563742E4D6163726F494429202O2E20222062656361757365206F6620636F6D6261742E20506C65617365202F72656C6F6164207768656E206F7574206F6620636F6D6261742E22293B0D0A8O2072657475726E3B0D0A6O20656E640D0A6O2057522E53657442696E64284F626A656374293B0D0A4O20656E640D0A4O2066756E6374696F6E2057522E556E62696E6420284B6579290D0A6O206C6F63616C204E756D42696E64696E6773203D204765744E756D42696E64696E677328293B0D0A6O20666F722069203D20312C204E756D42696E64696E677320646F0D0A8O206C6F63616C204B6579312C204B657932203D2047657442696E64696E674B65792847657442696E64696E6728692O293B0D0A8O206966204B657931202O3D204B6579206F72204B657932202O3D204B6579207468656E0D0A9O202053657442696E64696E67284B6579293B0D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A4O2066756E6374696F6E2057522E412O6446722O6542696E647320284B657973290D0A6O20666F722069203D20312C20234B65797320646F0D0A8O207461626C65696E736572742857522E46722O6542696E64732C204B6579735B695D293B0D0A8O20666F72206A203D20312C20234D6F6469666965724B65797320646F0D0A9O20207461626C65696E736572742857522E46722O6542696E64732C204D6F6469666965724B6579735B6A5D202O2E204B6579735B695D293B0D0A8O20656E640D0A8O20666F72206A203D20312C20234D6F6469666965724B6579436F6D627320646F0D0A9O20207461626C65696E736572742857522E46722O6542696E64732C204D6F6469666965724B6579436F6D62735B6A5D202O2E204B6579735B695D293B0D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A4O2066756E6374696F6E2057522E526562696E642028290D0A6O2057522E46722O6542696E6473203D207B7D3B0D0A6O2057522E536574757046722O6542696E6473203D20747275653B0D0A6O20666F722049642C205F20696E2070616972732857522E5370652O6C4F626A656374732920646F0D0A8O2057522E42696E642857522E5370652O6C4F626A656374735B49645D293B0D0A6O20656E640D0A6O20666F722049642C205F20696E2070616972732857522E4974656D4F626A656374732920646F0D0A8O2057522E42696E642857522E4974656D4F626A656374735B49645D293B0D0A6O20656E640D0A6O20666F722049642C205F20696E2070616972732857522E4D6163726F4F626A656374732920646F0D0A8O2057522E42696E642857522E4D6163726F4F626A656374735B49645D293B0D0A6O20656E640D0A4O20656E640D0A4O2066756E6374696F6E2057522E47657442696E6420284F626A656374290D0A6O202O2D20544F444F3A20426F6E757320416374696F6E20426172732028652E672E20737465616C7468656420526F677565206F7220666F726D2D73686966746564204472756964292C2072657475726E20696E76616C69642062696E64732C20736F2077652069676E6F7265207468656D2E0D0A6O20696620476574426F6E75734261724F2O667365742829203E2030207468656E2072657475726E3B20656E640D0A6O206C6F63616C205370652O6C4944203D204F626A6563742E5370652O6C49443B0D0A6O206C6F63616C204974656D4944203D204F626A6563742E4974656D49443B0D0A6O206C6F63616C204D6163726F4944203D204F626A6563742E4D6163726F49443B0D0A6O206C6F63616C20416374696F6E203D20285370652O6C494420616E6420484C2E416374696F6E2E46696E6442795370652O6C4944285370652O6C49442O29206F7220284974656D494420616E6420484C2E416374696F6E2E46696E6442794974656D4944284974656D49442O29206F7220284D6163726F494420616E6420484C2E416374696F6E2E46696E6442794D6163726F4944284D6163726F49442O29206F72206E696C3B0D0A6O20696620416374696F6E20616E6420416374696F6E2E436F2O6D616E644E616D65207468656E0D0A8O206C6F63616C2042696E64203D2047657442696E64696E674B657928416374696F6E2E436F2O6D616E644E616D65293B0D0A8O202O2D204D6F7573652062696E64696E677320617265206E6F74207965742073752O706F727465642062792074686520636C69656E742E0D0A8O2069662042696E6420616E6420286E6F7420737472696E672E66696E642842696E642C20224D4F555345222O2920616E6420286E6F7420737472696E672E66696E642842696E642C202242552O544F4E222O2920616E642057522E497356616C696442696E642842696E6429207468656E0D0A9O20202O2D2057522E5072696E74284F626A6563743A4E616D652829202O2E20222C2022202O2E2042696E64202O2E20222C2022202O2E20416374696F6E2E4944202O2E20222C2022202O2E20416374696F6E2E436F2O6D616E644E616D65290D0A9O202072657475726E2042696E643A6773756228222D222C20223A22293B0D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A4O2066756E6374696F6E2057522E53657442696E6420284F626A656374290D0A6O206C6F63616C2042696E64203D2057522E47657442696E64284F626A656374293B0D0A6O206C6F63616C205370652O6C4944203D204F626A6563742E5370652O6C49443B0D0A6O206C6F63616C204974656D4944203D204F626A6563742E4974656D49443B0D0A6O206C6F63616C204D6163726F4944203D204F626A6563742E4D6163726F49443B0D0A6O206966205370652O6C4944207468656E0D0A8O20696620286E6F742042696E642920616E642057522E47554953652O74696E67732E47656E6572616C2E456E61626C65642E4175746F42696E64207468656E0D0A9O202042696E64203D2057522E46722O6542696E64735B2357522E46722O6542696E64735D3B0D0A9O20207461626C6572656D6F76652857522E46722O6542696E64732C202357522E46722O6542696E6473293B0D0A9O202057522E556E62696E642842696E64293B0D0A9O202053657442696E64696E675370652O6C2842696E643A6773756228223A222C20222D22292C204F626A6563743A4E616D65282O293B0D0A9O202069662057522E47554953652O74696E67732E47656E6572616C2E456E61626C65642E526F746174696F6E44656275674F7574707574207468656E0D0A9O203O2057522E5072696E742822426F756E642022202O2E204F626A6563743A4E616D652829202O2E202220746F2022202O2E2042696E64293B0D0A9O2020656E640D0A8O20656E640D0A8O2069662042696E64207468656E0D0A9O202057522E5370652O6C42696E64735B5370652O6C49445D203D2042696E643B0D0A9O202057522E5370652O6C4F626A656374735B5370652O6C49445D203D204F626A6563743B0D0A8O20656C73650D0A9O202057522E5072696E7428224661696C656420746F206765742062696E64206F66202722202O2E204F626A6563743A4E616D652829202O2E2022272E20506C656173652062696E64206974206D616E75612O6C79206F7220656E61626C65204175746F42696E6420696E2074686520612O646F6E2073652O74696E67732E22293B0D0A8O20656E640D0A6O20656C73656966204974656D4944207468656E0D0A8O20696620286E6F742042696E642920616E642057522E47554953652O74696E67732E47656E6572616C2E456E61626C65642E4175746F42696E64207468656E0D0A9O202042696E64203D2057522E46722O6542696E64735B2357522E46722O6542696E64735D3B0D0A9O20207461626C6572656D6F76652857522E46722O6542696E64732C202357522E46722O6542696E6473293B0D0A9O202057522E556E62696E642842696E64293B0D0A9O202053657442696E64696E674974656D2842696E643A6773756228223A222C20222D22292C204F626A6563743A4E616D65282O293B0D0A9O202069662057522E47554953652O74696E67732E47656E6572616C2E456E61626C65642E526F746174696F6E44656275674F7574707574207468656E0D0A9O203O2057522E5072696E742822426F756E642022202O2E204F626A6563743A4E616D652829202O2E202220746F2022202O2E2042696E64293B0D0A9O2020656E640D0A8O20656E640D0A8O2069662042696E64207468656E0D0A9O202057522E4974656D42696E64735B4974656D49445D203D2042696E643B0D0A9O202057522E4974656D4F626A656374735B4974656D49445D203D204F626A6563743B0D0A8O20656C73650D0A9O202057522E5072696E7428224661696C656420746F206765742062696E64206F66202722202O2E204F626A6563743A4E616D652829202O2E2022272E20506C656173652062696E64206974206D616E75612O6C79206F7220656E61626C65204175746F42696E6420696E2074686520612O646F6E2073652O74696E67732E22293B0D0A8O20656E640D0A6O20656C73656966204D6163726F4944207468656E0D0A8O20696620286E6F742042696E642920616E642057522E47554953652O74696E67732E47656E6572616C2E456E61626C65642E4175746F42696E64207468656E0D0A9O202042696E64203D2057522E46722O6542696E64735B2357522E46722O6542696E64735D3B0D0A9O20207461626C6572656D6F76652857522E46722O6542696E64732C202357522E46722O6542696E6473293B0D0A9O202057522E556E62696E642842696E64293B0D0A9O202057522E4D61696E4672616D653A412O644D6163726F4672616D65284F626A656374293B0D0A9O202053657442696E64696E67436C69636B2842696E643A6773756228223A222C20222D22292C204D6163726F4944293B0D0A9O202069662057522E47554953652O74696E67732E47656E6572616C2E456E61626C65642E526F746174696F6E44656275674F7574707574207468656E0D0A9O203O2057522E5072696E742822426F756E642022202O2E204D6163726F4944202O2E202220746F2022202O2E2042696E64293B0D0A9O2020656E640D0A8O20656E640D0A8O2069662042696E64207468656E0D0A9O202057522E4D6163726F42696E64735B4D6163726F49445D203D2042696E643B0D0A9O202057522E4D6163726F4F626A656374735B4D6163726F49445D203D204F626A6563743B0D0A8O20656C73650D0A9O202057522E5072696E7428224661696C656420746F206765742062696E64206F66202722202O2E204D6163726F4944202O2E2022272E20506C656173652062696E64206974206D616E75612O6C79206F7220656E61626C65204175746F42696E6420696E2074686520612O646F6E2073652O74696E67732E22293B0D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A4O2066756E6374696F6E2057522E497356616C696442696E64202842696E64290D0A6O2069662042696E64207E3D206E696C207468656E0D0A8O206C6F63616C2042696E645061727473203D2073747273706C692O7461626C6528222D222C2042696E64293B0D0A8O206966202342696E645061727473202O3D2031207468656E0D0A9O2020696620284B6579436F6465735B746F737472696E672842696E6450617274735B315D295D207E3D206E696C29207468656E2072657475726E20747275653B20656E640D0A8O20656C73656966202342696E645061727473202O3D2032207468656E0D0A9O20206966202O284B6579436F6465735B746F737472696E672842696E6450617274735B315D295D207E3D206E696C2920616E6420284B6579436F6465735B746F737472696E672842696E6450617274735B325D295D207E3D206E696C2O29207468656E2072657475726E20747275653B20656E640D0A8O20656C73656966202342696E645061727473202O3D2033207468656E0D0A9O20206966202O284B6579436F6465735B746F737472696E672842696E6450617274735B315D295D207E3D206E696C2920616E6420284B6579436F6465735B746F737472696E672842696E6450617274735B325D295D207E3D206E696C2920616E6420284B6579436F6465735B746F737472696E672842696E6450617274735B335D295D207E3D206E696C2O29207468656E2072657475726E20747275653B20656E640D0A8O20656E640D0A6O20656E640D0A6O2072657475726E2066616C73653B0D0A4O20656E640D0A4O2066756E6374696F6E2057522E47657442696E64496E666F2842696E64290D0A6O206C6F63616C204B65792C204D6F64312C204D6F64323B0D0A6O2069662042696E64207E3D206E696C207468656E0D0A8O206C6F63616C2042696E645061727473203D2073747273706C692O7461626C6528223A222C2042696E64293B0D0A8O206966202342696E645061727473202O3D2031207468656E0D0A9O20204B6579203D2042696E6450617274735B315D3B0D0A8O20656C73656966202342696E645061727473202O3D2032207468656E0D0A9O20204D6F6431203D2042696E6450617274735B315D3B0D0A9O20204B6579203D2042696E6450617274735B325D3B0D0A8O20656C73656966202342696E645061727473202O3D2033207468656E0D0A9O20204D6F6431203D2042696E6450617274735B315D3B0D0A9O20204D6F6432203D2042696E6450617274735B325D3B0D0A9O20204B6579203D2042696E6450617274735B335D3B0D0A8O20656E640D0A6O20656E640D0A6O206C6F63616C2042696E644578203D207B7D3B0D0A6O206966204B6579207468656E0D0A8O2042696E6445782E4B6579203D204B6579436F6465735B746F737472696E67284B6579295D3B0D0A6O20656E640D0A6O206966204D6F6431207468656E0D0A8O2042696E6445782E4D6F6431203D204B6579436F6465735B746F737472696E67284D6F6431295D3B0D0A6O20656E640D0A6O206966204D6F6432207468656E0D0A8O2042696E6445782E4D6F6432203D204B6579436F6465735B746F737472696E67284D6F6432295D3B0D0A6O20656E640D0A6O2072657475726E2042696E6445783B0D0A4O20656E640D0A2O20656E640D0A0D0A3O2D207O3D20434F2O4D414E4453207O3D0D0A2O202O2D20436F2O6D616E642048616E646C65720D0A2O2066756E6374696F6E2057522E436D6448616E646C657220284D652O73616765290D0A4O206C6F63616C20417267756D656E742C20417267756D656E7431203D2073747273706C6974282220222C204D652O73616765293B0D0A4O206C6F63616C20417267756D656E744C6F776572203D20737472696E676C6F77657228417267756D656E74293B0D0A4O20666F72206B2C207620696E2070616972732857522E546F2O676C65732920646F0D0A6O206C6F63616C20546F2O676C65203D206B3B0D0A6O206C6F63616C20496E646578203D20763B0D0A6O20696620417267756D656E744C6F776572202O3D20546F2O676C65207468656E0D0A8O20576F726C6479526F746174696F6E4368617244422E546F2O676C65735B496E6465785D203D206E6F7420576F726C6479526F746174696F6E4368617244422E546F2O676C65735B496E6465785D3B0D0A8O2057522E5072696E7428546F2O676C65202O2E2022206973206E6F7720222O2E28576F726C6479526F746174696F6E4368617244422E546F2O676C65735B496E6465785D20616E6420227C632O662O302O662O30656E61626C65647C722E22206F7220227C634O664O3064697361626C65647C722E222O293B0D0A8O2057522E546F2O676C654672616D653A55706461746542752O746F6E5465787428496E646578293B0D0A8O20696620417267756D656E744C6F776572202O3D2022746F2O676C6522207468656E0D0A9O202057522E4D61696E4672616D653A4368616E6765506978656C28312C2057522E4F4E282O293B0D0A8O20656E640D0A8O2072657475726E3B0D0A6O20656E640D0A4O20656E640D0A4O20696620417267756D656E744C6F776572202O3D20226C6F636B22207468656E0D0A6O2057522E546F2O676C654672616D653A546F2O676C654C6F636B28293B0D0A4O20656C7365696620417267756D656E744C6F776572202O3D2022627265616B22207468656E0D0A6O2057522E427265616B28293B0D0A4O20656C7365696620417267756D656E744C6F776572202O3D2022636173742220616E6420417267756D656E7431207468656E0D0A6O206C6F63616C2042696E64203D2057522E5370652O6C42696E64735B746F6E756D62657228417267756D656E7431295D3B0D0A6O2057522E4D61696E4672616D653A4368616E676542696E642842696E64293B0D0A6O2057522E54696D65722E50756C7365203D2047657454696D652829202B20506C617965723A4743442829202B20302E3135303B0D0A4O20656C7365696620417267756D656E744C6F776572202O3D20227573652220616E6420417267756D656E7431207468656E0D0A6O206C6F63616C2042696E64203D2057522E4974656D42696E64735B746F6E756D62657228417267756D656E7431295D3B0D0A6O2057522E4D61696E4672616D653A4368616E676542696E642842696E64293B0D0A6O2057522E54696D65722E50756C7365203D2047657454696D652829202B20506C617965723A4743442829202B20302E3135303B0D0A4O20656C7365696620417267756D656E744C6F776572202O3D20226D6163726F2220616E6420417267756D656E7431207468656E0D0A6O206C6F63616C2042696E64203D2057522E4D6163726F42696E64735B746F737472696E6728417267756D656E7431295D3B0D0A6O2057522E4D61696E4672616D653A4368616E676542696E642842696E64293B0D0A6O2057522E54696D65722E50756C7365203D2047657454696D652829202B20506C617965723A4743442829202B20302E3135303B0D0A4O20656C7365696620417267756D656E744C6F776572202O3D202268656C7022207468656E0D0A6O2057522E5072696E7428227C636O662O302O2D5B546F2O676C65735D2O2D7C7222293B0D0A6O2057522E5072696E7428222O2053652O74696E67733A207C632O664O382O662F77727C7222293B0D0A6O2057522E5072696E7428222O204F6E2F4F2O663A207C632O664O382O662F777220746F2O676C657C7222293B0D0A6O2057522E5072696E7428222O204344733A207C632O664O382O662F7772206364737C7222293B0D0A6O2057522E5072696E7428222O20416F453A207C632O664O382O662F777220616F657C7222293B0D0A6O2057522E5072696E7428222O20556E2D2F4C6F636B3A207C632O664O382O662F7772206C6F636B7C7222293B0D0A6O2057522E5072696E7428222O20427265616B3A207C632O664O382O662F777220627265616B7C7222293B0D0A6O2057522E5072696E7428222O20436173743A207C632O664O382O662F77722063617374203C5370652O6C49443E7C7222293B0D0A6O2057522E5072696E7428222O205573653A207C632O664O382O662F777220757365203C4974656D49443E7C7222293B0D0A6O2057522E5072696E7428222O204D6163726F3A207C632O664O382O662F7772206D6163726F203C4D6163726F49443E7C7222293B0D0A4O20656C73650D0A6O2053652O74696E67732E4F70656E546F43617465676F72792857522E576F726C647953652O74696E6773290D0A4O20656E640D0A2O20656E640D0A2O20534C4153485F574F524C4459524F544154494F4E31203D20222F7772220D0A2O20536C617368436D644C6973745B22574F524C4459524F544154494F4E225D203D2057522E436D6448616E646C65723B0D0A0D0A2O202O2D20412O64206120746F2O676C650D0A2O2066756E6374696F6E2057522E412O64546F2O676C6528546F2O676C65290D0A4O207461626C652E696E736572742857522E546F2O676C65732C20546F2O676C65293B0D0A2O20656E640D0A0D0A2O202O2D2047657420696620746865206D61696E20746F2O676C65206973206F6E2E0D0A2O2066756E6374696F6E2057522E4F4E2028290D0A4O2072657475726E20576F726C6479526F746174696F6E4368617244422E546F2O676C65735B315D3B0D0A2O20656E640D0A2O200D0A2O2066756E6374696F6E2057522E546F2O676C652028496E646578290D0A3O2072657475726E20576F726C6479526F746174696F6E4368617244422E546F2O676C65735B496E6465785D3B0D0A2O20656E640D0A0D0A2O202O2D2047657420696620746865204344732061726520656E61626C65642E0D0A2O2066756E6374696F6E2057522E4344734F4E2028290D0A4O2072657475726E20576F726C6479526F746174696F6E4368617244422E546F2O676C65735B325D3B0D0A2O20656E640D0A0D0A2O202O2D204765742069662074686520416F4520697320656E61626C65642E0D0A2O20646F0D0A4O206C6F63616C20416F45492O6D756E654E50434944203D207B0D0A4O207D0D0A4O202O2D2044697361626C652074686520416F452069662077652074617267657420616E20756E6974207468617420697320692O6D756E6520746F20416F45207370652O6C732E0D0A4O2066756E6374696F6E2057522E416F454F4E2028290D0A6O2072657475726E20576F726C6479526F746174696F6E4368617244422E546F2O676C65735B335D20616E6420286E6F7420416F45492O6D756E654E504349445B5461726765743A4E5043494428295D293B0D0A4O20656E640D0A2O20656E640D0A00063O0012063O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);