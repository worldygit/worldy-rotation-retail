local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then do return;end elseif (v86>1) then local v111=v85[2];v83[v111]=v83[v111](v83[v111 + 1 ]);else local v113;local v114;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v83[v114]=v83[v114](v83[v114 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v78=(v114 + v84) -1 ;for v125=v114,v78 do v113=v79[v125-v114 ];v83[v125]=v113;end v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v83[v114](v13(v83,v114 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=4) then if (v86>3) then v83[v85[2]]=v85[3];else local v122=v85[2];v83[v122](v13(v83,v122 + 1 ,v78));end elseif (v86==5) then local v123=v85[2];v78=(v123 + v84) -1 ;for v128=v123,v78 do local v129=v79[v128-v123 ];v83[v128]=v129;end elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E670339082O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C206361636865203D2057522E63616368650D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A0D0A6C6F63616C2069735374752O6E6564446562752O6673203D207B0D0A2O202O2D2044656D6F6E2048756E7465720D0A2O202O2D2044727569640D0A2O202O2D2047656E6572616C0D0A2O207370652O6C2835322O31292C202O2D204D696768747920426173680D0A2O202O2D20466572616C0D0A2O207370652O6C28323033313233292C202O2D204D61696D0D0A2O207370652O6C28313633353035292C202O2D2052616B650D0A2O202O2D2050616C6164696E0D0A2O202O2D2047656E6572616C0D0A2O207370652O6C28383533292C202O2D2048612O6D6572206F66204A7573746963650D0A2O202O2D205265747269627574696F6E0D0A2O207370652O6C28323035323930292C202O2D2057616B65206F662041736865730D0A2O202O2D20526F6775650D0A2O202O2D2047656E6572616C0D0A2O207370652O6C28312O39383034292C202O2D20426574772O656E2074686520457965730D0A2O207370652O6C2831382O33292C202O2D2043686561702053686F740D0A2O207370652O6C28343038292C202O2D204B69646E65792053686F740D0A2O207370652O6C28313936393538292C202O2D20537472696B652066726F6D2074686520536861646F77730D0A2O202O2D2057612O72696F720D0A2O202O2D2047656E6572616C0D0A2O207370652O6C28313332313638292C202O2D2053686F636B776176650D0A2O207370652O6C28313332313639292C202O2D2053746F726D20426F6C740D0A7D0D0A66756E6374696F6E20756E69743A497465726174655374756E446562752O667328290D0A2O20666F722069203D20312C202369735374752O6E6564446562752O667320646F0D0A4O206C6F63616C2069735374752O6E6564446562752O66203D2069735374752O6E6564446562752O66735B695D0D0A4O2069662073656C663A446562752O6655702869735374752O6E6564446562752O662C206E696C2C207472756529207468656E0D0A6O2072657475726E20747275650D0A4O20656E640D0A2O20656E640D0A0D0A2O2072657475726E2066616C73650D0A656E640D0A0D0A66756E6374696F6E20756E69743A49735374752O6E656428290D0A2O206C6F63616C2067756964203D2073656C663A4755494428290D0A2O206966206E6F742067756964207468656E2072657475726E20656E640D0A0D0A2O206C6F63616C20756E6974496E666F203D2063616368652E756E6974496E666F5B677569645D0D0A2O206966206E6F7420756E6974496E666F207468656E0D0A4O20756E6974496E666F203D207B7D0D0A4O2063616368652E756E6974496E666F5B677569645D203D20756E6974496E666F0D0A2O20656E640D0A0D0A2O206C6F63616C2069735374752O6E6564203D20756E6974496E666F2E69735374752O6E65640D0A2O2069662069735374752O6E6564202O3D206E696C207468656E0D0A4O2069735374752O6E6564203D2073656C663A497465726174655374756E446562752O667328290D0A4O20756E6974496E666F2E69735374752O6E6564203D2069735374752O6E65640D0A2O20656E640D0A0D0A2O2072657475726E2069735374752O6E65640D0A656E640D0A0D0A6C6F63616C2069735374752O6E61626C65436C612O73696669636174696F6E203D207B0D0A2O205B227472697669616C225D203D20747275652C0D0A2O205B226D696E7573225D203D20747275652C0D0A2O205B226E6F726D616C225D203D20747275652C0D0A2O205B2272617265225D203D20747275652C0D0A2O205B227261722O656C697465225D203D2066616C73652C0D0A2O205B22656C697465225D203D2066616C73652C0D0A2O205B22776F726C64626F2O73225D203D2066616C73652C0D0A2O205B2O225D203D2066616C73650D0A7D0D0A66756E6374696F6E20756E69743A49735374752O6E61626C6528290D0A2O202O2D20544F444F3A20412O6420445220436865636B0D0A2O206C6F63616C2067756964203D2073656C663A4755494428290D0A2O206966206E6F742067756964207468656E2072657475726E20656E640D0A0D0A2O206C6F63616C20756E6974496E666F203D2063616368652E756E6974496E666F5B677569645D0D0A2O206966206E6F7420756E6974496E666F207468656E0D0A4O20756E6974496E666F203D207B7D0D0A4O2063616368652E756E6974496E666F5B677569645D203D20756E6974496E666F0D0A2O20656E640D0A0D0A2O206C6F63616C2069735374752O6E61626C65203D20756E6974496E666F2E49735374752O6E61626C650D0A2O2069662069735374752O6E61626C65202O3D206E696C207468656E0D0A4O2069735374752O6E61626C65203D2069735374752O6E61626C65436C612O73696669636174696F6E5B73656C663A436C612O73696669636174696F6E28295D0D0A4O20756E6974496E666F2E69735374752O6E61626C65203D2069735374752O6E61626C650D0A2O20656E640D0A0D0A2O2072657475726E2069735374752O6E61626C650D0A656E640D0A0D0A66756E6374696F6E20756E69743A43616E42655374752O6E65642869676E6F7265436C612O73696669636174696F6E290D0A2O2072657475726E202O2869676E6F7265436C612O73696669636174696F6E206F722073656C663A49735374752O6E61626C65282O2920616E64206E6F742073656C663A49735374752O6E6564282O29206F722066616C73650D0A656E640D0A00063O0012013O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);