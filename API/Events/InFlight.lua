local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111]=v83[v111](v83[v111 + 1 ]);elseif (v86>1) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v120=v85[2];v78=(v120 + v84) -1 ;for v132=v120,v78 do local v133=v79[v132-v120 ];v83[v132]=v133;end end elseif (v86<=3) then local v113=v85[2];v78=(v113 + v84) -1 ;for v117=v113,v78 do local v118=v79[v117-v113 ];v83[v117]=v118;end elseif (v86>4) then local v121=v85[2];v83[v121](v13(v83,v121 + 1 ,v78));else local v122=v85[2];v83[v122](v13(v83,v122 + 1 ,v78));end elseif (v86<=8) then if (v86<=6) then v83[v85[2]]=v85[3];elseif (v86>7) then v83[v85[2]]=v85[3];else do return;end end elseif (v86<=9) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86==10) then local v128=v85[2];v83[v128]=v83[v128](v83[v128 + 1 ]);else do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703780A2O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C20746172676574203D20756E69742E7461726765740D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A0D0A6C6F63616C20747261636B65645370652O6C73203D207B7D0D0A6C6F63616C20652O666563744D6170203D207B7D0D0A0D0A66756E6374696F6E207370652O6C3A5265676973746572496E466C69676874452O6665637428652O666563744944290D0A2O2073656C662E696E466C69676874452O666563744944203D20652O6665637449440D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A496E466C69676874452O6665637428290D0A2O2072657475726E2073656C662E696E466C69676874452O6665637449440D0A656E640D0A0D0A66756E6374696F6E207370652O6C3A5265676973746572496E466C69676874283O2E290D0A2O206C6F63616C2061726773203D207B203O2E207D0D0A2O206C6F63616C207370652O6C4944203D2073656C662E7370652O6C49440D0A0D0A2O206C6F63616C20747261636B65645370652O6C203D207B20696E666C69676874203D2066616C73652C206465737447554944203D206E696C2C20636F756E74203D20302C206175726173203D207B7D207D0D0A2O20747261636B65645370652O6C735B7370652O6C49445D203D20747261636B65645370652O6C0D0A2O20666F72205F2C20617572615370652O6C20696E20706169727328617267732920646F0D0A4O20696620617572615370652O6C3A49442829207468656E0D0A6O20747261636B65645370652O6C2E61757261735B617572615370652O6C5D203D2066616C73650D0A4O20656E640D0A2O20656E640D0A0D0A2O206C6F63616C20696E466C69676874452O666563744944203D2073656C663A496E466C69676874452O6665637428290D0A2O20696620696E466C69676874452O666563744944207468656E0D0A4O20652O666563744D61705B696E466C69676874452O6665637449445D203D207370652O6C49440D0A2O20656E640D0A656E640D0A0D0A6170693A5265676973746572466F7253656C66436F6D6261744576656E74280D0A2O2066756E6374696F6E285F2C205F2C205F2C205F2C205F2C205F2C205F2C2064657374475549442C205F2C205F2C205F2C207370652O6C4944290D0A4O206C6F63616C20747261636B65645370652O6C203D20747261636B65645370652O6C735B7370652O6C49445D0D0A4O206966206E6F7420747261636B65645370652O6C207468656E2072657475726E20656E640D0A0D0A4O206966206465737447554944202O3D202O22207468656E0D0A6O20747261636B65645370652O6C2E6465737447554944203D207461726765743A4755494428290D0A4O20656C73650D0A6O20747261636B65645370652O6C2E6465737447554944203D2064657374475549440D0A4O20656E640D0A0D0A4O20747261636B65645370652O6C2E696E666C69676874203D20747275650D0A4O20747261636B65645370652O6C2E636F756E74203D20747261636B65645370652O6C2E636F756E74202B20310D0A4O20666F7220617572615370652O6C2C205F20696E20706169727328747261636B65645370652O6C2E61757261732920646F0D0A6O20747261636B65645370652O6C2E61757261735B617572615370652O6C5D203D20706C617965723A42752O66557028617572615370652O6C29206F7220617572615370652O6C3A54696D6553696E63654C61737452656D6F7665644F6E506C617965722829203C20302E310D0A4O20656E640D0A2O20656E642C0D0A2O20225350452O4C5F434153545F53552O43452O53220D0A290D0A0D0A6170693A5265676973746572466F7253656C66436F6D6261744576656E74280D0A2O2066756E6374696F6E285F2C205F2C205F2C205F2C205F2C205F2C205F2C2064657374475549442C205F2C205F2C205F2C207370652O6C4944290D0A4O206C6F63616C20652O666563745370652O6C4944203D20652O666563744D61705B7370652O6C49445D0D0A4O206C6F63616C20747261636B65645370652O6C203D2028652O666563745370652O6C494420616E6420747261636B65645370652O6C735B652O666563745370652O6C49445D29206F7220747261636B65645370652O6C735B7370652O6C49445D0D0A4O206966206E6F7420747261636B65645370652O6C207468656E2072657475726E20656E640D0A0D0A4O20696620747261636B65645370652O6C2E6465737447554944202O3D206465737447554944207468656E0D0A6O20747261636B65645370652O6C2E696E666C69676874203D2066616C73650D0A6O20747261636B65645370652O6C2E636F756E74203D206D6174682E6D617828302C20747261636B65645370652O6C2E636F756E74202D2031290D0A4O20656E640D0A2O20656E642C0D0A2O20225350452O4C5F44414D414745222C20225350452O4C5F4D492O534544222C20225350452O4C5F415552415F412O504C494544222C20225350452O4C5F415552415F52454652455348220D0A290D0A0D0A6170693A5265676973746572466F72436F6D6261744576656E74280D0A2O2066756E6374696F6E285F2C205F2C205F2C205F2C205F2C205F2C205F2C206465737447554944290D0A4O20666F72207370652O6C49442C205F20696E20706169727328747261636B65645370652O6C732920646F0D0A6O206C6F63616C20747261636B65645370652O6C203D20747261636B65645370652O6C735B7370652O6C49445D0D0A6O20696620747261636B65645370652O6C2E6465737447554944202O3D206465737447554944207468656E0D0A8O20747261636B65645370652O6C2E696E666C69676874203D2066616C73650D0A8O20747261636B65645370652O6C2E636F756E74203D206D6174682E6D617828302C20747261636B65645370652O6C2E636F756E74202D2031290D0A6O20656E640D0A4O20656E640D0A2O20656E642C0D0A2O2022554E49545F44494544222C2022554E49545F44455354524F594544220D0A290D0A0D0A66756E6374696F6E207370652O6C3A496E466C696768742861757261290D0A2O206C6F63616C20747261636B65645370652O6C203D20747261636B65645370652O6C735B73656C663A494428295D0D0A2O206966206E6F7420747261636B65645370652O6C207468656E20652O726F722822596F7520666F72676F7420746F2072656769737465722022202O2E2073656C663A4E616D652829202O2E202220666F7220496E466C6967687420747261636B696E672E222920656E640D0A0D0A2O2069662061757261207468656E0D0A4O2072657475726E20747261636B65645370652O6C2E696E666C6967687420616E6420747261636B65645370652O6C2E61757261735B617572615D0D0A2O20656E640D0A0D0A2O2072657475726E20747261636B65645370652O6C2E696E666C696768740D0A656E640D0A00063O0012023O00013O001208000100028O000200022O000100016O00045O00012O00073O00017O00",v9(),...);