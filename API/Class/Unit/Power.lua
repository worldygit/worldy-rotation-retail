local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then do return;end elseif (v86>1) then v83[v85[2]]=v85[3];else do return;end end elseif (v86<=3) then v83[v85[2]]=v85[3];elseif (v86==4) then local v119=v85[2];v83[v119]=v83[v119](v83[v119 + 1 ]);else local v121=v85[2];v83[v121](v13(v83,v121 + 1 ,v78));end elseif (v86<=8) then if (v86<=6) then local v113=v85[2];v83[v113]=v83[v113](v83[v113 + 1 ]);elseif (v86==7) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86<=9) then local v115=v85[2];v83[v115](v13(v83,v115 + 1 ,v78));elseif (v86>10) then local v122=v85[2];v78=(v122 + v84) -1 ;for v126=v122,v78 do local v127=v79[v126-v122 ];v83[v126]=v127;end else local v123=v85[2];v78=(v123 + v84) -1 ;for v129=v123,v78 do local v130=v79[v129-v123 ];v83[v129]=v130;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E670368052O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C20756E6974203D206170692E756E69740D0A0D0A66756E6374696F6E20756E69743A506F7765725479706528290D0A2O206C6F63616C20756E69744944203D2073656C663A494428290D0A0D0A2O2072657475726E20556E6974506F7765725479706528756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A506F7765724D617828290D0A2O206C6F63616C20756E69744944203D2073656C663A494428290D0A0D0A2O2072657475726E20556E6974506F7765724D617828756E697449442C2073656C663A506F77657254797065282O290D0A656E640D0A0D0A66756E6374696F6E20756E69743A506F77657228290D0A2O206C6F63616C20756E69744944203D2073656C663A494428290D0A0D0A2O2072657475726E20556E6974506F77657228756E697449442C2073656C663A506F77657254797065282O290D0A656E640D0A0D0A66756E6374696F6E20756E69743A506F776572526567656E28290D0A2O206C6F63616C20756E69744944203D2073656C663A494428290D0A0D0A2O2072657475726E20476574506F776572526567656E28756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A506F77657250657263656E7461676528290D0A2O2072657475726E202873656C663A506F7765722829202F2073656C663A506F7765724D6178282O29202A20312O300D0A656E640D0A0D0A66756E6374696F6E20756E69743A506F7765724465666963697428290D0A2O2072657475726E2073656C663A506F7765724D61782829202D2073656C663A506F77657228290D0A656E640D0A0D0A66756E6374696F6E20756E69743A506F7765724465666963697450657263656E7461676528290D0A2O2072657475726E202873656C663A506F776572446566696369742829202F2073656C663A506F7765724D6178282O29202A20312O300D0A656E640D0A0D0A66756E6374696F6E20756E69743A506F776572526567656E50657263656E7461676528290D0A2O2072657475726E202873656C663A506F776572526567656E2829202F2073656C663A506F7765724D6178282O29202A20312O300D0A656E640D0A0D0A66756E6374696F6E20756E69743A506F77657254696D65546F4D617828290D0A2O2069662073656C663A506F776572526567656E2829202O3D2030207468656E2072657475726E202D3120656E640D0A2O2072657475726E2073656C663A506F776572446566696369742829202F2073656C663A506F776572526567656E28290D0A656E640D0A0D0A66756E6374696F6E20756E69743A506F77657254696D65546F5828616D6F756E742C206F2O66736574290D0A2O2069662073656C663A506F776572526567656E2829202O3D2030207468656E2072657475726E202D3120656E640D0A2O2072657475726E20616D6F756E74203E2073656C663A506F776572282920616E642028616D6F756E74202D2073656C663A506F776572282O29202F202873656C663A506F776572526567656E2829202A202831202D20286F2O66736574206F7220303O29206F7220300D0A656E640D0A0D0A66756E6374696F6E20756E69743A506F77657254696D65546F5850657263656E7461676528616D6F756E74290D0A2O2069662073656C663A506F776572526567656E2829202O3D2030207468656E2072657475726E202D3120656E640D0A2O2072657475726E20616D6F756E74203E2073656C663A506F77657250657263656E74616765282920616E642028616D6F756E74202D2073656C663A506F77657250657263656E74616765282O29202F2073656C663A506F776572526567656E50657263656E746167652829206F7220300D0A656E640D0A00063O0012083O00013O001203000100024O00043O000200022O000B00016O00095O00016O00017O00",v9(),...);