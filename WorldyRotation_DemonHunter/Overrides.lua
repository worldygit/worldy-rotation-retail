local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then v83[v85[2]]=v59[v85[3]];elseif (v86==1) then v83[v85[2]]=v85[3];else do return;end end elseif (v86<=3) then v83[v85[2]]=v85[3];elseif (v86==4) then do return;end else local v121=v85[2];v83[v121](v13(v83,v121 + 1 ,v78));end elseif (v86<=8) then if (v86<=6) then local v115=v85[2];v83[v115]=v83[v115](v83[v115 + 1 ]);elseif (v86==7) then local v122=v85[2];v78=(v122 + v84) -1 ;for v130=v122,v78 do local v131=v79[v130-v122 ];v83[v130]=v131;end else local v123=v85[2];v78=(v123 + v84) -1 ;for v133=v123,v78 do local v134=v79[v133-v123 ];v83[v133]=v134;end end elseif (v86<=9) then local v117=v85[2];v83[v117](v13(v83,v117 + 1 ,v78));elseif (v86>10) then local v124=v85[2];v83[v124]=v83[v124](v83[v124 + 1 ]);else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67030A082O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A2O2D204865726F4C69620D0A6C6F63616C20484C6O203D204865726F4C69620D0A6C6F63616C2043616368653O203D204865726F43616368650D0A6C6F63616C20556E69744O203D20484C2E556E69740D0A6C6F63616C20506C617965722O203D20556E69742E506C617965720D0A6C6F63616C205065745O203D20556E69742E5065740D0A6C6F63616C205461726765742O203D20556E69742E5461726765740D0A6C6F63616C205370652O6C3O203D20484C2E5370652O6C0D0A6C6F63616C204974656D4O203D20484C2E4974656D0D0A2O2D20576F726C6479526F746174696F6E0D0A6C6F63616C2057526O203D20576F726C6479526F746174696F6E0D0A2O2D205370652O6C730D0A6C6F63616C205370652O6C4861766F639O205O203D205370652O6C2E44656D6F6E48756E7465722E4861766F630D0A6C6F63616C205370652O6C56656E6765616E63659O20203D205370652O6C2E44656D6F6E48756E7465722E56656E6765616E63650D0A2O2D204C75610D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D3D0D0A2O2D204861766F632C2049443A20352O370D0A6C6F63616C204861766F634F6C645370652O6C49734361737461626C650D0A4861766F634F6C645370652O6C49734361737461626C65203D20484C2E412O64436F72654F76652O726964652028225370652O6C2E49734361737461626C65222C0D0A2O2066756E6374696F6E202873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A4O206C6F63616C2042617365436865636B203D204861766F634F6C645370652O6C49734361737461626C652873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A4O2069662073656C66202O3D205370652O6C4861766F632E4D6574616D6F7270686F736973207468656E0D0A6O206C6F63616C20484D4941203D2057522E47554953652O74696E67732E41504C2E44656D6F6E48756E7465722E4861766F632E486964654D65746149664163746976650D0A6O2072657475726E2042617365436865636B20616E64202O28484D494120616E6420506C617965723A42752O66446F776E285370652O6C4861766F632E4D6574616D6F7270686F73697342752O662O29206F72206E6F7420484D4941290D0A4O20656C736569662073656C66202O3D205370652O6C4861766F632E46656C52757368207468656E0D0A6O2072657475726E2042617365436865636B206F722028506C617965723A42752O665570285370652O6C4861766F632E476C6964652920616E64205370652O6C4861766F632E46656C527573683A436861726765732829203E3D2031290D0A4O20656C736569662073656C66202O3D205370652O6C4861766F632E56656E676566756C52657472656174207468656E0D0A6O2072657475726E2042617365436865636B206F722028506C617965723A42752O665570285370652O6C4861766F632E476C6964652920616E64205370652O6C4861766F632E56656E676566756C526574726561743A49734C6561726E6564282920616E64205370652O6C4861766F632E56656E676566756C526574726561743A432O6F6C646F776E52656D61696E732829203C20302E33290D0A4O20656C73650D0A6O2072657475726E2042617365436865636B0D0A4O20656E640D0A2O20656E640D0A2C20352O37290D0A0D0A2O2D2056656E6765616E63652C2049443A203538310D0A6C6F63616C2056656E674F6C645370652O6C49734361737461626C650D0A56656E674F6C645370652O6C49734361737461626C65203D20484C2E412O64436F72654F76652O726964652028225370652O6C2E49734361737461626C65222C0D0A2O2066756E6374696F6E202873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A4O206C6F63616C2042617365436865636B203D2056656E674F6C645370652O6C49734361737461626C652873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A4O2069662073656C66202O3D205370652O6C56656E6765616E63652E46696572794272616E64207468656E0D0A6O2072657475726E2042617365436865636B20616E64205461726765743A446562752O66446F776E285370652O6C56656E6765616E63652E46696572794272616E64446562752O66290D0A4O20656C736569662073656C66202O3D205370652O6C56656E6765616E63652E54686548756E74207468656E0D0A6O2072657475726E2042617365436865636B20616E64206E6F7420506C617965723A497343617374696E672873656C66290D0A4O20656C73650D0A6O2072657475726E2042617365436865636B0D0A4O20656E640D0A2O20656E640D0A2C20353831290D0A00063O00124O00013O001203000100024O00063O000200022O000700016O00095O00012O00043O00017O00",v9(),...);