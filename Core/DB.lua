local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v78=(v110 + v84) -1 ;for v112=v110,v78 do local v113=v79[v112-v110 ];v83[v112]=v113;end elseif (v86==1) then local v115=v85[2];v83[v115](v13(v83,v115 + 1 ,v78));else do return;end end elseif (v86<=4) then if (v86==3) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v116=v85[2];v83[v116]=v83[v116](v83[v116 + 1 ]);end elseif (v86==5) then v83[v85[2]]=v85[3];else local v120;local v121;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v121=v85[2];v83[v121]=v83[v121](v83[v121 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v121=v85[2];v78=(v121 + v84) -1 ;for v128=v121,v78 do v120=v79[v128-v121 ];v83[v128]=v120;end v77=v77 + 1 ;v85=v73[v77];v121=v85[2];v83[v121](v13(v83,v121 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E670395162O006C6F63616C20612O646F6E4E616D65203D203O2E0D0A0D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A66756E6374696F6E2057523A496E6974446228290D0A2O206C6F63616C2064656661756C7473203D207B0D0A4O20676C6F62616C203D207B0D0A6O2061706C73203D207B0D0A8O2064656174684B6E69676874203D207B0D0A9O2020626C2O6F64203D202264656661756C74222C0D0A9O202066726F7374203D202264656661756C74222C0D0A9O2020756E686F6C79203D202264656661756C74222C0D0A8O207D2C0D0A8O2064656D6F6E48756E746572203D207B0D0A9O20206861766F63203D202264656661756C74222C0D0A9O202076656E6765616E6365203D202264656661756C74222C0D0A8O207D2C0D0A8O206472756964203D207B0D0A9O202062616C616E6365203D202264656661756C74222C0D0A9O2020666572616C203D202264656661756C74222C0D0A9O2020677561726469616E203D202264656661756C74222C0D0A9O2020726573746F726174696F6E203D202264656661756C74222C0D0A8O207D2C0D0A8O2065766F6B6572203D207B0D0A9O20206175676D656E746174696F6E203D202264656661756C74222C0D0A9O20206465766173746174696F6E203D202264656661756C74222C0D0A9O2020707265736572766174696F6E203D202264656661756C74222C0D0A8O207D2C0D0A8O2068756E746572203D207B0D0A9O202062656173744D617374657279203D202264656661756C74222C0D0A9O20206D61726B736D616E73686970203D202264656661756C74222C0D0A9O2020737572766976616C203D202264656661756C74222C0D0A8O207D2C0D0A8O206D616765203D207B0D0A9O2020617263616E65203D202264656661756C74222C0D0A9O202066697265203D202264656661756C74222C0D0A9O202066726F7374203D202264656661756C74222C0D0A8O207D2C0D0A8O206D6F6E6B203D207B0D0A9O2020627265776D6173746572203D202264656661756C74222C0D0A9O20206D697374776561766572203D202264656661756C74222C0D0A9O202077696E6477616C6B6572203D202264656661756C74222C0D0A8O207D2C0D0A8O2070616C6164696E203D207B0D0A9O2020686F6C79203D202264656661756C74222C0D0A9O202070726F74656374696F6E203D202264656661756C74222C0D0A9O20207265747269627574696F6E203D202264656661756C74222C0D0A8O207D2C0D0A8O20707269657374203D207B0D0A9O20206469736369706C696E65203D202264656661756C74222C0D0A9O2020686F6C79203D202264656661756C74222C0D0A9O2020736861646F77203D202264656661756C74222C0D0A8O207D2C0D0A8O20726F677565203D207B0D0A9O2020612O73612O73696E6174696F6E203D202264656661756C74222C0D0A9O20206F75746C6177203D202264656661756C74222C0D0A9O2020737562746C657479203D202264656661756C74222C0D0A8O207D2C0D0A8O207368616D616E203D207B0D0A9O2020656C656D656E74616C203D202264656661756C74222C0D0A9O2020656E68616E63656D656E74203D202264656661756C74222C0D0A9O2020726573746F726174696F6E203D202264656661756C74222C0D0A8O207D2C0D0A8O207761726C6F636B203D207B0D0A9O2020612O666C696374696F6E203D202264656661756C74222C0D0A9O202064656D6F6E6F6C6F6779203D202264656661756C74222C0D0A9O20206465737472756374696F6E203D202264656661756C74222C0D0A8O207D2C0D0A8O2077612O72696F72203D207B0D0A9O202061726D73203D202264656661756C74222C0D0A9O202066757279203D202264656661756C74222C0D0A9O202070726F74656374696F6E203D202264656661756C74222C0D0A8O207D2C0D0A6O207D2C0D0A6O2067656E6572616C203D207B0D0A8O20656E61626C6564203D207B0D0A9O20206175746F466F637573203D20747275652C0D0A9O20206175746F546172676574203D20747275652C0D0A9O20206465627567203D2066616C73652C0D0A9O20206465736E617265203D20747275652C0D0A9O202064697370656C42752O6673203D20747275652C0D0A9O202064697370656C446562752O6673203D20747275652C0D0A9O202066707341646A75737450756C7365496E74657276616C203D20747275652C0D0A9O202068616E646C65412O666C6963746564203D20747275652C0D0A9O202068616E646C65496E636F72706F7265616C203D20747275652C0D0A9O2020696E74652O72757074203D20747275652C0D0A9O2020696E74652O72757074576974685374756E203D20747275652C0D0A9O20206974656D73203D20747275652C0D0A9O20206D69746967617465203D20747275652C0D0A9O20206F70656E6572203D20747275652C0D0A9O2020706F74696F6E73203D2066616C73652C0D0A9O20207072696F726974697A654865616C4F6E546172676574203D20747275652C0D0A9O202072616369616C73203D20747275652C0D0A9O20206D6F6469666965724B65795061757365203D20747275652C0D0A9O20207472696E6B657431203D20747275652C0D0A9O20207472696E6B657432203D20747275652C0D0A8O207D2C0D0A8O207468726573686F6C64203D207B0D0A9O2020632O6F6C646F776E4D696E4865616C7468203D2031352C0D0A9O202064697370656C44656C6179203D2031302C0D0A9O2020696E74652O7275707443617374203D2032352C0D0A9O2020696E74652O727570744368612O6E656C203D2039302C0D0A9O2020696E74652O7275707444656C6179203D2031302C0D0A9O20207072656361737457696E646F77203D2033352C0D0A9O202070756C7365496E74657276616C203D2031302C0D0A8O207D2C0D0A8O206870203D207B0D0A9O20206865616C746873746F6E65203D2034302C0D0A9O2020706F74696F6E203D2032302C0D0A8O207D2C0D0A6O207D2C0D0A6O206672616D6573203D207B0D0A8O20722O6F74203D207B0D0A9O2020706F736974696F6E203D2022544F504C454654220D0A8O207D2C0D0A8O20746F2O676C6573203D207B0D0A9O2020636F6E666967203D2066616C73652C0D0A9O20206F6E203D20747275652C0D0A9O2020636473203D20747275652C0D0A9O2020616F65203D20747275652C0D0A9O2020706F736974696F6E203D207B0D0A9O203O20616E63686F72203D202243454E544552222C0D0A9O203O2078203D20302C0D0A9O203O2079203D20302C0D0A9O20207D2C0D0A9O2020656E61626C6564203D207B0D0A9O203O2073686F77546F2O676C6573203D20747275652C0D0A9O203O206C6F636B546F2O676C6573203D2066616C73652C0D0A9O20207D2C0D0A9O20207374796C65203D207B0D0A9O203O2073697A65203D207B0D0A9O205O20746F2O676C655769647468203D2034302C0D0A9O205O20746F2O676C65486569676874203D2032302C0D0A9O205O20746F2O676C6550612O64696E67203D20322C0D0A9O205O20746F2O676C654D617267696E203D20352C0D0A9O203O207D2C0D0A9O203O20636F6C6F72203D207B0D0A9O205O20746F2O676C65466F6E74456E61626C6564203D20226O46222C0D0A9O205O20746F2O676C65466F6E7444697361626C6564203D20226O61222C0D0A9O205O20746F2O676C6542752O746F6E456E61626C6564203D20226O31222C0D0A9O205O20746F2O676C6542752O746F6E44697361626C6564203D20226O32222C0D0A9O203O207D0D0A9O20207D2C0D0A8O207D2C0D0A8O206E616D65706C617465203D207B0D0A9O2020706F736974696F6E203D207B0D0A9O203O20616E63686F72203D202243454E544552220D0A9O20207D2C0D0A9O2020656E61626C6564203D207B0D0A9O203O2073686F774379636C6549636F6E203D20747275652C0D0A9O20207D0D0A8O207D2C0D0A6O207D2C0D0A6O2064697370656C73203D207B0D0A8O2062752O6673203D207B0D0A9O2020656E72616765203D207B0D0A9O203O20626C61636B6C697374203D207B7D2C0D0A9O203O2077686974656C697374203D207B7D2C0D0A9O20207D2C0D0A9O20206D61676963203D207B0D0A9O203O20626C61636B6C697374203D207B7D2C0D0A9O203O2077686974656C697374203D207B7D2C0D0A9O20207D2C0D0A8O207D2C0D0A8O20646562752O6673203D207B0D0A9O2020626C2O6564203D207B0D0A9O203O20626C61636B6C697374203D207B7D2C0D0A9O203O2077686974656C697374203D207B7D2C0D0A9O20207D2C0D0A9O20206375727365203D207B0D0A9O203O20626C61636B6C697374203D207B7D2C0D0A9O203O2077686974656C697374203D207B7D2C0D0A9O20207D2C0D0A9O202064697365617365203D207B0D0A9O203O20626C61636B6C697374203D207B7D2C0D0A9O203O2077686974656C697374203D207B7D2C0D0A9O20207D2C0D0A9O2020706F69736F6E203D207B0D0A9O203O20626C61636B6C697374203D207B7D2C0D0A9O203O2077686974656C697374203D207B7D2C0D0A9O20207D2C0D0A9O20206D61676963203D207B0D0A9O203O20626C61636B6C697374203D207B7D2C0D0A9O203O2077686974656C697374203D207B7D2C0D0A9O20207D2C0D0A8O207D2C0D0A6O207D2C0D0A6O20696E74652O7275707473203D207B0D0A8O206B69636B73203D207B0D0A9O2020626C61636B6C697374203D207B7D2C0D0A9O202077686974656C697374203D207B7D2C0D0A8O207D2C0D0A8O207374756E73203D207B0D0A9O2020626C61636B6C697374203D207B7D2C0D0A9O202077686974656C697374203D207B7D2C0D0A8O207D2C0D0A6O207D2C0D0A6O20696E70757473203D207B0D0A8O20626C61636B6C697374203D207B7D2C0D0A6O207D2C0D0A4O207D2C0D0A4O2070726F66696C65203D207B7D2C0D0A2O207D0D0A0D0A2O2073656C662E6462203D204C696253747562282241636544422D332E3022293A4E657728612O646F6E4E616D65202O2E20224442222C2064656661756C74732C2074727565290D0A2O207574696C732E52656D6F76654E6F6E6578697374656E744B6579732873656C662E64622E676C6F62616C2C2064656661756C74732E676C6F62616C2C207B2022626C61636B6C697374222C202277686974656C69737422207D290D0A2O2073656C663A496E697450726F66696C657328290D0A656E640D0A0D0A66756E6374696F6E2057523A496E697450726F66696C657328290D0A2O20666F72207370656349442C20737065635461626C6520696E2070616972732873656C662E61706C732920646F0D0A4O206966206E6F742073656C662E64622E70726F66696C655B7370656349445D207468656E0D0A6O2073656C662E64622E70726F66696C655B7370656349445D203D207B7D0D0A4O20656E640D0A0D0A4O20666F722061706C4E616D652C2061706C5461626C6520696E20706169727328737065635461626C652920646F0D0A6O206966206E6F742073656C662E64622E70726F66696C655B7370656349445D5B61706C4E616D655D207468656E0D0A8O2073656C662E64622E70726F66696C655B7370656349445D5B61706C4E616D655D203D207574696C732E436F70795461626C6542794B65792861706C5461626C652E64656661756C7453652O74696E6773290D0A6O20656C73650D0A8O2073656C662E64622E70726F66696C655B7370656349445D5B61706C4E616D655D203D207574696C732E4D657267655461626C6542794B65792861706C5461626C652E64656661756C7453652O74696E67732C2073656C662E64622E70726F66696C655B7370656349445D5B61706C4E616D655D290D0A8O207574696C732E52656D6F76654E6F6E6578697374656E744B6579732873656C662E64622E70726F66696C655B7370656349445D5B61706C4E616D655D2C2061706C5461626C652E64656661756C7453652O74696E6773290D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A00063O0012063O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);