local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v78=(v110 + v84) -1 ;for v112=v110,v78 do local v113=v79[v112-v110 ];v83[v112]=v113;end elseif (v86>1) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v115;local v116;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v83[v116]=v83[v116](v83[v116 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v78=(v116 + v84) -1 ;for v128=v116,v78 do v115=v79[v128-v116 ];v83[v128]=v115;end v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v83[v116](v13(v83,v116 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=4) then if (v86>3) then v83[v85[2]]=v85[3];else local v124=v85[2];v83[v124](v13(v83,v124 + 1 ,v78));end elseif (v86==5) then do return;end else local v125=v85[2];v83[v125]=v83[v125](v83[v125 + 1 ]);end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67039A1D2O006C6F63616C20617069203D2057522E6170690D0A0D0A6C6F63616C2062696E64203D207B0D0A2O206974656D203D207B7D2C0D0A2O207370652O6C203D207B7D2C0D0A2O206D6163726F203D207B7D2C0D0A2O2066722O654B657973203D207B7D2C0D0A2O2066722O654B657973496E697469616C697A6564203D2066616C73650D0A7D0D0A57522E62696E64203D2062696E640D0A0D0A6C6F63616C206B6579436F646573203D207B0D0A2O205B225348494654225D203D20307831302C0D0A2O205B224354524C225D203D2030782O312C0D0A2O205B22414C54225D203D20307841342C0D0A2O205B2230225D203D20307833302C0D0A2O205B2231225D203D20307833312C0D0A2O205B2232225D203D20307833322C0D0A2O205B2233225D203D2030782O332C0D0A2O205B2234225D203D20307833342C0D0A2O205B2235225D203D20307833352C0D0A2O205B2236225D203D20307833362C0D0A2O205B2237225D203D20307833372C0D0A2O205B2238225D203D20307833382C0D0A2O205B2239225D203D20307833392C0D0A2O205B2241225D203D20307834312C0D0A2O205B2242225D203D20307834322C0D0A2O205B2243225D203D20307834332C0D0A2O205B2244225D203D2030782O342C0D0A2O205B2245225D203D20307834352C0D0A2O205B2246225D203D20307834362C0D0A2O205B2247225D203D20307834372C0D0A2O205B2248225D203D20307834382C0D0A2O205B2249225D203D20307834392C0D0A2O205B224A225D203D20307834412C0D0A2O205B224B225D203D20307834422C0D0A2O205B224C225D203D20307834432C0D0A2O205B224D225D203D20307834442C0D0A2O205B224E225D203D20307834452C0D0A2O205B224F225D203D20307834462C0D0A2O205B2250225D203D20307835302C0D0A2O205B2251225D203D20307835312C0D0A2O205B2252225D203D20307835322C0D0A2O205B2253225D203D20307835332C0D0A2O205B2254225D203D20307835342C0D0A2O205B2255225D203D2030782O352C0D0A2O205B2256225D203D20307835362C0D0A2O205B2257225D203D20307835372C0D0A2O205B2258225D203D20307835382C0D0A2O205B2259225D203D20307835392C0D0A2O205B225A225D203D20307835412C0D0A2O205B224E756D7061642030225D203D20307836302C0D0A2O205B224E756D7061642031225D203D20307836312C0D0A2O205B224E756D7061642032225D203D20307836322C0D0A2O205B224E756D7061642033225D203D20307836332C0D0A2O205B224E756D7061642034225D203D20307836342C0D0A2O205B224E756D7061642035225D203D20307836352C0D0A2O205B224E756D7061642036225D203D2030782O362C0D0A2O205B224E756D7061642037225D203D20307836372C0D0A2O205B224E756D7061642038225D203D20307836382C0D0A2O205B224E756D7061642039225D203D20307836392C0D0A2O205B224E756D706164202A225D203D20307836412C0D0A2O205B224E756D706164202B225D203D20307836422C0D0A2O205B224E756D706164202D225D203D20307836442C0D0A2O205B224E756D706164202E225D203D20307836452C0D0A2O205B224E756D706164202F225D203D20307836462C0D0A2O205B224631225D203D20307837302C0D0A2O205B224632225D203D20307837312C0D0A2O205B224633225D203D20307837322C0D0A2O205B224634225D203D20307837332C0D0A2O205B224635225D203D20307837342C0D0A2O205B224636225D203D20307837352C0D0A2O205B224637225D203D20307837362C0D0A2O205B224638225D203D2030782O372C0D0A2O205B224639225D203D20307837382C0D0A2O205B22463130225D203D20307837392C0D0A2O205B22462O31225D203D20307837412C0D0A2O205B22463132225D203D20307837422C0D0A2O205B222C225D203D20307842432C0D0A2O205B222E225D203D20307842452C0D0A7D0D0A6C6F63616C20636F2O6D6F6E4B657973203D207B0D0A2O202231222C202232222C202233222C202234222C202235222C202236222C0D0A2O202248222C202255222C20224A222C202249222C20224B222C20224C222C202250222C0D0A7D0D0A6C6F63616C20756E636F2O6D6F6E4B657973203D207B0D0A2O20224631222C20224632222C20224633222C20224635222C20224636222C0D0A2O20222C222C20222E222C0D0A7D0D0A6C6F63616C20726172654B657973203D207B0D0A2O202237222C202238222C202239222C0D0A2O20224637222C20224638222C20224639222C2022463130222C2022462O31222C2022463132220D0A7D0D0A6C6F63616C20726172655370656369616C4B657973203D207B0D0A2O202253484946543A30222C20224354524C3A30222C2022414C543A30222C2022414C543A53484946543A3022202O2D20682O7470733A2O2F616E73776572732E6D6963726F736F66742E636F6D2F656E2D75732F77696E646F77732F666F72756D2F612O6C2F6374726C7368696674302D696E2D77696E646F77732D31302F2O333762363534322D343135392D343134332D383361382D612O3439366638662O3935630D0A2O202O2D20224354524C3A4634222C202253484946543A4634222C20224634220D0A7D0D0A6C6F63616C206D6F6469666965724B657973203D207B0D0A2O202253484946543A222C20224354524C3A222C2022414C543A220D0A7D0D0A6C6F63616C206D6F6469666965724B6579436F6D6273203D207B0D0A2O20224354524C3A53484946543A222C2022414C543A53484946543A220D0A7D0D0A0D0A66756E6374696F6E2062696E642E47657442696E64496E666F2862696E64696E674B6579290D0A2O206C6F63616C206B65792C206D6F64312C206D6F64320D0A2O206C6F63616C2062696E64496E666F203D207B7D0D0A0D0A2O2069662062696E64696E674B6579207468656E0D0A4O206C6F63616C2062696E645061727473203D2073747273706C692O7461626C6528273A272C2062696E64696E674B6579290D0A0D0A4O206966202362696E645061727473202O3D2031207468656E0D0A6O206B6579203D2062696E6450617274735B315D0D0A4O20656C73656966202362696E645061727473202O3D2032207468656E0D0A6O206D6F64312C206B6579203D2062696E6450617274735B315D2C2062696E6450617274735B325D0D0A4O20656C73656966202362696E645061727473202O3D2033207468656E0D0A6O206D6F64312C206D6F64322C206B6579203D2062696E6450617274735B315D2C2062696E6450617274735B325D2C2062696E6450617274735B335D0D0A4O20656E640D0A0D0A4O20666F72206B2C207620696E207061697273287B206B6579203D206B65792C206D6F6431203D206D6F64312C206D6F6432203D206D6F6432207D2920646F0D0A6O2069662076207468656E0D0A8O2062696E64496E666F5B6B5D203D206B6579436F6465735B765D0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A0D0A2O2072657475726E2062696E64496E666F0D0A656E640D0A0D0A66756E6374696F6E2062696E642E496E697446722O654B65797328290D0A2O206C6F63616C2066756E6374696F6E20412O6446722O6542696E6473286B657973290D0A4O20666F722069203D20312C20236B65797320646F0D0A6O206966206E6F742062696E642E4973426C61636B6C6973746564286B6579735B695D29207468656E0D0A8O207461626C652E696E736572742862696E642E66722O654B6579732C206B6579735B695D290D0A6O20656E640D0A6O20666F72206A203D20312C20236D6F6469666965724B65797320646F0D0A8O206966206E6F742062696E642E4973426C61636B6C6973746564286D6F6469666965724B6579735B6A5D202O2E206B6579735B695D29207468656E0D0A9O20207461626C652E696E736572742862696E642E66722O654B6579732C206D6F6469666965724B6579735B6A5D202O2E206B6579735B695D290D0A8O20656E640D0A6O20656E640D0A6O20666F72206A203D20312C20236D6F6469666965724B6579436F6D627320646F0D0A8O206966206E6F742062696E642E4973426C61636B6C6973746564286D6F6469666965724B6579436F6D62735B6A5D202O2E206B6579735B695D29207468656E0D0A9O20207461626C652E696E736572742862696E642E66722O654B6579732C206D6F6469666965724B6579436F6D62735B6A5D202O2E206B6579735B695D290D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2O206966206E6F742062696E642E66722O654B657973496E697469616C697A6564207468656E0D0A4O20412O6446722O6542696E647328636F2O6D6F6E4B657973290D0A4O20412O6446722O6542696E647328756E636F2O6D6F6E4B657973290D0A4O20412O6446722O6542696E647328726172654B657973290D0A4O20666F722069203D20312C2023726172655370656369616C4B65797320646F0D0A6O207461626C652E696E736572742862696E642E66722O654B6579732C20726172655370656369616C4B6579735B695D290D0A4O20656E640D0A4O2062696E642E66722O654B657973496E697469616C697A6564203D20747275650D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E2062696E642E42696E64286F626A656374290D0A2O206966206F626A656374202O3D206E696C207468656E0D0A4O2057523A5072696E745761726E696E672822547279696E6720746F2062696E64206E696C206F626A6563742E20506C6561736520636F6E746163742074686520726F746174696F6E20646576656C6F7065722E2022202O2E206465627567737461636B282O290D0A4O2072657475726E0D0A2O20656E640D0A2O200D0A2O2062696E642E496E697446722O654B65797328290D0A0D0A2O202O2D206D756C7469207370652O6C730D0A2O206966206F626A6563742E7370652O6C5461626C65207E3D206E696C207468656E0D0A4O20666F72205F2C207370652O6C20696E207061697273286F626A6563742E7370652O6C5461626C652920646F0D0A6O2062696E642E42696E64287370652O6C290D0A4O20656E640D0A0D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O206966206170692E756E69742E706C617965723A412O66656374696E67436F6D6261742829207468656E0D0A4O2057523A5072696E745761726E696E6728224661696C656420746F2062696E642022202O2E203O286F626A6563742E7370652O6C4944206F72206F626A6563742E6974656D49442920616E64206F626A6563743A4E616D65282O29206F72206F626A6563742E6D6163726F494429202O2E20222062656361757365206F6620636F6D6261742E20506C65617365202F72656C6F6164207768656E206F7574206F6620636F6D6261742E22290D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O2062696E642E53657442696E64696E674B6579286F626A656374290D0A656E640D0A0D0A66756E6374696F6E2062696E642E556E62696E64286B6579290D0A2O206C6F63616C206E756D42696E64696E6773203D204765744E756D42696E64696E677328290D0A2O20666F722069203D20312C206E756D42696E64696E677320646F0D0A4O206C6F63616C206B6579312C206B657932203D2047657442696E64696E674B65792847657442696E64696E6728692O290D0A4O206966206B657931202O3D206B6579206F72206B657932202O3D206B6579207468656E0D0A6O2053657442696E64696E67286B6579290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E2062696E642E526562696E6428290D0A2O2062696E642E66722O654B657973203D207B7D0D0A2O2062696E642E66722O654B657973496E697469616C697A6564203D2066616C73650D0A2O20666F72205F2C207620696E2070616972732862696E642E7370652O6C2920646F0D0A4O2062696E642E42696E6428762E6F626A656374290D0A2O20656E640D0A2O20666F72205F2C207620696E2070616972732862696E642E6974656D2920646F0D0A4O2062696E642E42696E6428762E6F626A656374290D0A2O20656E640D0A2O20666F72205F2C207620696E2070616972732862696E642E6D6163726F2920646F0D0A4O2062696E642E42696E6428762E6F626A656374290D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E2062696E642E526573657428290D0A2O207461626C652E776970652862696E642E7370652O6C290D0A2O207461626C652E776970652862696E642E6974656D290D0A2O207461626C652E776970652862696E642E6D6163726F290D0A2O207461626C652E776970652862696E642E66722O654B657973290D0A2O2062696E642E66722O654B657973496E697469616C697A6564203D2066616C73650D0A656E640D0A0D0A66756E6374696F6E2062696E642E53657442696E64696E674B6579286F626A656374290D0A2O206C6F63616C207370652O6C4944203D206F626A6563742E7370652O6C49440D0A2O206C6F63616C206974656D4944203D206F626A6563742E6974656D49440D0A2O206C6F63616C206D6163726F4944203D206F626A6563742E6D6163726F49440D0A2O206966207370652O6C4944207468656E0D0A4O206C6F63616C2062696E64696E674B6579203D2062696E642E66722O654B6579735B2362696E642E66722O654B6579735D0D0A4O207461626C652E72656D6F76652862696E642E66722O654B6579732C202362696E642E66722O654B657973290D0A4O2062696E642E556E62696E642862696E64696E674B6579290D0A4O2053657442696E64696E675370652O6C2862696E64696E674B65793A6773756228223A222C20222D22292C206F626A6563743A4E616D65282O290D0A4O2057523A5072696E7444656275672822426F756E642022202O2E206F626A6563743A4E616D652829202O2E202220746F2022202O2E2062696E64696E674B6579290D0A4O2062696E642E7370652O6C5B7370652O6C49445D203D207B206B6579203D2062696E64696E674B65792C206F626A656374203D206F626A656374207D0D0A2O20656C73656966206974656D4944207468656E0D0A4O206C6F63616C2062696E64696E674B6579203D2062696E642E66722O654B6579735B2362696E642E66722O654B6579735D0D0A4O207461626C652E72656D6F76652862696E642E66722O654B6579732C202362696E642E66722O654B657973290D0A4O2062696E642E556E62696E642862696E64696E674B6579290D0A4O2053657442696E64696E674974656D2862696E64696E674B65793A6773756228223A222C20222D22292C206F626A6563743A4E616D65282O290D0A4O2057523A5072696E7444656275672822426F756E642022202O2E206F626A6563743A4E616D652829202O2E202220746F2022202O2E2062696E64696E674B6579290D0A4O2062696E642E6974656D5B6974656D49445D203D207B206B6579203D2062696E64696E674B65792C206F626A656374203D206F626A656374207D0D0A2O20656C73656966206D6163726F4944207468656E0D0A4O206C6F63616C2062696E64696E674B6579203D2062696E642E66722O654B6579735B2362696E642E66722O654B6579735D0D0A4O207461626C652E72656D6F76652862696E642E66722O654B6579732C202362696E642E66722O654B657973290D0A4O2062696E642E556E62696E642862696E64696E674B6579290D0A4O2057522E6672616D65732E722O6F743A412O644D6163726F286F626A656374290D0A4O2053657442696E64696E67436C69636B2862696E64696E674B65793A6773756228223A222C20222D22292C206D6163726F4944290D0A4O2057523A5072696E7444656275672822426F756E642022202O2E206D6163726F4944202O2E202220746F2022202O2E2062696E64696E674B6579290D0A4O2062696E642E6D6163726F5B6D6163726F49445D203D207B206B6579203D2062696E64696E674B65792C206F626A656374203D206F626A6563742C206973416374696F6E42696E64203D206973416374696F6E42696E64207D0D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E2062696E642E47657442696E64696E674B6579286F626A656374290D0A2O206C6F63616C207370652O6C4944203D206F626A6563742E7370652O6C49440D0A2O206C6F63616C206974656D4944203D206F626A6563742E6974656D49440D0A2O206C6F63616C206D6163726F4944203D206F626A6563742E6D6163726F49440D0A2O206C6F63616C20616374696F6E203D20287370652O6C494420616E64206170692E616374696F6E2E46696E6442795370652O6C4944287370652O6C49442O29206F7220286974656D494420616E64206170692E616374696F6E2E46696E6442794974656D4944286974656D49442O29206F7220286D6163726F494420616E64206170692E616374696F6E2E46696E6442794D6163726F4944286D6163726F49442O29206F72206E696C0D0A2O20696620616374696F6E20616E6420616374696F6E2E636F2O6D616E644E616D65207468656E0D0A4O206C6F63616C2062696E64696E674B6579203D2047657442696E64696E674B657928616374696F6E2E636F2O6D616E644E616D65290D0A4O202O2D20544F444F284649584D45293A204D6F7573652062696E64696E677320617265206E6F74207965742073752O706F727465642062792074686520636C69656E742E0D0A4O2069662062696E64696E674B657920616E6420286E6F7420737472696E672E66696E642862696E64696E674B65792C20224D4F555345222O2920616E6420286E6F7420737472696E672E66696E642862696E64696E674B65792C202242552O544F4E222O2920616E642062696E642E497356616C696442696E64696E674B65792862696E64696E674B657929207468656E0D0A6O2072657475726E2062696E64696E674B65793A6773756228222D222C20223A22290D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E2062696E642E497356616C696442696E64696E674B65792862696E64696E674B6579290D0A2O2069662062696E64696E674B6579207E3D206E696C207468656E0D0A4O206C6F63616C207061727473203D2073747273706C692O7461626C6528222D222C2062696E64696E674B6579290D0A4O20696620237061727473202O3D2031207468656E0D0A6O20696620286B6579436F6465735B746F737472696E672870617274735B315D295D207E3D206E696C29207468656E0D0A8O2072657475726E20747275650D0A6O20656E640D0A4O20656C7365696620237061727473202O3D2032207468656E0D0A6O206966202O286B6579436F6465735B746F737472696E672870617274735B315D295D207E3D206E696C2920616E6420286B6579436F6465735B746F737472696E672870617274735B325D295D207E3D206E696C2O29207468656E0D0A8O2072657475726E20747275650D0A6O20656E640D0A4O20656C7365696620237061727473202O3D2033207468656E0D0A6O206966202O286B6579436F6465735B746F737472696E672870617274735B315D295D207E3D206E696C2920616E6420286B6579436F6465735B746F737472696E672870617274735B325D295D207E3D206E696C2920616E6420286B6579436F6465735B746F737472696E672870617274735B335D295D207E3D206E696C2O29207468656E0D0A8O2072657475726E20747275650D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A0D0A2O2072657475726E2066616C73650D0A656E640D0A0D0A66756E6374696F6E2062696E642E4973426C61636B6C6973746564286B6579290D0A2O2072657475726E2057522E7574696C732E497356616C7565496E412O7261792857522E64622E676C6F62616C2E696E707574732E626C61636B6C6973742C206B6579290D0A656E640D0A00063O0012013O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);