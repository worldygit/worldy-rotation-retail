local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=19) then if (v86<=9) then if (v86<=4) then if (v86<=1) then if (v86==0) then if (v85[2]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end else local v114;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v83[v114]=v83[v114]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v83[v114]=v83[v114](v83[v114 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];if (v85[2]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=2) then v83[v85[2]]=v83[v85[3]]/v83[v85[4]] ;elseif (v86==3) then v83[v85[2]]=v58[v85[3]];else v83[v85[2]]=v85[3]~=0 ;end elseif (v86<=6) then if (v86==5) then local v123=v85[2];v83[v123]=v83[v123](v13(v83,v123 + 1 ,v85[3]));else local v125=v85[2];do return v13(v83,v125,v125 + v85[3] );end end elseif (v86<=7) then local v126;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v126=v85[2];v83[v126]=v83[v126]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v126=v85[2];v83[v126]=v83[v126](v83[v126 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];if (v85[2]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86==8) then local v172;local v173;v173=v85[2];v172=v83[v85[3]];v83[v173 + 1 ]=v172;v83[v173]=v172[v85[4]];v77=v77 + 1 ;v85=v73[v77];v173=v85[2];v83[v173]=v83[v173](v83[v173 + 1 ]);v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v173=v85[2];do return v83[v173](v13(v83,v173 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v173=v85[2];do return v13(v83,v173,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end else v83[v85[2]]=v85[3]~=0 ;v77=v77 + 1 ;end elseif (v86<=14) then if (v86<=11) then if (v86>10) then if (v83[v85[2]]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end else local v134=v85[2];do return v83[v134](v13(v83,v134 + 1 ,v85[3]));end end elseif (v86<=12) then local v135=v85[2];local v136=v83[v85[3]];v83[v135 + 1 ]=v136;v83[v135]=v136[v85[4]];elseif (v86==13) then if (v83[v85[2]]==v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end else do return;end end elseif (v86<=16) then if (v86==15) then do return v83[v85[2]];end else v83[v85[2]][v85[3]]=v83[v85[4]];end elseif (v86<=17) then v83[v85[2]]=v83[v85[3]];elseif (v86==18) then v83[v85[2]]=v85[3];else local v185;local v186;v186=v85[2];v185=v83[v85[3]];v83[v186 + 1 ]=v185;v83[v186]=v185[v85[4]];v77=v77 + 1 ;v85=v73[v77];v186=v85[2];v83[v186]=v83[v186](v83[v186 + 1 ]);v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v186=v85[2];do return v83[v186](v13(v83,v186 + 1 ,v85[3]));end v77=v77 + 1 ;v85=v73[v77];v186=v85[2];do return v13(v83,v186,v78);end v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=29) then if (v86<=24) then if (v86<=21) then if (v86>20) then if (v83[v85[2]]==v85[4]) then v77=v77 + 1 ;else v77=v85[3];end else local v144=v85[2];v83[v144]=v83[v144](v83[v144 + 1 ]);end elseif (v86<=22) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86>23) then if  not v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end else local v198;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v198=v85[2];v83[v198]=v83[v198]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v58[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v198=v85[2];v83[v198]=v83[v198](v83[v198 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v198=v85[2];v83[v198]=v83[v198]();v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]][v85[4]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]]/v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] * v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];if (v85[2]<v83[v85[4]]) then v77=v77 + 1 ;else v77=v85[3];end end elseif (v86<=26) then if (v86==25) then local v146=v83[v85[4]];if  not v146 then v77=v77 + 1 ;else v83[v85[2]]=v146;v77=v85[3];end elseif (v83[v85[2]]~=v85[4]) then v77=v77 + 1 ;else v77=v85[3];end elseif (v86<=27) then v77=v85[3];elseif (v86==28) then local v209=v74[v85[3]];local v210;local v211={};v210=v10({},{__index=function(v226,v227)local v228=v211[v227];return v228[1][v228[2]];end,__newindex=function(v229,v230,v231)local v232=v211[v230];v232[1][v232[2]]=v231;end});for v234=1,v85[4] do v77=v77 + 1 ;local v235=v73[v77];if (v235[1]==17) then v211[v234-1 ]={v83,v235[3]};else v211[v234-1 ]={v58,v235[3]};end v82[ #v82 + 1 ]=v211;end v83[v85[2]]=v29(v209,v210,v59);else local v213=v85[2];local v214={v83[v213](v83[v213 + 1 ])};local v215=0;for v237=v213,v85[4] do v215=v215 + 1 ;v83[v237]=v214[v215];end end elseif (v86<=34) then if (v86<=31) then if (v86==30) then v83[v85[2]]=v29(v74[v85[3]],nil,v59);else v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;end elseif (v86<=32) then local v150;v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v150=v85[2];v83[v150]=v83[v150](v13(v83,v150 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]]/v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] + v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];do return v83[v85[2]];end v77=v77 + 1 ;v85=v73[v77];do return;end elseif (v86==33) then v83[v85[2]]=v83[v85[3]] + v83[v85[4]] ;else v83[v85[2]]=v83[v85[3]][v85[4]];end elseif (v86<=36) then if (v86>35) then local v156=v85[2];do return v13(v83,v156,v78);end else v83[v85[2]]=v83[v85[3]] + v85[4] ;end elseif (v86<=37) then local v158=v85[2];v83[v158]=v83[v158]();elseif (v86==38) then v83[v85[2]]=v83[v85[3]] * v83[v85[4]] ;else local v220;v83[v85[2]]=v83[v85[3]];v77=v77 + 1 ;v85=v73[v77];v220=v85[2];v83[v220]=v83[v220](v13(v83,v220 + 1 ,v85[3]));v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] -v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v83[v85[3]] * v83[v85[4]] ;v77=v77 + 1 ;v85=v73[v77];do return v83[v85[2]];end v77=v77 + 1 ;v85=v73[v77];do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!103O0003023O0057522O033O0061706903053O007370652O6C030C3O00432O6F6C646F776E496E666F030B3O0043686172676573496E666F03083O00432O6F6C646F776E030F3O00432O6F6C646F776E52656D61696E7303143O00432O6F6C646F776E52656D61696E734775652O73030A3O00432O6F6C646F776E5570030C3O00432O6F6C646F776E446F776E03073O0043686172676573030A3O004D61784368617267657303083O00526563686172676503113O00436861726765734672616374696F6E616C03103O0046752O6C526563686172676554696D6503083O00557361626C65496E00213O0012163O00013O0020225O000200202200013O000300021E00025O002O1000010004000200021E000200013O002O1000010005000200021E000200023O002O1000010006000200061C00020003000100012O00117O002O1000010007000200061C00020004000100012O00117O002O1000010008000200021E000200053O002O1000010009000200021E000200063O002O100001000A000200021E000200073O002O100001000B000200021E000200083O002O100001000C000200061C00020009000100012O00117O002O100001000D000200021E0002000A3O002O100001000E000200021E0002000B3O002O100001000F000200021E0002000C3O002O100001001000022O000E3O00013O000D3O00023O0003023O00494403103O004765745370652O6C432O6F6C646F776E01073O00201300013O00014O00010002000200122O000200026O000300016O000200036O00029O0000017O00023O0003023O004944030F3O004765745370652O6C4368617267657301073O00201300013O00014O00010002000200122O000200026O000300016O000200036O00029O0000017O00023O00030B3O0043686172676573496E666F030C3O00432O6F6C646F776E496E666F010A3O00200C00013O00012O001D000100020004000618000400080001000100041B3O0008000100200C00053O00022O001D0005000200062O0011000400064O0011000300054O000F000400024O000E3O00017O00043O00030C3O00432O6F6C646F776E496E666F028O0003073O0047657454696D65030E3O005265636F766572794F2O6673657402163O00200C00023O00012O001D000200020003002615000200060001000200041B3O00060001002O12000400024O000F000400024O0021000400020003001207000500036O0005000100024O0004000400054O00055O00202O0005000500044O000600016O0005000200024O000400040005000E2O000200130001000400041B3O00130001000619000500140001000400041B3O00140001002O12000500024O000F000500024O000E3O00017O00053O00030C3O00432O6F6C646F776E496E666F028O0003073O0047657454696D65030E3O005265636F766572794F2O66736574030C3O006C6173744361737454696D65021D3O00200C00023O00012O001D000200020003002615000200060001000200041B3O00060001002O12000400024O000F000400024O0021000400020003001217000500036O0005000100024O0004000400054O00055O00202O0005000500044O000600016O0005000200024O00040004000500122O000500036O00050001000200202O00063O00054O0005000500064O0006000300044O0005000500064O000400040005000E2O0002001A0001000400041B3O001A00010006190006001B0001000400041B3O001B0001002O12000600024O000F000600024O000E3O00017O00023O00030F3O00432O6F6C646F776E52656D61696E73028O0002093O00200C00023O00012O0011000400014O000500020004000200261A000200060001000200041B3O000600012O000900026O0004000200014O000F000200024O000E3O00017O00023O00030F3O00432O6F6C646F776E52656D61696E73028O0002093O00200C00023O00012O0011000400014O0005000200040002002615000200060001000200041B3O000600012O000900026O0004000200014O000F000200024O000E3O00017O00043O00030B3O0043686172676573496E666F03083O005265636861726765028O00026O00F03F020C3O00200C00023O00012O001D00020002000300060B0002000A0001000300041B3O000A000100200C00043O00022O0011000600014O00050004000600020026150004000A0001000300041B3O000A00010020230002000200042O000F000200024O000E3O00017O00013O00030B3O0043686172676573496E666F01043O00200C00013O00012O001D0001000200022O000F000200024O000E3O00017O00043O00030B3O0043686172676573496E666F028O0003073O0047657454696D65030E3O005265636F766572794F2O6673657402163O00200C00023O00012O001D00020002000500060D000200060001000300041B3O00060001002O12000600024O000F000600024O0021000600040005001207000700036O0007000100024O0006000600074O00075O00202O0007000700044O000800016O0007000200024O000600060007000E2O000200130001000600041B3O00130001000619000700140001000600041B3O00140001002O12000700024O000F000700024O000E3O00017O00023O00030B3O0043686172676573496E666F03083O005265636861726765020D3O00200C00023O00012O001D00020002000500060D000200050001000300041B3O000500012O000F000200023O00200C00063O00022O0020000800016O0006000800024O0006000500064O0006000600054O0006000200064O000600028O00017O00033O00030B3O0043686172676573496E666F028O0003113O00436861726765734672616374696F6E616C020D3O00200C00023O00012O001D00020002000500060D000200060001000300041B3O00060001002O12000600024O000F000600023O00200C00063O00032O0027000800016O0006000800024O0006000300064O0006000600054O000600028O00017O00033O0003073O0043686172676573028O0003083O005265636861726765020B3O00200C00023O00012O0014000200020002000E2O000200060001000200041B3O00060001002O12000200024O000F000200023O00200C00023O00032O0011000400014O000A000200044O002400026O000E3O00017O00",v9(),...);