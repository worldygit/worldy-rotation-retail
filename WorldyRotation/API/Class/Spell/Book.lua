local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110;local v111;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v111=v85[2];v83[v111]=v83[v111](v83[v111 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v111=v85[2];v78=(v111 + v84) -1 ;for v118=v111,v78 do v110=v79[v118-v111 ];v83[v118]=v110;end v77=v77 + 1 ;v85=v73[v77];v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end elseif (v86>1) then local v124=v85[2];v83[v124]=v83[v124](v83[v124 + 1 ]);else do return;end end elseif (v86<=4) then if (v86==3) then local v126=v85[2];v83[v126](v13(v83,v126 + 1 ,v78));elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86==5) then v83[v85[2]]=v85[3];else local v129=v85[2];v78=(v129 + v84) -1 ;for v131=v129,v78 do local v132=v79[v131-v129 ];v83[v131]=v132;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703E4052O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C206361636865203D2057522E63616368650D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A0D0A6C6F63616C2066756E6374696F6E2046696E64422O6F6B496E646578287370652O6C49442C207370652O6C54797065290D0A2O206966207370652O6C54797065202O3D2022706C6179657222207468656E0D0A4O20666F722069203D20312C204765744E756D5370652O6C54616273282920646F0D0A6O206C6F63616C206F2O667365742C206E756D5370652O6C732C205F2C206F2O6653706563203D2073656C65637428332C204765745370652O6C546162496E666F28692O290D0A6O206966206F2O6653706563202O3D2030207468656E0D0A8O20666F72206A203D20312C20286F2O66736574202B206E756D5370652O6C732920646F0D0A9O20206C6F63616C2063752O72656E745370652O6C4944203D2073656C65637428372C204765745370652O6C496E666F286A2C20422O4F4B545950455F5350452O4C2O290D0A9O202069662063752O72656E745370652O6C494420616E642063752O72656E745370652O6C4944202O3D207370652O6C4944207468656E0D0A9O203O2072657475726E206A0D0A9O2020656E640D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656C73656966207370652O6C54797065202O3D202270657422207468656E0D0A4O206C6F63616C206E756D5065745370652O6C73203D204861735065745370652O6C7328290D0A4O206966206E756D5065745370652O6C73207468656E0D0A6O20666F722069203D20312C206E756D5065745370652O6C7320646F0D0A8O206C6F63616C2063752O72656E745370652O6C4944203D2073656C65637428372C204765745370652O6C496E666F28692C20422O4F4B545950455F5045542O290D0A8O2069662063752O72656E745370652O6C494420616E642063752O72656E745370652O6C4944202O3D207370652O6C4944207468656E0D0A9O202072657475726E20690D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656C73650D0A4O20652O726F722822496E636F2O72656374207370652O6C547970652E22290D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A422O6F6B496E64657828290D0A2O206C6F63616C207370652O6C4944203D2073656C662E7370652O6C49440D0A2O206C6F63616C207370652O6C54797065203D2073656C662E7370652O6C547970650D0A0D0A2O206C6F63616C20622O6F6B496E646578203D2063616368652E70657273697374656E742E622O6F6B496E6465785B7370652O6C547970655D5B7370652O6C49445D0D0A2O206966206E6F7420622O6F6B496E646578207468656E0D0A4O20622O6F6B496E646578203D2046696E64422O6F6B496E646578287370652O6C49442C207370652O6C54797065290D0A4O2063616368652E70657273697374656E742E622O6F6B496E6465785B7370652O6C547970655D5B7370652O6C49445D203D20622O6F6B496E6465780D0A2O20656E640D0A0D0A2O2072657475726E20622O6F6B496E6465780D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A422O6F6B5479706528290D0A2O206C6F63616C207370652O6C54797065203D2073656C662E7370652O6C547970650D0A2O206966207370652O6C54797065202O3D2022706C6179657222207468656E0D0A4O2072657475726E20422O4F4B545950455F5350452O4C0D0A2O20656C73656966207370652O6C54797065202O3D202270657422207468656E0D0A4O2072657475726E20422O4F4B545950455F5045540D0A2O20656C73650D0A4O20652O726F722822496E636F2O72656374207370652O6C547970652E22290D0A2O20656E640D0A656E640D0A00063O00124O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);