local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v78=(v111 + v84) -1 ;for v117=v111,v78 do local v118=v79[v117-v111 ];v83[v117]=v118;end elseif (v86==1) then v83[v85[2]]=v85[3];else local v122=v85[2];v83[v122](v13(v83,v122 + 1 ,v78));end elseif (v86<=3) then v83[v85[2]]=v59[v85[3]];elseif (v86==4) then do return;end else local v123=v85[2];v78=(v123 + v84) -1 ;for v133=v123,v78 do local v134=v79[v133-v123 ];v83[v133]=v134;end end elseif (v86<=8) then if (v86<=6) then v83[v85[2]]=v85[3];elseif (v86>7) then local v124=v85[2];v83[v124]=v83[v124](v83[v124 + 1 ]);else local v126=v85[2];v83[v126](v13(v83,v126 + 1 ,v78));end elseif (v86<=9) then do return;end elseif (v86>10) then v83[v85[2]]=v59[v85[3]];else local v129=v85[2];v83[v129]=v83[v129](v83[v129 + 1 ]);end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67035C062O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A3O2D207O3D204C4F43414C495A45207O3D0D0A2O2D20412O646F6E0D0A6C6F63616C20612O646F6E4E616D652C20612O646F6E5461626C65203D203O2E0D0A2O2D20576F726C6479526F746174696F6E0D0A6C6F63616C205752203D20576F726C6479526F746174696F6E0D0A6C6F63616C20475549203D2057522E4755490D0A6C6F63616C204372656174654368696C6450616E656C203D204755492E4372656174654368696C6450616E656C0D0A6C6F63616C2043726561746550616E656C4F7074696F6E203D204755492E43726561746550616E656C4F7074696F6E0D0A6C6F63616C20437265617465415250616E656C4F7074696F6E203D204755492E437265617465415250616E656C4F7074696F6E0D0A6C6F63616C20437265617465415250616E656C4F7074696F6E73203D204755492E437265617465415250616E656C4F7074696F6E730D0A0D0A57522E47554953652O74696E67732E41504C2E44656174684B6E69676874203D207B0D0A2O20436F2O6D6F6E73203D207B0D0A4O20456E61626C6564203D207B0D0A6O20557365416D73416D7A4F2O66656E736976656C79203D2066616C73652C0D0A4O207D2C0D0A4O204850203D207B0D0A6O204465617468537472696B65203D2036302C0D0A6O204461726B53752O636F72203D2038302C0D0A4O207D2C0D0A2O207D2C0D0A2O20426C2O6F64203D207B0D0A4O204850203D207B0D0A6O2052756E655461705468726573686F6C64203D2034302C0D0A6O20496365626F756E64466F727469747564655468726573686F6C64203D2035302C0D0A6O2056616D7069726963426C2O6F645468726573686F6C64203D2036352C0D0A6O204465617468537472696B6544756D70416D6F756E74203D2036352C0D0A4O207D2C0D0A2O207D2C0D0A2O2046726F7374203D207B0D0A4O20456E61626C6564203D207B0D0A6O2044697361626C65426F53502O6F6C696E67203D2066616C73652C0D0A6O204272656174686F6653696E647261676F7361203D20747275652C0D0A4O207D2C0D0A2O207D2C0D0A2O20556E686F6C79203D207B0D0A4O20456E61626C6564203D207B0D0A6O2044697361626C65416F7444203D2066616C73652C0D0A4O207D2C0D0A2O207D2C0D0A7D0D0A0D0A57522E4755492E4C6F616453652O74696E67735265637572736976656C792857522E47554953652O74696E6773290D0A2O2D2050616E656C730D0A6C6F63616C20415250616E656C203D2057522E4755492E50616E656C0D0A6C6F63616C2043505F44656174686B6E69676874203D204372656174654368696C6450616E656C28415250616E656C2C202244656174684B6E6967687422290D0A6C6F63616C2043505F426C2O6F64203D204372656174654368696C6450616E656C2843505F44656174686B6E696768742C2022426C2O6F6422290D0A6C6F63616C2043505F46726F7374203D204372656174654368696C6450616E656C2843505F44656174686B6E696768742C202246726F737422290D0A6C6F63616C2043505F556E686F6C79203D204372656174654368696C6450616E656C2843505F44656174686B6E696768742C2022556E686F6C7922290D0A0D0A2O2D44656174684B6E696768742050616E656C730D0A437265617465415250616E656C4F7074696F6E732843505F44656174686B6E696768742C202241504C2E44656174684B6E696768742E436F2O6D6F6E7322290D0A0D0A2O2D426C2O6F642050616E656C730D0A437265617465415250616E656C4F7074696F6E732843505F426C2O6F642C202241504C2E44656174684B6E696768742E426C2O6F6422290D0A0D0A2O2D46726F73742050616E656C730D0A437265617465415250616E656C4F7074696F6E732843505F46726F73742C202241504C2E44656174684B6E696768742E46726F737422290D0A0D0A2O2D556E686F6C792050616E656C730D0A437265617465415250616E656C4F7074696F6E732843505F556E686F6C792C202241504C2E44656174684B6E696768742E556E686F6C7922290D0A00063O00120B3O00013O001206000100024O000A3O000200024O00016O00025O00012O00043O00017O00",v9(),...);