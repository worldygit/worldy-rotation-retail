local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110]=v83[v110](v83[v110 + 1 ]);elseif (v86>1) then local v113=v85[2];v83[v113](v13(v83,v113 + 1 ,v78));else v83[v85[2]]=v85[3];end elseif (v86<=4) then if (v86>3) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v116;local v117;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v83[v117]=v83[v117](v83[v117 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v78=(v117 + v84) -1 ;for v125=v117,v78 do v116=v79[v125-v117 ];v83[v125]=v116;end v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v83[v117](v13(v83,v117 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86>5) then do return;end else local v123=v85[2];v78=(v123 + v84) -1 ;for v128=v123,v78 do local v129=v79[v128-v123 ];v83[v128]=v129;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67032B432O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206D756C74695370652O6C203D206170692E6D756C74695370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C0D0A6966206E6F74207370652O6C2E707269657374207468656E0D0A2O207370652O6C2E707269657374203D207B7D0D0A656E640D0A7370652O6C2E7072696573742E636F2O6D6F6E73203D207B0D0A2O202O2D2072616369616C730D0A2O20616E6365737472616C43612O6C203D207370652O6C28323734373338292C0D0A2O20617263616E6550756C7365203D207370652O6C28323630333634292C0D0A2O20617263616E65546F2O72656E74203D207370652O6C283530363133292C0D0A2O206261676F66547269636B73203D207370652O6C28333132342O31292C0D0A2O206265727365726B696E67203D207370652O6C283236323937292C0D0A2O206265727365726B696E6742752O66203D207370652O6C283236323937292C0D0A2O20626C2O6F6446757279203D207370652O6C283230353732292C0D0A2O20626C2O6F644675727942752O66203D207370652O6C283230353732292C0D0A2O2066697265626C2O6F64203D207370652O6C283236352O3231292C0D0A2O206C69676874734A7564676D656E74203D207370652O6C28322O35363437292C0D0A2O202O2D206162696C69746965730D0A2O20626F6479616E64536F756C203D207370652O6C283634313239292C0D0A2O20626F6479616E64536F756C42752O66203D207370652O6C283635303831292C0D0A2O206465617468416E644D61646E652O73203D207370652O6C28333231323931292C0D0A2O20646573706572617465507261796572203D207370652O6C283139323336292C0D0A2O2064697370656C4D61676963203D207370652O6C28353238292C0D0A2O2066616465203D207370652O6C28353836292C0D0A2O20666C6173684865616C203D207370652O6C2832303631292C0D0A2O20686F6C794E6F7661203D207370652O6C28313332313537292C202O2D204D656C2O652C2031320D0A2O206D612O7344697370656C203D207370652O6C283332333735292C0D0A2O206D696E64426C617374203D207370652O6C2838303932292C0D0A2O206D696E6453656172203D207370652O6C283438303435292C202O2D2073706C6173682C2031300D0A2O20706F776572496E667573696F6E203D207370652O6C28312O303630292C0D0A2O20706F776572576F7264466F72746974756465203D207370652O6C283231353632292C0D0A2O20706F776572576F7264536869656C64203D207370652O6C283137292C0D0A2O207073796368696353637265616D203D207370652O6C2838312O32292C0D0A2O20707572696679203D207370652O6C28353237292C0D0A2O20696D70726F766564507572696679203D207370652O6C28333930363332292C0D0A2O20736861646F77576F72644465617468203D207370652O6C283332333739292C0D0A2O20736861646F77576F72645061696E203D207370652O6C28353839292C0D0A2O20736861646F77576F72645061696E446562752O66203D207370652O6C28353839292C0D0A2O20736D697465203D207370652O6C28353835292C0D0A2O20726573752O72656374696F6E203D207370652O6C28322O3036292C0D0A2O202O2D2074616C656E74730D0A2O20616E67656C696346656174686572203D207370652O6C28313231353336292C0D0A2O20616E67656C69634665617468657242752O66203D207370652O6C283132312O3537292C0D0A2O206C6561706F664661697468203D207370652O6C28372O333235292C0D0A2O206D696E6467616D6573203D207370652O6C28333735393031292C0D0A2O20736861646F776669656E64203D207370652O6C28332O342O33292C0D0A2O20736861636B6C65556E64656164203D207370652O6C2839343834292C0D0A2O20646F6D696E6174654D696E64203D207370652O6C28323035333634292C0D0A2O207472616E736C7563656E74496D616765203D207370652O6C283337332O3436292C0D0A2O207477696E734F6654686553756E507269657374652O73203D207370652O6C28333733342O36292C0D0A2O202O2D2042752O66730D0A2O20706F776572576F7264466F7274697475646542752O66203D207370652O6C283231353632292C0D0A2O202O2D20646562752O66730D0A2O202O2D206F746865720D0A2O20702O6F6C203D207370652O6C284O393130292C0D0A2O202O2D20706F74696F6E730D0A2O20706869616C4F665465706964566572736174696C69747942752O66203D207370652O6C2833372O313732290D0A7D0D0A0D0A7370652O6C2E7072696573742E736861646F77203D204D657267655461626C6542794B6579287370652O6C2E7072696573742E636F2O6D6F6E732C207B0D0A2O202O2D2042617365207370652O6C730D0A2O206D696E64466C6179203D207370652O6C283135343037292C0D0A2O20736861646F77666F726D203D207370652O6C28323332363938292C0D0A2O2076616D7069726963546F756368203D207370652O6C283334393134292C0D0A2O20766F6964426F6C74203D207370652O6C283230352O3438292C0D0A2O20766F69644572757074696F6E203D207370652O6C282O3238323630292C202O2D2073706C6173682C2031300D0A2O202O2D2074616C656E74730D0A2O20616E6369656E744D61646E652O73203D207370652O6C28333431323430292C0D0A2O2064616D6E6174696F6E203D207370652O6C28333431333734292C0D0A2O206461726B417363656E73696F6E203D207370652O6C2833392O313039292C0D0A2O206461726B566F6964203D207370652O6C2832362O333436292C0D0A2O206465617468537065616B6572203D207370652O6C28333932353037292C0D0A2O206465766F7572696E67506C61677565203D207370652O6C282O3335343637292C0D0A2O2064697370657273696F6E203D207370652O6C283437353835292C0D0A2O20646973746F727465645265616C697479203D207370652O6C28343039302O34292C0D0A2O20646976696E6553746172203D207370652O6C28312O32313231292C0D0A2O20666F727472652O734F665468654D696E64203D207370652O6C28313933313935292C0D0A2O2068616C6F203D207370652O6C28313230362O34292C0D0A2O2068756E676572696E67566F6964203D207370652O6C28333435323138292C0D0A2O2069646F6C4F66437468756E203D207370652O6C28332O37333439292C0D0A2O2069646F6C4F66596F2O675361726F6E203D207370652O6C28333733323733292C0D0A2O20696E657363617061626C65546F726D656E74203D207370652O6C28333733343237292C0D0A2O20696E736964696F7573497265203D207370652O6C28333733323132292C0D0A2O206D656E74616C4465636179203D207370652O6C283337352O3934292C0D0A2O206D696E6462656E646572203D207370652O6C28322O30313734292C0D0A2O206D696E644465766F75726572203D207370652O6C28333733323032292C0D0A2O206D696E64466C6179496E73616E697479203D207370652O6C28333931343033292C0D0A2O206D696E64466C6179496E73616E69747954616C656E74203D207370652O6C28333931332O39292C0D0A2O206D696E644D656C74203D207370652O6C28333931303930292C0D0A2O206D696E645370696B65203D207370652O6C283733353130292C0D0A2O206D696E645370696B65496E73616E697479203D207370652O6C28343037342O36292C0D0A2O206D6973657279203D207370652O6C283233382O3538292C0D0A2O20707379636869634C696E6B203D207370652O6C28312O39343834292C0D0A2O2070757269667944697365617365203D207370652O6C28323133363334292C0D0A2O2073637265616D734F66546865566F6964203D207370652O6C28333735373637292C0D0A2O2073656172696E674E696768746D617265203D207370652O6C28333431333835292C202O2D2073706C6173682C2031300D0A2O20736861646F774372617368203D207370652O6C28323035333835292C202O2D2073706C6173682C20380D0A2O20736861646F7779496E7369676874203D207370652O6C28333735393831292C0D0A2O2073696C656E6365203D207370652O6C283135343837292C0D0A2O2073757267654F664461726B6E652O73203D207370652O6C283136322O3438292C0D0A2O2073752O72656E646572546F4D61646E652O73203D207370652O6C2833312O393532292C0D0A2O2074776973746F6646617465203D207370652O6C28313039313432292C0D0A2O20756E6675726C696E674461726B6E652O73203D207370652O6C28333431323733292C0D0A2O20766F6964546F2O72656E74203D207370652O6C28323633313635292C0D0A2O20766F6964746F7563686564203D207370652O6C28343037343330292C0D0A2O2077686973706572696E67536861646F7773203D207370652O6C283430363O37292C0D0A2O202O2D2042752O66730D0A2O206461726B417363656E73696F6E42752O66203D207370652O6C2833392O313039292C0D0A2O206461726B4576616E67656C69736D42752O66203D207370652O6C28333931302O39292C0D0A2O206461726B54686F7567687442752O66203D207370652O6C28333431323037292C0D0A2O20646561746873546F726D656E7442752O66203D207370652O6C28343233373630292C202O2D2054696572203331203470630D0A2O206465617468737065616B657242752O66203D207370652O6C28333932352O31292C0D0A2O206465766F757265644665617242752O66203D207370652O6C2833372O333139292C202O2D2049646F6C206F6620592753682O61726A2062752O660D0A2O206465766F75726564507269646542752O66203D207370652O6C2833372O333136292C202O2D2049646F6C206F6620592753682O61726A2062752O660D0A2O206D696E644465766F7572657242752O66203D207370652O6C28333733323034292C0D0A2O206D696E64466C6179496E73616E69747942752O66203D207370652O6C28333931343031292C0D0A2O206D696E645370696B65496E73616E69747942752O66203D207370652O6C28343037343638292C0D0A2O20736861646F77666F726D42752O66203D207370652O6C28323332363938292C0D0A2O20736861646F7779496E736967687442752O66203D207370652O6C28333735393831292C0D0A2O2073757267654F664461726B6E652O7342752O66203D207370652O6C283837313630292C0D0A2O20756E6675726C696E674461726B6E652O7342752O66203D207370652O6C28333431323832292C0D0A2O20766F6964666F726D42752O66203D207370652O6C28313934323439292C0D0A2O202O2D20646562752O66730D0A2O206465766F7572696E67506C61677565446562752O66203D207370652O6C282O3335343637292C0D0A2O2068756E676572696E67566F6964446562752O66203D207370652O6C28333435323139292C0D0A2O2076616D7069726963546F756368446562752O66203D207370652O6C283334393134292C0D0A2O202O2D20746965722073657420452O66656374730D0A2O206461726B526576657269657342752O66203D207370652O6C28333934393633292C0D0A2O20676174686572696E67536861646F777342752O66203D207370652O6C28333934393631292C0D0A7D290D0A0D0A7370652O6C2E7072696573742E6469736369706C696E65203D204D657267655461626C6542794B6579287370652O6C2E7072696573742E636F2O6D6F6E732C207B0D0A2O202O2D207370652O6C730D0A2O2061746F6E656D656E7442752O66203D207370652O6C28313934333834292C0D0A2O2062696E64696E674865616C73203D207370652O6C28333638323735292C0D0A2O206461726B52657072696D616E64203D207370652O6C28342O30313639292C0D0A2O20646976696E6553746172203D207370652O6C282O3130372O34292C0D0A2O20646976696E6553746172536861646F77203D207370652O6C28312O32313231292C0D0A2O206576616E67656C69736D203D207370652O6C28323436323837292C0D0A2O20657870696174696F6E203D207370652O6C28333930383332292C0D0A2O2068616C6F203D207370652O6C28313230353137292C0D0A2O2068616C6F536861646F77203D207370652O6C28313230362O34292C0D0A2O2068617273684469736369706C696E65203D207370652O6C28333733313830292C0D0A2O2068617273684469736369706C696E6542752O66203D207370652O6C28333733313833292C0D0A2O206C69676874735772617468203D207370652O6C28333733313738292C0D0A2O206C6561706F664661697468203D207370652O6C28372O333235292C0D0A2O206C756D696E6F757342612O72696572203D207370652O6C28323731342O36292C0D0A2O206D612O73526573752O72656374696F6E203D207370652O6C28323132303336292C0D0A2O206D696E6462656E646572203D207370652O6C28313233303430292C0D0A2O207061696E53752O7072652O73696F6E203D207370652O6C282O33323036292C0D0A2O207061696E66756C50756E6973686D656E74203D207370652O6C28333930363836292C0D0A2O2070656E616E6365203D207370652O6C283437353430292C0D0A2O2070757267655468655769636B6564203D207370652O6C28323034313937292C0D0A2O2070757267655468655769636B6564446562752O66203D207370652O6C28323034323133292C0D0A2O20706F776572576F726442612O72696572203D207370652O6C283632363138292C0D0A2O20706F776572576F72644C696665203D207370652O6C28333733343831292C0D0A2O20706F776572576F726452616469616E6365203D207370652O6C28313934353039292C0D0A2O2072616469616E7450726F766964656E636542752O66203D207370652O6C28343130363338292C0D0A2O2072617074757265203D207370652O6C283437353336292C0D0A2O207261707475726542752O66203D207370652O6C283437353336292C0D0A2O2072656E6577203D207370652O6C28313339292C0D0A2O2072656E657742752O66203D207370652O6C28313339292C0D0A2O2072686170736F647942752O66203D207370652O6C28333930363336292C0D0A2O20736861646F77436F76656E616E74203D207370652O6C28333134383637292C0D0A2O20736861646F77436F76656E616E7442752O66203D207370652O6C28332O32313035292C0D0A2O20736861646F776669656E64203D207370652O6C28332O342O33292C0D0A2O207368612O746572656450657263657074696F6E73203D207370652O6C2833393O3132292C0D0A2O207370697269745368652O6C203D207370652O6C2831302O393634292C0D0A2O2073757267656F664C69676874203D207370652O6C282O3134322O35292C0D0A2O207477696C69676874457175696C69627269756D203D207370652O6C28333930373035292C0D0A2O207465486F6C7942752O66203D207370652O6C28333930373036292C0D0A2O207465536861646F7742752O66203D207370652O6C28333930373037292C0D0A2O20756C74696D61746550656E6974656E6365203D207370652O6C28343231343533292C0D0A2O20766F69645368696674203D207370652O6C28313038393638292C0D0A7D290D0A0D0A7370652O6C2E7072696573742E686F6C79203D204D657267655461626C6542794B6579287370652O6C2E7072696573742E636F2O6D6F6E732C207B0D0A2O202O2D207370652O6C730D0A2O20636972636C656F664865616C696E67203D207370652O6C283230342O3833292C0D0A2O20646976696E6548796D6E203D207370652O6C283634383433292C0D0A2O20656D70797265616C426C617A65203D207370652O6C28333732363136292C0D0A2O20656D70797265616C426C617A6542752O66203D207370652O6C28333732363137292C0D0A2O20677561726469616E537069726974203D207370652O6C28342O372O38292C0D0A2O206865616C203D207370652O6C2832303630292C0D0A2O20686F6C7946697265203D207370652O6C283134393134292C0D0A2O20686F6C7946697265446562752O66203D207370652O6C283134393134292C0D0A2O20686F6C794E6F7661203D207370652O6C28313332313537292C202O2D204D656C2O652C2031320D0A2O20686F6C79576F72644368617374697365203D207370652O6C282O38363235292C0D0A2O20686F6C79576F726453616E6374696679203D207370652O6C283334383631292C0D0A2O20686F6C79576F7264536572656E697479203D207370652O6C2832303530292C0D0A2O206C69676874776561766572203D207370652O6C283339302O3932292C0D0A2O206C6967687477656176657242752O66203D207370652O6C283339302O3933292C0D0A2O206D612O73526573752O72656374696F6E203D207370652O6C28323132303336292C0D0A2O2073796D626F6C6F66486F7065203D207370652O6C283634393031292C0D0A2O2073757267656F664C69676874203D207370652O6C282O3134322O35292C0D0A2O20706F776572576F72644C696665203D207370652O6C28333733343831292C0D0A2O207072617965726F664865616C696E67203D207370652O6C28353936292C0D0A2O207072617965726F664D656E64696E67203D207370652O6C282O33303736292C0D0A2O207072617965726F664D656E64696E6742752O66203D207370652O6C283431363335292C0D0A2O2072656E6577203D207370652O6C28313339292C0D0A2O2072656E657742752O66203D207370652O6C28313339292C0D0A2O202O2D2074616C656E74730D0A2O2061706F7468656F736973203D207370652O6C28322O30313833292C0D0A2O20646976696E6553746172203D207370652O6C282O3130372O34292C0D0A2O2068616C6F203D207370652O6C28313230353137292C0D0A2O20686F6C79576F726453616C766174696F6E203D207370652O6C28323635323032292C0D0A2O20707261796572436972636C65203D207370652O6C28333231332O37292C0D0A2O20707261796572436972636C6542752O66203D207370652O6C28333231333739292C0D0A2O2072686170736F647942752O66203D207370652O6C28333930363336292C0D0A7D290D0A0D0A2O2D206974656D730D0A6966206E6F74206974656D2E707269657374207468656E0D0A2O206974656D2E707269657374203D207B7D0D0A656E640D0A6974656D2E7072696573742E636F2O6D6F6E73203D207B0D0A2O202O2D207472696E6B6574730D0A2O20626561636F6E746F7468654265796F6E64203D206974656D283230333936332C207B2031332C203134207D292C0D0A2O2062656C6F2O72656C6F7374686553756E63612O6C6572203D206974656D283230373137322C207B31332C2031347D292C0D0A2O20646573706572617465496E766F6B657273436F646578203D206974656D283139343331302C207B2031332C203134207D292C0D0A2O20646D6444616E6365203D206974656D28313938302O382C207B2031332C203134207D292C0D0A2O20646D6444616E6365426F78203D206974656D283139383437382C207B2031332C203134207D292C0D0A2O20646D64496E6665726E6F203D206974656D283139383038362C207B2031332C203134207D292C0D0A2O20646D64496E6665726E6F426F78203D206974656D283139343837322C207B2031332C203134207D292C0D0A2O20646D6452696D65203D206974656D283139383038372C207B2031332C203134207D292C0D0A2O20646D6452696D65426F78203D206974656D28313938342O372C207B2031332C203134207D292C0D0A2O206572757074696E675370656172467261676D656E74203D206974656D283139333736392C207B2031332C203134207D292C0D0A2O206E796D756573556E726176656C696E675370696E646C65203D206974656D283230383631352C207B31332C2031347D292C0D0A2O20766F69646D656E64657273536861646F7767656D203D206974656D282O313O30372C207B2031332C203134207D292C0D0A2O20776172644F66466163656C652O73497265203D206974656D283230333731342C207B2031332C203134207D292C0D0A2O20736D6F6C646572696E67532O65646C696E67203D206974656D283230373137302C207B2031332C203134207D292C0D0A2O202O2D204F74686572204974656D730D0A2O20647265616D62696E646572203D206974656D283230383631362C207B31367D292C0D0A2O2069726964616C203D206974656D283230383332312C207B31367D292C0D0A2O202O2D20706F74696F6E730D0A2O20706869616C4F665465706964566572736174696C697479203D206974656D28313931333431290D0A7D0D0A0D0A6974656D2E7072696573742E736861646F77203D204D657267655461626C6542794B6579286974656D2E7072696573742E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E7072696573742E6469736369706C696E65203D204D657267655461626C6542794B6579286974656D2E7072696573742E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E7072696573742E686F6C79203D204D657267655461626C6542794B6579286974656D2E7072696573742E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F730D0A6966206E6F74206D6163726F2E707269657374207468656E0D0A2O206D6163726F2E707269657374203D207B7D0D0A656E640D0A6D6163726F2E7072696573742E636F2O6D6F6E73203D207B0D0A2O202O2D206974656D730D0A2O20626561636F6E746F7468654265796F6E64203D206D6163726F2822626561636F6E746F7468654265796F6E64222C20222F757365206974656D3A32303339363322292C0D0A2O2062656C6F2O72656C6F7374686553756E63612O6C6572203D206D6163726F282262656C6F2O72656C6F7374686553756E63612O6C6572222C20222F757365206974656D3A32303731373222292C0D0A2O20646573706572617465496E766F6B657273436F646578203D206D6163726F2822646573706572617465496E766F6B657273436F646578222C20222F757365206974656D3A31393433313022292C0D0A2O20646D6444616E6365203D206D6163726F2822646D6444616E6365222C20222F757365206974656D3A313938302O3822292C0D0A2O20646D6444616E6365426F78203D206D6163726F2822646D6444616E6365426F78222C20222F757365206974656D3A31393834373822292C0D0A2O20646D64496E6665726E6F203D206D6163726F2822646D64496E6665726E6F222C20222F757365206974656D3A31393830383622292C0D0A2O20646D64496E6665726E6F426F78203D206D6163726F2822646D64496E6665726E6F426F78222C20222F757365206974656D3A31393438373222292C0D0A2O20646D6452696D65203D206D6163726F2822646D6452696D65222C20222F757365206974656D3A31393830383722292C0D0A2O20646D6452696D65426F78203D206D6163726F2822646D6452696D65426F78222C20222F757365206974656D3A313938342O3722292C0D0A2O206572757074696E675370656172467261676D656E74437572736F72203D206D6163726F28226572757074696E675370656172467261676D656E74437572736F72222C20222F757365205B40637572736F725D206974656D3A31393337363922292C0D0A2O206E796D756573556E726176656C696E675370696E646C65203D206D6163726F28226E796D756573556E726176656C696E675370696E646C65222C20222F757365206974656D3A32303836313522292C0D0A2O20766F69646D656E64657273536861646F7767656D203D206D6163726F2822766F69646D656E64657273536861646F7767656D222C20222F757365206974656D3A2O313O303722292C0D0A2O20776172644F66466163656C652O73497265466F637573203D206D6163726F2822776172644F66466163656C652O73497265466F637573222C20222F757365205B40666F6375735D206974656D3A32303337313422292C0D0A2O20736D6F6C646572696E67532O65646C696E67203D206D6163726F2822736D6F6C646572696E67532O65646C696E67222C20222F757365206974656D3A32303731373022202O2E20225C6E22202O2E20222F746172676574657861637420547265616E7420532O65646C696E6722202O2E20225C6E22202O2E20222F666F63757322292C0D0A2O20647265616D62696E646572203D206D6163726F2822647265616D62696E646572222C20222F757365206974656D3A32303836313622292C0D0A2O2069726964616C203D206D6163726F282269726964616C222C20222F757365206974656D3A32303833323122292C0D0A0D0A2O202O2D207370652O6C730D0A2O20616E67656C696346656174686572506C61796572203D206D6163726F2822616E67656C696346656174686572506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E616E67656C6963466561746865723A4E616D65282O292C0D0A2O2064697370656C4D616769634D6F7573656F766572203D206D6163726F282264697370656C4D616769634D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E64697370656C4D616769633A4E616D65282O292C0D0A2O20646F6D696E6174654D696E644D6F7573656F766572203D206D6163726F2822646F6D696E6174654D696E644D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E646F6D696E6174654D696E643A4E616D65282O292C0D0A2O206C6561706F6646616974684D6F7573656F766572203D206D6163726F28226C6561706F6646616974684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E6C6561706F6646616974683A4E616D65282O292C0D0A2O206C6561706F664661697468466F637573203D206D6163726F28226C6561706F664661697468466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E6C6561706F6646616974683A4E616D65282O292C0D0A2O206D612O7344697370656C437572736F72203D206D6163726F28226D612O7344697370656C437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E6D612O7344697370656C3A4E616D65282O292C0D0A2O206D696E6467616D65734D6F7573656F766572203D206D6163726F28226D696E6467616D65734D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E6D696E6467616D65733A4E616D65282O292C0D0A2O20706F776572496E667573696F6E466F637573203D206D6163726F2822706F776572496E667573696F6E466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E706F776572496E667573696F6E3A4E616D65282O292C0D0A2O20706F776572496E667573696F6E4D6F7573656F766572203D206D6163726F2822706F776572496E667573696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E706F776572496E667573696F6E3A4E616D65282O292C0D0A2O20706F776572496E667573696F6E506C61796572203D206D6163726F2822706F776572496E667573696F6E506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E706F776572496E667573696F6E3A4E616D65282O292C0D0A2O20706F776572576F7264466F72746974756465506C61796572203D206D6163726F2822706F776572576F7264466F72746974756465506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E706F776572576F7264466F727469747564653A4E616D65282O292C0D0A2O20706F776572576F7264536869656C64466F637573203D206D6163726F2822706F776572576F7264536869656C64466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E706F776572576F7264536869656C643A4E616D65282O292C0D0A2O20706F776572576F7264536869656C64506C61796572203D206D6163726F2822706F776572576F7264536869656C64506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E706F776572576F7264536869656C643A4E616D65282O292C0D0A2O20706F776572576F7264536869656C644D6F7573656F766572203D206D6163726F2822706F776572576F7264536869656C644D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E706F776572576F7264536869656C643A4E616D65282O292C0D0A2O20707572696679466F637573203D206D6163726F2822707572696679466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E7075726966793A4E616D65282O292C0D0A2O207075726966794D6F7573656F766572203D206D6163726F28227075726966794D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E7075726966793A4E616D65282O292C0D0A2O20726573752O72656374696F6E4D6F7573656F766572203D206D6163726F2822726573752O72656374696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E726573752O72656374696F6E3A4E616D65282O292C0D0A2O20736861636B6C65556E646561644D6F7573656F766572203D206D6163726F2822736861636B6C65556E646561644D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E736861636B6C65556E646561643A4E616D65282O292C0D0A2O20736861646F77576F726444656174684D6F7573656F766572203D206D6163726F2822736861646F77576F726444656174684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E736861646F77576F726444656174683A4E616D65282O292C0D0A2O20736861646F77576F72645061696E4D6F7573656F766572203D206D6163726F2822736861646F77576F72645061696E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E636F2O6D6F6E732E736861646F77576F72645061696E3A4E616D65282O292C0D0A0D0A2O202O2D20706F74696F6E730D0A2O20706869616C4F665465706964566572736174696C697479203D206D6163726F2822706869616C4F665465706964566572736174696C697479222C20222F757365206974656D3A31393133343122292C0D0A2O200D0A2O202O2D206D6973630D0A2O2073746F7043617374696E67203D206D6163726F282273746F7043617374696E67222C20222F73746F7063617374696E6722292C0D0A7D0D0A0D0A6D6163726F2E7072696573742E6469736369706C696E65203D204D657267655461626C6542794B6579286D6163726F2E7072696573742E636F2O6D6F6E732C207B0D0A2O202O2D207370652O6C730D0A2O206461726B52657072696D616E64466F637573203D206D6163726F28226461726B52657072696D616E64466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E6461726B52657072696D616E643A4E616D65282O292C0D0A2O206461726B52657072696D616E644D6F7573656F766572203D206D6163726F28226461726B52657072696D616E644D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E6461726B52657072696D616E643A4E616D65282O292C0D0A2O20666C6173684865616C466F637573203D206D6163726F2822666C6173684865616C466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E666C6173684865616C3A4E616D65282O292C0D0A2O20666C6173684865616C4D6F7573656F766572203D206D6163726F2822666C6173684865616C4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E666C6173684865616C3A4E616D65282O292C0D0A2O207061696E53752O7072652O73696F6E466F637573203D206D6163726F28227061696E53752O7072652O73696F6E466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E7061696E53752O7072652O73696F6E3A4E616D65282O292C0D0A2O207061696E53752O7072652O73696F6E4D6F7573656F766572203D206D6163726F28227061696E53752O7072652O73696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E7061696E53752O7072652O73696F6E3A4E616D65282O292C0D0A2O2070656E616E6365466F637573203D206D6163726F282270656E616E6365466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E70656E616E63653A4E616D65282O292C0D0A2O2070656E616E63654D6F7573656F766572203D206D6163726F282270656E616E63654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E70656E616E63653A4E616D65282O292C0D0A2O20706F776572576F726442612O72696572437572736F72203D206D6163726F2822706F776572576F726442612O72696572437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E706F776572576F726442612O726965723A4E616D65282O292C0D0A2O20706F776572576F72644C696665466F637573203D206D6163726F2822706F776572576F72644C696665466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E706F776572576F72644C6966653A4E616D65282O292C0D0A2O20706F776572576F72644C6966654D6F7573656F766572203D206D6163726F2822706F776572576F72644C6966654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E706F776572576F72644C6966653A4E616D65282O292C0D0A2O20706F776572576F726452616469616E6365466F637573203D206D6163726F2822706F776572576F726452616469616E6365466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E706F776572576F726452616469616E63653A4E616D65282O292C0D0A2O20706F776572576F726452616469616E6365506C61796572203D206D6163726F2822706F776572576F726452616469616E6365506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E706F776572576F726452616469616E63653A4E616D65282O292C0D0A2O2070757267655468655769636B65644D6F7573656F766572203D206D6163726F282270757267655468655769636B65644D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E70757267655468655769636B65643A4E616D65282O292C0D0A2O2072617074757265466F637573203D206D6163726F282272617074757265466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E726170747572653A4E616D65282O292C0D0A2O2072656E6577466F637573203D206D6163726F282272656E6577466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E72656E65773A4E616D65282O292C0D0A2O20736861646F77436F76656E616E74466F637573203D206D6163726F2822736861646F77436F76656E616E74466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E6469736369706C696E652E736861646F77436F76656E616E743A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E7072696573742E686F6C79203D204D657267655461626C6542794B6579286D6163726F2E7072696573742E636F2O6D6F6E732C207B0D0A2O202O2D207370652O6C730D0A2O20636972636C656F664865616C696E67466F637573203D206D6163726F2822636972636C656F664865616C696E67466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E686F6C792E636972636C656F664865616C696E673A4E616D65282O292C0D0A2O20677561726469616E537069726974466F637573203D206D6163726F2822677561726469616E537069726974466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E686F6C792E677561726469616E5370697269743A4E616D65282O292C0D0A2O20666C6173684865616C466F637573203D206D6163726F2822666C6173684865616C466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E686F6C792E666C6173684865616C3A4E616D65282O292C0D0A2O20666C6173684865616C4D6F7573656F766572203D206D6163726F2822666C6173684865616C4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E686F6C792E666C6173684865616C3A4E616D65282O292C0D0A2O206865616C466F637573203D206D6163726F28226865616C466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E686F6C792E6865616C3A4E616D65282O292C0D0A2O20686F6C79576F726443686173746973654D6F7573656F766572203D206D6163726F2822686F6C79576F726443686173746973654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E686F6C792E686F6C79576F726443686173746973653A4E616D65282O292C0D0A2O20686F6C79576F726453616E6374696679437572736F72203D206D6163726F2822686F6C79576F726453616E6374696679437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E7072696573742E686F6C792E686F6C79576F726453616E63746966793A4E616D65282O292C0D0A2O20686F6C79576F7264536572656E697479466F637573203D206D6163726F2822686F6C79576F7264536572656E697479466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E686F6C792E686F6C79576F7264536572656E6974793A4E616D65282O292C0D0A2O20686F6C79576F7264536572656E6974794D6F7573656F766572203D206D6163726F2822686F6C79576F7264536572656E6974794D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E686F6C792E686F6C79576F7264536572656E6974793A4E616D65282O292C0D0A2O20706F776572576F72644C696665466F637573203D206D6163726F2822706F776572576F72644C696665466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E686F6C792E706F776572576F72644C6966653A4E616D65282O292C0D0A2O20706F776572576F72644C6966654D6F7573656F766572203D206D6163726F2822706F776572576F72644C6966654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E686F6C792E706F776572576F72644C6966653A4E616D65282O292C0D0A2O207072617965726F664865616C696E67466F637573203D206D6163726F28227072617965726F664865616C696E67466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E686F6C792E7072617965726F664865616C696E673A4E616D65282O292C0D0A2O207072617965726F664D656E64696E67466F637573203D206D6163726F28227072617965726F664D656E64696E67466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E686F6C792E7072617965726F664D656E64696E673A4E616D65282O292C0D0A2O2072656E6577466F637573203D206D6163726F282272656E6577466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E7072696573742E686F6C792E72656E65773A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E7072696573742E736861646F77203D204D657267655461626C6542794B6579286D6163726F2E7072696573742E636F2O6D6F6E732C207B0D0A2O20666C6173684865616C506C61796572203D206D6163726F2822666C6173684865616C506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E7072696573742E736861646F772E666C6173684865616C3A4E616D65282O292C0D0A2O206465766F7572696E67506C616775654D6F7573656F766572203D206D6163726F28226465766F7572696E67506C616775654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E736861646F772E6465766F7572696E67506C616775653A4E616D65282O292C0D0A2O206D696E64426C6173744D6F7573656F766572203D206D6163726F28226D696E64426C6173744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E736861646F772E6D696E64426C6173743A4E616D65282O292C0D0A2O20707572696679446973656173654D6F7573656F766572203D206D6163726F2822707572696679446973656173654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E736861646F772E707572696679446973656173653A4E616D65282O292C0D0A2O20736861646F774372617368437572736F72203D206D6163726F2822736861646F774372617368437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E7072696573742E736861646F772E736861646F7743726173683A4E616D65282O292C0D0A2O2073696C656E63654D6F7573656F766572203D206D6163726F282273696C656E63654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E736861646F772E73696C656E63653A4E616D65282O292C0D0A2O2076616D7069726963546F7563684D6F7573656F766572203D206D6163726F282276616D7069726963546F7563684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E736861646F772E76616D7069726963546F7563683A4E616D65282O292C0D0A2O20766F6964546F2O72656E744D6F7573656F766572203D206D6163726F2822766F6964546F2O72656E744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7072696573742E736861646F772E766F6964546F2O72656E743A4E616D65282O292C0D0A7D290D0A0D0A66756E6374696F6E206170692E4765745069556E697428290D0A2O206966206170692E756E69742E746172676574207468656E0D0A4O206C6F63616C2067726F7570203D206170692E47726F7570556E69747328290D0A4O20666F722069203D20312C202367726F757020646F0D0A6O206C6F63616C2067726F7570556E6974203D2067726F75705B695D0D0A6O2067726F7570556E69743A436163686528290D0A6O206966206170692E756E69742E7461726765743A475549442829202O3D2067726F7570556E69743A475549442829207468656E0D0A8O2057523A5072696E742822506F77657220696E667573696F6E2073657420746F3A2022202O2E2067726F7570556E69743A4944282O290D0A8O2072657475726E2067726F7570556E69740D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A0D0A2O2057523A5072696E742822506F77657220696E667573696F6E2073657420746F3A204175746F22290D0A656E6400063O0012033O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);