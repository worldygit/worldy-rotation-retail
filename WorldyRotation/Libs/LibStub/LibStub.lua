local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=19) then if (v86<=9) then if (v86<=4) then if (v86<=1) then if (v86==0) then local v114;v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v83[v114](v13(v83,v114 + 1 ,v85[3]));else local v122=v85[2];do return v13(v83,v122,v78);end end elseif (v86<=2) then if (v83[v85[2]]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86>3) then local v189;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v189=v85[2];do return v83[v189](v13(v83,v189 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v189=v85[2];do return v13(v83,v189,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end else v83[v85[2]]=v83[v85[3]];end elseif (v86<=6) then if (v86==5) then local v123=v85[2];v83[v123](v13(v83,v123 + 1 ,v85[3]));else local v124=v85[2];do return v83[v124](v13(v83,v124 + 1 ,v85[3]));end end elseif (v86<=7) then do return;end elseif (v86>8) then v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v200=v85[2];v83[v200]=v83[v200](v13(v83,v200 + 1 ,v78));end elseif (v86<=14) then if (v86<=11) then if (v86==10) then v83[v85[2]]=v29(v74[v85[3]],nil,v59);else local v126=v85[2];do return v83[v126],v83[v126 + 1 ];end end elseif (v86<=12) then if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86==13) then do return v83[v85[2]];end else local v203;v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v203=v85[2];do return v83[v203],v83[v203 + 1 ];end v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=16) then if (v86==15) then local v127=v85[2];v83[v127]=v83[v127](v83[v127 + 1 ]);elseif v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86<=17) then v83[v85[2]]=v83[v85[3]][v85[4]];elseif (v86==18) then v83[v85[2]]=v85[3]~=0 ;else v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=29) then if (v86<=24) then if (v86<=21) then if (v86>20) then v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];else local v136=v85[2];local v137,v138=v76(v83[v136](v83[v136 + 1 ]));v78=(v138 + v136) -1 ;local v139=0;for v176=v136,v78 do v139=v139 + 1 ;v83[v176]=v137[v139];end end elseif (v86<=22) then local v140=v85[2];do return v13(v83,v140,v140 + v85[3] );end elseif (v86>23) then local v216=v85[2];v83[v216]=v83[v216](v13(v83,v216 + 1 ,v85[3]));else v83[v85[2]][v83[v85[3]]]=v83[v85[4]];end elseif (v86<=26) then if (v86==25) then if (v83[v85[2]]~=v85[4]) then v77=v77 + 1 ;else v77=v85[3];end else local v141=v85[2];local v142=v83[v85[3]];v83[v141 + 1 ]=v142;v83[v141]=v142[v85[4]];end elseif (v86<=27) then if (v83[v85[2]]<=v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86==28) then v83[v85[2]]=v85[3]~=0 ;v77=v77 + 1 ;else v77=v85[3];end elseif (v86<=34) then if (v86<=31) then if (v86>30) then local v146;v83[v85[2]][v83[v85[3]]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v146=v85[2];do return v83[v146],v83[v146 + 1 ];end v77=v77 + 1 ;v85=v73[v77];do return;end else local v155=v85[2];local v156,v157=v76(v83[v155](v13(v83,v155 + 1 ,v85[3])));v78=(v157 + v155) -1 ;local v158=0;for v179=v155,v78 do v158=v158 + 1 ;v83[v179]=v156[v158];end end elseif (v86<=32) then v83[v85[2]][v85[3]]=v83[v85[4]];elseif (v86>33) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v224;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v224=v85[2];v83[v224]=v83[v224](v83[v224 + 1 ]);v77=v77 + 1 ;v85=v73[v77];if (v83[v85[2]]~=v85[4]) then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=37) then if (v86<=35) then local v161;local v162,v163;local v164;local v165;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v165=v85[2];v164=v83[v85[3]];v83[v165 + 1 ]=v164;v83[v165]=v164[v85[4]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v165=v85[2];v162,v163=v76(v83[v165](v83[v165 + 1 ]));v78=(v163 + v165) -1 ;v161=0;for v182=v165,v78 do v161=v161 + 1 ;v83[v182]=v162[v161];end v77=v77 + 1 ;v85=v73[v77];v165=v85[2];v83[v165]=v83[v165](v13(v83,v165 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v165=v85[2];v83[v165](v13(v83,v165 + 1 ,v85[3]));elseif (v86>36) then for v248=v85[2],v85[3] do v83[v248]=nil;end else v83[v85[2]]=v85[3];end elseif (v86<=38) then v83[v85[2]]=v83[v85[3]][v83[v85[4]]];elseif (v86==39) then local v235;local v236,v237;local v238;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v238=v85[2];v83[v238](v13(v83,v238 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v238=v85[2];v236,v237=v76(v83[v238](v13(v83,v238 + 1 ,v85[3])));v78=(v237 + v238) -1 ;v235=0;for v250=v238,v78 do v235=v235 + 1 ;v83[v250]=v236[v235];end v77=v77 + 1 ;v85=v73[v77];v238=v85[2];v83[v238]=v83[v238](v13(v83,v238 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v238=v85[2];v83[v238]=v83[v238](v13(v83,v238 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]]={};end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!0B3O0003073O004C696253747562027O004003023O005F4703053O006D696E6F7203043O006C69627303063O006D696E6F7273030A3O004E65774C696272617279030A3O004765744C69627261727903103O00497465726174654C6962726172696573030C3O007365746D6574617461626C6503063O002O5F63612O6C00213O0012093O00013O00122O000100023O00122O000200036O000200023O00062O0002000900013O00041D3O00090001002011000300020004000602000300200001000100041D3O0020000100060C000200110001000100041D3O001100012O002800033O00022O001500045O00102O0003000500044O00045O00102O0003000600044O000200033O001222000300034O001700033O000200102000020004000100020A00035O00102000020007000300020A000300013O00102000020008000300020A000300023O00102O00020009000300122O0003000A6O000400026O00053O000100202O00060002000800102O0005000B00064O0003000500012O00073O00013O00033O000A3O0003063O00612O7365727403043O007479706503063O00737472696E6703313O0042616420617267756D656E7420233220746F20604E65774C696272617279272028737472696E672065787065637465642903083O00746F6E756D62657203053O006D617463682O033O0025642B033A3O004D696E6F722076657273696F6E206D757374206569746865722062652061206E756D626572206F7220636F6E7461696E2061206E756D6265722E03063O006D696E6F727303043O006C696273032C3O001221000300013O00122O000400026O000500016O00040002000200262O000400070001000300041D3O000700012O001C00046O0012000400013O001227000500046O00030005000100122O000300013O00122O000400053O00122O000500033O00202O0005000500064O000600023O00122O000700076O000500076O00043O000200122O000500086O0003000500024O000200033O00202O00033O00094O00030003000100062O0003001D00013O00041D3O001D000100061B0002001D0001000300041D3O001D00012O0025000400044O000D000400023O00201100043O000900201300053O000A4O000600023O00202O00073O000A4O00070007000100062O000700250001000100041D3O002500012O002800076O00170005000100072O001F00040001000600202O00043O000A4O0004000400014O000500036O000400038O00017O00073O0003043O006C69627303053O00652O726F7203253O0043612O6E6F742066696E642061206C69627261727920696E7374616E6365206F662025712E03063O00666F726D617403083O00746F737472696E67027O004003063O006D696E6F727303153O00201100033O00012O002600030003000100060C0003000F0001000100041D3O000F000100060C0002000F0001000100041D3O000F0001001222000300023O001223000400033O00202O00040004000400122O000600056O000700016O000600076O00043O000200122O000500066O00030005000100201100033O00012O000E00030003000100202O00043O00074O0004000400014O000300038O00017O00023O0003053O00706169727303043O006C69627301053O001204000100013O00202O00023O00024O000100026O00019O0000017O00",v9(),...);