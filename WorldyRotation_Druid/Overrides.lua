local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then do return;end elseif (v86==1) then local v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));else v83[v85[2]]=v85[3];end elseif (v86<=4) then if (v86>3) then v83[v85[2]]=v59[v85[3]];else local v116=v85[2];v83[v116]=v83[v116](v83[v116 + 1 ]);end elseif (v86>5) then local v118;local v119;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v119=v85[2];v83[v119]=v83[v119](v83[v119 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v119=v85[2];v78=(v119 + v84) -1 ;for v128=v119,v78 do v118=v79[v128-v119 ];v83[v128]=v118;end v77=v77 + 1 ;v85=v73[v77];v119=v85[2];v83[v119](v13(v83,v119 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else local v126=v85[2];v78=(v126 + v84) -1 ;for v131=v126,v78 do local v132=v79[v131-v126 ];v83[v131]=v132;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703250D2O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A2O2D204865726F4C69620D0A6C6F63616C20484C6O203D204865726F4C69620D0A6C6F63616C2043616368653O203D204865726F43616368650D0A6C6F63616C20556E69744O203D20484C2E556E69740D0A6C6F63616C20506C617965722O203D20556E69742E506C617965720D0A6C6F63616C205065745O203D20556E69742E5065740D0A6C6F63616C205461726765742O203D20556E69742E5461726765740D0A6C6F63616C205370652O6C3O203D20484C2E5370652O6C0D0A6C6F63616C204974656D4O203D20484C2E4974656D0D0A2O2D20576F726C6479526F746174696F6E0D0A6C6F63616C2057526O203D20576F726C6479526F746174696F6E0D0A2O2D205370652O6C730D0A6C6F63616C205370652O6C466572616C203D205370652O6C2E44727569642E466572616C0D0A6C6F63616C205370652O6C526573746F203D205370652O6C2E44727569642E526573746F726174696F6E0D0A2O2D204C75610D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D3D0D0A2O2D2042616C616E63652C2049443A203130320D0A484C2E412O64436F72654F76652O72696465202822506C617965722E41737472616C506F77657250222C0D0A2O2066756E6374696F6E2028290D0A4O206C6F63616C204150203D20506C617965723A41737472616C506F77657228290D0A4O206966206E6F7420506C617965723A497343617374696E672829207468656E0D0A6O2072657475726E2041500D0A4O20656C73650D0A6O20696620506C617965723A497343617374696E67285370652O6C42616C616E63652E577261746829206F7220506C617965723A497343617374696E67285370652O6C42616C616E63652E537461726669726529206F7220506C617965723A497343617374696E67285370652O6C42616C616E63652E5374652O6C6172466C61726529207468656E0D0A8O2072657475726E204150202B20380D0A6O20656C7365696620506C617965723A497343617374696E67285370652O6C42616C616E63652E4E65774D2O6F6E29207468656E0D0A8O2072657475726E204150202B2031300D0A6O20656C7365696620506C617965723A497343617374696E67285370652O6C42616C616E63652E48616C664D2O6F6E29207468656E0D0A8O2072657475726E204150202B2032300D0A6O20656C7365696620506C617965723A497343617374696E67285370652O6C42616C616E63652E46752O6C4D2O6F6E29207468656E0D0A8O2072657475726E204150202B2034300D0A6O20656C73650D0A8O2072657475726E2041500D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2C20313032290D0A0D0A6C6F63616C2042616C4F6C645370652O6C49734361737461626C650D0A42616C4F6C645370652O6C49734361737461626C65203D20484C2E412O64436F72654F76652O726964652028225370652O6C2E49734361737461626C65222C0D0A2O2066756E6374696F6E202873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A4O206C6F63616C2052616E67654F4B203D20747275650D0A4O2069662052616E6765207468656E0D0A6O206C6F63616C2052616E6765556E6974203D2054686973556E6974206F72205461726765740D0A6O2052616E67654F4B203D2052616E6765556E69743A4973496E52616E6765282052616E67652C20416F455370652O6C20290D0A4O20656E640D0A4O206C6F63616C2042617365436865636B203D2042616C4F6C645370652O6C49734361737461626C652873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A4O2069662073656C66202O3D205370652O6C42616C616E63652E4D2O6F6E6B696E466F726D207468656E0D0A6O2072657475726E2042617365436865636B20616E6420506C617965723A42752O66446F776E2873656C66290D0A4O20656C736569662073656C66202O3D205370652O6C42616C616E63652E5374652O6C6172466C617265207468656E0D0A6O2072657475726E2042617365436865636B20616E64206E6F7420506C617965723A497343617374696E672873656C66290D0A4O20656C736569662073656C66202O3D205370652O6C42616C616E63652E5772617468206F722073656C66202O3D205370652O6C42616C616E63652E5374617266697265207468656E0D0A6O2072657475726E2042617365436865636B20616E64206E6F742028506C617965723A497343617374696E672873656C662920616E642073656C663A436F756E742829202O3D2031290D0A4O20656C736569662073656C66202O3D205370652O6C42616C616E63652E57612O72696F726F66456C756E65207468656E0D0A6O2072657475726E2042617365436865636B20616E6420506C617965723A42752O66446F776E2873656C66290D0A4O20656C736569662073656C66202O3D205370652O6C42616C616E63652E4E65774D2O6F6E206F722073656C66202O3D205370652O6C42616C616E63652E48616C664D2O6F6E206F722073656C66202O3D205370652O6C42616C616E63652E46752O6C4D2O6F6E207468656E0D0A6O2072657475726E2042617365436865636B20616E64206E6F7420506C617965723A497343617374696E672873656C66290D0A4O20656C73650D0A6O2072657475726E2042617365436865636B0D0A4O20656E640D0A2O20656E640D0A2C20313032290D0A0D0A2O2D20466572616C2C2049443A203130330D0A6C6F63616C20466572616C4F6C645370652O6C49734361737461626C650D0A466572616C4F6C645370652O6C49734361737461626C65203D20484C2E412O64436F72654F76652O726964652028225370652O6C2E49734361737461626C65222C0D0A2O2066756E6374696F6E202873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A4O206C6F63616C2042617365436865636B203D20466572616C4F6C645370652O6C49734361737461626C652873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A4O2069662073656C66202O3D205370652O6C466572616C2E436174466F726D206F722073656C66202O3D205370652O6C466572616C2E4D2O6F6E6B696E466F726D207468656E0D0A6O2072657475726E2042617365436865636B20616E6420506C617965723A42752O66446F776E2873656C66290D0A4O20656C736569662073656C66202O3D205370652O6C466572616C2E50726F776C207468656E0D0A6O2072657475726E2042617365436865636B20616E642073656C663A4973557361626C65282920616E64206E6F7420506C617965723A537465616C7468557028747275652C2074727565290D0A4O20656C73650D0A6O2072657475726E2042617365436865636B0D0A4O20656E640D0A2O20656E640D0A2C20313033290D0A0D0A2O2D20526573746F726174696F6E2C2049443A203130350D0A6C6F63616C20526573746F4F6C645370652O6C49734361737461626C650D0A526573746F4F6C645370652O6C49734361737461626C65203D20484C2E412O64436F72654F76652O726964652028225370652O6C2E49734361737461626C65222C0D0A2O2066756E6374696F6E202873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A4O206C6F63616C2042617365436865636B203D20526573746F4F6C645370652O6C49734361737461626C652873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A4O2069662073656C66202O3D205370652O6C526573746F2E436174466F726D206F722073656C66202O3D205370652O6C526573746F2E4D2O6F6E6B696E466F726D207468656E0D0A6O2072657475726E2042617365436865636B20616E6420506C617965723A42752O66446F776E2873656C66290D0A4O20656C73650D0A6O2072657475726E2042617365436865636B0D0A4O20656E640D0A2O20656E640D0A2C20313035290D0A00063O0012063O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);