local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111]=v83[v111](v83[v111 + 1 ]);elseif (v86>1) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86<=3) then local v113=v85[2];v83[v113]=v83[v113](v83[v113 + 1 ]);elseif (v86>4) then v83[v85[2]]=v85[3];else do return;end end elseif (v86<=8) then if (v86<=6) then local v115=v85[2];v78=(v115 + v84) -1 ;for v118=v115,v78 do local v119=v79[v118-v115 ];v83[v118]=v119;end elseif (v86>7) then v83[v85[2]]=v85[3];else do return;end end elseif (v86<=9) then local v116=v85[2];v78=(v116 + v84) -1 ;for v121=v116,v78 do local v122=v79[v121-v116 ];v83[v121]=v122;end elseif (v86>10) then local v128=v85[2];v83[v128](v13(v83,v128 + 1 ,v78));else local v129=v85[2];v83[v129](v13(v83,v129 + 1 ,v78));end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67035C322O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206D756C74695370652O6C203D206170692E6D756C74695370652O6C0D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C730D0A6966206E6F74207370652O6C2E64656174684B6E69676874207468656E0D0A2O207370652O6C2E64656174684B6E69676874203D207B7D0D0A656E640D0A0D0A7370652O6C2E64656174684B6E696768742E636F2O6D6F6E73203D207B0D0A2O202O2D206162696C69746965730D0A2O2061626F6D696E6174696F6E4C696D62203D207370652O6C28333833323639292C0D0A2O20616E74694D616769635368652O6C203D207370652O6C283438373037292C0D0A2O20616E74694D616769635A6F6E65203D207370652O6C283531303532292C0D0A2O2061737068797869617465203D207370652O6C282O3231353632292C0D0A2O20612O73696D696C6174696F6E203D207370652O6C28333734333833292C0D0A2O20636861696E734F66496365203D207370652O6C28342O353234292C0D0A2O20636C656176696E67537472696B6573203D207370652O6C28333136393136292C0D0A2O20636F6E74726F6C556E64656164203D207370652O6C283O31363733292C0D0A2O206465617468416E644465636179203D207370652O6C283433323635292C0D0A2O206465617468436F696C203D207370652O6C283437353431292C0D0A2O20646561746847726970203D207370652O6C283439353736292C0D0A2O206465617468537472696B65203D207370652O6C28343O3938292C0D0A2O20656D706F77657252756E65576561706F6E203D207370652O6C283437353638292C0D0A2O20696365626F756E64466F72746974756465203D207370652O6C283438373932292C0D0A2O2069637954616C6F6E73203D207370652O6C28313934383738292C0D0A2O206D696E6446722O657A65203D207370652O6C283437353238292C0D0A2O207261697365412O6C79203D207370652O6C2836313O39292C0D0A2O20726169736544656164203D207370652O6C283436353835292C0D0A2O2072756E6963412O74656E756174696F6E203D207370652O6C28323037313034292C0D0A2O20736163726966696369616C50616374203D207370652O6C28333237353734292C0D0A2O20736F756C526561706572203D207370652O6C28333433323934292C0D0A2O20756E686F6C7947726F756E64203D207370652O6C28333734323635292C0D0A2O202O2D2062752O66730D0A2O2061626F6D696E6174696F6E4C696D6242752O66203D207370652O6C28333833323639292C0D0A2O206465617468416E64446563617942752O66203D207370652O6C28312O38323930292C0D0A2O2064656174687344756542752O66203D207370652O6C28333234313635292C202O2D20534C20436F76656E616E742E2052656D6F7665206166746572204446206C61756E63683F0D0A2O20656D706F77657252756E65576561706F6E42752O66203D207370652O6C283437353638292C0D0A2O2069637954616C6F6E7342752O66203D207370652O6C28313934383739292C0D0A2O20756E686F6C79537472656E67746842752O66203D207370652O6C28352O333635292C0D0A2O206465617468537472696B6542752O66203D207370652O6C28313031353638292C0D0A2O202O2D20646562752O66730D0A2O20626C2O6F64506C61677565446562752O66203D207370652O6C282O35303738292C0D0A2O2066726F73744665766572446562752O66203D207370652O6C282O35303935292C0D0A2O20736F756C526561706572446562752O66203D207370652O6C28333433323934292C0D0A2O20766972756C656E74506C61677565446562752O66203D207370652O6C28313931353837292C0D0A2O202O2D2072616369616C730D0A2O20616E6365737472616C43612O6C203D207370652O6C28323734373338292C0D0A2O20617263616E6550756C7365203D207370652O6C28323630333634292C0D0A2O20617263616E65546F2O72656E74203D207370652O6C283530363133292C0D0A2O206261674F66547269636B73203D207370652O6C28333132342O31292C0D0A2O206265727365726B696E67203D207370652O6C283236323937292C0D0A2O20626C2O6F6446757279203D207370652O6C283230353732292C0D0A2O2066697265626C2O6F64203D207370652O6C283236352O3231292C0D0A2O206C69676874734A7564676D656E74203D207370652O6C28322O35363437292C0D0A2O202O2D20637573746F6D0D0A2O20702O6F6C203D207370652O6C284O393130290D0A7D0D0A0D0A7370652O6C2E64656174684B6E696768742E626C2O6F64203D204D657267655461626C6542794B6579287370652O6C2E64656174684B6E696768742E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O20626C2O6F64426F696C203D207370652O6C283530383432292C0D0A2O20626C2O6F64546170203D207370652O6C282O3231362O39292C0D0A2O20626C2O6F2O6472696E6B6572203D207370652O6C28323036393331292C0D0A2O20626F6E6573746F726D203D207370652O6C28313934382O34292C0D0A2O20636F6167756C6F7061746879203D207370652O6C28333931342O37292C0D0A2O20636F6E73756D7074696F6E203D207370652O6C28323734313536292C0D0A2O2064616E63696E6752756E65576561706F6E203D207370652O6C283439303238292C0D0A2O20646561746873436172652O73203D207370652O6C28313935323932292C0D0A2O20676F72656669656E64734772617370203D207370652O6C28313038312O39292C0D0A2O206865617274537472696B65203D207370652O6C28323036393330292C0D0A2O206865617274627265616B6572203D207370652O6C282O3231353336292C0D0A2O20696E7361746961626C65426C616465203D207370652O6C28332O37363337292C0D0A2O206D612O726F7772656E64203D207370652O6C28313935313832292C0D0A2O2072617069644465636F6D706F736974696F6E203D207370652O6C283139342O3632292C0D0A2O2072656C697368696E426C2O6F64203D207370652O6C28333137363130292C0D0A2O2072756E65546170203D207370652O6C28313934363739292C0D0A2O2073616E6775696E6547726F756E64203D207370652O6C28333931343538292C0D0A2O207368612O746572696E67426F6E65203D207370652O6C28332O37363430292C0D0A2O207469676874656E696E674772617370203D207370652O6C28323036393730292C0D0A2O20746F6D6273746F6E65203D207370652O6C28323139383039292C0D0A2O2076616D7069726963426C2O6F64203D207370652O6C282O35322O33292C0D0A2O202O2D2062752O66730D0A2O20626F6E65536869656C6442752O66203D207370652O6C28313935313831292C0D0A2O20636F6167756C6F706174687942752O66203D207370652O6C28333931343831292C0D0A2O206372696D736F6E53636F7572676542752O66203D207370652O6C28382O313431292C0D0A2O2064616E63696E6752756E65576561706F6E42752O66203D207370652O6C283831323536292C0D0A2O2068656D6F73746173697342752O66203D207370652O6C28323733393437292C0D0A2O20696365626F756E64466F7274697475646542752O66203D207370652O6C283438373932292C0D0A2O2072756E6554617042752O66203D207370652O6C28313934363739292C0D0A2O2076616D7069726963426C2O6F6442752O66203D207370652O6C282O35322O33292C0D0A2O2076616D7069726963537472656E67746842752O66203D207370652O6C28343038333536292C202O2D2074696572203330203470630D0A7D290D0A0D0A7370652O6C2E64656174684B6E696768742E66726F7374203D204D657267655461626C6542794B6579287370652O6C2E64656174684B6E696768742E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O206176616C616E636865203D207370652O6C28323037313432292C0D0A2O20626974696E67436F6C64203D207370652O6C28332O37303536292C0D0A2O206272656174686F6653696E647261676F7361203D207370652O6C2831352O323739292C0D0A2O206368692O6C53747265616B203D207370652O6C28333035333932292C0D0A2O20636F6C644865617274203D207370652O6C28323831323038292C0D0A2O206576657266726F7374203D207370652O6C28333736393338292C0D0A2O20666174616C4669786174696F6E203D207370652O6C28343035312O36292C0D0A2O2066726F7374736379746865203D207370652O6C28323037323330292C0D0A2O2066726F7374537472696B65203D207370652O6C283439313433292C0D0A2O2066726F73747779726D7346757279203D207370652O6C28323739333032292C0D0A2O20676174686572696E6753746F726D203D207370652O6C28313934393132292C0D0A2O20676C616369616C416476616E6365203D207370652O6C28313934393133292C0D0A2O20686F726E4F6657696E746572203D207370652O6C2835372O3330292C0D0A2O20686F776C696E67426C617374203D207370652O6C283439313834292C0D0A2O20696365627265616B6572203D207370652O6C28333932393530292C0D0A2O20696365636170203D207370652O6C28323037313236292C0D0A2O20696D70726F7665644F626C69746572617465203D207370652O6C28333137313938292C0D0A2O206D696768744F6654686546726F7A656E576173746573203D207370652O6C2838313O33292C0D0A2O206F626C69746572617465203D207370652O6C283439303230292C0D0A2O206F626C697465726174696F6E203D207370652O6C28323831323338292C0D0A2O2070692O6C61724F6646726F7374203D207370652O6C283531323731292C0D0A2O20726167654F6654686546726F7A656E4368616D70696F6E203D207370652O6C28332O37303736292C0D0A2O2072656D6F7273656C652O7357696E746572203D207370652O6C283139362O3730292C0D0A2O207368612O746572696E67426C616465203D207370652O6C28323037303537292C0D0A2O20756E6C6561736865644672656E7A79203D207370652O6C28333736393035292C0D0A2O202O2D2062752O66730D0A2O20636F6C64486561727442752O66203D207370652O6C28323831323039292C0D0A2O20676174686572696E6753746F726D42752O66203D207370652O6C28322O31383035292C0D0A2O206B692O6C696E674D616368696E6542752O66203D207370652O6C28352O313234292C0D0A2O2070692O6C61726F6646726F737442752O66203D207370652O6C283531323731292C0D0A2O2072696D6542752O66203D207370652O6C283539303532292C0D0A2O20756E6C6561736865644672656E7A7942752O66203D207370652O6C28333736393037292C0D0A2O202O2D20646562752O66730D0A2O2072617A6F72696365446562752O66203D207370652O6C283531373134290D0A7D290D0A0D0A7370652O6C2E64656174684B6E696768742E756E686F6C79203D204D657267655461626C6542794B6579287370652O6C2E64656174684B6E696768742E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O2061706F63616C79707365203D207370652O6C28323735362O39292C0D0A2O2061726D794F6654686544616D6E6564203D207370652O6C28323736383337292C0D0A2O2061726D794F6654686544656164203D207370652O6C283432363530292C0D0A2O206275727374696E67536F726573203D207370652O6C28323037323634292C0D0A2O20636C6177696E67536861646F7773203D207370652O6C28323037332O31292C0D0A2O20636F696C4F664465766173746174696F6E203D207370652O6C28333930323730292C0D0A2O20636F2O6D616E6465724F6654686544656164203D207370652O6C28333930323539292C0D0A2O206461726B5472616E73666F726D6174696F6E203D207370652O6C283633353630292C0D0A2O20646566696C65203D207370652O6C2831352O323830292C0D0A2O2065626F6E4665766572203D207370652O6C28323037323639292C0D0A2O2065706964656D6963203D207370652O6C28323037333137292C0D0A2O20657465726E616C41676F6E79203D207370652O6C28333930323638292C0D0A2O20666573746572696E67537472696B65203D207370652O6C283835393438292C0D0A2O206665737465726D69676874203D207370652O6C28332O37353930292C0D0A2O2067686F756C6973684672656E7A79203D207370652O6C28332O37353837292C0D0A2O20696D70726F7665644465617468436F696C203D207370652O6C28332O37353830292C0D0A2O20696E666563746564436C617773203D207370652O6C28323037323732292C0D0A2O206D6F72626964697479203D207370652O6C28332O37353932292C0D0A2O206F7574627265616B203D207370652O6C282O37353735292C0D0A2O2070657374696C656E6365203D207370652O6C28322O37323334292C0D0A2O20706C616775656272696E676572203D207370652O6C28333930313735292C0D0A2O20726169736544656164203D207370652O6C283436353834292C0D0A2O20726F2O74656E546F756368203D207370652O6C28333930323735292C0D0A2O2073636F75726765537472696B65203D207370652O6C282O35303930292C0D0A2O2073752O6D6F6E476172676F796C65203D206D756C74695370652O6C2834393230362C20323037333439292C0D0A2O20737570657273747261696E203D207370652O6C28333930323833292C0D0A2O20756E686F6C79412O7361756C74203D207370652O6C28323037323839292C0D0A2O20756E686F6C79426C69676874203D207370652O6C282O3135393839292C0D0A2O20756E686F6C79436F2O6D616E64203D207370652O6C28333136393431292C0D0A2O20756E686F6C7950616374203D207370652O6C28333139323330292C0D0A2O2076696C65436F6E746167696F6E203D207370652O6C28333930323739292C0D0A2O202O2D2062752O66730D0A2O20636F2O6D616E6465724F665468654465616442752O66203D207370652O6C28333930323630292C0D0A2O206665737465726D6967687442752O66203D207370652O6C28332O37353931292C0D0A2O20706C616775656272696E67657242752O66203D207370652O6C28333930313738292C0D0A2O2072756E6963436F2O72757074696F6E42752O66203D207370652O6C283531343630292C0D0A2O2073752O64656E442O6F6D42752O66203D207370652O6C283831333430292C0D0A2O20756E686F6C79412O7361756C7442752O66203D207370652O6C28323037323839292C0D0A2O202O2D20646562752O66730D0A2O206465617468526F74446562752O66203D207370652O6C28332O37353430292C0D0A2O20666573746572696E67576F756E64446562752O66203D207370652O6C28313934333130292C0D0A2O20726F2O74656E546F756368446562752O66203D207370652O6C28333930323736292C0D0A2O20756E686F6C79426C69676874446562752O66203D207370652O6C282O31352O3934292C0D0A7D290D0A0D0A2O2D206974656D730D0A6966206E6F74206974656D2E64656174684B6E69676874207468656E0D0A2O206974656D2E64656174684B6E69676874203D207B7D0D0A656E640D0A6974656D2E64656174684B6E696768742E636F2O6D6F6E73203D207B0D0A2O202O2D207472696E6B6574730D0A2O20616C67657468617250752O7A6C65426F78203D206974656D283139333730312C207B2031332C203134207D292C0D0A2O2069726964657573467261676D656E74203D206974656D283139333734332C207B2031332C203134207D292C0D0A2O207669616C6F66416E696D61746564426C2O6F64203D206974656D283135393632352C207B2031332C203134207D292C0D0A7D0D0A0D0A6974656D2E64656174684B6E696768742E626C2O6F64203D204D657267655461626C6542794B6579286974656D2E64656174684B6E696768742E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E64656174684B6E696768742E66726F7374203D204D657267655461626C6542794B6579286974656D2E64656174684B6E696768742E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E64656174684B6E696768742E756E686F6C79203D204D657267655461626C6542794B6579286974656D2E64656174684B6E696768742E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F730D0A6966206E6F74206D6163726F2E64656174684B6E69676874207468656E0D0A2O206D6163726F2E64656174684B6E69676874203D207B7D0D0A656E640D0A6D6163726F2E64656174684B6E696768742E636F2O6D6F6E73203D207B0D0A2O202O2D207370652O6C730D0A2O20617370687978696174654D6F7573656F766572203D206D6163726F2822617370687978696174654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E636F2O6D6F6E732E617370687978696174653A4E616D65282O292C0D0A2O20616E74694D616769635A6F6E65437572736F72203D206D6163726F2822616E74694D616769635A6F6E65437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E64656174684B6E696768742E636F2O6D6F6E732E616E74694D616769635A6F6E653A4E616D65282O292C0D0A2O20636F6E74726F6C556E646561644D6F7573656F766572203D206D6163726F2822636F6E74726F6C556E646561644D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E636F2O6D6F6E732E636F6E74726F6C556E646561643A4E616D65282O292C0D0A2O206465617468416E644465636179437572736F72203D206D6163726F28226465617468416E644465636179437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E64656174684B6E696768742E636F2O6D6F6E732E6465617468416E6444656361793A4E616D65282O292C0D0A2O206465617468416E644465636179506C61796572203D206D6163726F28226465617468416E644465636179506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64656174684B6E696768742E636F2O6D6F6E732E6465617468416E6444656361793A4E616D65282O292C0D0A2O206465617468477269704D6F7573656F766572203D206D6163726F28226465617468477269704D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E636F2O6D6F6E732E6465617468477269703A4E616D65282O292C0D0A2O206D696E6446722O657A654D6F7573656F766572203D206D6163726F28226D696E6446722O657A654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E636F2O6D6F6E732E6D696E6446722O657A653A4E616D65282O292C0D0A2O207261697365412O6C794D6F7573656F766572203D206D6163726F28227261697365412O6C794D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E636F2O6D6F6E732E7261697365412O6C793A4E616D65282O292C0D0A2O20736F756C5265617065724D6F7573656F766572203D206D6163726F2822736F756C5265617065724D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E636F2O6D6F6E732E736F756C5265617065723A4E616D65282O292C0D0A2O202O2D206974656D730D0A2O20616C67657468617250752O7A6C65426F78203D206D6163726F2822616C67657468617250752O7A6C65426F78222C20222F757365206974656D3A31393337303122292C0D0A2O2069726964657573467261676D656E74203D206D6163726F282269726964657573467261676D656E74222C20222F757365206974656D3A31393337343322292C0D0A2O207669616C6F66416E696D61746564426C2O6F64203D206D6163726F28227669616C6F66416E696D61746564426C2O6F64222C20222F757365206974656D3A31353936323522292C0D0A7D0D0A0D0A6D6163726F2E64656174684B6E696768742E626C2O6F64203D204D657267655461626C6542794B6579286D6163726F2E64656174684B6E696768742E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6D6163726F2E64656174684B6E696768742E66726F7374203D204D657267655461626C6542794B6579286D6163726F2E64656174684B6E696768742E636F2O6D6F6E732C207B0D0A2O2066726F7374537472696B654D6F7573656F766572203D206D6163726F282266726F7374537472696B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E66726F73742E66726F7374537472696B653A4E616D65282O292C0D0A2O206F626C697465726174654D6F7573656F766572203D206D6163726F28226F626C697465726174654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E66726F73742E6F626C697465726174653A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E64656174684B6E696768742E756E686F6C79203D204D657267655461626C6542794B6579286D6163726F2E64656174684B6E696768742E636F2O6D6F6E732C207B0D0A2O202O2D207370652O6C730D0A2O2061706F63616C797073654D6F7573656F766572203D206D6163726F282261706F63616C797073654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E756E686F6C792E61706F63616C797073653A4E616D65282O292C0D0A2O20636C6177696E67536861646F77734D6F7573656F766572203D206D6163726F2822636C6177696E67536861646F77734D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E756E686F6C792E636C6177696E67536861646F77733A4E616D65282O292C0D0A2O20646566696C65506C61796572203D206D6163726F2822646566696C65506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E64656174684B6E696768742E756E686F6C792E646566696C653A4E616D65282O292C0D0A2O20666573746572696E67537472696B654D6F7573656F766572203D206D6163726F2822666573746572696E67537472696B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E756E686F6C792E666573746572696E67537472696B653A4E616D65282O292C0D0A2O206F7574627265616B4D6F7573656F766572203D206D6163726F28226F7574627265616B4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E756E686F6C792E6F7574627265616B3A4E616D65282O292C0D0A2O2073636F75726765537472696B654D6F7573656F766572203D206D6163726F282273636F75726765537472696B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E756E686F6C792E73636F75726765537472696B653A4E616D65282O292C0D0A2O20756E686F6C79412O7361756C744D6F7573656F766572203D206D6163726F2822756E686F6C79412O7361756C744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E756E686F6C792E756E686F6C79412O7361756C743A4E616D65282O292C0D0A2O2076696C65436F6E746167696F6E4D6F7573656F766572203D206D6163726F282276696C65436F6E746167696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E64656174684B6E696768742E756E686F6C792E76696C65436F6E746167696F6E3A4E616D65282O292C0D0A7D290D0A0D0A2O2D206576656E74730D0A6C6F63616C206F6E6552756E655370656E64657273203D207B2034323635302C202O353039302C20323037332O312C2034333236352C2031352O3238302C202O373537352C202O31353938392C20342O3532342C20333731342C203334333239342C203O31363733207D0D0A6170692E67686F756C5461626C65203D207B0D0A2O2073752O6D6F6E656447686F756C203D206E696C2C0D0A2O2073752O6D6F6E45787069726174696F6E203D206E696C2C0D0A2O2073752O6D6F6E6564476172676F796C65203D206E696C2C0D0A2O20676172676F796C6545787069726174696F6E203D206E696C2C0D0A2O2061706F634D6167757345787069726174696F6E203D20302C0D0A2O2061726D794D6167757345787069726174696F6E203D20302C0D0A7D0D0A0D0A66756E6374696F6E206170692E5265676973746572446B4576656E747328290D0A2O206170693A5265676973746572466F7253656C66436F6D6261744576656E742866756E6374696F6E285F2C205F2C205F2C205F2C205F2C205F2C205F2C2064657374475549442C205F2C205F2C205F2C207370652O6C4964290D0A4O206966207370652O6C4964202O3D203436353835207468656E0D0A6O206170692E67686F756C5461626C652E73752O6D6F6E656447686F756C203D2064657374475549440D0A6O206170692E67686F756C5461626C652E73752O6D6F6E45787069726174696F6E203D2047657454696D652829202B2036300D0A4O20656E640D0A4O206966207370652O6C4964202O3D203439323036206F72207370652O6C4964202O3D20323037333439207468656E0D0A6O206170692E67686F756C5461626C652E73752O6D6F6E6564476172676F796C65203D2064657374475549440D0A6O206170692E67686F756C5461626C652E676172676F796C6545787069726174696F6E203D2047657454696D652829202B2032350D0A4O20656E640D0A2O20656E642C20225350452O4C5F53552O4D4F4E22290D0A0D0A2O206170693A5265676973746572466F7253656C66436F6D6261744576656E742866756E6374696F6E285F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C207370652O6C4964290D0A4O206966207370652O6C4964202O3D20333237353734207468656E0D0A6O206170692E67686F756C5461626C652E73752O6D6F6E656447686F756C203D206E696C0D0A6O206170692E67686F756C5461626C652E73752O6D6F6E45787069726174696F6E203D206E696C0D0A4O20656E640D0A4O20696620706C617965723A486173546965722833312C20342920616E6420286170692E67686F756C5461626C652E61706F634D6167757345787069726174696F6E203E2030206F72206170692E67686F756C5461626C652E61726D794D6167757345787069726174696F6E203E203029207468656E0D0A6O206966207370652O6C4964202O3D203835393438207468656E0D0A8O206966206170692E67686F756C5461626C653A41706F634D616775734163746976652829207468656E0D0A9O20206170692E67686F756C5461626C652E61706F634D6167757345787069726174696F6E203D206170692E67686F756C5461626C652E61706F634D6167757345787069726174696F6E202B20310D0A8O20656E640D0A8O206966206170692E67686F756C5461626C653A41726D794D616775734163746976652829207468656E0D0A9O20206170692E67686F756C5461626C652E61726D794D6167757345787069726174696F6E203D206170692E67686F756C5461626C652E61726D794D6167757345787069726174696F6E202B20310D0A8O20656E640D0A6O20656E640D0A6O20666F722069203D20312C20236F6E6552756E655370656E6465727320646F0D0A8O206966206F6E6552756E655370656E646572735B695D202O3D207370652O6C4964207468656E0D0A9O20206966206170692E67686F756C5461626C653A41706F634D616775734163746976652829207468656E0D0A9O203O206170692E67686F756C5461626C652E61706F634D6167757345787069726174696F6E203D206170692E67686F756C5461626C652E61706F634D6167757345787069726174696F6E202B20302E350D0A9O2020656E640D0A9O20206966206170692E67686F756C5461626C653A41726D794D616775734163746976652829207468656E0D0A9O203O206170692E67686F756C5461626C652E61726D794D6167757345787069726174696F6E203D206170692E67686F756C5461626C652E61726D794D6167757345787069726174696F6E202B20302E350D0A9O2020656E640D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A4O20696620706C617965723A486173546965722833312C20322920616E64207370652O6C4964202O3D20323735362O39207468656E0D0A6O206170692E67686F756C5461626C652E61706F634D6167757345787069726174696F6E203D2047657454696D652829202B2032300D0A4O20656E640D0A4O20696620706C617965723A486173546965722833312C20322920616E64207370652O6C4964202O3D203432363530207468656E0D0A6O206170692E67686F756C5461626C652E61726D794D6167757345787069726174696F6E203D2047657454696D652829202B2033300D0A4O20656E640D0A2O20656E642C20225350452O4C5F434153545F53552O43452O5322290D0A0D0A2O206170693A5265676973746572466F72436F6D6261744576656E742866756E6374696F6E285F2C205F2C205F2C205F2C205F2C205F2C205F2C206465737447554944290D0A4O206966206465737447554944202O3D206170692E67686F756C5461626C652E73752O6D6F6E656447686F756C207468656E0D0A6O206170692E67686F756C5461626C652E73752O6D6F6E656447686F756C203D206E696C0D0A6O206170692E67686F756C5461626C652E73752O6D6F6E45787069726174696F6E203D206E696C0D0A4O20656E640D0A4O206966206465737447554944202O3D206170692E67686F756C5461626C652E73752O6D6F6E6564476172676F796C65207468656E0D0A6O206170692E67686F756C5461626C652E73752O6D6F6E6564476172676F796C65203D206E696C0D0A6O206170692E67686F756C5461626C652E676172676F796C6545787069726174696F6E203D206E696C0D0A4O20656E640D0A2O20656E642C2022554E49545F44455354524F59454422290D0A656E640D0A0D0A2O2D20747261636B65722066756E6374696F6E730D0A66756E6374696F6E206170692E67686F756C5461626C653A47686F756C52656D61696E7328290D0A2O206966206170692E67686F756C5461626C652E73752O6D6F6E45787069726174696F6E202O3D206E696C207468656E0D0A4O2072657475726E20300D0A2O20656E640D0A2O2072657475726E206170692E67686F756C5461626C652E73752O6D6F6E45787069726174696F6E202D2047657454696D6528290D0A656E640D0A0D0A66756E6374696F6E206170692E67686F756C5461626C653A47686F756C41637469766528290D0A2O2072657475726E206170692E67686F756C5461626C652E73752O6D6F6E656447686F756C207E3D206E696C20616E64206170692E67686F756C5461626C653A47686F756C52656D61696E732829203E20300D0A656E640D0A0D0A66756E6374696F6E206170692E67686F756C5461626C653A4761726752656D61696E7328290D0A2O206966206170692E67686F756C5461626C652E676172676F796C6545787069726174696F6E202O3D206E696C207468656E0D0A4O2072657475726E20300D0A2O20656E640D0A2O2072657475726E206170692E67686F756C5461626C652E676172676F796C6545787069726174696F6E202D2047657454696D6528290D0A656E640D0A0D0A66756E6374696F6E206170692E67686F756C5461626C653A4761726741637469766528290D0A2O2072657475726E206170692E67686F756C5461626C652E73752O6D6F6E6564476172676F796C65207E3D206E696C20616E64206170692E67686F756C5461626C653A4761726752656D61696E732829203E20300D0A656E640D0A0D0A66756E6374696F6E206170692E67686F756C5461626C653A41726D794D6167757352656D61696E7328290D0A2O2072657475726E206170692E67686F756C5461626C652E61726D794D6167757345787069726174696F6E202D2047657454696D6528290D0A656E640D0A0D0A66756E6374696F6E206170692E67686F756C5461626C653A41726D794D6167757341637469766528290D0A2O2072657475726E206170692E67686F756C5461626C653A41726D794D6167757352656D61696E732829203E20300D0A656E640D0A0D0A66756E6374696F6E206170692E67686F756C5461626C653A41706F634D6167757352656D61696E7328290D0A2O2072657475726E206170692E67686F756C5461626C652E61706F634D6167757345787069726174696F6E202D2047657454696D6528290D0A656E640D0A0D0A66756E6374696F6E206170692E67686F756C5461626C653A41706F634D6167757341637469766528290D0A2O2072657475726E206170692E67686F756C5461626C653A41706F634D6167757352656D61696E732829203E20300D0A656E640D0A00063O0012013O00013O001208000100024O00033O000200022O000600016O000B5O00012O00073O00017O00",v9(),...);