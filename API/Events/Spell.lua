local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=32) then if (v86<=15) then if (v86<=7) then if (v86<=3) then if (v86<=1) then if (v86==0) then local v114;local v115;local v116;v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v58[v85[3]]=v83[v85[2]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v58[v85[3]]=v83[v85[2]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v58[v85[3]]=v83[v85[2]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v115={v83[v116](v83[v116 + 1 ])};v114=0;for v494=v116,v85[4] do v114=v114 + 1 ;v83[v494]=v115[v114];end v77=v77 + 1 ;v85=v73[v77];v77=v85[3];else local v124;local v125;local v126;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]= #v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v126=v85[2];v125=v83[v126];v124=v83[v126 + 2 ];if (v124>0) then if (v125>v83[v126 + 1 ]) then v77=v85[3];else v83[v126 + 3 ]=v125;end elseif (v125<v83[v126 + 1 ]) then v77=v85[3];else v83[v126 + 3 ]=v125;end end elseif (v86>2) then local v135;local v136;local v137;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]= #v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v137=v85[2];v136=v83[v137];v135=v83[v137 + 2 ];if (v135>0) then if (v136>v83[v137 + 1 ]) then v77=v85[3];else v83[v137 + 3 ]=v136;end elseif (v136<v83[v137 + 1 ]) then v77=v85[3];else v83[v137 + 3 ]=v136;end else local v146=v85[2];v83[v146](v83[v146 + 1 ]);end elseif (v86<=5) then if (v86==4) then v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86>6) then local v155;local v156;local v157;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]= #v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v157=v85[2];v156=v83[v157];v155=v83[v157 + 2 ];if (v155>0) then if (v156>v83[v157 + 1 ]) then v77=v85[3];else v83[v157 + 3 ]=v156;end elseif (v156<v83[v157 + 1 ]) then v77=v85[3];else v83[v157 + 3 ]=v156;end else v83[v85[2]]=v83[v85[3]] + v83[v85[4]] ;end elseif (v86<=11) then if (v86<=9) then if (v86==8) then v83[v85[2]]={};elseif v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86>10) then v83[v85[2]]=v83[v85[3]];else local v169=v85[2];local v170=v83[v169];local v171=v83[v169 + 2 ];if (v171>0) then if (v170>v83[v169 + 1 ]) then v77=v85[3];else v83[v169 + 3 ]=v170;end elseif (v170<v83[v169 + 1 ]) then v77=v85[3];else v83[v169 + 3 ]=v170;end end elseif (v86<=13) then if (v86==12) then local v172=v85[2];local v173=v85[4];local v174=v172 + 2 ;local v175={v83[v172](v83[v172 + 1 ],v83[v174])};for v497=1,v173 do v83[v174 + v497 ]=v175[v497];end local v176=v175[1];if v176 then v83[v174]=v176;v77=v85[3];else v77=v77 + 1 ;end else local v177;local v178;v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v178=v85[2];v177=v83[v85[3]];v83[v178 + 1 ]=v177;v83[v178]=v177[v85[4]];v77=v77 + 1 ;v85=v73[v77];v178=v85[2];v83[v178]=v83[v178](v83[v178 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v83[v85[3]]]=v83[v85[4]];end elseif (v86>14) then local v189;local v190;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v190=v85[2];v83[v190]=v83[v190]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v190=v85[2];v83[v190]=v83[v190]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v190=v85[2];v189=v83[v85[3]];v83[v190 + 1 ]=v189;v83[v190]=v189[v85[4]];v77=v77 + 1 ;v85=v73[v77];v190=v85[2];v83[v190]=v83[v190](v83[v190 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] + v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];elseif (v83[v85[2]]~=v85[4]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86<=23) then if (v86<=19) then if (v86<=17) then if (v86>16) then local v201;local v202;local v203;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]= #v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v203=v85[2];v202=v83[v203];v201=v83[v203 + 2 ];if (v201>0) then if (v202>v83[v203 + 1 ]) then v77=v85[3];else v83[v203 + 3 ]=v202;end elseif (v202<v83[v203 + 1 ]) then v77=v85[3];else v83[v203 + 3 ]=v202;end else local v211;local v212;local v213;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]= #v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v213=v85[2];v212=v83[v213];v211=v83[v213 + 2 ];if (v211>0) then if (v212>v83[v213 + 1 ]) then v77=v85[3];else v83[v213 + 3 ]=v212;end elseif (v212<v83[v213 + 1 ]) then v77=v85[3];else v83[v213 + 3 ]=v212;end end elseif (v86==18) then v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v58[v85[3]]=v83[v85[2]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v225;local v226;local v227;local v228;v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v58[v85[3]]=v83[v85[2]];v77=v77 + 1 ;v85=v73[v77];v228=v85[2];v227=v83[v85[3]];v83[v228 + 1 ]=v227;v83[v228]=v227[v85[4]];v77=v77 + 1 ;v85=v73[v77];v228=v85[2];v83[v228]=v83[v228](v83[v228 + 1 ]);v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v228=v85[2];v226={v83[v228](v83[v228 + 1 ])};v225=0;for v500=v228,v85[4] do v225=v225 + 1 ;v83[v500]=v226[v225];end v77=v77 + 1 ;v85=v73[v77];v77=v85[3];end elseif (v86<=21) then if (v86>20) then v83[v85[2]]=v83[v85[3]][v83[v85[4]]];else local v240=v85[2];local v241=v83[v240 + 2 ];local v242=v83[v240] + v241 ;v83[v240]=v242;if (v241>0) then if (v242<=v83[v240 + 1 ]) then v77=v85[3];v83[v240 + 3 ]=v242;end elseif (v242>=v83[v240 + 1 ]) then v77=v85[3];v83[v240 + 3 ]=v242;end end elseif (v86>22) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=27) then if (v86<=25) then if (v86==24) then local v248;local v249;local v250;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]= #v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v250=v85[2];v249=v83[v250];v248=v83[v250 + 2 ];if (v248>0) then if (v249>v83[v250 + 1 ]) then v77=v85[3];else v83[v250 + 3 ]=v249;end elseif (v249<v83[v250 + 1 ]) then v77=v85[3];else v83[v250 + 3 ]=v249;end else local v259=v85[2];local v260=v83[v85[3]];v83[v259 + 1 ]=v260;v83[v259]=v260[v85[4]];end elseif (v86==26) then v83[v85[2]]=v85[3];else local v266;local v267;local v268;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v268=v85[2];v267={v83[v268](v83[v268 + 1 ])};v266=0;for v503=v268,v85[4] do v266=v266 + 1 ;v83[v503]=v267[v266];end v77=v77 + 1 ;v85=v73[v77];v77=v85[3];end elseif (v86<=29) then if (v86>28) then v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v58[v85[3]]=v83[v85[2]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else v77=v85[3];end elseif (v86<=30) then local v281;local v282;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v282=v85[2];v83[v282]=v83[v282]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v282=v85[2];v83[v282]=v83[v282]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v282=v85[2];v281=v83[v85[3]];v83[v282 + 1 ]=v281;v83[v282]=v281[v85[4]];v77=v77 + 1 ;v85=v73[v77];v282=v85[2];v83[v282]=v83[v282](v83[v282 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] + v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];elseif (v86>31) then v83[v85[2]][v83[v85[3]]]=v83[v85[4]];else v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v58[v85[3]]=v83[v85[2]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=49) then if (v86<=40) then if (v86<=36) then if (v86<=34) then if (v86>33) then v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v297;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v297=v85[2];v83[v297](v13(v83,v297 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86==35) then local v304;local v305;local v306;local v307;local v308;local v309;local v310;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v310=v85[2];v83[v310](v13(v83,v310 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v310=v85[2];v309={};for v506=1, #v82 do v308=v82[v506];for v577=0, #v308 do v307=v308[v577];v306=v307[1];v305=v307[2];if ((v306==v83) and (v305>=v310)) then v309[v305]=v306[v305];v307[1]=v309;end end end v77=v77 + 1 ;v85=v73[v77];for v508=v85[2],v85[3] do v83[v508]=nil;end v77=v77 + 1 ;v85=v73[v77];v310=v85[2];v304=v83[v85[3]];v83[v310 + 1 ]=v304;v83[v310]=v304[v85[4]];else local v319;local v320;local v321;v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]= #v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v321=v85[2];v320=v83[v321];v319=v83[v321 + 2 ];if (v319>0) then if (v320>v83[v321 + 1 ]) then v77=v85[3];else v83[v321 + 3 ]=v320;end elseif (v320<v83[v321 + 1 ]) then v77=v85[3];else v83[v321 + 3 ]=v320;end end elseif (v86<=38) then if (v86==37) then local v331=v85[2];local v332={v83[v331](v83[v331 + 1 ])};local v333=0;for v510=v331,v85[4] do v333=v333 + 1 ;v83[v510]=v332[v333];end else v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v83[v85[3]]]=v83[v85[4]];end elseif (v86==39) then local v340;local v341;local v342;v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v342=v85[2];v83[v342](v13(v83,v342 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v83[v85[3]]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v342=v85[2];v341={v83[v342](v83[v342 + 1 ])};v340=0;for v513=v342,v85[4] do v340=v340 + 1 ;v83[v513]=v341[v340];end v77=v77 + 1 ;v85=v73[v77];v77=v85[3];else if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};end elseif (v86<=44) then if (v86<=42) then if (v86==41) then v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v359;local v360;local v361;local v362;local v363;local v364;local v365;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v365=v85[2];v83[v365](v13(v83,v365 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v365=v85[2];v364={};for v516=1, #v82 do v363=v82[v516];for v591=0, #v363 do v362=v363[v591];v361=v362[1];v360=v362[2];if ((v361==v83) and (v360>=v365)) then v364[v360]=v361[v360];v362[1]=v364;end end end v77=v77 + 1 ;v85=v73[v77];for v518=v85[2],v85[3] do v83[v518]=nil;end v77=v77 + 1 ;v85=v73[v77];v365=v85[2];v359=v83[v85[3]];v83[v365 + 1 ]=v359;v83[v365]=v359[v85[4]];end elseif (v86>43) then v83[v85[2]][v85[3]]=v83[v85[4]];else local v376;local v377;local v378;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]= #v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v378=v85[2];v377=v83[v378];v376=v83[v378 + 2 ];if (v376>0) then if (v377>v83[v378 + 1 ]) then v77=v85[3];else v83[v378 + 3 ]=v377;end elseif (v377<v83[v378 + 1 ]) then v77=v85[3];else v83[v378 + 3 ]=v377;end end elseif (v86<=46) then if (v86==45) then local v387;local v388;local v389;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]= #v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v389=v85[2];v388=v83[v389];v387=v83[v389 + 2 ];if (v387>0) then if (v388>v83[v389 + 1 ]) then v77=v85[3];else v83[v389 + 3 ]=v388;end elseif (v388<v83[v389 + 1 ]) then v77=v85[3];else v83[v389 + 3 ]=v388;end else local v397;local v398;v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];for v520=v85[2],v85[3] do v83[v520]=nil;end v77=v77 + 1 ;v85=v73[v77];v398=v85[2];v397=v83[v85[3]];v83[v398 + 1 ]=v397;v83[v398]=v397[v85[4]];end elseif (v86<=47) then local v408=v74[v85[3]];local v409;local v410={};v409=v10({},{__index=function(v522,v523)local v524=v410[v523];return v524[1][v524[2]];end,__newindex=function(v525,v526,v527)local v528=v410[v526];v528[1][v528[2]]=v527;end});for v530=1,v85[4] do v77=v77 + 1 ;local v531=v73[v77];if (v531[1]==11) then v410[v530-1 ]={v83,v531[3]};else v410[v530-1 ]={v58,v531[3]};end v82[ #v82 + 1 ]=v410;end v83[v85[2]]=v29(v408,v409,v59);elseif (v86>48) then v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v83[v85[3]]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];do return;end else v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v58[v85[3]]=v83[v85[2]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=57) then if (v86<=53) then if (v86<=51) then if (v86==50) then local v412;local v413;local v414;local v415;local v416;local v417;local v418;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v418=v85[2];v83[v418](v13(v83,v418 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v418=v85[2];v417={};for v533=1, #v82 do v416=v82[v533];for v605=0, #v416 do v415=v416[v605];v414=v415[1];v413=v415[2];if ((v414==v83) and (v413>=v418)) then v417[v413]=v414[v413];v415[1]=v417;end end end v77=v77 + 1 ;v85=v73[v77];for v535=v85[2],v85[3] do v83[v535]=nil;end v77=v77 + 1 ;v85=v73[v77];v418=v85[2];v412=v83[v85[3]];v83[v418 + 1 ]=v412;v83[v418]=v412[v85[4]];else local v427=v85[2];v83[v427]=v83[v427](v83[v427 + 1 ]);end elseif (v86==52) then local v429;local v430;local v431;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]= #v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v431=v85[2];v430=v83[v431];v429=v83[v431 + 2 ];if (v429>0) then if (v430>v83[v431 + 1 ]) then v77=v85[3];else v83[v431 + 3 ]=v430;end elseif (v430<v83[v431 + 1 ]) then v77=v85[3];else v83[v431 + 3 ]=v430;end else do return;end end elseif (v86<=55) then if (v86>54) then local v440;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v440=v85[2];v83[v440](v13(v83,v440 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];do return;end else local v446;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v446=v85[2];v83[v446]=v83[v446](v83[v446 + 1 ]);v77=v77 + 1 ;v85=v73[v77];if (v83[v85[2]]~=v85[4]) then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86>56) then local v453;local v454;v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v454=v85[2];v453=v83[v85[3]];v83[v454 + 1 ]=v453;v83[v454]=v453[v85[4]];v77=v77 + 1 ;v85=v73[v77];v454=v85[2];v83[v454]=v83[v454](v83[v454 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v454=v85[2];v83[v454](v13(v83,v454 + 1 ,v85[3]));else v83[v85[2]]= #v83[v85[3]];end elseif (v86<=61) then if (v86<=59) then if (v86>58) then v83[v85[2]]=v58[v85[3]];else v83[v85[2]]=v83[v85[3]][v85[4]];end elseif (v86==60) then local v470=v85[2];v83[v470](v13(v83,v470 + 1 ,v85[3]));else local v471;v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v471=v85[2];v83[v471](v13(v83,v471 + 1 ,v85[3]));end elseif (v86<=63) then if (v86==62) then local v479;local v480;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v480=v85[2];v479=v83[v85[3]];v83[v480 + 1 ]=v479;v83[v480]=v479[v85[4]];v77=v77 + 1 ;v85=v73[v77];v480=v85[2];v83[v480]=v83[v480](v83[v480 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v480=v85[2];v83[v480]=v83[v480](v83[v480 + 1 ]);v77=v77 + 1 ;v85=v73[v77];if (v83[v85[2]]~=v85[4]) then v77=v77 + 1 ;else v77=v85[3];end else v58[v85[3]]=v83[v85[2]];end elseif (v86<=64) then local v492=v85[2];v83[v492]=v83[v492]();elseif (v86==65) then local v614=v85[2];local v615={};for v618=1, #v82 do local v619=v82[v618];for v681=0, #v619 do local v682=v619[v681];local v683=v682[1];local v684=v682[2];if ((v683==v83) and (v684>=v614)) then v615[v684]=v683[v684];v682[1]=v615;end end end else for v620=v85[2],v85[3] do v83[v620]=nil;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!163O0003023O0057522O033O0061706903053O007574696C7303043O00756E697403063O00706C6179657203053O007370652O6C030A3O006D756C74695370652O6C03093O0077686974656C69737403093O00626C61636B6C697374031A3O005265676973746572466F7253656C66436F6D6261744576656E7403123O005350452O4C5F434153545F53552O43452O5303193O005265676973746572466F72506574436F6D6261744576656E7403123O005350452O4C5F415552415F412O504C49454403123O005350452O4C5F415552415F52454D4F564544031A3O0052656769737465724C697374656E65644974656D5370652O6C7303163O0052656769737465724C697374656E65645370652O6C7303133O00412O64546F4C697374656E65645370652O6C7303183O0052656D6F766546726F6D4C697374656E65645370652O6C7303103O00412O64546F4D756C74695370652O6C7303103O005265676973746572466F724576656E74030C3O00504C415945525F4C4F47494E030E3O005350452O4C535F4348414E47454400523O0012283O00013O00206O000200122O000100013O00202O00010001000300202O00023O000400202O00030002000500202O00043O000600202O00053O00074O00068O00076O000800086O002E00098O000A3O00024O000B5O00102O000A0008000B4O000B5O00102O000A0009000B4O000B8O000C000C3O00202O000D3O000A00062F000F3O000100052O000B3O00064O000B3O00074O000B3O000C4O000B3O00084O000B3O00093O0012230010000B6O000D001000014O000C8O000C000C3O00202O000D3O000C00062F000F0001000100032O000B3O00064O000B3O00074O000B3O000C3O0012230010000B6O000D001000014O000C8O000C000C3O00202O000D3O000A00062F000F0002000100032O000B3O00064O000B3O00074O000B3O000C3O0012230010000D6O000D001000014O000C8O000C000C3O00202O000D3O000A00062F000F0003000100032O000B3O00064O000B3O00074O000B3O000C3O00121A0010000E4O003C000D001000012O0041000C5O00062F000C0004000100012O000B3O00083O00102C0003000F000C00062F000C0005000100052O000B3O00064O000B3O00074O000B3O00094O000B8O000B3O000A3O00102C00030010000C00062F000C0006000100012O000B3O000A3O00102C00040011000C00062F000C0007000100012O000B3O000A3O00102C00040012000C00062F000C0008000100012O000B3O000B3O00102C00050013000C002019000C3O001400062F000E0009000100012O000B3O000B3O00121A000F00153O00121A001000164O003C000C001000012O00353O00013O000A3O00053O00026O00F03F030C3O006C6173744361737454696D6503073O0047657454696D65030B3O006C61737448697454696D65030A3O0054726176656C54696D650C423O001207000C00016O000D8O000D000D3O00122O000E00013O00042O000C002D00012O003B001000014O002900118O00110011000F4O0010001000114O00100010000B00062O0010002C00013O00041C3O002C000100121A001000014O0034001100016O00128O00120012000F4O0011001100124O00110011000B4O001100113O00122O001200013O00042O0010002C00012O003B001400014O003000158O00150015000F4O0014001400154O00140014000B4O0014001400134O001400026O001400023O00062O0014002B00013O00041C3O002B00012O003B001400023O00120F001500036O00150001000200102O0014000200154O001400023O00122O001500036O0015000100024O001600023O00202O0016001600054O0016000200024O00150015001600102O001400040015000414001000150001000414000C000500012O003B000C00034O0015000C000C000B2O003F000C00024O003B000C00023O000609000C003700013O00041C3O003700012O003B000C00023O001217000D00034O0040000D0001000200102C000C0002000D2O003B000C00044O0015000C000C000B2O003F000C00024O003B000C00023O000609000C004100013O00041C3O004100012O003B000C00023O001217000D00034O0040000D0001000200102C000C0002000D2O00353O00017O00053O00026O00F03F030C3O006C6173744361737454696D6503073O0047657454696D65030B3O006C61737448697454696D65030A3O0054726176656C54696D650C2E3O001207000C00016O000D8O000D000D3O00122O000E00013O00042O000C002D00012O003B001000014O002900118O00110011000F4O0010001000114O00100010000B00062O0010002C00013O00041C3O002C000100121A001000014O0034001100016O00128O00120012000F4O0011001100124O00110011000B4O001100113O00122O001200013O00042O0010002C00012O003B001400014O003000158O00150015000F4O0014001400154O00140014000B4O0014001400134O001400026O001400023O00062O0014002B00013O00041C3O002B00012O003B001400023O00120F001500036O00150001000200102O0014000200154O001400023O00122O001500036O0015000100024O001600023O00202O0016001600054O0016000200024O00150015001600102O001400040015000414001000150001000414000C000500012O00353O00017O00033O00026O00F03F03173O006C617374412O706C6965644F6E506C6179657254696D6503073O0047657454696D650C263O001207000C00016O000D8O000D000D3O00122O000E00013O00042O000C002500012O003B001000014O002900118O00110011000F4O0010001000114O00100010000B00062O0010002400013O00041C3O0024000100121A001000014O0034001100016O00128O00120012000F4O0011001100124O00110011000B4O001100113O00122O001200013O00042O0010002400012O003B001400014O003000158O00150015000F4O0014001400154O00140014000B4O0014001400134O001400026O001400023O00062O0014002300013O00041C3O002300012O003B001400023O001217001500034O004000150001000200102C001400020015000414001000150001000414000C000500012O00353O00017O00033O00026O00F03F03193O006C61737452656D6F76656446726F6D506C6179657254696D6503073O0047657454696D650C263O001207000C00016O000D8O000D000D3O00122O000E00013O00042O000C002500012O003B001000014O002900118O00110011000F4O0010001000114O00100010000B00062O0010002400013O00041C3O0024000100121A001000014O0034001100016O00128O00120012000F4O0011001100124O00110011000B4O001100113O00122O001200013O00042O0010002400012O003B001400014O003000158O00150015000F4O0014001400154O00140014000B4O0014001400134O001400026O001400023O00062O0014002300013O00041C3O002300012O003B001400023O001217001500034O004000150001000200102C001400020015000414001000150001000414000C000500012O00353O00017O00043O00030D3O004765744F6E5573654974656D7303063O00697061697273030A3O004F6E5573655370652O6C03023O00494401134O001300018O00015O00202O00013O00014O00010002000200122O000200026O000300016O00020002000400044O001000010020190007000600032O00330007000200020006090007001000013O00041C3O001000012O003B00085O0020190009000700042O00330009000200022O002000080009000700060C000200080001000200041C3O000800012O00353O00017O000C3O0003143O00636C612O73657353706563734279537065634944026O00F03F03053O00706169727303053O007370652O6C03053O007461626C6503063O00696E7365727403043O007479706503023O00494403093O0077686974656C69737403093O00626C61636B6C69737403043O006974656D030A3O004F6E5573655370652O6C02946O00028O00028O00028O000200016O00028O000200026O000200033O00202O0002000200014O00020002000100202O00020002000200122O000300036O000400033O00202O0004000400044O0004000400024O00030002000500044O00360001001217000800053O0020270008000800064O00098O000A00066O0008000A00014O000800016O00098O00080006000900122O000800036O000900076O00080002000A00044O00340001001217000D00074O003E000E00016O000E000E000600202O000F000C00084O000F000200024O000E000E000F4O000D0002000200262O000D002B0001000500041C3O002B00012O003B000D00014O000D000D000D000600202O000E000C00084O000E000200024O000F8O000D000E000F001217000D00053O002039000D000D00064O000E00016O000E000E000600202O000F000C00084O000F000200024O000E000E000F4O000F000C6O000D000F000100060C0008001C0001000200041C3O001C000100060C000300100001000200041C3O00100001001217000300034O003B000400043O00203A0004000400092O002500030002000500041C3O005B000100121A000800024O003B00096O0038000900093O00121A000A00023O00040A0008005B0001001217000C00074O0036000D00016O000E8O000E000E000B4O000D000D000E4O000D000D00064O000C0002000200262O000C00510001000500041C3O005100012O003B000C00014O0026000D8O000D000D000B4O000C000C000D4O000D8O000C0006000D001217000C00053O00203D000C000C00064O000D00016O000E8O000E000E000B4O000D000D000E4O000D000D00064O000E00076O000C000E000100041400080042000100060C0003003D0001000200041C3O003D000100121A000300024O0003000400043O00202O00040004000A4O000400043O00122O000500023O00042O0003007800012O003B000700043O00202400070007000A4O00070007000600122O000800026O00098O000900093O00122O000A00023O00042O0008007700012O003B000C6O0016000C000C000B4O000D00016O000D000D000C4O000D000D000700062O000D007600013O00041C3O007600012O003B000D00014O0015000D000D000C2O0008000E6O0020000D0007000E0004140008006B00010004140003006300012O003B000300033O00203A00030003000B2O00150003000300020006090003009300013O00041C3O00930001001217000300034O001B000400033O00202O00040004000B4O0004000400024O00030002000500044O00910001001217000800034O000B000900074O002500080002000A00041C3O008F0001002019000D000C000C2O0033000D00020002000609000D008F00013O00041C3O008F00012O003B000E00023O002019000F000D00082O0033000F000200022O0020000E000F000D00060C000800870001000200041C3O0087000100060C000300830001000200041C3O008300012O00353O00017O00023O0003093O0077686974656C69737403073O007370652O6C494401054O003100015O00202O00010001000100202O00023O00024O000100028O00017O00043O0003053O007461626C6503063O00696E7365727403093O00626C61636B6C69737403073O007370652O6C494401073O001237000100013O00202O0001000100024O00025O00202O00020002000300202O00033O00044O0001000300016O00017O00023O0003053O007461626C6503063O00696E7365727401063O001221000100013O00202O0001000100024O00028O00038O0001000300016O00017O00023O0003053O00706169727303063O0055706461746502093O001217000200014O003B00036O002500020002000400041C3O000600010020190007000600022O000200070002000100060C000200040001000200041C3O000400012O00353O00017O00",v9(),...);