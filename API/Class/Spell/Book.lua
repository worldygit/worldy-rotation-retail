local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=16) then if (v86<=7) then if (v86<=3) then if (v86<=1) then if (v86==0) then local v114=v85[2];v83[v114]=v83[v114](v13(v83,v114 + 1 ,v78));elseif (v83[v85[2]]==v85[4]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86==2) then local v116=v74[v85[3]];local v117;local v118={};v117=v10({},{__index=function(v207,v208)local v209=v118[v208];return v209[1][v209[2]];end,__newindex=function(v210,v211,v212)local v213=v118[v211];v213[1][v213[2]]=v212;end});for v215=1,v85[4] do v77=v77 + 1 ;local v216=v73[v77];if (v216[1]==4) then v118[v215-1 ]={v83,v216[3]};else v118[v215-1 ]={v58,v216[3]};end v82[ #v82 + 1 ]=v118;end v83[v85[2]]=v29(v116,v117,v59);else v83[v85[2]]=v83[v85[3]][v85[4]];end elseif (v86<=5) then if (v86>4) then v83[v85[2]][v83[v85[3]]]=v83[v85[4]];else v83[v85[2]]=v83[v85[3]];end elseif (v86>6) then v83[v85[2]]=v83[v85[3]][v83[v85[4]]];else local v128=v85[2];local v129=v83[v128];local v130=v83[v128 + 2 ];if (v130>0) then if (v129>v83[v128 + 1 ]) then v77=v85[3];else v83[v128 + 3 ]=v129;end elseif (v129<v83[v128 + 1 ]) then v77=v85[3];else v83[v128 + 3 ]=v129;end end elseif (v86<=11) then if (v86<=9) then if (v86==8) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];else local v134=v85[2];v83[v134]=v83[v134]();end elseif (v86>10) then v83[v85[2]]=v58[v85[3]];elseif  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86<=13) then if (v86>12) then v83[v85[2]]=v83[v85[3]] + v83[v85[4]] ;else local v139;v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v139=v85[2];v83[v139]=v83[v139](v13(v83,v139 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v83[v85[3]]]=v83[v85[4]];end elseif (v86<=14) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86==15) then v77=v85[3];elseif (v83[v85[2]]==v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86<=24) then if (v86<=20) then if (v86<=18) then if (v86==17) then local v150=v85[2];local v151=v83[v150 + 2 ];local v152=v83[v150] + v151 ;v83[v150]=v152;if (v151>0) then if (v152<=v83[v150 + 1 ]) then v77=v85[3];v83[v150 + 3 ]=v152;end elseif (v152>=v83[v150 + 1 ]) then v77=v85[3];v83[v150 + 3 ]=v152;end else local v154;local v155,v156;local v157;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v157=v85[2];v155,v156=v76(v83[v157](v13(v83,v157 + 1 ,v85[3])));v78=(v156 + v157) -1 ;v154=0;for v218=v157,v78 do v154=v154 + 1 ;v83[v218]=v155[v154];end v77=v77 + 1 ;v85=v73[v77];v157=v85[2];v83[v157]=v83[v157](v13(v83,v157 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86>19) then local v164;local v165;local v164,v166;local v167;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v167=v85[2];v164,v166=v76(v83[v167](v83[v167 + 1 ]));v78=(v166 + v167) -1 ;v165=0;for v221=v167,v78 do v165=v165 + 1 ;v83[v221]=v164[v165];end v77=v77 + 1 ;v85=v73[v77];v167=v85[2];v164={v83[v167](v13(v83,v167 + 1 ,v78))};v165=0;for v224=v167,v85[4] do v165=v165 + 1 ;v83[v224]=v164[v165];end v77=v77 + 1 ;v85=v73[v77];if (v83[v85[2]]==v85[4]) then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]][v85[3]]=v83[v85[4]];end elseif (v86<=22) then if (v86==21) then v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v180=v85[2];local v181={v83[v180](v13(v83,v180 + 1 ,v78))};local v182=0;for v227=v180,v85[4] do v182=v182 + 1 ;v83[v227]=v181[v182];end end elseif (v86==23) then local v183=v85[2];do return v13(v83,v183,v183 + v85[3] );end else local v184=v85[2];v83[v184](v83[v184 + 1 ]);end elseif (v86<=28) then if (v86<=26) then if (v86==25) then v83[v85[2]]=v85[3];elseif v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86==27) then local v187=v85[2];v83[v187]=v83[v187](v13(v83,v187 + 1 ,v85[3]));else local v189=v85[2];local v190,v191=v76(v83[v189](v83[v189 + 1 ]));v78=(v191 + v189) -1 ;local v192=0;for v230=v189,v78 do v192=v192 + 1 ;v83[v230]=v190[v192];end end elseif (v86<=30) then if (v86==29) then do return;end else local v193=v85[2];local v194,v195=v76(v83[v193](v13(v83,v193 + 1 ,v85[3])));v78=(v195 + v193) -1 ;local v196=0;for v233=v193,v78 do v196=v196 + 1 ;v83[v233]=v194[v196];end end elseif (v86<=31) then local v197;local v198,v199;local v200;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v200=v85[2];v198,v199=v76(v83[v200](v13(v83,v200 + 1 ,v85[3])));v78=(v199 + v200) -1 ;v197=0;for v236=v200,v78 do v197=v197 + 1 ;v83[v236]=v198[v197];end v77=v77 + 1 ;v85=v73[v77];v200=v85[2];v83[v200]=v83[v200](v13(v83,v200 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86==32) then v83[v85[2]]=v29(v74[v85[3]],nil,v59);else do return v83[v85[2]];end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!063O0003023O0057522O033O0061706903053O00636163686503053O007370652O6C03093O00422O6F6B496E64657803083O00422O6F6B54797065000D3O0012083O00013O00206O000200122O000100013O00202O00010001000300202O00023O000400022000035O00060200040001000100022O00043O00014O00043O00033O001013000200050004000220000400023O0010130002000600042O001D3O00013O00033O000F3O0003063O00706C61796572026O00F03F030F3O004765744E756D5370652O6C5461627303063O0073656C656374026O000840030F3O004765745370652O6C546162496E666F028O00026O001C40030C3O004765745370652O6C496E666F030E3O00422O4F4B545950455F5350452O4C2O033O00706574030C3O004861735065745370652O6C73030C3O00422O4F4B545950455F50455403053O00652O726F7203143O00496E636F2O72656374207370652O6C547970652E023E3O002601000100220001000100040F3O00220001001219000200023O00120E000300034O0009000300010002001219000400023O00040600020021000100120E000600043O001214000700053O00122O000800066O000900056O000800096O00063O000900262O000900200001000700040F3O00200001001219000A00024O000D000B00060007001219000C00023O000406000A0020000100120E000E00043O00121F000F00083O00122O001000096O0011000D3O00122O0012000A6O001000126O000E3O000200062O000E001F00013O00040F3O001F0001000610000E001F00013O00040F3O001F00012O0021000D00023O000411000A0013000100041100020007000100040F3O003D00010026010001003A0001000B00040F3O003A000100120E0002000C4O000900020001000200061A0002003D00013O00040F3O003D0001001219000300024O0004000400023O001219000500023O00040600030039000100120E000700043O00121F000800083O00122O000900096O000A00063O00122O000B000D6O0009000B6O00073O000200062O0007003800013O00040F3O003800010006100007003800013O00040F3O003800012O0021000600023O0004110003002C000100040F3O003D000100120E0002000E3O0012190003000F4O00180002000200012O001D3O00017O00043O0003073O007370652O6C494403093O007370652O6C54797065030A3O0070657273697374656E7403093O00622O6F6B496E64657801153O00201500013O000100202O00023O00024O00035O00202O00030003000300202O0003000300044O0003000300024O00030003000100062O000300130001000100040F3O001300012O000B000400014O000C000500016O000600026O0004000600024O000300046O00045O00202O00040004000300202O0004000400044O0004000400024O0004000100032O0021000300024O001D3O00017O00073O0003093O007370652O6C5479706503063O00706C61796572030E3O00422O4F4B545950455F5350452O4C2O033O00706574030C3O00422O4F4B545950455F50455403053O00652O726F7203143O00496E636F2O72656374207370652O6C547970652E010F3O00200300013O0001002601000100060001000200040F3O0006000100120E000200034O0021000200023O00040F3O000E00010026010001000B0001000400040F3O000B000100120E000200054O0021000200023O00040F3O000E000100120E000200063O001219000300074O00180002000200012O001D3O00017O00",v9(),...);