local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=25) then if (v86<=12) then if (v86<=5) then if (v86<=2) then if (v86<=0) then v83[v85[2]]=v83[v85[3]];elseif (v86>1) then local v143;local v144;v144=v85[2];v143=v83[v85[3]];v83[v144 + 1 ]=v143;v83[v144]=v143[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v144=v85[2];do return v83[v144](v13(v83,v144 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v144=v85[2];do return v13(v83,v144,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end else local v153;local v154;v154=v85[2];v153=v83[v85[3]];v83[v154 + 1 ]=v153;v83[v154]=v153[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v154=v85[2];do return v83[v154](v13(v83,v154 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v154=v85[2];do return v13(v83,v154,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=3) then local v116=v85[2];local v117={};for v138=1, #v82 do local v139=v82[v138];for v163=0, #v139 do local v164=v139[v163];local v165=v164[1];local v166=v164[2];if ((v165==v83) and (v166>=v116)) then v117[v166]=v165[v166];v164[1]=v117;end end end elseif (v86>4) then local v167;v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v167=v85[2];v83[v167](v13(v83,v167 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];do return v83[v85[2]];end v77=v77 + 1 ;v85=v73[v77];do return;end else local v172=v85[2];local v173=v83[v172];local v174=v83[v172 + 2 ];if (v174>0) then if (v173>v83[v172 + 1 ]) then v77=v85[3];else v83[v172 + 3 ]=v173;end elseif (v173<v83[v172 + 1 ]) then v77=v85[3];else v83[v172 + 3 ]=v173;end end elseif (v86<=8) then if (v86<=6) then local v118=v85[2];do return v13(v83,v118,v118 + v85[3] );end elseif (v86==7) then local v175;local v176;v176=v85[2];v175=v83[v85[3]];v83[v176 + 1 ]=v175;v83[v176]=v175[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v176=v85[2];do return v83[v176](v13(v83,v176 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v176=v85[2];do return v13(v83,v176,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end else v77=v85[3];end elseif (v86<=10) then if (v86==9) then local v186=v85[2];local v187=v83[v85[3]];v83[v186 + 1 ]=v187;v83[v186]=v187[v85[4]];else v83[v85[2]]=v85[3];end elseif (v86==11) then local v193;local v194;v194=v85[2];v193=v83[v85[3]];v83[v194 + 1 ]=v193;v83[v194]=v193[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v194=v85[2];do return v83[v194](v13(v83,v194 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v194=v85[2];do return v13(v83,v194,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end elseif (v83[v85[2]]<=v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86<=18) then if (v86<=15) then if (v86<=13) then v83[v85[2]][v85[3]]=v83[v85[4]];elseif (v86>14) then v83[v85[2]]=v58[v85[3]];else local v205;local v206;local v207;v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v83[v85[4]]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v207=v85[2];v206={v83[v207](v83[v207 + 1 ])};v205=0;for v304=v207,v85[4] do v205=v205 + 1 ;v83[v304]=v206[v205];end v77=v77 + 1 ;v85=v73[v77];v77=v85[3];end elseif (v86<=16) then local v121;v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v121=v85[2];v83[v121](v13(v83,v121 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];do return v83[v85[2]];end v77=v77 + 1 ;v85=v73[v77];do return;end elseif (v86>17) then local v215;local v216;local v217;v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]= #v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v217=v85[2];v216=v83[v217];v215=v83[v217 + 2 ];if (v215>0) then if (v216>v83[v217 + 1 ]) then v77=v85[3];else v83[v217 + 3 ]=v216;end elseif (v216<v83[v217 + 1 ]) then v77=v85[3];else v83[v217 + 3 ]=v216;end elseif (v85[2]<=v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86<=21) then if (v86<=19) then v83[v85[2]]=v83[v85[3]][v85[4]];elseif (v86==20) then v83[v85[2]][v83[v85[3]]]=v85[4];else if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];end elseif (v86<=23) then if (v86>22) then local v230=v74[v85[3]];local v231;local v232={};v231=v10({},{__index=function(v307,v308)local v309=v232[v308];return v309[1][v309[2]];end,__newindex=function(v310,v311,v312)local v313=v232[v311];v313[1][v313[2]]=v312;end});for v315=1,v85[4] do v77=v77 + 1 ;local v316=v73[v77];if (v316[1]==0) then v232[v315-1 ]={v83,v316[3]};else v232[v315-1 ]={v58,v316[3]};end v82[ #v82 + 1 ]=v232;end v83[v85[2]]=v29(v230,v231,v59);else local v234=v85[2];local v235={v83[v234](v83[v234 + 1 ])};local v236=0;for v318=v234,v85[4] do v236=v236 + 1 ;v83[v318]=v235[v236];end end elseif (v86>24) then local v237;v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v237=v85[2];v83[v237](v13(v83,v237 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];do return v83[v85[2]];end v77=v77 + 1 ;v85=v73[v77];do return;end else local v242=v85[2];local v243=v83[v242];for v321=v242 + 1 ,v85[3] do v7(v243,v83[v321]);end end elseif (v86<=38) then if (v86<=31) then if (v86<=28) then if (v86<=26) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86==27) then local v247=v85[2];local v248=v83[v247 + 2 ];local v249=v83[v247] + v248 ;v83[v247]=v249;if (v248>0) then if (v249<=v83[v247 + 1 ]) then v77=v85[3];v83[v247 + 3 ]=v249;end elseif (v249>=v83[v247 + 1 ]) then v77=v85[3];v83[v247 + 3 ]=v249;end else v83[v85[2]]= #v83[v85[3]];end elseif (v86<=29) then v83[v85[2]]=v85[3]~=0 ;elseif (v86>30) then local v252;v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v252=v85[2];v83[v252](v13(v83,v252 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];do return v83[v85[2]];end v77=v77 + 1 ;v85=v73[v77];do return;end else local v257=v85[2];v83[v257]=v83[v257](v83[v257 + 1 ]);end elseif (v86<=34) then if (v86<=32) then local v129=v85[2];v83[v129](v13(v83,v129 + 1 ,v85[3]));elseif (v86>33) then do return v83[v85[2]];end else local v259=v85[2];local v260=v83[v259];local v261=v85[3];for v322=1,v261 do v260[v322]=v83[v259 + v322 ];end end elseif (v86<=36) then if (v86==35) then local v262;local v263;local v264;v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]={};v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v264=v85[2];v263=v83[v264];v262=v85[3];for v325=1,v262 do v263[v325]=v83[v264 + v325 ];end else do return;end end elseif (v86==37) then v83[v85[2]][v83[v85[3]]]=v83[v85[4]];else local v273;v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v273=v85[2];v83[v273](v13(v83,v273 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];do return v83[v85[2]];end v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=44) then if (v86<=41) then if (v86<=39) then local v130=v85[2];local v131=v85[4];local v132=v130 + 2 ;local v133={v83[v130](v83[v130 + 1 ],v83[v132])};for v140=1,v131 do v83[v132 + v140 ]=v133[v140];end local v134=v133[1];if v134 then v83[v132]=v134;v77=v85[3];else v77=v77 + 1 ;end elseif (v86>40) then v83[v85[2]]=v29(v74[v85[3]],nil,v59);else local v281;v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v281=v85[2];v83[v281](v13(v83,v281 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v83[v85[2]][v83[v85[3]]]=v85[4];end elseif (v86<=42) then local v135=v85[2];v83[v135]=v83[v135](v13(v83,v135 + 1 ,v85[3]));elseif (v86>43) then if v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]]={};end elseif (v86<=47) then if (v86<=45) then v83[v85[2]]=v85[3]~=0 ;v77=v77 + 1 ;elseif (v86==46) then if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v290=v85[2];do return v83[v290](v13(v83,v290 + 1 ,v85[3]));end end elseif (v86<=49) then if (v86==48) then if (v83[v85[2]]<v83[v85[4]]) then v77=v85[3];else v77=v77 + 1 ;end else local v291;local v292;v292=v85[2];v291=v83[v85[3]];v83[v292 + 1 ]=v291;v83[v292]=v291[v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v292=v85[2];do return v83[v292](v13(v83,v292 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v292=v85[2];do return v13(v83,v292,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86>50) then local v301=v85[2];do return v13(v83,v301,v78);end else v83[v85[2]]=v83[v85[3]][v83[v85[4]]];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!133O0003023O0057522O033O0061706903053O00636163686503043O00756E697403063O00706C6179657203073O00656E656D696573030A3O006974656D416374696F6E03053O006D656C2O6503063O0072616E676564030B3O007370652O6C416374696F6E03053O007370652O6C03053O006172656E6103043O00626F2O7303093O006E616D65706C61746503113O00476574456E656D696573496E52616E676503163O00476574456E656D696573496E4D656C2O6552616E676503163O00476574456E656D696573496E5370652O6C52616E6765031B3O00476574456E656D696573496E4974656D416374696F6E52616E6765031C3O00476574456E656D696573496E5370652O6C416374696F6E52616E6765003E3O0012153O00013O00206O000200122O000100013O00202O00010001000300202O00023O000400202O00030002000500202O00040001000600202O00040004000700202O00050001000600202O00050005000800201300060001000600202300060006000900202O00070001000600202O00070007000A00202O00080001000600202O00080008000B4O000900033O00122O000A000C3O00122O000B000D3O00122O000C000E6O000900030001000617000A3O000100036O00098O00028O00034O002B000B5O000617000C0001000100046O00068O00028O000B8O000A3O00100D0003000F000C2O0003000B6O002B000B5O000617000C0002000100036O00058O000B8O000A3O00100D00030010000C2O0003000B6O002B000B5O000617000C0003000100036O00088O000B8O000A3O00100D00030011000C2O0003000B6O002B000B5O000617000C0004000100036O00048O000B8O000A3O00100D00030012000C2O0003000B6O002B000B5O000617000C0005000100036O00078O000B8O000A3O00100D00030013000C2O0003000B6O00243O00013O00063O000B3O00026O00F03F03053O00706169727303043O004755494403063O00457869737473030D3O004973426C61636B6C697374656403113O00497355736572426C61636B6C6973746564030D3O004973446561644F7247686F737403093O0043616E412O7461636B03053O007461626C6503063O00696E736572742O0102384O001200025O00122O000300016O00048O000400043O00122O000500013O00042O0003003700012O000F000700014O000E00088O0008000800064O00070007000800122O000800026O000900076O00080002000A00044O00340001002009000D000C00032O001E000D000200022O0032000E0002000D00062E000E0034000100010004083O00340001002009000E000C00042O001E000E0002000200062C000E003400013O0004083O00340001002009000E000C00052O001E000E0002000200062E000E0034000100010004083O00340001002009000E000C00062O001E000E0002000200062E000E0034000100010004083O00340001002009000E000C00072O001E000E0002000200062E000E0034000100010004083O003400012O000F000E00023O002009000E000E00084O0010000C4O002A000E0010000200062C000E003400013O0004083O003400014O000E00016O000F000C4O001E000E0002000200062C000E003400013O0004083O0034000100121A000E00093O002028000E000E000A4O000F8O0010000C6O000E0010000100202O0002000D000B0006270008000E000100020004083O000E000100041B0003000600012O00243O00017O00073O00026O00F03F03053O00706169727303053O007461626C6503063O00696E73657274027O004003043O00736F727403093O004973496E52616E676502444O000F00026O003200030002000100062C0003000600013O0004083O000600012O00320003000200012O0022000300024O002B00036O00250002000100032O001C000400023O000E1100010036000100040004083O003600012O002B00045O00121A000500026O000600024O00160005000200070004083O0017000100060C00010017000100080004083O0017000100121A000A00033O002013000A000A00044O000B00046O000C00084O0020000A000C000100062700050010000100020004083O001000012O001C000500043O000E1100010036000100050004083O003600012O001C000500043O000E1100050024000100050004083O0024000100121A000500033O0020130005000500064O000600043O00022900076O002000050007000100121A000500023O0020130006000400012O00320006000200062O00160005000200070004083O00330001002009000A000900074O000C00014O002A000A000C000200062C000A003300013O0004083O0033000100121A000A00033O002013000A000A00044O000B00034O000F000C00014O0020000A000C000100062700050029000100020004083O002900012O0022000300024O000F000400024O003200040004000100062E0004003E000100010004083O003E000100061700040001000100016O00014O000F000500024O00250005000100042O000F000500034O0026000600036O000700046O0005000700014O000300028O00013O00027O0002063O0006303O0003000100010004083O000300012O002D00026O001D000200014O0022000200024O00243O00017O00013O0003093O004973496E52616E676501053O00200100013O00014O00038O000100036O00019O0000019O002O0002164O000F00026O003200030002000100062C0003000600013O0004083O000600012O00320003000200012O0022000300024O002B00036O00250002000100032O000F000400014O003200040004000100062E00040010000100010004083O0010000100061700043O000100016O00014O000F000500014O00250005000100042O000F000500024O0026000600036O000700046O0005000700014O000300028O00013O00013O00013O00030E3O004973496E4D656C2O6552616E676501053O00200100013O00014O00038O000100036O00019O0000017O00013O0003073O007370652O6C494402173O0020130002000100012O000F00036O003200040003000200062C0004000700013O0004083O000700012O00320004000300022O0022000400024O002B00046O00250003000200042O000F000500014O003200050005000200062E00050011000100010004083O0011000100061700053O000100016O00014O000F000600014O00250006000200052O000F000600024O0026000700046O000800056O0006000800014O000400028O00013O00013O00013O00030E3O0049735370652O6C496E52616E676501053O00200100013O00014O00038O000100036O00019O0000017O00013O0003063O006974656D494402173O0020130002000100012O000F00036O003200040003000200062C0004000700013O0004083O000700012O00320004000300022O0022000400024O002B00046O00250003000200042O000F000500014O003200050005000200062E00050011000100010004083O0011000100061700053O000100016O00014O000F000600014O00250006000200052O000F000600024O0026000700046O000800056O0006000800014O000400028O00013O00013O00013O0003133O0049734974656D496E416374696F6E52616E676501053O00200100013O00014O00038O000100036O00019O0000017O00013O0003073O007370652O6C494402173O0020130002000100012O000F00036O003200040003000200062C0004000700013O0004083O000700012O00320004000300022O0022000400024O002B00046O00250003000200042O000F000500014O003200050005000200062E00050011000100010004083O0011000100061700053O000100016O00014O000F000600014O00250006000200052O000F000600024O0026000700046O000800056O0006000800014O000400028O00013O00013O00013O0003143O0049735370652O6C496E416374696F6E52616E676501053O00200100013O00014O00038O000100036O00019O0000017O00",v9(),...);