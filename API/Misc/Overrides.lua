local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=14) then if (v86<=6) then if (v86<=2) then if (v86<=0) then v83[v85[2]]=v83[v85[3]];elseif (v86==1) then do return v83[v85[2]];end else local v116=v85[2];do return v13(v83,v116,v116 + v85[3] );end end elseif (v86<=4) then if (v86>3) then local v117;local v118;local v119;local v118,v117;local v120;local v121;local v122;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v122=v85[3];v121=v83[v122];for v216=v122 + 1 ,v85[4] do v121=v121   .. v83[v216] ;end v83[v85[2]]=v121;v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v118,v117=v76(v83[v120](v83[v120 + 1 ]));v78=(v117 + v120) -1 ;v119=0;for v217=v120,v78 do v119=v119 + 1 ;v83[v217]=v118[v119];end v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v83[v120]=v83[v120](v13(v83,v120 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v83[v120](v13(v83,v120 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v118={v83[v120]()};v117=v85[4];v119=0;for v220=v120,v117 do v119=v119 + 1 ;v83[v220]=v118[v119];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if (v83[v85[2]]==v85[4]) then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]][v85[3]]=v83[v85[4]];end elseif (v86>5) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v137=v85[2];local v138=v85[4];local v139=v137 + 2 ;local v140={v83[v137](v83[v137 + 1 ],v83[v139])};for v223=1,v138 do v83[v139 + v223 ]=v140[v223];end local v141=v140[1];if v141 then v83[v139]=v141;v77=v85[3];else v77=v77 + 1 ;end end elseif (v86<=10) then if (v86<=8) then if (v86>7) then do return;end else local v142=v85[3];local v143=v83[v142];for v226=v142 + 1 ,v85[4] do v143=v143   .. v83[v226] ;end v83[v85[2]]=v143;end elseif (v86>9) then local v145=v85[2];v83[v145]=v83[v145](v83[v145 + 1 ]);else local v147=v85[2];local v148=v83[v147];local v149=v85[3];for v227=1,v149 do v148[v227]=v83[v147 + v227 ];end end elseif (v86<=12) then if (v86==11) then local v150=v85[2];v83[v150]=v83[v150](v13(v83,v150 + 1 ,v78));else local v152=v85[2];local v153={v83[v152](v83[v152 + 1 ])};local v154=0;for v230=v152,v85[4] do v154=v154 + 1 ;v83[v230]=v153[v154];end end elseif (v86>13) then v77=v85[3];else local v156;local v157;local v158;v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v158=v85[2];v157=v83[v158];v156=v85[3];for v233=1,v156 do v157[v233]=v83[v158 + v233 ];end end elseif (v86<=22) then if (v86<=18) then if (v86<=16) then if (v86>15) then v83[v85[2]]=v58[v85[3]];else local v170;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v170=v85[2];v83[v170]=v83[v170](v83[v170 + 1 ]);v77=v77 + 1 ;v85=v73[v77];if (v83[v85[2]]==v85[4]) then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86==17) then v83[v85[2]]=v85[3];else local v179=v74[v85[3]];local v180;local v181={};v180=v10({},{__index=function(v236,v237)local v238=v181[v237];return v238[1][v238[2]];end,__newindex=function(v239,v240,v241)local v242=v181[v240];v242[1][v242[2]]=v241;end});for v244=1,v85[4] do v77=v77 + 1 ;local v245=v73[v77];if (v245[1]==0) then v181[v244-1 ]={v83,v245[3]};else v181[v244-1 ]={v58,v245[3]};end v82[ #v82 + 1 ]=v181;end v83[v85[2]]=v29(v179,v180,v59);end elseif (v86<=20) then if (v86>19) then v83[v85[2]]={};else v83[v85[2]]=v83[v85[3]][v83[v85[4]]];end elseif (v86==21) then local v186;local v187;local v188;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v188=v85[2];v187=v83[v188];v186=v85[3];for v247=1,v186 do v187[v247]=v83[v188 + v247 ];end elseif (v83[v85[2]]==v85[4]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86<=26) then if (v86<=24) then if (v86>23) then local v197=v85[2];v83[v197](v83[v197 + 1 ]);else local v198=v85[2];local v199=v83[v198];for v250=v198 + 1 ,v85[3] do v7(v199,v83[v250]);end end elseif (v86>25) then v83[v85[2]][v83[v85[3]]]=v83[v85[4]];else v83[v85[2]]=v83[v85[3]][v85[4]];end elseif (v86<=28) then if (v86==27) then local v204=v85[2];v83[v204](v13(v83,v204 + 1 ,v85[3]));else local v205=v85[2];local v206={v83[v205]()};local v207=v85[4];local v208=0;for v251=v205,v207 do v208=v208 + 1 ;v83[v251]=v206[v208];end end elseif (v86==29) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};else local v212=v85[2];local v213,v214=v76(v83[v212](v83[v212 + 1 ]));v78=(v214 + v212) -1 ;local v215=0;for v254=v212,v78 do v215=v215 + 1 ;v83[v254]=v213[v215];end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!0B3O0003023O0057522O033O0061706903043O00756E697403063O00706C617965722O033O0070657403063O0074617267657403053O007370652O6C03043O006974656D030F3O00412O64436F72654F76652O72696465030C3O004C6F6164526573746F726573030D3O004C6F61644F76652O7269646573001C3O00121D3O00013O00206O000200202O00013O000300202O00020001000400202O00030001000500202O00040001000600202O00053O000700202O00063O00084O00078O00085O00061200093O000100099O006O00028O00058O00068O00048O00018O00038O00088O00073O0010033O0009000900061200090001000100016O00073O0010033O000A000900061200090002000100016O00083O0010033O000B00092O00083O00013O00033O00103O0003063O00612O73657274030A3O006C6F6164737472696E6703233O006O2072657475726E2066756E6374696F6E202866756E63290A6O2003133O00203D2066756E630A6O20656E642C2003063O006O2003073O0073657466656E762O033O0061706903063O00706C6179657203053O007370652O6C03043O006974656D03063O0074617267657403043O00756E69742O033O007065740003053O007461626C6503063O00696E7365727403383O001204000300013O00122O000400023O00122O000500036O00065O00122O000700046O00085O00122O000900056O0005000500094O000400056O00033O000200122O000400066O000500036O00063O00074O00075O00102O0006000700074O000700013O00102O0006000800074O000700023O00102O0006000900074O000700033O00102O0006000A00074O000700043O00102O0006000B00074O000700053O00102O0006000C00074O000700063O00102O0006000D00074O0004000600014O000400036O0004000100054O000600076O00060006000200262O000600250001000E00040E3O002500012O0010000600074O001400076O001A0006000200070012060006000F3O00200D0006000600104O000700076O0007000700024O000800026O000900046O000A00016O0008000200012O001B0006000800010012150006000F3O00202O0006000600104O000700086O000800026O000900046O000A00056O0008000200012O001B0006000800012O0001000500024O00083O00017O00033O0003053O007061697273026O00F03F027O0040000A3O0012063O00014O001000016O000C3O0002000200040E3O000700010020190005000400020020190006000400032O00180005000200010006053O00040001000200040E3O000400012O00083O00017O00053O0003043O007479706503053O007461626C6503053O007061697273026O00F03F027O004001113O00120F000100016O00028O000200026O00010002000200262O000100100001000200040E3O00100001001206000100034O001000026O0013000200024O000C00010002000300040E3O000E00010020190006000500040020190007000500052O00180006000200010006050001000B0001000200040E3O000B00012O00083O00017O00",v9(),...);