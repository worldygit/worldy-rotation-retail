local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=35) then if (v86<=17) then if (v86<=8) then if (v86<=3) then if (v86<=1) then if (v86>0) then if (v83[v85[2]]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end else local v114=v85[2];local v115=v85[4];local v116=v114 + 2 ;local v117={v83[v114](v83[v114 + 1 ],v83[v116])};for v301=1,v115 do v83[v116 + v301 ]=v117[v301];end local v118=v117[1];if v118 then v83[v116]=v118;v77=v85[3];else v77=v77 + 1 ;end end elseif (v86==2) then local v119=v85[2];local v120,v121=v76(v83[v119](v13(v83,v119 + 1 ,v85[3])));v78=(v121 + v119) -1 ;local v122=0;for v304=v119,v78 do v122=v122 + 1 ;v83[v304]=v120[v122];end else local v123=v85[3];local v124=v83[v123];for v307=v123 + 1 ,v85[4] do v124=v124   .. v83[v307] ;end v83[v85[2]]=v124;end elseif (v86<=5) then if (v86==4) then local v126;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v126=v85[2];v83[v126]=v83[v126](v83[v126 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v126=v85[2];v83[v126]=v83[v126](v83[v126 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v126=v85[2];v83[v126]=v83[v126](v13(v83,v126 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v135;local v136;v136=v85[2];v135=v83[v85[3]];v83[v136 + 1 ]=v135;v83[v136]=v135[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3]~=0 ;v77=v77 + 1 ;v85=v73[v77];v136=v85[2];v83[v136]=v83[v136](v13(v83,v136 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=6) then local v147;local v148;local v149;v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]= #v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v149=v85[2];v148=v83[v149];v147=v83[v149 + 2 ];if (v147>0) then if (v148>v83[v149 + 1 ]) then v77=v85[3];else v83[v149 + 3 ]=v148;end elseif (v148<v83[v149 + 1 ]) then v77=v85[3];else v83[v149 + 3 ]=v148;end elseif (v86>7) then do return;end else local v356;local v357;v83[v85[2]]=v85[3]~=0 ;v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v357=v85[2];v356=v83[v85[3]];v83[v357 + 1 ]=v356;v83[v357]=v356[v85[4]];v77=v77 + 1 ;v85=v73[v77];v356=v83[v85[4]];if  not v356 then v77=v77 + 1 ;else v83[v85[2]]=v356;v77=v85[3];end end elseif (v86<=12) then if (v86<=10) then if (v86==9) then local v157=v85[2];v83[v157](v83[v157 + 1 ]);elseif (v83[v85[2]]>v83[v85[4]]) then v77=v77 + 1 ;else v77=v77 + v85[3] ;end elseif (v86>11) then v83[v85[2]]=v58[v85[3]];else local v160=v85[2];do return v83[v160](v13(v83,v160 + 1 ,v78));end end elseif (v86<=14) then if (v86==13) then v83[v85[2]]=v83[v85[3]];else v83[v85[2]]={};end elseif (v86<=15) then v83[v85[2]][v83[v85[3]]]=v83[v85[4]];elseif (v86>16) then local v367;local v368,v369;local v370;local v371;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v371=v85[2];v370=v83[v85[3]];v83[v371 + 1 ]=v370;v83[v371]=v370[v85[4]];v77=v77 + 1 ;v85=v73[v77];v371=v85[2];v83[v371]=v83[v371](v83[v371 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v371=v85[2];v370=v83[v85[3]];v83[v371 + 1 ]=v370;v83[v371]=v370[v85[4]];v77=v77 + 1 ;v85=v73[v77];v371=v85[2];v368,v369=v76(v83[v371](v83[v371 + 1 ]));v78=(v369 + v371) -1 ;v367=0;for v437=v371,v78 do v367=v367 + 1 ;v83[v437]=v368[v367];end v77=v77 + 1 ;v85=v73[v77];v371=v85[2];v83[v371]=v83[v371](v13(v83,v371 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v85[2]<=v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86<=26) then if (v86<=21) then if (v86<=19) then if (v86>18) then if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v166=v85[2];local v167={v83[v166](v13(v83,v166 + 1 ,v85[3]))};local v168=0;for v308=v166,v85[4] do v168=v168 + 1 ;v83[v308]=v167[v168];end end elseif (v86>20) then local v169=v85[2];local v170,v171=v76(v83[v169](v83[v169 + 1 ]));v78=(v171 + v169) -1 ;local v172=0;for v311=v169,v78 do v172=v172 + 1 ;v83[v311]=v170[v172];end else local v173=v85[2];local v174={v83[v173](v13(v83,v173 + 1 ,v78))};local v175=0;for v314=v173,v85[4] do v175=v175 + 1 ;v83[v314]=v174[v175];end end elseif (v86<=23) then if (v86==22) then local v176=v85[2];v83[v176]=v83[v176](v83[v176 + 1 ]);else local v178;v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v178=v85[2];v83[v178]=v83[v178](v13(v83,v178 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]]/v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] * v85[4] ;v77=v77 + 1 ;v85=v73[v77];if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=24) then local v185;local v186;local v187;v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v187=v85[2];v186=v83[v187];v185=v85[3];for v317=1,v185 do v186[v317]=v83[v187 + v317 ];end elseif (v86==25) then local v380;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v380=v85[2];do return v83[v380](v13(v83,v380 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v380=v85[2];do return v13(v83,v380,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end else v83[v85[2]]= #v83[v85[3]];end elseif (v86<=30) then if (v86<=28) then if (v86>27) then v83[v85[2]]=v85[3]~=0 ;else local v196;local v197,v198;local v199;local v200;v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v200=v85[2];v199=v83[v85[3]];v83[v200 + 1 ]=v199;v83[v200]=v199[v85[4]];v77=v77 + 1 ;v85=v73[v77];v200=v85[2];v197,v198=v76(v83[v200](v83[v200 + 1 ]));v78=(v198 + v200) -1 ;v196=0;for v320=v200,v78 do v196=v196 + 1 ;v83[v320]=v197[v196];end v77=v77 + 1 ;v85=v73[v77];v200=v85[2];do return v83[v200](v13(v83,v200 + 1 ,v78));end v77=v77 + 1 ;v85=v73[v77];v200=v85[2];do return v13(v83,v200,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86>29) then if (v83[v85[2]]<=v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]]=v83[v85[3]][v85[4]];end elseif (v86<=32) then if (v86==31) then local v210;local v211;local v212;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v212=v85[3];v211=v83[v212];for v323=v212 + 1 ,v85[4] do v211=v211   .. v83[v323] ;end v83[v85[2]]=v211;v77=v77 + 1 ;v85=v73[v77];v210=v85[2];do return v83[v210](v13(v83,v210 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v210=v85[2];do return v13(v83,v210,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end else v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v85[3]]=v85[4];end elseif (v86<=33) then local v225=v85[2];v83[v225]=v83[v225](v13(v83,v225 + 1 ,v85[3]));elseif (v86>34) then if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v387=v85[2];local v388=v83[v387];local v389=v83[v387 + 2 ];if (v389>0) then if (v388>v83[v387 + 1 ]) then v77=v85[3];else v83[v387 + 3 ]=v388;end elseif (v388<v83[v387 + 1 ]) then v77=v85[3];else v83[v387 + 3 ]=v388;end end elseif (v86<=53) then if (v86<=44) then if (v86<=39) then if (v86<=37) then if (v86>36) then local v227=v85[2];do return v13(v83,v227,v227 + v85[3] );end else v83[v85[2]]=v83[v85[3]] * v85[4] ;end elseif (v86==38) then do return v83[v85[2]];end else local v229=v74[v85[3]];local v230;local v231={};v230=v10({},{__index=function(v324,v325)local v326=v231[v325];return v326[1][v326[2]];end,__newindex=function(v327,v328,v329)local v330=v231[v328];v330[1][v330[2]]=v329;end});for v332=1,v85[4] do v77=v77 + 1 ;local v333=v73[v77];if (v333[1]==13) then v231[v332-1 ]={v83,v333[3]};else v231[v332-1 ]={v58,v333[3]};end v82[ #v82 + 1 ]=v231;end v83[v85[2]]=v29(v229,v230,v59);end elseif (v86<=41) then if (v86>40) then if (v83[v85[2]]==v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end else if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];end elseif (v86<=42) then local v236=v85[2];do return v13(v83,v236,v78);end elseif (v86==43) then local v397=v83[v85[4]];if  not v397 then v77=v77 + 1 ;else v83[v85[2]]=v397;v77=v85[3];end else local v398;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v398=v85[2];do return v83[v398](v13(v83,v398 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v398=v85[2];do return v13(v83,v398,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=48) then if (v86<=46) then if (v86>45) then local v237;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v237=v85[2];do return v83[v237](v13(v83,v237 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v237=v85[2];do return v13(v83,v237,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end else local v242=v85[2];local v243=v83[v242];local v244=v85[3];for v335=1,v244 do v243[v335]=v83[v242 + v335 ];end end elseif (v86==47) then v83[v85[2]]=v85[3]~=0 ;v77=v77 + 1 ;else local v246=v85[2];local v247={v83[v246](v83[v246 + 1 ])};local v248=0;for v338=v246,v85[4] do v248=v248 + 1 ;v83[v338]=v247[v248];end end elseif (v86<=50) then if (v86==49) then v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86<=51) then local v250;local v251;v251=v85[2];v250=v83[v85[3]];v83[v251 + 1 ]=v250;v83[v251]=v250[v85[4]];v77=v77 + 1 ;v85=v73[v77];v251=v85[2];v83[v251](v83[v251 + 1 ]);v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v251=v85[2];v83[v251]=v83[v251](v83[v251 + 1 ]);v77=v77 + 1 ;v85=v73[v77];if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86==52) then v83[v85[2]]=v29(v74[v85[3]],nil,v59);else local v414=v85[2];local v415=v83[v85[3]];v83[v414 + 1 ]=v415;v83[v414]=v415[v85[4]];end elseif (v86<=62) then if (v86<=57) then if (v86<=55) then if (v86>54) then v83[v85[2]][v85[3]]=v83[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];elseif (v83[v85[2]]~=v85[4]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86==56) then v77=v85[3];else local v266=v85[2];v83[v266]=v83[v266](v13(v83,v266 + 1 ,v78));end elseif (v86<=59) then if (v86==58) then local v268;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v268=v85[2];do return v83[v268](v13(v83,v268 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v268=v85[2];do return v13(v83,v268,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end else local v273;local v274;v274=v85[2];v83[v274]=v83[v274](v83[v274 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v274=v85[2];v273=v83[v85[3]];v83[v274 + 1 ]=v273;v83[v274]=v273[v85[4]];v77=v77 + 1 ;v85=v73[v77];v274=v85[2];v83[v274]=v83[v274](v83[v274 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v274=v85[2];v273=v83[v85[3]];v83[v274 + 1 ]=v273;v83[v274]=v273[v85[4]];v77=v77 + 1 ;v85=v73[v77];v274=v85[2];v83[v274]=v83[v274](v83[v274 + 1 ]);v77=v77 + 1 ;v85=v73[v77];if (v85[2]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=60) then local v281;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v281=v85[2];do return v83[v281](v13(v83,v281 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v281=v85[2];do return v13(v83,v281,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end elseif (v86==61) then local v427=v85[2];local v428=v83[v427 + 2 ];local v429=v83[v427] + v428 ;v83[v427]=v429;if (v428>0) then if (v429<=v83[v427 + 1 ]) then v77=v85[3];v83[v427 + 3 ]=v429;end elseif (v429>=v83[v427 + 1 ]) then v77=v85[3];v83[v427 + 3 ]=v429;end else v83[v85[2]]=v83[v85[3]][v83[v85[4]]];end elseif (v86<=66) then if (v86<=64) then if (v86>63) then v83[v85[2]]=v85[3];else local v288;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3]~=0 ;v77=v77 + 1 ;v85=v73[v77];v288=v85[2];v83[v288]=v83[v288](v13(v83,v288 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86>65) then if (v85[2]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]][v85[3]]=v83[v85[4]];end elseif (v86<=68) then if (v86==67) then v83[v85[2]]=v83[v85[3]]/v83[v85[4]] ;else local v298=v85[2];do return v83[v298](v13(v83,v298 + 1 ,v85[3]));end end elseif (v86<=69) then local v299=v85[2];local v300=v83[v299];for v341=v299 + 1 ,v85[3] do v7(v300,v83[v341]);end elseif (v86==70) then if (v83[v85[2]]==v85[4]) then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]][v85[3]]=v85[4];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!813O0003023O0057522O033O0061706903053O00636163686503043O00756E697403063O00706C6179657203043O00626F2O7303063O0074617267657403053O00436163686503023O00494403043O004755494403043O004E616D6503063O0045786973747303053O004E5043494403053O004C6576656C030C3O004973496E426F2O734C69737403133O00436865636B485046726F6D426F2O734C69737403093O0043616E412O7461636B024O00806ADE402O01025O006ADE40024O0080E6DF40024O00C0E6DF40024O00E0C6E640025O0009FC40024O0028B60241024O0060B60241024O007063F040024O005051F540024O006051F540024O008051F540024O00A08FF540024O00C08FF540025O006DF540024O00106DF540024O00206DF540025O008EF540024O00108EF540024O00C0D2FB40024O00E0D2FB40024O00503EF940024O00C03EF940024O00A03EF940024O003042FA40024O004042FA40024O004080F640024O005080F640024O006080F640024O0040E4F840024O00D0E9F840025O00EAF840024O0040EAF840024O0088960141024O0090960141024O00A8960141024O00B0960141024O00D0F3FE40024O00781C0041024O00A81C0041024O00C01C0041024O0020DE0241024O0038DE0241024O00A0DE0241024O00B8DE0241024O00C8DE0241024O00D0DE0241024O0028920341024O00B03B0541024O00C86A0541024O00D06A0541024O00D86A0541024O00E06A0541024O00F86A0541025O006B0541024O00306B0541024O00284F0541024O00304F0541024O00384F0541024O00404F0541024O00484F0541024O00504F0541024O00584F0541024O00A04C0541024O00B84C0541024O00C04C0541024O00D84C0541024O00103E0841024O00C0C20741025O00260741024O0098C20741024O00A0C20741024O0048260841024O0088250741024O00C8C20741024O00D8A00741024O00C0E3EF40024O006034F040024O0050F90741024O00B0F90741024O00884C084103073O00497344752O6D7903093O00497341506C6179657203063O004865616C746803093O004D61784865616C746803103O004865616C746850657263656E74616765024O00F8271A41024O00448B1241024O0054351941024O0028D40F41024O00C0F80741024O0060860B41024O001C5E1941024O0038B71941030F3O004865616C696E674162736F72626564030A3O004865616C4162736F7262024O0028FF0841024O0008F50841024O00887E0941024O0068720941024O00C05D0941024O0070F30941030F3O0052657175697265734865616C696E67030D3O004973446561644F7247686F7374030F3O00412O66656374696E67436F6D62617403063O004973556E6974030E3O00436C612O73696669636174696F6E03093O00497354616E6B696E67030C3O00497354616E6B696E67416F4503083O0049734D6F76696E6703063O0054617267657400A93O0012283O00013O00206O000200122O000100013O00202O00010001000300202O00023O000400202O00030002000500202O00040002000600202O00050002000700023400065O001041000200080006000234000600013O001041000200090006000234000600023O0010410002000A0006000234000600033O0010410002000B0006000234000600043O0010410002000C000600062700060005000100012O000D3O00013O0010410002000D0006000234000600063O0010410002000E000600062700060007000100012O000D3O00043O0010410002000F000600062700060008000100012O000D3O00043O001041000200100006000234000600093O0010200002001100064O00063O002300302O00060012001300302O00060014001300302O00060015001300302O00060016001300302O00060017001300302O00060018001300302O00060019001300302O0006001A001300302O0006001B001300302O0006001C001300302O0006001D001300302O0006001E001300302O0006001F001300302O00060020001300302O00060021001300302O00060022001300302O00060023001300302O00060024001300302O00060025001300302O00060026001300302O00060027001300302O00060028001300302O00060029001300302O0006002A001300302O0006002B001300302O0006002C001300302O0006002D001300302O0006002E001300302O0006002F001300302O00060030001300302O00060031001300302O00060032001300302O00060033001300302O00060034001300302O00060035001300302O00060036001300302O00060037001300302O00060038001300302O00060039001300302O0006003A001300302O0006003B001300302O0006003C001300302O0006003D001300302O0006003E001300302O0006003F001300302O00060040001300302O00060041001300302O00060042001300302O00060043001300302O00060044001300302O00060045001300302O00060046001300302O00060047001300302O00060048001300302O00060049001300302O0006004A001300302O0006004B001300302O0006004C001300302O0006004D001300302O0006004E001300302O0006004F001300302O00060050001300302O00060051001300302O00060052001300302O00060053001300302O00060054001300302O00060055001300302O00060056001300302O00060057001300302O00060058001300302O00060059001300302O0006005A001300302O0006005B001300302O0006005C001300302O0006005D001300302O0006005E001300302O0006005F001300302O0006006000130030470006006100130030470006006200130030470006006300130006270007000A000100012O000D3O00063O0010410002006400070002340007000B3O0010410002006500070002340007000C3O0010410002006600070002340007000D3O0010410002006700070002340007000E3O0010370002006800074O000700083O00122O000800693O00122O0009006A3O00122O000A006B3O00122O000B006C3O00122O000C006D3O00122O000D006E3O00122O000E006F3O00122O000F00704O002D0007000800010006270008000F000100012O000D3O00073O001041000200710008000234000800103O0010180002007200084O000800063O00122O000900733O00122O000A00743O00122O000B00753O00122O000C00763O00122O000D00773O00122O000E00786O00080006000100062700090011000100012O000D3O00083O001041000200790009000234000900123O0010410002007A0009000234000900133O0010410002007B0009000234000900143O0010410002007C0009000234000900153O0010410002007D0009000234000900163O0010410002007E000900062700090017000100012O000D3O00033O0010410002007F0009000234000900183O00104100020080000900062700090019000100012O000D3O00023O0010410002008100092O00083O00013O001A3O000E3O0003163O0052656D6F7665556E6974475549444D6170456E747279030A3O00756E6974457869737473030A3O00556E697445786973747303063O00756E6974494403083O00756E69744755494403083O00556E69744755494403083O00756E69744E616D6503083O00556E69744E616D6503113O00756E697443616E4265412O7461636B6564030D3O00556E697443616E412O7461636B03063O00706C6179657203093O00756E69744E5043494403053O004E5043494403133O00412O64556E6974475549444D6170456E74727901263O00203300013O00014O00010002000100122O000100033O00202O00023O00044O00010002000200062O00010008000100010004383O000800012O001C00015O0010413O00020001001204000100063O00202O00023O00044O00010002000200104O0005000100122O000100083O00202O00023O00044O00010002000200104O0007000100122O0001000A3O00122O0002000B3O00202O00033O00044O00010003000200062O00010018000100010004383O001800012O001C00015O0010413O0009000100200500013O000D4O000300016O00010003000200104O000C000100202O00013O000500062O0001002500013O0004383O0025000100201D00013O00040006130001002500013O0004383O0025000100203500013O000E2O00090001000200012O00083O00017O00013O0003063O00756E6974494401033O00201D00013O00012O0026000100024O00083O00017O00043O0003083O00757365436163686503083O00756E69744755494403083O00556E69744755494403063O00756E69744944010A3O00201D00013O00010006130001000500013O0004383O0005000100201D00013O00022O0026000100023O001232000100033O00201D00023O00042O0044000100024O002A00016O00083O00017O00043O0003083O00757365436163686503083O00756E69744E616D6503083O00556E69744E616D6503063O00756E69744944010A3O00201D00013O00010006130001000500013O0004383O0005000100201D00013O00022O0026000100023O001232000100033O00201D00023O00042O0044000100024O002A00016O00083O00017O00053O0003083O007573654361636865030A3O00756E6974457869737473030D3O00556E6974497356697369626C6503063O00756E69744944030A3O00556E697445786973747301143O00201D00013O00010006130001000A00013O0004383O000A000100201D00013O00020006130001000900013O0004383O00090001001232000100033O00201D00023O00042O00160001000200022O0026000100023O001232000100053O00201D00023O00042O00160001000200020006130001001200013O0004383O00120001001232000100033O00201D00023O00042O00160001000200022O0026000100024O00083O00017O000D3O0003083O00757365436163686503093O00756E69744E5043494403043O0047554944026O00F0BF03083O00756E6974496E666F03053O006E7063696403083O0073747273706C697403013O002D03083O0043726561747572652O033O0050657403073O0056656869636C6503083O00746F6E756D626572027O00C002303O0006230001000A000100010004383O000A000100201D00023O00010006130002000A00013O0004383O000A000100201D00023O00020006130002000A00013O0004383O000A000100201D00023O00022O0026000200023O00203500023O00032O001600020002000200062300020010000100010004383O00100001001240000300044O0026000300024O000C00035O00201D0003000300052O003E0003000300020006230003001A000100010004383O001A00012O000E00046O000D000300044O000C00045O00201D0004000400052O000F00040002000300201D0004000300060006230004002E000100010004383O002E0001001232000500073O001240000600084O000D000700024O001200050007000A00263600050027000100090004383O00270001002636000500270001000A0004383O002700010026460005002C0001000B0004383O002C0001001232000B000C4O000D000C000A4O0016000B000200022O000D0004000B3O0004383O002D00010012400004000D3O0010410003000600042O0026000400024O00083O00017O00023O0003093O00556E69744C6576656C03063O00756E6974494401053O001219000100013O00202O00023O00024O000100026O00019O0000017O00033O0003053O004E5043494403053O00706169727303063O0045786973747302173O00062B00020004000100010004383O0004000100203500023O00012O0016000200020002001232000300024O000C00046O00300003000200050004383O001200010020350008000700032O00160008000200020006130008001200013O0004383O001200010020350008000700012O001600080002000200062900080012000100020004383O001200012O001C000800014O0026000800023O00062O00030008000100020004383O000800012O001C00036O0026000300024O00083O00017O00053O0003053O004E50434944026O00594003053O00706169727303063O0045786973747303103O004865616C746850657263656E74616765031E3O00062B00030004000100010004383O0004000100203500033O00012O001600030002000200062B00040007000100020004383O00070001001240000400023O001232000500034O000C00066O00300005000200070004383O00190001002035000A000900042O0016000A00020002000613000A001900013O0004383O00190001002035000A000900012O0016000A00020002000629000A0019000100030004383O00190001002035000A000900052O0016000A0002000200061E000A0019000100040004383O001900012O001C000A00014O0026000A00023O00062O0005000B000100020004383O000B00012O001C00056O0026000500024O00083O00017O00053O0003023O00494403063O00706C6179657203083O00757365436163686503113O00756E697443616E4265412O7461636B6564030D3O00556E697443616E412O7461636B02103O00203500023O00012O001600020002000200264600020009000100020004383O0009000100201D0003000100030006130003000900013O0004383O0009000100201D0003000100042O0026000300023O001232000300054O001B000400023O00202O0005000100014O000500066O00038O00039O0000017O00033O0003053O004E50434944028O003O010C3O00203500013O00012O0016000100020002000E1000020008000100010004383O000800012O000C00026O003E00020002000100263600020009000100030004383O000900012O002F00026O001C000200014O0026000200024O00083O00017O00023O00030C3O00556E69744973506C6179657203063O00756E6974494401053O001219000100013O00202O00023O00024O000100026O00019O0000017O00033O00030A3O00556E69744865616C746803063O00756E69744944026O00F0BF01083O001232000100013O00201D00023O00022O001600010002000200062300010006000100010004383O00060001001240000100034O0026000100024O00083O00017O00033O00030D3O00556E69744865616C74684D617803063O00756E69744944026O00F0BF01083O001232000100013O00201D00023O00022O001600010002000200062300010006000100010004383O00060001001240000100034O0026000100024O00083O00017O000B3O00030F3O0052657175697265734865616C696E67026O00494003063O004865616C746803093O004D61784865616C7468030A3O004865616C4162736F7262028O0003043O006D6174682O033O006D6178026O00F03F026O005940026O00F0BF011E3O00203500013O00012O00160001000200020006130001000600013O0004383O00060001001240000100024O0026000100023O00203500013O00032O003B00010002000200202O00023O00044O00020002000200202O00033O00054O000300020002000E2O0006001B000100010004383O001B0001000E420006001B000100020004383O001B0001000E100006001B000100030004383O001B0001001232000400073O0020170004000400084O00050001000300122O000600096O0004000600024O00040004000200202O00040004000A00062O0004001C000100010004383O001C00010012400004000B4O0026000400024O00083O00017O00023O00026O00F03F03083O00446562752O66557001123O001206000100016O00028O000200023O00122O000300013O00042O0001000F000100203500053O00022O003F00078O0007000700044O000800016O00050008000200062O0005000E00013O0004383O000E00012O001C000500014O0026000500023O00043D0001000500012O001C00016O0026000100024O00083O00017O00033O0003173O00556E6974476574546F74616C4865616C4162736F72627303063O00756E69744944028O0001083O001232000100013O00201D00023O00022O001600010002000200062300010006000100010004383O00060001001240000100034O0026000100024O00083O00017O00053O00030F3O004865616C696E674162736F72626564026O00F03F03053O004E5043494403063O004865616C746803093O004D61784865616C7468011D3O00203500013O00012O00160001000200020006130001000600013O0004383O000600012O001C000100014O0026000100023O001240000100024O000C00026O001A000200023O001240000300023O0004220001001A00012O000C00056O003E00050005000400203500063O00032O001600060002000200062900050019000100060004383O0019000100203500053O00042O001600050002000200203500063O00052O001600060002000200060100050019000100060004383O001900012O001C000500014O0026000500023O00043D0001000B00012O001C00016O0026000100024O00083O00017O00023O0003113O00556E69744973446561644F7247686F737403063O00756E6974494401053O001219000100013O00202O00023O00024O000100026O00019O0000017O00023O0003133O00556E6974412O66656374696E67436F6D62617403063O00756E6974494401053O001219000100013O00202O00023O00024O000100026O00019O0000017O00023O00030A3O00556E69744973556E697403063O00756E6974494402063O00123A000200013O00202O00033O000200202O0004000100024O000200046O00029O0000017O00033O0003123O00556E6974436C612O73696669636174696F6E03063O00756E69744944034O0001083O001232000100013O00201D00023O00022O001600010002000200062300010006000100010004383O00060001001240000100034O0026000100024O00083O00017O00033O0003133O00556E6974546872656174536974756174696F6E03023O004944027O004003133O001211000300013O00202O00043O00024O00040002000200202O0005000100024O000500066O00033O000200062O0003000D00013O0004383O000D000100062B0004000B000100020004383O000B0001001240000400033O00060A00040004000100030004383O001000012O001C00045O0004383O001100012O002F00046O001C000400014O0026000400024O00083O00017O00043O0003053O00706169727303113O00476574456E656D696573496E52616E6765026O001A4003093O00497354616E6B696E6703154O000700035O00122O000400016O00055O00202O00050005000200062O00070007000100010004383O00070001001240000700034O0002000500074O001400043O00060004383O0011000100203500093O00042O000D000B00084O000D000C00024O00210009000C00020006130009001100013O0004383O001100012O001C000300013O00062O0004000A000100020004383O000A00012O0026000300024O00083O00017O00033O00030C3O00476574556E697453702O656403063O00756E69744944028O0001093O001232000100013O00201D00023O00022O001600010002000200264600010006000100030004383O000600012O002F00016O001C000100014O0026000100024O00083O00017O00023O0003063O00756E6974494403063O0074617267657401074O001F00015O00202O00023O000100122O000300026O0002000200034O000100026O00019O0000017O00",v9(),...);