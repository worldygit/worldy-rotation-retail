local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=36) then if (v86<=17) then if (v86<=8) then if (v86<=3) then if (v86<=1) then if (v86==0) then local v114;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v83[v114]=v83[v114]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];do return v83[v85[2]];end v77=v77 + 1 ;v85=v73[v77];do return;end else local v120=v85[2];v83[v120]=v83[v120]();end elseif (v86>2) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v122;local v123;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v123=v85[2];v122=v83[v85[3]];v83[v123 + 1 ]=v122;v83[v123]=v122[v85[4]];v77=v77 + 1 ;v85=v73[v77];v123=v85[2];v83[v123]=v83[v123](v83[v123 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=5) then if (v86==4) then v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]]=v83[v85[3]]/v85[4] ;end elseif (v86<=6) then v83[v85[2]]=v83[v85[3]][v83[v85[4]]];elseif (v86>7) then local v367;local v368;local v369;v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v369=v85[2];v368={v83[v369](v83[v369 + 1 ])};v367=0;for v487=v369,v85[4] do v367=v367 + 1 ;v83[v487]=v368[v367];end v77=v77 + 1 ;v85=v73[v77];v77=v85[3];else v83[v85[2]]=v83[v85[3]]/v83[v85[4]] ;end elseif (v86<=12) then if (v86<=10) then if (v86>9) then v83[v85[2]][v83[v85[3]]]=v83[v85[4]];elseif v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86>11) then local v143;local v144;v144=v85[2];v143=v83[v85[3]];v83[v144 + 1 ]=v143;v83[v144]=v143[v85[4]];v77=v77 + 1 ;v85=v73[v77];v144=v85[2];v83[v144]=v83[v144](v83[v144 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86<=14) then if (v86>13) then for v334=v85[2],v85[3] do v83[v334]=nil;end else local v154=v83[v85[4]];if  not v154 then v77=v77 + 1 ;else v83[v85[2]]=v154;v77=v85[3];end end elseif (v86<=15) then v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;elseif (v86>16) then if (v83[v85[2]]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v83[v85[2]]~=v85[4]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86<=26) then if (v86<=21) then if (v86<=19) then if (v86>18) then local v156;local v157,v158;local v159;local v160;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v160=v85[2];v159=v83[v85[3]];v83[v160 + 1 ]=v159;v83[v160]=v159[v85[4]];v77=v77 + 1 ;v85=v73[v77];v160=v85[2];v157,v158=v76(v83[v160](v83[v160 + 1 ]));v78=(v158 + v160) -1 ;v156=0;for v336=v160,v78 do v156=v156 + 1 ;v83[v336]=v157[v156];end v77=v77 + 1 ;v85=v73[v77];v160=v85[2];do return v83[v160](v13(v83,v160 + 1 ,v78));end v77=v77 + 1 ;v85=v73[v77];v160=v85[2];do return v13(v83,v160,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end else local v167;v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v167=v85[2];v83[v167]=v83[v167]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86>20) then local v175;local v176,v177;local v178;local v179;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v179=v85[2];v178=v83[v85[3]];v83[v179 + 1 ]=v178;v83[v179]=v178[v85[4]];v77=v77 + 1 ;v85=v73[v77];v179=v85[2];v176,v177=v76(v83[v179](v83[v179 + 1 ]));v78=(v177 + v179) -1 ;v175=0;for v339=v179,v78 do v175=v175 + 1 ;v83[v339]=v176[v175];end v77=v77 + 1 ;v85=v73[v77];v179=v85[2];do return v83[v179](v13(v83,v179 + 1 ,v78));end v77=v77 + 1 ;v85=v73[v77];v179=v85[2];do return v13(v83,v179,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end else v83[v85[2]]=v85[3]~=0 ;v77=v77 + 1 ;end elseif (v86<=23) then if (v86==22) then v83[v85[2]]=v83[v85[3]] * v85[4] ;else local v188;local v189;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v189=v85[2];v188=v83[v85[3]];v83[v189 + 1 ]=v188;v83[v189]=v188[v85[4]];v77=v77 + 1 ;v85=v73[v77];v189=v85[2];v83[v189]=v83[v189](v83[v189 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=24) then local v199=v85[2];local v200,v201=v76(v83[v199](v83[v199 + 1 ]));v78=(v201 + v199) -1 ;local v202=0;for v342=v199,v78 do v202=v202 + 1 ;v83[v342]=v200[v202];end elseif (v86>25) then v83[v85[2]]= #v83[v85[3]];else v83[v85[2]]=v85[3];end elseif (v86<=31) then if (v86<=28) then if (v86>27) then local v203;local v204;v204=v85[2];v203=v83[v85[3]];v83[v204 + 1 ]=v203;v83[v204]=v203[v85[4]];v77=v77 + 1 ;v85=v73[v77];v204=v85[2];v83[v204]=v83[v204](v83[v204 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v214;local v215;v215=v85[2];v214=v83[v85[3]];v83[v215 + 1 ]=v214;v83[v215]=v214[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3]~=0 ;v77=v77 + 1 ;v85=v73[v77];v215=v85[2];do return v83[v215](v13(v83,v215 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v215=v85[2];do return v13(v83,v215,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=29) then v83[v85[2]]={};elseif (v86>30) then local v395;local v396;v396=v85[2];v395=v83[v85[3]];v83[v396 + 1 ]=v395;v83[v396]=v395[v85[4]];v77=v77 + 1 ;v85=v73[v77];v396=v85[2];v83[v396]=v83[v396](v83[v396 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v396=v85[2];v395=v83[v85[3]];v83[v396 + 1 ]=v395;v83[v396]=v395[v85[4]];v77=v77 + 1 ;v85=v73[v77];v396=v85[2];v83[v396]=v83[v396](v83[v396 + 1 ]);v77=v77 + 1 ;v85=v73[v77];if (v83[v85[2]]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end else do return v83[v85[2]];end end elseif (v86<=33) then if (v86==32) then local v224=v85[2];local v225={v83[v224](v83[v224 + 1 ])};local v226=0;for v345=v224,v85[4] do v226=v226 + 1 ;v83[v345]=v225[v226];end else v83[v85[2]]=v85[3]~=0 ;end elseif (v86<=34) then v83[v85[2]][v85[3]]=v83[v85[4]];elseif (v86>35) then local v405=v85[2];v83[v405]=v83[v405](v83[v405 + 1 ]);else local v407=v85[2];v83[v407](v83[v407 + 1 ]);end elseif (v86<=54) then if (v86<=45) then if (v86<=40) then if (v86<=38) then if (v86>37) then v83[v85[2]]=v83[v85[3]];else local v232;local v233;v233=v85[2];v232=v83[v85[3]];v83[v233 + 1 ]=v232;v83[v233]=v232[v85[4]];v77=v77 + 1 ;v85=v73[v77];v233=v85[2];v83[v233]=v83[v233](v83[v233 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v233=v85[2];v232=v83[v85[3]];v83[v233 + 1 ]=v232;v83[v233]=v232[v85[4]];v77=v77 + 1 ;v85=v73[v77];v233=v85[2];v83[v233]=v83[v233](v83[v233 + 1 ]);v77=v77 + 1 ;v85=v73[v77];if (v83[v85[2]]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86==39) then local v242=v85[2];local v243=v85[4];local v244=v242 + 2 ;local v245={v83[v242](v83[v242 + 1 ],v83[v244])};for v348=1,v243 do v83[v244 + v348 ]=v245[v348];end local v246=v245[1];if v246 then v83[v244]=v246;v77=v85[3];else v77=v77 + 1 ;end else v83[v85[2]]=v83[v85[3]] * v83[v85[4]] ;end elseif (v86<=42) then if (v86>41) then v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v253=v85[2];do return v13(v83,v253,v78);end end elseif (v86<=43) then v83[v85[2]]=v83[v85[3]] + v85[4] ;elseif (v86==44) then local v412;v412=v85[2];v83[v412]=v83[v412](v83[v412 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];if (v83[v85[2]]~=v85[4]) then v77=v77 + 1 ;else v77=v85[3];end else local v420;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v420=v85[2];do return v83[v420](v13(v83,v420 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v420=v85[2];do return v13(v83,v420,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=49) then if (v86<=47) then if (v86>46) then if (v85[2]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end else local v255;local v256;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v256=v85[2];v255=v83[v85[3]];v83[v256 + 1 ]=v255;v83[v256]=v255[v85[4]];v77=v77 + 1 ;v85=v73[v77];v256=v85[2];v83[v256]=v83[v256](v83[v256 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v256=v85[2];v255=v83[v85[3]];v83[v256 + 1 ]=v255;v83[v256]=v255[v85[4]];v77=v77 + 1 ;v85=v73[v77];v256=v85[2];v83[v256]=v83[v256](v83[v256 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86==48) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];else local v270=v85[2];local v271={};for v351=1, #v82 do local v352=v82[v351];for v436=0, #v352 do local v437=v352[v436];local v438=v437[1];local v439=v437[2];if ((v438==v83) and (v439>=v270)) then v271[v439]=v438[v439];v437[1]=v271;end end end end elseif (v86<=51) then if (v86==50) then if (v83[v85[2]]<v83[v85[4]]) then v77=v85[3];else v77=v77 + 1 ;end else v77=v85[3];end elseif (v86<=52) then if (v83[v85[2]]<=v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86==53) then local v442=v85[2];do return v13(v83,v442,v442 + v85[3] );end else v83[v85[2]]=v29(v74[v85[3]],nil,v59);end elseif (v86<=63) then if (v86<=58) then if (v86<=56) then if (v86>55) then local v273;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v273=v85[2];v83[v273]=v83[v273]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];do return v83[v85[2]];end v77=v77 + 1 ;v85=v73[v77];do return;end else local v279=v85[2];do return v83[v279](v13(v83,v279 + 1 ,v85[3]));end end elseif (v86>57) then v58[v85[3]]=v83[v85[2]];else v83[v85[2]]=v58[v85[3]];end elseif (v86<=60) then if (v86>59) then if (v83[v85[2]]==v85[4]) then v77=v77 + 1 ;else v77=v85[3];end else local v284;v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v284=v85[2];v83[v284]=v83[v284]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=61) then local v292;local v293;v293=v85[2];v292=v83[v85[3]];v83[v293 + 1 ]=v292;v83[v293]=v292[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v293=v85[2];v83[v293]=v83[v293](v13(v83,v293 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v292=v83[v85[4]];if  not v292 then v77=v77 + 1 ;else v83[v85[2]]=v292;v77=v85[3];end elseif (v86>62) then local v451=v74[v85[3]];local v452;local v453={};v452=v10({},{__index=function(v490,v491)local v492=v453[v491];return v492[1][v492[2]];end,__newindex=function(v493,v494,v495)local v496=v453[v494];v496[1][v496[2]]=v495;end});for v498=1,v85[4] do v77=v77 + 1 ;local v499=v73[v77];if (v499[1]==38) then v453[v498-1 ]={v83,v499[3]};else v453[v498-1 ]={v58,v499[3]};end v82[ #v82 + 1 ]=v453;end v83[v85[2]]=v29(v451,v452,v59);else local v455;local v456;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v456=v85[2];v455=v83[v85[3]];v83[v456 + 1 ]=v455;v83[v456]=v455[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v456=v85[2];v83[v456]=v83[v456](v13(v83,v456 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=68) then if (v86<=65) then if (v86==64) then local v303;local v304,v305;local v306;local v307;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v307=v85[2];v306=v83[v85[3]];v83[v307 + 1 ]=v306;v83[v307]=v306[v85[4]];v77=v77 + 1 ;v85=v73[v77];v307=v85[2];v304,v305=v76(v83[v307](v83[v307 + 1 ]));v78=(v305 + v307) -1 ;v303=0;for v353=v307,v78 do v303=v303 + 1 ;v83[v353]=v304[v303];end v77=v77 + 1 ;v85=v73[v77];v307=v85[2];do return v83[v307](v13(v83,v307 + 1 ,v78));end v77=v77 + 1 ;v85=v73[v77];v307=v85[2];do return v13(v83,v307,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end else local v314;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v314=v85[2];v83[v314]=v83[v314]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];do return v83[v85[2]];end v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=66) then local v320=v85[2];v83[v320]=v83[v320](v13(v83,v320 + 1 ,v85[3]));elseif (v86==67) then local v471=v85[2];local v472=v83[v85[3]];v83[v471 + 1 ]=v472;v83[v471]=v472[v85[4]];else do return;end end elseif (v86<=70) then if (v86==69) then local v322=v85[2];do return v83[v322](v13(v83,v322 + 1 ,v78));end else local v323;local v324;local v325;v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v325=v85[2];v324={v83[v325](v83[v325 + 1 ])};v323=0;for v356=v325,v85[4] do v323=v323 + 1 ;v83[v356]=v324[v323];end v77=v77 + 1 ;v85=v73[v77];v77=v85[3];end elseif (v86<=71) then v83[v85[2]]=v83[v85[3]] + v83[v85[4]] ;elseif (v86==72) then local v479;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v479=v85[2];v83[v479]=v83[v479]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];do return v83[v85[2]];end v77=v77 + 1 ;v85=v73[v77];do return;end else v83[v85[2]]=v83[v85[3]][v85[4]];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!353O0003023O0057522O033O006170692O033O0064626303053O00636163686503043O00756E697403063O00706C6179657203063O0074617267657403053O007370652O6C03023O00494403043O005479706503043O004E616D65030C3O004D696E696D756D52616E6765030C3O004D6178696D756D52616E676503073O0049734D656C2O6503083O00496E666F42794944030A3O00496E666F42794E616D6503113O0054696D6553696E63654C6173744361737403143O0054696D6553696E63654C617374446973706C6179031C3O0054696D6553696E63654C617374412O706C6965644F6E506C61796572031C3O0054696D6553696E63654C61737452656D6F7665644F6E506C6179657203153O00526567697374657244616D616765466F726D756C6103063O0044616D616765030B3O004973417661696C61626C6503073O0049734B6E6F776E030A3O0049735065744B6E6F776E03083O004973557361626C6503093O004973557361626C6550030D3O004973557361626C652O502O6F6C03093O0049734C6561726E656403053O00436F756E74030A3O0049734361737461626C6503073O004973526561647903083O004361737454696D65030B3O004578656375746554696D65030E3O004578656375746552656D61696E7303093O00436F73745461626C6503083O00436F7374496E666F03043O00436F7374030A3O0054616C656E7452616E6B030D3O007370652O6C5469636B54696D65030E3O0046696C7465725469636B54696D65030C3O00426173655469636B54696D6503083O005469636B54696D65030D3O007370652O6C4475726174696F6E030C3O00426173654475726174696F6E030B3O004D61784475726174696F6E03113O0050616E64656D69635468726573686F6C6403083O007370652O6C4743442O033O0047434403143O007370652O6C50726F6A656374696C6553702O656403153O0046696C74657250726F6A656374696C6553702O6564030A3O0054726176656C54696D65030A3O004973496E466C6967687400793O0012303O00013O00206O000200122O000100013O00202O00010001000300122O000200013O00202O00020002000400202O00033O000500202O00040003000600202O00050003000700202O00063O000800023600075O001022000600090007000236000700013O0010220006000A0007000236000700023O0010220006000B0007000236000700033O0010220006000C0007000236000700043O0010220006000D0007000236000700053O0010220006000E0007000236000700063O0010220006000F0007000236000700073O001022000600100007000236000700083O001022000600110007000236000700093O0010220006001200070002360007000A3O0010220006001300070002360007000B3O0010220006001400070002360007000C3O0010220006001500070002360007000D3O0010220006001600070002360007000E3O0010220006001700070002360007000F3O001022000600180007000236000700103O001022000600190007000236000700113O0010220006001A000700063F00070012000100012O00263O00043O0010220006001B000700063F00070013000100012O00263O00043O0010220006001C000700063F00070014000100012O00263O00023O0010220006001D0007000236000700153O0010220006001E0007000236000700163O0010220006001F0007000236000700173O001022000600200007000236000700183O00102200060021000700063F00070019000100012O00263O00043O00102200060022000700063F0007001A000100012O00263O00043O00102200060023000700063F0007001B000100012O00263O00023O0010220006002400070002360007001C3O0010220006002500070002360007001D3O00102200060026000700063F0007001E000100012O00263O00023O00102200060027000700204900070001002800063F0008001F000100022O00268O00263O00073O00102200060029000800063F00080020000100012O00263O00073O0010220006002A000800063F00080021000100022O00263O00074O00263O00043O0010220006002B00082O003100075O00204900070001002C00063F00080022000100012O00263O00073O0010220006002D000800063F00080023000100012O00263O00073O0010220006002E0008000236000800243O0010220006002F00082O003100075O00204900070001003000063F00080025000100012O00263O00073O0010220006003100082O003100075O00204900070001003200063F00080026000100032O00263O00064O00268O00263O00073O00102200060033000800063F00080027000100022O00263O00074O00263O00053O0010220006003400082O003100075O000236000700283O0010220006003500072O00443O00013O00293O00013O0003073O007370652O6C494401033O00204900013O00012O001E000100024O00443O00017O00013O0003093O007370652O6C5479706501033O00204900013O00012O001E000100024O00443O00017O00013O0003093O007370652O6C4E616D6501033O00204900013O00012O001E000100024O00443O00017O00013O00030C3O006D696E696D756D52616E676501033O00204900013O00012O001E000100024O00443O00017O00013O00030C3O006D6178696D756D52616E676501033O00204900013O00012O001E000100024O00443O00017O00013O0003073O0069734D656C2O6501033O00204900013O00012O001E000100024O00443O00017O00023O00030C3O004765745370652O6C496E666F03023O00494401063O001215000100013O00202O00023O00024O000200036O00018O00019O0000017O00023O00030C3O004765745370652O6C496E666F03043O004E616D6501063O001215000100013O00202O00023O00024O000200036O00018O00019O0000017O00023O0003073O0047657454696D65030C3O006C6173744361737454696D6501063O001238000100016O00010001000200202O00023O00024O0001000100024O000100028O00017O00023O0003073O0047657454696D65030F3O006C617374446973706C617954696D6501063O001238000100016O00010001000200202O00023O00024O0001000100024O000100028O00017O00023O0003073O0047657454696D6503173O006C617374412O706C6965644F6E506C6179657254696D6501063O001238000100016O00010001000200202O00023O00024O0001000100024O000100028O00017O00023O0003073O0047657454696D6503193O006C61737452656D6F76656446726F6D506C6179657254696D6501063O001238000100016O00010001000200202O00023O00024O0001000100024O000100028O00017O00013O00030D3O0064616D616765466F726D756C612O023O0010223O000100012O00443O00017O00023O00030D3O0064616D616765466F726D756C61028O00010A3O00204900013O00010006090001000700013O0004333O0007000100204900013O00012O000100010001000200060B00010008000100010004333O00080001001219000100024O001E000100024O00443O00017O00033O00030C3O0049735370652O6C4B6E6F776E03073O007370652O6C4944030D3O004973506C617965725370652O6C020D3O0006090001000800013O0004333O00080001001203000200013O00204900033O00022O0021000400014O004200020004000200060B0002000B000100010004333O000B0001001203000200033O00204900033O00022O00240002000200022O001E000200024O00443O00017O00023O00030C3O0049735370652O6C4B6E6F776E03073O007370652O6C4944020B3O001203000200013O00204900033O00020006090001000700013O0004333O000700012O0021000400013O00060B00040008000100010004333O000800012O002100046O0037000200044O002900026O00443O00017O00013O0003073O0049734B6E6F776E01053O00201B00013O00014O000300016O000100036O00019O0000017O00023O00030D3O004973557361626C655370652O6C03073O007370652O6C494401053O00122D000100013O00202O00023O00024O000100026O00019O0000017O000A3O0003083O004973557361626C65010003093O00436F73745461626C65028O00026O00F03F2O0103043O007479706503143O007072656469637465645265736F757263654D6170030A3O00637573746F6D436F737403073O006D696E436F737402353O00204300023O00012O002000020002000300263C00020008000100020004333O0008000100263C00030008000100020004333O000800012O002100046O001E000400023O00204300043O00032O002400040002000200060B0004000D000100010004333O000D00012O001D00046O0021000500014O001A000600043O000E2F00040033000100060004333O00330001001219000600053O00263C00050033000100060004333O003300012O001A000700043O00063400060033000100070004333O003300012O00060007000400060020120008000700074O00095O00202O0009000900084O0009000900084O00090001000200202O000A3O000900062O000A002900013O0004333O00290001002049000A3O00092O0006000A000A0008000609000A002900013O0004333O00290001002049000A3O00092O0006000A000A00082O0001000A0001000200060B000A002A000100010004333O002A0001002049000A0007000A00060D000B002D000100010004333O002D0001001219000B00044O0047000A000A000B000611000900310001000A0004333O003100012O002100055O00202B0006000600050004333O001200012O001E000500024O00443O00017O00073O0003093O00436F73745461626C65028O00026O00F03F03043O007479706503143O007072656469637465645265736F757263654D6170030A3O00637573746F6D436F737403073O006D696E436F737402253O00204300023O00012O00240002000200022O001A000300023O000E2F00020022000100030004333O002200010020490003000200030020120004000300044O00055O00202O0005000500054O0005000500044O00050001000200202O00063O000600062O0006001700013O0004333O0017000100204900063O00062O00060006000600040006090006001700013O0004333O0017000100204900063O00062O00060006000600042O000100060001000200060B00060018000100010004333O0018000100204900060003000700060D0007001B000100010004333O001B0001001219000700024O00470006000600070006320005001F000100060004333O001F00012O001400056O0021000500014O001E000500023O0004333O002400012O0021000300014O001E000300024O00443O00017O00043O00030A3O0070657273697374656E74030C3O007370652O6C4C6561726E656403043O005479706503023O004944010E4O002E00015O00202O00010001000100202O00010001000200202O00023O00034O0002000200024O00010001000200202O00023O00044O0002000200024O00010001000200062O0001000C000100010004333O000C00012O002100016O001E000100024O00443O00017O00023O00030D3O004765745370652O6C436F756E7403023O00494401063O001215000100013O00202O00023O00024O000200036O00018O00019O0000017O00023O0003093O0049734C6561726E6564030A3O00432O6F6C646F776E557002093O00204300023O00012O00240002000200020006090002000700013O0004333O0007000100204300023O00022O0026000400014O00420002000400022O001E000200024O00443O00017O00023O00030A3O0049734361737461626C6503093O004973557361626C655001083O00204300013O00012O00240001000200020006090001000600013O0004333O0006000100204300013O00022O00240001000200022O001E000100024O00443O00017O00033O0003083O00496E666F42794944025O00408F40028O00010A3O00204300013O00012O00200001000200040006090004000700013O0004333O0007000100200500050004000200060B00050008000100010004333O00080001001219000500034O001E000500024O00443O00017O00023O0003083O004361737454696D652O033O00474344010C3O00202500013O00014O0001000200024O00025O00202O0002000200024O00020002000200062O00020009000100010004333O0009000100060D0003000A000100010004333O000A00012O0026000300024O001E000300024O00443O00017O00043O0003093O00497343617374696E67028O00030B3O004361737452656D61696E73030A3O0047434452656D61696E7301154O003E00015O00202O0001000100014O00038O00010003000200062O00010008000100010004333O00080001001219000100024O001E000100024O003900015O0020250001000100034O0001000200024O00025O00202O0002000200044O00020002000200062O00020012000100010004333O0012000100060D00030013000100010004333O001300012O0026000300024O001E000300024O00443O00017O00043O0003073O007370652O6C494403093O007370652O6C496E666F03093O00636F73745461626C6503113O004765745370652O6C506F776572436F737401153O00200400013O00014O00025O00202O0002000200024O00020002000100062O0002000B000100010004333O000B00012O001D00036O0026000200034O003900035O0020490003000300022O000A00030001000200204900030002000300060B00030013000100010004333O00130001001203000400044O0026000500014O00240004000200022O0026000300043O0010220002000300032O001E000300024O00443O00017O00093O0003043O007479706503063O00737472696E6703053O00652O726F7203113O00496E76616C6964206B657920747970652E03093O00436F73745461626C65026O00F03F026O001040027O0040026O000840032C3O0006090002000700013O0004333O00070001001203000300014O0026000400024O00240003000200020026100003000A000100020004333O000A0001001203000300033O001219000400044O002300030002000100204300033O00052O002400030002000200060B0001001D000100010004333O001D00010006090003001D00013O0004333O001D00012O001A000400033O000E2F0006001D000100040004333O001D000100204900040003000600204900040004000100263C0004001D000100070004333O001D000100204900040003000800204900040004000100263C0004001D000100090004333O001D0001001219000100083O0004333O0020000100060B00010020000100010004333O00200001001219000100063O0006090003002900013O0004333O002900012O00060004000300010006090004002900013O0004333O002900012O00060004000300012O000600040004000200060B0004002A000100010004333O002A00012O000E000400044O001E000400024O00443O00017O00033O0003083O00436F7374496E666F03043O00636F7374028O0002093O00203D00023O00014O000400013O00122O000500026O00020005000200062O00030007000100020004333O00070001001219000300034O001E000300024O00443O00017O00043O00030A3O0070657273697374656E7403073O0074616C656E747303073O007370652O6C4944028O00010A4O002A00015O00202O00010001000100202O00010001000200202O00023O00034O00010001000200062O00010008000100010004333O00080001001219000100044O001E000100024O00443O00017O00053O0003053O00706169727303143O00636C612O73657353706563734279537065634944026O00F03F03023O00494400021A4O004600025O00122O000300016O00045O00202O0004000400024O00040004000100202O0004000400034O00030002000500044O00160001001203000800014O0026000900074O002000080002000A0004333O00140001002043000D000C00042O002C000D000200024O000E00016O000E000E000D00202O000E000E000300262O000E0014000100050004333O001400012O000A0002000D000E0006270008000C000100020004333O000C000100062700030008000100020004333O000800012O003A000200014O00443O00017O00043O0003023O004944028O00026O00F03F025O00408F40010E4O001700015O00202O00023O00014O0002000200024O00010001000200062O0001000800013O0004333O0008000100263C0001000A000100020004333O000A0001001219000200024O001E000200023O0020490002000100030020050002000200042O001E000200024O00443O00017O00053O00030C3O00426173655469636B54696D65028O0003023O004944027O0040030A3O005370652O6C486173746501163O00204300013O00012O00240001000200020006090001000600013O0004333O0006000100263C00010008000100020004333O00080001001219000200024O001E000200024O003900025O00200C00033O00034O0003000200024O00020002000300202O00020002000400062O0002001400013O0004333O001400012O0039000300013O0020430003000300052O00240003000200022O00280003000100032O001E000300024O001E000100024O00443O00017O00043O0003023O004944028O00026O00F03F025O00408F40010E4O001700015O00202O00023O00014O0002000200024O00010001000200062O0001000800013O0004333O0008000100263C0001000A000100020004333O000A0001001219000200024O001E000200023O0020490002000100030020050002000200042O001E000200024O00443O00017O00043O0003073O007370652O6C4944028O00027O0040025O00408F40010D4O003900015O00204900023O00012O00060001000100020006090001000700013O0004333O0007000100263C00010009000100020004333O00090001001219000200024O001E000200023O0020490002000100030020050002000200042O001E000200024O00443O00017O00033O00030C3O00426173654475726174696F6E028O00026O33D33F010B3O00204300013O00012O00240001000200020006090001000600013O0004333O0006000100263C00010008000100020004333O00080001001219000200024O001E000200023O0020160002000100032O001E000200024O00443O00017O00033O0003073O007370652O6C4944028O00025O00408F40010C4O003900015O00204900023O00012O00060001000100020006090001000700013O0004333O0007000100263C00010009000100020004333O00090001001219000200024O001E000200023O0020050002000100032O001E000200024O00443O00017O00053O0003053O00706169727303143O00636C612O73657353706563734279537065634944026O00F03F03023O00494400021B4O000800025O00122O000300016O00048O000500013O00202O0005000500024O00050005000100202O0005000500034O0004000400054O00030002000500044O00170001001203000800014O0026000900074O002000080002000A0004333O00150001002043000D000C00042O0024000D000200022O0039000E00024O0006000E000E000D002610000E0015000100050004333O001500012O000A0002000D000E0006270008000E000100020004333O000E00010006270003000A000100020004333O000A00012O003A000200024O00443O00017O00043O0003023O004944028O00030B3O004D617844697374616E6365026O003640021D3O00201C00023O00014O0002000200024O00038O00030003000200062O0003000800013O0004333O0008000100263C0003000A000100020004333O000A0001001219000400024O001E000400023O0006090001001000013O0004333O001000010020430004000100032O002400040002000200060B00040013000100010004333O001300012O0039000400013O0020430004000400032O002400040002000200060B00040017000100010004333O00170001001219000500024O001E000500023O00060D0005001A000100030004333O001A0001001219000500044O00070005000400052O001E000500024O00443O00017O00023O0003073O0047657454696D65030B3O006C61737448697454696D6501093O001203000100014O000100010001000200204900023O000200063200010006000100020004333O000600012O001400016O0021000100014O001E000100024O00443O00017O00",v9(),...);