local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then do return;end elseif (v86>1) then do return;end else local v117=v85[2];v78=(v117 + v84) -1 ;for v130=v117,v78 do local v131=v79[v130-v117 ];v83[v130]=v131;end end elseif (v86<=3) then v83[v85[2]]=v59[v85[3]];elseif (v86==4) then local v118=v85[2];v83[v118](v13(v83,v118 + 1 ,v78));else local v119=v85[2];v78=(v119 + v84) -1 ;for v133=v119,v78 do local v134=v79[v133-v119 ];v83[v133]=v134;end end elseif (v86<=8) then if (v86<=6) then local v113=v85[2];v83[v113](v13(v83,v113 + 1 ,v78));elseif (v86>7) then v83[v85[2]]=v85[3];else v83[v85[2]]=v85[3];end elseif (v86<=9) then v83[v85[2]]=v59[v85[3]];elseif (v86==10) then local v124=v85[2];v83[v124]=v83[v124](v83[v124 + 1 ]);else local v126=v85[2];v83[v126]=v83[v126](v83[v126 + 1 ]);end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703B6042O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A3O2D207O3D204C4F43414C495A45207O3D0D0A2O2D20412O646F6E0D0A6C6F63616C20612O646F6E4E616D652C20612O646F6E5461626C65203D203O2E0D0A2O2D204865726F4C69620D0A6C6F63616C20484C9O206O203D204865726F4C69620D0A6C6F63616C2057529O206O203D20576F726C6479526F746174696F6E0D0A6C6F63616C2043616368659O203O203D204865726F43616368650D0A6C6F63616C20556E69749O204O203D20484C2E556E69740D0A6C6F63616C20506C617965729O202O203D20556E69742E506C617965720D0A6C6F63616C205461726765749O202O203D20556E69742E5461726765740D0A6C6F63616C205370652O6C9O203O203D20484C2E5370652O6C0D0A6C6F63616C204974656D9O204O203D20484C2E4974656D0D0A2O2D204C75610D0A6C6F63616C2047657454696D659O20203D2047657454696D650D0A2O2D2046696C65204C6F63616C730D0A57522E436F2O6D6F6E732E44656D6F6E48756E746572203D207B7D0D0A6C6F63616C2044656D6F6E48756E7465726O203D2057522E436F2O6D6F6E732E44656D6F6E48756E7465720D0A6C6F63616C205370652O6C5644489O203D205370652O6C2E44656D6F6E48756E7465722E56656E6765616E63650D0A0D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D3D0D0A3O2D207O3D204E4F4E2D434F4D4241544C4F47207O3D0D0A0D0A3O2D207O3D20434F4D4241544C4F47207O3D0D0A0D0A9O2D9O2D2D0D0A5O2D2044474220434452205O2D0D0A9O2D9O2D2D0D0A484C3A5265676973746572466F7253656C66436F6D6261744576656E74280D0A2O2066756E6374696F6E20283O2E290D0A4O206C6F63616C20536F75726365475549442C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205370652O6C49442C205F2C205F2C20416D6F756E74203D2073656C65637428342C203O2E290D0A0D0A4O20696620536F7572636547554944202O3D20506C617965723A475549442829207468656E0D0A6O206966205370652O6C4944202O3D20333931333435207468656E0D0A8O2044656D6F6E48756E7465722E444742434452203D2028416D6F756E74202F20312O3029202A2036300D0A8O2044656D6F6E48756E7465722E4447424344524C617374557064617465203D2047657454696D6528290D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2O202C20225350452O4C5F454E455247495A45220D0A290D0A00063O0012093O00013O001208000100024O000A3O000200022O000100016O00045O00016O00017O00",v9(),...);