local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then do return;end elseif (v86==1) then local v111;local v112;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v112=v85[2];v83[v112]=v83[v112](v83[v112 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v112=v85[2];v78=(v112 + v84) -1 ;for v128=v112,v78 do v111=v79[v128-v112 ];v83[v128]=v111;end v77=v77 + 1 ;v85=v73[v77];v112=v85[2];v83[v112](v13(v83,v112 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else local v119=v85[2];v78=(v119 + v84) -1 ;for v131=v119,v78 do local v132=v79[v131-v119 ];v83[v131]=v132;end end elseif (v86<=4) then if (v86==3) then v83[v85[2]]=v85[3];else v83[v85[2]]=v59[v85[3]];end elseif (v86==5) then local v124=v85[2];v83[v124]=v83[v124](v83[v124 + 1 ]);else local v126=v85[2];v83[v126](v13(v83,v126 + 1 ,v78));end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703A6072O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A3O2D207O3D204C4F43414C495A45207O3D0D0A2O202O2D20412O646F6E0D0A2O206C6F63616C20612O646F6E4E616D652C205752203D203O2E3B0D0A2O206C6F63616C20475549203D2057522E4755493B0D0A2O206C6F63616C2043726561746550616E656C203D204755492E43726561746550616E656C3B0D0A2O206C6F63616C204372656174654368696C6450616E656C203D204755492E4372656174654368696C6450616E656C3B0D0A2O206C6F63616C2043726561746550616E656C4F7074696F6E203D204755492E43726561746550616E656C4F7074696F6E3B0D0A2O206C6F63616C20437265617465415250616E656C4F7074696F6E73203D204755492E437265617465415250616E656C4F7074696F6E730D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D3D0D0A2O202O2D2044656661756C742073652O74696E67730D0A2O2057522E47554953652O74696E6773203D207B0D0A4O2050726F66696C65203D207B0D0A6O20526F746174696F6E203D206E696C2C0D0A4O207D2C0D0A4O2047656E6572616C203D207B0D0A6O20456E61626C6564203D207B0D0A8O202O2D204175746F42696E640D0A8O204175746F42696E64203D20747275652C0D0A8O202O2D2050617573650D0A8O2053686966744B65795061757365203D2066616C73652C0D0A8O202O2D20496E74652O727570740D0A8O20496E74652O72757074203D2066616C73652C0D0A8O20496E74652O72757074576974685374756E203D2066616C73652C202O2D204558504552494D454E54414C0D0A8O20496E74652O727570744F6E6C7957686974656C697374203D2066616C73652C0D0A8O202O2D20412O666C69637465640D0A8O2048616E646C65412O666C6963746564203D2066616C73652C0D0A8O202O2D20496E636F72706F7265616C0D0A8O2048616E646C65496E636F72706F7265616C203D2066616C73652C0D0A8O202O2D2044697370656C0D0A8O2044697370656C42752O6673203D2066616C73652C0D0A8O2044697370656C446562752O6673203D2066616C73652C0D0A8O202O2D204D6973630D0A8O2052616369616C73203D2066616C73652C0D0A8O205472696E6B657473203D2066616C73652C0D0A8O202O2D2044656275670D0A8O20526F746174696F6E44656275674F7574707574203D2066616C73652C0D0A6O207D2C0D0A6O205468726573686F6C64203D207B0D0A8O202O2D20496E74652O727570740D0A8O20496E74652O72757074203D2038352C0D0A6O207D2C0D0A6O204850203D207B0D0A8O204865616C746873746F6E65203D2034302C0D0A6O207D2C0D0A4O207D2C0D0A4O2041504C203D207B7D0D0A2O207D3B0D0A2O200D0A2O2057522E526F746174696F6E44726F70646F776E203D206E696C3B0D0A0D0A2O2066756E6374696F6E2057522E4755492E436F726550616E656C53652O74696E6773496E69742028290D0A4O202O2D204755490D0A4O206C6F63616C20575250616E656C203D2043726561746550616E656C2857522E4755492C20612O646F6E4E616D652C202250616E656C4672616D65222C2057522E47554953652O74696E67732C20576F726C6479526F746174696F6E44422E47554953652O74696E6773293B0D0A4O202O2D204368696C642050616E656C0D0A4O206C6F63616C2043505F50726F66696C65203D204372656174654368696C6450616E656C28575250616E656C2C202250726F66696C6522293B0D0A4O206C6F63616C2043505F47656E6572616C203D204372656174654368696C6450616E656C28575250616E656C2C202247656E6572616C22293B0D0A4O202O2D20436F6E74726F6C730D0A4O20437265617465415250616E656C4F7074696F6E732843505F47656E6572616C2C202247656E6572616C22290D0A4O2057522E526F746174696F6E44726F70646F776E203D2043726561746550616E656C4F7074696F6E282244726F70646F776E4578222C2057522E4755492E50616E656C735461626C655B43505F50726F66696C652E757365644E616D655D2C2022526F746174696F6E222C20576F726C6479526F746174696F6E4368617244422E47554953652O74696E67732C207B20224E4F4E4522207D2C2022526F746174696F6E222C202243682O6F7365206120726F746174696F6E20796F752077616E7420746F20706C617920776974682E222C207B52656C6F61645265717569726564203D20747275657D293B0D0A2O20656E640D0A00063O0012013O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);