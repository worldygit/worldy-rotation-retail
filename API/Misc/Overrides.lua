local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110]=v83[v110](v83[v110 + 1 ]);elseif (v86>1) then v83[v85[2]]=v85[3];else do return;end end elseif (v86<=4) then if (v86>3) then local v115=v85[2];v78=(v115 + v84) -1 ;for v125=v115,v78 do local v126=v79[v125-v115 ];v83[v125]=v126;end else local v116=v85[2];v83[v116](v13(v83,v116 + 1 ,v78));end elseif (v86==5) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v117;local v118;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v83[v118]=v83[v118](v83[v118 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v78=(v118 + v84) -1 ;for v128=v118,v78 do v117=v79[v128-v118 ];v83[v128]=v117;end v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v83[v118](v13(v83,v118 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67034B042O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C20706574203D20756E69742E7065740D0A6C6F63616C20746172676574203D20756E69742E7461726765740D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A0D0A6C6F63616C20726573746F72654442203D207B7D0D0A6C6F63616C206F76652O726964654442203D207B7D0D0A0D0A66756E6374696F6E206170692E412O64436F72654F76652O7269646528742C206E657766756E6374696F6E2C20737065634B6579290D0A2O206C6F63616C206C6F61644F76652O7269646546756E63203D20612O73657274286C6F6164737472696E67282O5B0D0A6O2072657475726E2066756E6374696F6E202866756E63290D0A6O202O5D202O2E2074202O2E202O5B203D2066756E630D0A6O20656E642C202O5D202O2E2074202O2E202O5B0D0A6O202O5D2O290D0A2O2073657466656E76286C6F61644F76652O7269646546756E632C207B20617069203D206170692C20706C61796572203D20706C617965722C207370652O6C203D207370652O6C2C206974656D203D206974656D2C20746172676574203D207461726765742C20756E6974203D20756E69742C20706574203D20706574207D290D0A2O206C6F63616C206F76652O7269646546756E632C206F6C6466756E6374696F6E203D206C6F61644F76652O7269646546756E6328290D0A2O206966206F76652O7269646544425B737065634B65795D202O3D206E696C207468656E0D0A4O206F76652O7269646544425B737065634B65795D203D207B7D0D0A2O20656E640D0A2O207461626C652E696E73657274286F76652O7269646544425B737065634B65795D2C207B206F76652O7269646546756E632C206E657766756E6374696F6E207D290D0A2O207461626C652E696E7365727428726573746F726544422C207B206F76652O7269646546756E632C206F6C6466756E6374696F6E207D290D0A2O2072657475726E206F6C6466756E6374696F6E0D0A656E640D0A0D0A66756E6374696F6E206170692E4C6F6164526573746F72657328290D0A2O20666F72205F2C207620696E20706169727328726573746F726544422920646F0D0A4O20765B315D28765B325D290D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170692E4C6F61644F76652O726964657328737065634B6579290D0A2O2069662074797065286F76652O7269646544425B737065634B65795D29202O3D20227461626C6522207468656E0D0A4O20666F72205F2C207620696E207061697273286F76652O7269646544425B737065634B65795D2920646F0D0A6O20765B315D28765B325D290D0A4O20656E640D0A2O20656E640D0A656E640D0A00063O0012063O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);