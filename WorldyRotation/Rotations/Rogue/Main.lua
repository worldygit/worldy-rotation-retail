local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v78=(v110 + v84) -1 ;for v112=v110,v78 do local v113=v79[v112-v110 ];v83[v112]=v113;end elseif (v86>1) then local v115;local v116;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v83[v116]=v83[v116](v83[v116 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v78=(v116 + v84) -1 ;for v128=v116,v78 do v115=v79[v128-v116 ];v83[v128]=v115;end v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v83[v116](v13(v83,v116 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else v83[v85[2]]=v85[3];end elseif (v86<=4) then if (v86==3) then do return;end else local v124=v85[2];v83[v124]=v83[v124](v83[v124 + 1 ]);end elseif (v86>5) then local v126=v85[2];v83[v126](v13(v83,v126 + 1 ,v78));elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703EE402O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C730D0A6966206E6F74207370652O6C2E726F677565207468656E0D0A2O207370652O6C2E726F677565203D207B7D0D0A656E640D0A0D0A7370652O6C2E726F6775652E636F2O6D6F6E73203D207B0D0A2O202O2D2072616369616C730D0A2O20616E6365737472616C43612O6C203D207370652O6C28323734373338292C0D0A2O20617263616E6550756C7365203D207370652O6C28323630333634292C0D0A2O20617263616E65546F2O72656E74203D207370652O6C283235303436292C0D0A2O206261676F66547269636B73203D207370652O6C28333132342O31292C0D0A2O206265727365726B696E67203D207370652O6C283236323937292C0D0A2O20626C2O6F6446757279203D207370652O6C283230353732292C0D0A2O2066697265626C2O6F64203D207370652O6C283236352O3231292C0D0A2O206C69676874734A7564676D656E74203D207370652O6C28322O35363437292C0D0A2O20736861646F776D656C64203D207370652O6C283538393834292C0D0A2O202O2D20646566656E736976650D0A2O20636C6F616B6F66536861646F7773203D207370652O6C2833312O3234292C0D0A2O206372696D736F6E5669616C203D207370652O6C28313835332O31292C0D0A2O2065766173696F6E203D207370652O6C2835322O37292C0D0A2O206665696E74203D207370652O6C2831392O36292C0D0A2O202O2D207574696C6974790D0A2O20626C696E64203D207370652O6C2832303934292C0D0A2O20636865617053686F74203D207370652O6C2831382O33292C0D0A2O206B69636B203D207370652O6C2831372O36292C0D0A2O206B69646E657953686F74203D207370652O6C28343038292C0D0A2O20736170203D207370652O6C28362O3730292C0D0A2O2073686976203D207370652O6C2835393338292C0D0A2O20736C696365616E6444696365203D207370652O6C28333135343936292C0D0A2O20736861646F7773746570203D207370652O6C2833362O3534292C0D0A2O20737072696E74203D207370652O6C2832393833292C0D0A2O20747269636B736F667468655472616465203D207370652O6C283537393334292C0D0A2O202O2D20706F69736F6E730D0A2O20616D706C696679696E67506F69736F6E203D207370652O6C283338312O3634292C0D0A2O206174726F70686963506F69736F6E203D207370652O6C28333831363337292C0D0A2O206372692O706C696E67506F69736F6E203D207370652O6C2833343038292C0D0A2O20646561646C79506F69736F6E203D207370652O6C2832383233292C0D0A2O20696E7374616E74506F69736F6E203D207370652O6C2833312O353834292C0D0A2O206E756D62696E67506F69736F6E203D207370652O6C2835373631292C0D0A2O20776F756E64506F69736F6E203D207370652O6C2838363739292C0D0A2O20616D706C696679696E67506F69736F6E446562752O66203D207370652O6C28333833343134292C0D0A2O206174726F70686963506F69736F6E446562752O66203D207370652O6C28333932332O38292C0D0A2O206372692O706C696E67506F69736F6E446562752O66203D207370652O6C2833343039292C0D0A2O20646561646C79506F69736F6E446562752O66203D207370652O6C2832383138292C0D0A2O20776F756E64506F69736F6E446562752O66203D207370652O6C2838363830292C0D0A2O202O2D2074616C656E74730D0A2O206163726F6261746963537472696B6573203D207370652O6C28313936393234292C0D0A2O20616C616372697479203D207370652O6C28313933353339292C0D0A2O20636F6C64426C2O6F64203D207370652O6C2833382O323435292C0D0A2O20642O6570657253747261746167656D203D207370652O6C28313933353331292C0D0A2O20646576696F757353747261746167656D203D207370652O6C28333934333231292C0D0A2O2073656372657453747261746167656D203D207370652O6C28333934333230292C0D0A2O206563686F696E6752657072696D616E64203D207370652O6C28333835363136292C0D0A2O206563686F696E6752657072696D616E6432203D207370652O6C283332332O3538292C0D0A2O206563686F696E6752657072696D616E6433203D207370652O6C283332332O3539292C0D0A2O206563686F696E6752657072696D616E6434203D207370652O6C28333233353630292C0D0A2O206563686F696E6752657072696D616E6435203D207370652O6C28333534383338292C0D0A2O2066696E645765616B6E652O73203D207370652O6C283931303233292C0D0A2O2066696E645765616B6E652O73446562752O66203D207370652O6C283331362O3230292C0D0A2O20696D70726F766564416D62757368203D207370652O6C28333831363230292C0D0A2O206D61726B6564666F724465617468203D207370652O6C28313337363139292C0D0A2O206E696768747374616C6B6572203D207370652O6C283134303632292C0D0A2O207265736F756E64696E67436C6172697479203D207370652O6C28333831362O32292C0D0A2O207365616C46617465203D207370652O6C283134313930292C0D0A2O20736570736973203D207370652O6C28333835343038292C0D0A2O2073657073697342752O66203D207370652O6C28333735393339292C0D0A2O20736861646F7744616E6365203D207370652O6C28313835333133292C202O2D2062617365207370652O6C0D0A2O20736861646F7744616E636554616C656E74203D207370652O6C28333934393330292C0D0A2O20736861646F7744616E636542752O66203D207370652O6C28313835342O32292C0D0A2O2073756274657266756765203D207370652O6C28313038323038292C0D0A2O207375627465726675676542752O66203D207370652O6C282O3135313932292C0D0A2O2074686973746C65546561203D207370652O6C28333831363233292C0D0A2O207669676F72203D207370652O6C283134393833292C0D0A2O202O2D20737465616C74680D0A2O20737465616C7468203D207370652O6C2831373834292C0D0A2O20737465616C746832203D207370652O6C282O3135313931292C0D0A2O2076616E697368203D207370652O6C2831383536292C0D0A2O2076616E69736842752O66203D207370652O6C282O31333237292C0D0A2O2076616E69736842752O6632203D207370652O6C282O3135313933292C0D0A2O202O2D207472696E6B6574730D0A2O202O2D206D6973630D0A2O20702O6F6C456E65726779203D207370652O6C284O393130292C0D0A7D0D0A0D0A7370652O6C2E726F6775652E612O73612O73696E6174696F6E203D204D657267655461626C6542794B6579287370652O6C2E726F6775652E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O20616D62757368203D207370652O6C2838363736292C0D0A2O20616D627573684F76652O72696465203D207370652O6C2834332O303233292C0D0A2O20616D706C696679696E67506F69736F6E446562752O6644656174686D61726B203D207370652O6C28333934333238292C0D0A2O20646561646C79506F69736F6E446562752O6644656174686D61726B203D207370652O6C28333934333234292C0D0A2O20656E76656E6F6D203D207370652O6C283332363435292C0D0A2O2066616E6F664B6E69766573203D207370652O6C283531373233292C0D0A2O2067612O726F7465203D207370652O6C28373033292C0D0A2O2067612O726F746544656174686D61726B203D207370652O6C28333630383330292C0D0A2O206D7574696C617465203D207370652O6C2831333239292C0D0A2O20706F69736F6E65644B6E696665203D207370652O6C2831382O353635292C0D0A2O2072757074757265203D207370652O6C2831393433292C0D0A2O207275707475726544656174686D61726B203D207370652O6C28333630383236292C0D0A2O202O2D2074616C656E74730D0A2O20617274657269616C507265636973696F6E203D207370652O6C28342O30373833292C0D0A2O20626C696E647369646542752O66203D207370652O6C2831322O313533292C0D0A2O20636175737469635370612O746572203D207370652O6C28343231393735292C0D0A2O20636175737469635370612O746572446562752O66203D207370652O6C28343231393736292C0D0A2O206372696D736F6E54656D70657374203D207370652O6C28313231342O31292C0D0A2O20637574546F5468654368617365203D207370652O6C2835312O3637292C0D0A2O2064617368696E6753636F756E6472656C203D207370652O6C28333831373937292C0D0A2O2064656174686D61726B203D207370652O6C28333630313934292C0D0A2O20642O6F6D626C616465203D207370652O6C28333831363733292C0D0A2O20647261676F6E54656D7065726564426C61646573203D207370652O6C28333831383031292C0D0A2O20656C75736976656E652O73203D207370652O6C2837392O3038292C0D0A2O20696D70726F76656447612O726F7465203D207370652O6C28333831363332292C0D0A2O20696D70726F76656447612O726F746542752O66203D207370652O6C28333932343031292C0D0A2O20696D70726F76656447612O726F746541757261203D207370652O6C28333932343033292C0D0A2O20696E6469736372696D696E6174654361726E616765203D207370652O6C28333831383032292C0D0A2O20696E6469736372696D696E6174654361726E61676541757261203D207370652O6C28333835373534292C0D0A2O20696E6469736372696D696E6174654361726E61676542752O66203D207370652O6C28333835373437292C0D0A2O20696E7465726E616C426C2O6564696E67203D207370652O6C28313534393533292C0D0A2O206B696E677362616E65203D207370652O6C28333835363237292C0D0A2O206C6967687477656967687453686976203D207370652O6C28333934393833292C0D0A2O206D6173746572412O73612O73696E203D207370652O6C28322O35393839292C0D0A2O206D6173746572412O73612O73696E42752O66203D207370652O6C28323536373335292C0D0A2O20707265796F6E7468655765616B203D207370652O6C28313331352O31292C0D0A2O20707265796F6E7468655765616B446562752O66203D207370652O6C28322O35393039292C0D0A2O207363656E744F66426C2O6F64203D207370652O6C28333831372O39292C0D0A2O207363656E744F66426C2O6F6442752O66203D207370652O6C28333934303830292C0D0A2O2073652O7261746564426F6E655370696B65203D207370652O6C28333835343234292C0D0A2O2073652O7261746564426F6E655370696B65446562752O66203D207370652O6C28333934303336292C0D0A2O2073686976446562752O66203D207370652O6C28333139353034292C0D0A2O207368726F7564656453752O666F636174696F6E203D207370652O6C28333835343738292C0D0A2O2076656E6F6D52757368203D207370652O6C28313532313532292C0D0A7D290D0A0D0A7370652O6C2E726F6775652E6F75746C6177203D204D657267655461626C6542794B6579287370652O6C2E726F6775652E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O20616472656E616C696E6552757368203D207370652O6C283133373530292C0D0A2O20616D62757368203D207370652O6C2838363736292C0D0A2O20616D627573684F76652O72696465203D207370652O6C2834332O303233292C0D0A2O20626574772O656E74686545796573203D207370652O6C28333135333431292C0D0A2O20626C616465466C752O7279203D207370652O6C283133382O37292C0D0A2O206469737061746368203D207370652O6C2832303938292C0D0A2O20656C75736976656E652O73203D207370652O6C2837392O3038292C0D0A2O206F2O706F7274756E697479203D207370652O6C28313935363237292C0D0A2O20706973746F6C53686F74203D207370652O6C28313835373633292C0D0A2O20726F2O6C746865426F6E6573203D207370652O6C2833312O353038292C0D0A2O2073696E6973746572537472696B65203D207370652O6C2831392O333135292C0D0A2O202O2D2074616C656E74730D0A2O206175646163697479203D207370652O6C28333831383435292C0D0A2O20617564616369747942752O66203D207370652O6C28333836323730292C0D0A2O20626C61646552757368203D207370652O6C28323731382O37292C0D0A2O20636F756E745468654F2O6473203D207370652O6C28333831393832292C0D0A2O20637261636B73686F74203D207370652O6C28343233373033292C0D0A2O20646566744D616E657576657273203D207370652O6C28333835383335292C0D0A2O206472656164626C61646573203D207370652O6C28333433313432292C0D0A2O2066616E54686548612O6D6572203D207370652O6C28333831383436292C0D0A2O2067686F73746C79537472696B65203D207370652O6C28313936393337292C0D0A2O2067722O656E736B696E735769636B657273203D207370652O6C28333836383233292C0D0A2O2067722O656E736B696E735769636B65727342752O66203D207370652O6C28333934313331292C0D0A2O2068692O64656E4F2O706F7274756E697479203D207370652O6C28333833323831292C0D0A2O20696D70726F766564416472656E616C696E6552757368203D207370652O6C28333935342O32292C0D0A2O20696D70726F766564426574772O656E54686545796573203D207370652O6C28323335343834292C0D0A2O206B2O65704974526F2O6C696E67203D207370652O6C28333831393839292C0D0A2O206B692O6C696E675370722O65203D207370652O6C283531363930292C0D0A2O206C6F6164656444696365203D207370652O6C28323536313730292C0D0A2O206C6F616465644469636542752O66203D207370652O6C28323536313731292C0D0A2O20707265796F6E7468655765616B203D207370652O6C28313331352O31292C0D0A2O20707265796F6E7468655765616B446562752O66203D207370652O6C28322O35393039292C0D0A2O20717569636B44726177203D207370652O6C28313936393338292C0D0A2O2073752O6D6172696C7944697370617463686564203D207370652O6C283338312O3930292C0D0A2O207377696674536C6173686572203D207370652O6C28333831392O38292C0D0A2O2074616B65456D4279537572707269736542752O66203D207370652O6C28333835393037292C0D0A2O20756E64657268616E646564552O70657268616E64203D207370652O6C28343234302O34292C0D0A2O20776561706F6E6D6173746572203D207370652O6C28322O30372O33292C0D0A2O202O2D207574696C6974790D0A2O20676F756765203D207370652O6C28312O3736292C0D0A2O202O2D20726F2O6C2074686520626F6E65730D0A2O2062726F616473696465203D207370652O6C2831392O333536292C0D0A2O206275726965645472656173757265203D207370652O6C28312O39362O30292C0D0A2O206772616E644D656C2O65203D207370652O6C2831392O333538292C0D0A2O20727574686C652O73507265636973696F6E203D207370652O6C2831392O333537292C0D0A2O20736B752O6C616E6443726F2O73626F6E6573203D207370652O6C28312O39363033292C0D0A2O207472756542656172696E67203D207370652O6C2831392O333539292C0D0A2O202O2D2073657420626F6E757365730D0A2O20766963696F7573466F2O6C6F777570203D207370652O6C28333934383739292C0D0A7D290D0A0D0A7370652O6C2E726F6775652E737562746C657479203D204D657267655461626C6542794B6579287370652O6C2E726F6775652E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O206261636B73746162203D207370652O6C283533292C0D0A2O20626C61636B506F77646572203D207370652O6C28333139313735292C0D0A2O20656C75736976656E652O73203D207370652O6C2837392O3038292C0D0A2O2065766973636572617465203D207370652O6C28313936383139292C0D0A2O2072757074757265203D207370652O6C2831393433292C0D0A2O20736861646F77426C61646573203D207370652O6C28313231343731292C0D0A2O20736861646F77737472696B65203D207370652O6C28313835343338292C0D0A2O2073687572696B656E53746F726D203D207370652O6C28313937383335292C0D0A2O2073687572696B656E546F2O73203D207370652O6C282O3134303134292C0D0A2O2073796D626F6C736F664465617468203D207370652O6C2832312O323833292C0D0A2O202O2D2074616C656E74730D0A2O2064616E73654D616361627265203D207370652O6C28333832353238292C0D0A2O2064616E73654D61636162726542752O66203D207370652O6C28333933393639292C0D0A2O20642O6570657244612O67657273203D207370652O6C28333832353137292C0D0A2O20642O6570657244612O6765727342752O66203D207370652O6C28333833343035292C0D0A2O206461726B42726577203D207370652O6C28333832353034292C0D0A2O206461726B536861646F77203D207370652O6C28323435363837292C0D0A2O20656E76656C6F70696E67536861646F7773203D207370652O6C28323338313034292C0D0A2O2066696E616C697479203D207370652O6C28333832353235292C0D0A2O2066696E616C697479426C61636B506F7764657242752O66203D207370652O6C28333835393438292C0D0A2O2066696E616C6974794576697363657261746542752O66203D207370652O6C28333835393439292C0D0A2O2066696E616C6974795275707475726542752O66203D207370652O6C28333835393531292C0D0A2O20666C6167652O6C6174696F6E203D207370652O6C28333834363331292C0D0A2O20666C6167652O6C6174696F6E5065727369737442752O66203D207370652O6C28333934373538292C0D0A2O20676C2O6F6D626C616465203D207370652O6C28322O30373538292C0D0A2O20696D70726F766564536861646F7744616E6365203D207370652O6C28333933393732292C0D0A2O20696D70726F76656453687572696B656E53746F726D203D207370652O6C2833312O393531292C0D0A2O206C696E676572696E67536861646F77203D207370652O6C28333832353234292C0D0A2O206C696E676572696E67536861646F7742752O66203D207370652O6C28333835393630292C0D0A2O206D61737465726F66536861646F7773203D207370652O6C28313936393736292C0D0A2O20706572666F72617465645665696E73203D207370652O6C28333832353138292C0D0A2O20706572666F72617465645665696E7342752O66203D207370652O6C28333934323534292C0D0A2O20707265796F6E7468655765616B203D207370652O6C28313331352O31292C0D0A2O20707265796F6E7468655765616B446562752O66203D207370652O6C28322O35393039292C0D0A2O207072656D656469746174696F6E203D207370652O6C28333433313630292C0D0A2O207072656D656469746174696F6E42752O66203D207370652O6C28333433313733292C0D0A2O20736563726574546563686E69717565203D207370652O6C28323830373139292C0D0A2O20736861646F77466F637573203D207370652O6C28313038323039292C0D0A2O2073687572696B656E546F726E61646F203D207370652O6C28322O37393235292C0D0A2O2073696C656E7453746F726D203D207370652O6C28333835372O32292C0D0A2O2073696C656E7453746F726D42752O66203D207370652O6C28333835372O32292C0D0A2O20746865466972737444616E6365203D207370652O6C28333832353035292C0D0A2O20746865526F2O74656E203D207370652O6C28333832303135292C0D0A2O20746865526F2O74656E42752O66203D207370652O6C28333934323033292C0D0A2O20776561706F6E6D6173746572203D207370652O6C28313933353337292C0D0A7D290D0A0D0A2O2D206974656D730D0A6966206E6F74206974656D2E726F677565207468656E0D0A2O206974656D2E726F677565203D207B7D0D0A656E640D0A6974656D2E726F6775652E636F2O6D6F6E73203D207B0D0A7D0D0A0D0A6974656D2E726F6775652E612O73612O73696E6174696F6E203D204D657267655461626C6542794B6579286974656D2E726F6775652E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E726F6775652E6F75746C6177203D204D657267655461626C6542794B6579286974656D2E726F6775652E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E726F6775652E737562746C657479203D204D657267655461626C6542794B6579286974656D2E726F6775652E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F0D0A6966206E6F74206D6163726F2E726F677565207468656E0D0A2O206D6163726F2E726F677565203D207B7D0D0A656E640D0A6D6163726F2E726F6775652E636F2O6D6F6E73203D207B0D0A2O20626C696E644D6F7573656F766572203D206D6163726F2822626C696E644D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E726F6775652E636F2O6D6F6E732E626C696E643A4E616D65282O292C0D0A2O20636865617053686F744D6F7573656F766572203D206D6163726F2822636865617053686F744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E726F6775652E636F2O6D6F6E732E636865617053686F743A4E616D65282O292C0D0A2O206B69636B4D6F7573656F766572203D206D6163726F28226B69636B4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E726F6775652E636F2O6D6F6E732E6B69636B3A4E616D65282O292C0D0A2O206B69646E657953686F744D6F7573656F766572203D206D6163726F28226B69646E657953686F744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E726F6775652E636F2O6D6F6E732E6B69646E657953686F743A4E616D65282O292C0D0A2O206D61726B6564666F7244656174684D6F7573656F766572203D206D6163726F28226D61726B6564666F7244656174684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E726F6775652E636F2O6D6F6E732E6D61726B6564666F7244656174683A4E616D65282O292C0D0A2O20747269636B736F667468655472616465466F637573203D206D6163726F2822747269636B736F667468655472616465466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E726F6775652E636F2O6D6F6E732E747269636B736F6674686554726164653A4E616D65282O292C0D0A7D0D0A0D0A6D6163726F2E726F6775652E6F75746C6177203D204D657267655461626C6542794B6579286D6163726F2E726F6775652E636F2O6D6F6E732C207B0D0A2O20636F6C64426C2O6F644469737061746368203D206D6163726F28226469737061746368222C20222F636173742022202O2E207370652O6C2E726F6775652E636F2O6D6F6E732E636F6C64426C2O6F643A4E616D652829202O2E20225C6E22202O2E20222F636173742022202O2E207370652O6C2E726F6775652E6F75746C61772E64697370617463683A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E726F6775652E737562746C657479203D204D657267655461626C6542794B6579286D6163726F2E726F6775652E636F2O6D6F6E732C207B0D0A2O20736563726574546563686E69717565203D206D6163726F2822736563726574546563686E69717565222C20222F636173742022202O2E207370652O6C2E726F6775652E636F2O6D6F6E732E636F6C64426C2O6F643A4E616D652829202O2E20225C6E22202O2E20222F636173742022202O2E207370652O6C2E726F6775652E737562746C6574792E736563726574546563686E697175653A4E616D65282O292C0D0A2O20736861646F7744616E6365203D206D6163726F2822736861646F7744616E6365222C20222F636173742022202O2E207370652O6C2E726F6775652E737562746C6574792E736861646F7744616E63653A4E616D652829202O2E20225C6E22202O2E20222F636173742022202O2E207370652O6C2E726F6775652E737562746C6574792E74686973746C655465613A4E616D652829202O2E20225C6E22202O2E20222F636173742022202O2E207370652O6C2E726F6775652E737562746C6574792E736861646F77737472696B653A4E616D65282O292C0D0A2O2076616E697368536861646F77737472696B65203D206D6163726F282276616E697368536861646F77737472696B65222C20222F636173742022202O2E207370652O6C2E726F6775652E636F2O6D6F6E732E76616E6973683A4E616D652829202O2E20225C6E22202O2E20222F636173742022202O2E207370652O6C2E726F6775652E737562746C6574792E736861646F77737472696B653A4E616D65282O292C0D0A2O2073687572696B656E53746F726D5344203D206D6163726F282273687572696B656E53746F726D5344222C20222F636173742022202O2E207370652O6C2E726F6775652E737562746C6574792E736861646F7744616E63653A4E616D652829202O2E20225C6E22202O2E20222F636173742022202O2E207370652O6C2E726F6775652E737562746C6574792E73687572696B656E53746F726D3A4E616D65282O292C0D0A2O2073687572696B656E53746F726D56616E697368203D206D6163726F282273687572696B656E53746F726D56616E697368222C20222F636173742022202O2E207370652O6C2E726F6775652E636F2O6D6F6E732E76616E6973683A4E616D652829202O2E20225C6E22202O2E20222F636173742022202O2E207370652O6C2E726F6775652E737562746C6574792E73687572696B656E53746F726D3A4E616D65282O292C0D0A2O20676C2O6F6D626C6164655344203D206D6163726F2822676C2O6F6D626C6164655344222C20222F636173742022202O2E207370652O6C2E726F6775652E737562746C6574792E736861646F7744616E63653A4E616D652829202O2E20225C6E22202O2E20222F636173742022202O2E207370652O6C2E726F6775652E737562746C6574792E676C2O6F6D626C6164653A4E616D65282O292C0D0A2O20676C2O6F6D626C61646556616E697368203D206D6163726F2822676C2O6F6D626C61646556616E697368222C20222F636173742022202O2E207370652O6C2E726F6775652E636F2O6D6F6E732E76616E6973683A4E616D652829202O2E20225C6E22202O2E20222F636173742022202O2E207370652O6C2E726F6775652E737562746C6574792E676C2O6F6D626C6164653A4E616D65282O292C0D0A2O206261636B737461624D6F7573656F766572203D206D6163726F28226261636B737461624D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E726F6775652E737562746C6574792E6261636B737461623A4E616D65282O292C0D0A2O20727570747572654D6F7573656F766572203D206D6163726F2822727570747572654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E726F6775652E737562746C6574792E727570747572653A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E726F6775652E612O73612O73696E6174696F6E203D204D657267655461626C6542794B6579286D6163726F2E726F6775652E636F2O6D6F6E732C207B0D0A2O2067612O726F74654D6F7573656F766572203D206D6163726F282267612O726F74654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E726F6775652E612O73612O73696E6174696F6E2E67612O726F74653A4E616D65282O292C0D0A7D290D0A0D0A2O2D207574696C2066756E6374696F6E730D0A66756E6374696F6E206170692E537465616C74685370652O6C28290D0A2O2072657475726E207370652O6C2E726F6775652E636F2O6D6F6E732E737562746572667567653A4973417661696C61626C65282920616E64207370652O6C2E726F6775652E636F2O6D6F6E732E737465616C746832206F72207370652O6C2E726F6775652E636F2O6D6F6E732E737465616C74680D0A656E640D0A0D0A66756E6374696F6E206170692E56616E69736842752O665370652O6C28290D0A2O2072657475726E207370652O6C2E726F6775652E636F2O6D6F6E732E737562746572667567653A4973417661696C61626C65282920616E64207370652O6C2E726F6775652E636F2O6D6F6E732E76616E69736842752O6632206F72207370652O6C2E726F6775652E636F2O6D6F6E732E76616E69736842752O660D0A656E640D0A0D0A66756E6374696F6E206170692E537465616C746828737465616C74682C2073652O74696E67290D0A2O2069662073652O74696E6720616E6420737465616C74683A49734361737461626C65282920616E6420706C617965723A537465616C7468446F776E2829207468656E0D0A4O206966206170692E4361737428737465616C746829207468656E0D0A6O2072657475726E2022737465616C7468220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170692E4372696D736F6E5669616C2873652O74696E67290D0A2O206966207370652O6C2E726F6775652E636F2O6D6F6E732E6372696D736F6E5669616C3A49734361737461626C65282920616E6420706C617965723A4865616C746850657263656E746167652829203C3D2073652O74696E67207468656E0D0A4O206966206170692E43617374287370652O6C2E726F6775652E636F2O6D6F6E732E6372696D736F6E5669616C29207468656E0D0A6O2072657475726E20226372696D736F6E5F7669616C220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170692E4665696E742873652O74696E67290D0A2O206966207370652O6C2E726F6775652E636F2O6D6F6E732E6665696E743A49734361737461626C65282920616E6420706C617965723A42752O66446F776E287370652O6C2E726F6775652E636F2O6D6F6E732E6665696E742920616E6420706C617965723A4865616C746850657263656E746167652829203C3D2073652O74696E67207468656E0D0A4O206966206170692E43617374287370652O6C2E726F6775652E636F2O6D6F6E732E6665696E7429207468656E0D0A6O2072657475726E20226665696E74220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170692E45766173696F6E2873652O74696E67290D0A2O206966207370652O6C2E726F6775652E636F2O6D6F6E732E65766173696F6E3A49734361737461626C65282920616E6420706C617965723A42752O66446F776E287370652O6C2E726F6775652E636F2O6D6F6E732E65766173696F6E2920616E6420706C617965723A4865616C746850657263656E746167652829203C3D2073652O74696E67207468656E0D0A4O206966206170692E43617374287370652O6C2E726F6775652E636F2O6D6F6E732E65766173696F6E29207468656E0D0A6O2072657475726E202265766173696F6E220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A2O2D20706F69736F6E730D0A646F0D0A2O206C6F63616C2066756E6374696F6E2043617374506F69736F6E28706F69736F6E290D0A4O206966206E6F7420706C617965723A412O66656374696E67436F6D626174282920616E6420706C617965723A42752O665265667265736861626C6528706F69736F6E29207468656E0D0A6O206966206170692E4361737428706F69736F6E2C206E696C2C207472756529207468656E0D0A8O2072657475726E2022706F69736F6E220D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A0D0A2O2066756E6374696F6E206170692E506F69736F6E7328290D0A4O20696620706C617965723A412O66656374696E67436F6D6261742829207468656E0D0A6O2072657475726E0D0A4O20656E640D0A0D0A4O206C6F63616C2073686F756C6452657475726E0D0A4O202O2D206C657468616C20706F69736F6E0D0A4O206C6F63616C207573696E67576F756E64506F69736F6E203D20706C617965723A42752O665570287370652O6C2E726F6775652E636F2O6D6F6E732E776F756E64506F69736F6E290D0A0D0A4O206966207370652O6C2E726F6775652E612O73612O73696E6174696F6E2E647261676F6E54656D7065726564426C616465733A4973417661696C61626C652829207468656E0D0A6O2073686F756C6452657475726E203D2043617374506F69736F6E287573696E67576F756E64506F69736F6E20616E64207370652O6C2E726F6775652E636F2O6D6F6E732E776F756E64506F69736F6E206F72207370652O6C2E726F6775652E636F2O6D6F6E732E646561646C79506F69736F6E290D0A6O2069662073686F756C6452657475726E207468656E0D0A8O2072657475726E2073686F756C6452657475726E0D0A6O20656E640D0A6O206966207370652O6C2E726F6775652E636F2O6D6F6E732E616D706C696679696E67506F69736F6E3A4973417661696C61626C652829207468656E0D0A8O2073686F756C6452657475726E203D2043617374506F69736F6E287370652O6C2E726F6775652E636F2O6D6F6E732E616D706C696679696E67506F69736F6E290D0A8O2069662073686F756C6452657475726E207468656E0D0A9O202072657475726E2073686F756C6452657475726E0D0A8O20656E640D0A6O20656C73650D0A8O2073686F756C6452657475726E203D2043617374506F69736F6E287370652O6C2E726F6775652E636F2O6D6F6E732E696E7374616E74506F69736F6E290D0A8O2069662073686F756C6452657475726E207468656E0D0A9O202072657475726E2073686F756C6452657475726E0D0A8O20656E640D0A6O20656E640D0A4O20656C73650D0A6O206966207573696E67576F756E64506F69736F6E207468656E0D0A8O2073686F756C6452657475726E203D2043617374506F69736F6E287370652O6C2E726F6775652E636F2O6D6F6E732E776F756E64506F69736F6E290D0A8O2069662073686F756C6452657475726E207468656E0D0A9O202072657475726E2073686F756C6452657475726E0D0A8O20656E640D0A6O20656C73656966207370652O6C2E726F6775652E636F2O6D6F6E732E616D706C696679696E67506F69736F6E3A4973417661696C61626C65282920616E6420706C617965723A42752O66446F776E287370652O6C2E726F6775652E636F2O6D6F6E732E646561646C79506F69736F6E29207468656E0D0A8O2073686F756C6452657475726E203D2043617374506F69736F6E287370652O6C2E726F6775652E636F2O6D6F6E732E616D706C696679696E67506F69736F6E290D0A8O2069662073686F756C6452657475726E207468656E0D0A9O202072657475726E2073686F756C6452657475726E0D0A8O20656E640D0A6O20656C73656966207370652O6C2E726F6775652E636F2O6D6F6E732E646561646C79506F69736F6E3A4973417661696C61626C652829207468656E0D0A8O2073686F756C6452657475726E203D2043617374506F69736F6E287370652O6C2E726F6775652E636F2O6D6F6E732E646561646C79506F69736F6E290D0A8O2069662073686F756C6452657475726E207468656E0D0A9O202072657475726E2073686F756C6452657475726E0D0A8O20656E640D0A6O20656C73650D0A8O2073686F756C6452657475726E203D2043617374506F69736F6E287370652O6C2E726F6775652E636F2O6D6F6E732E696E7374616E74506F69736F6E290D0A8O2069662073686F756C6452657475726E207468656E0D0A9O202072657475726E2073686F756C6452657475726E0D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A0D0A4O202O2D206E6F6E2D6C657468616C20706F69736F6E730D0A4O20696620706C617965723A42752O66446F776E287370652O6C2E726F6775652E636F2O6D6F6E732E6372692O706C696E67506F69736F6E29207468656E0D0A6O206966207370652O6C2E726F6775652E636F2O6D6F6E732E6174726F70686963506F69736F6E3A4973417661696C61626C652829207468656E0D0A8O2073686F756C6452657475726E203D2043617374506F69736F6E287370652O6C2E726F6775652E636F2O6D6F6E732E6174726F70686963506F69736F6E290D0A8O2069662073686F756C6452657475726E207468656E0D0A9O202072657475726E2073686F756C6452657475726E0D0A8O20656E640D0A6O20656C73656966207370652O6C2E726F6775652E636F2O6D6F6E732E6E756D62696E67506F69736F6E3A4973417661696C61626C652829207468656E0D0A8O2073686F756C6452657475726E203D2043617374506F69736F6E287370652O6C2E726F6775652E636F2O6D6F6E732E6E756D62696E67506F69736F6E290D0A8O2069662073686F756C6452657475726E207468656E0D0A9O202072657475726E2073686F756C6452657475726E0D0A8O20656E640D0A6O20656C73650D0A8O2073686F756C6452657475726E203D2043617374506F69736F6E287370652O6C2E726F6775652E636F2O6D6F6E732E6372692O706C696E67506F69736F6E290D0A8O2069662073686F756C6452657475726E207468656E0D0A9O202072657475726E2073686F756C6452657475726E0D0A8O20656E640D0A6O20656E640D0A4O20656C73650D0A6O2073686F756C6452657475726E203D2043617374506F69736F6E287370652O6C2E726F6775652E636F2O6D6F6E732E6372692O706C696E67506F69736F6E290D0A6O2069662073686F756C6452657475726E207468656E0D0A8O2072657475726E2073686F756C6452657475726E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170692E53686F756C64446F54556E697428756E69742C206865616C74685468726573686F6C64290D0A2O2072657475726E20756E69743A4865616C74682829203E3D206865616C74685468726573686F6C64206F7220756E69743A497344752O6D7928290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204576616C756174654D66445461726765744966436F6E646974696F6E28746172676574556E6974290D0A2O2072657475726E20746172676574556E69743A54696D65546F4469652829206F72204O310D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204576616C756174654D6644436F6E646974696F6E28746172676574556E6974290D0A2O202O2D204E6F74653A20496E63726561736564207468652053696D4320636F6E646974696F6E206279203530252073696E63652077652061726520736C6F7765722E0D0A2O2072657475726E20746172676574556E69743A46696C746572656454696D65546F44696528223C222C20706C617965723A436F6D626F506F696E7473446566696369742829202A20312E35290D0A656E640D0A0D0A2O2D206D61726B656420666F7220646561746820736E6970696E670D0A66756E6374696F6E206170692E4D6644536E6970696E6728656E656D696573290D0A2O206966207370652O6C2E726F6775652E636F2O6D6F6E732E6D61726B6564666F7244656174683A497352656164792829207468656E0D0A4O206966206170692E436173744379636C65287370652O6C2E726F6775652E636F2O6D6F6E732E6D61726B6564666F7244656174682C206D6163726F2E726F6775652E636F2O6D6F6E732E6D61726B6564666F7244656174684D6F7573656F7665722C2033302C206E696C2C20747275652C20656E656D6965732C20226D696E222C204576616C756174654D66445461726765744966436F6E646974696F6E2C204576616C756174654D6644436F6E646974696F6E29207468656E0D0A6O2072657475726E20226D61726B65645F666F725F6465617468220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E206170692E43504D61785370656E6428290D0A2O2072657475726E2035202B20287370652O6C2E726F6775652E636F2O6D6F6E732E642O6570657253747261746167656D3A4973417661696C61626C65282920616E642031206F72203029202B20287370652O6C2E726F6775652E636F2O6D6F6E732E646576696F757353747261746167656D3A4973417661696C61626C65282920616E642031206F72203029202B20287370652O6C2E726F6775652E636F2O6D6F6E732E73656372657453747261746167656D3A4973417661696C61626C65282920616E642031206F722030290D0A656E640D0A0D0A2O2D202263705F7370656E64220D0A66756E6374696F6E206170692E43505370656E6428290D0A2O2072657475726E206D6174682E6D696E28706C617965723A436F6D626F506F696E747328292C206170692E43504D61785370656E64282O290D0A656E640D0A0D0A2O2D2022616E696D61636861726765645F6370220D0A66756E6374696F6E206170692E416E696D6163686172676564435028290D0A2O20696620706C617965723A42752O665570287370652O6C2E726F6775652E636F2O6D6F6E732E6563686F696E6752657072696D616E643229207468656E0D0A4O2072657475726E20320D0A2O20656C7365696620706C617965723A42752O665570287370652O6C2E726F6775652E636F2O6D6F6E732E6563686F696E6752657072696D616E643329207468656E0D0A4O2072657475726E20330D0A2O20656C7365696620706C617965723A42752O665570287370652O6C2E726F6775652E636F2O6D6F6E732E6563686F696E6752657072696D616E643429207468656E0D0A4O2072657475726E20340D0A2O20656C7365696620706C617965723A42752O665570287370652O6C2E726F6775652E636F2O6D6F6E732E6563686F696E6752657072696D616E643529207468656E0D0A4O2072657475726E20350D0A2O20656E640D0A0D0A2O2072657475726E202D310D0A656E640D0A0D0A66756E6374696F6E206170692E452O66656374697665436F6D626F506F696E747328636F6D626F506F696E7473290D0A2O20696620636F6D626F506F696E7473202O3D203220616E6420706C617965723A42752O665570287370652O6C2E726F6775652E636F2O6D6F6E732E6563686F696E6752657072696D616E6432290D0A6O206F7220636F6D626F506F696E7473202O3D203320616E6420706C617965723A42752O665570287370652O6C2E726F6775652E636F2O6D6F6E732E6563686F696E6752657072696D616E6433290D0A6O206F7220636F6D626F506F696E7473202O3D203420616E6420706C617965723A42752O665570287370652O6C2E726F6775652E636F2O6D6F6E732E6563686F696E6752657072696D616E6434290D0A6O206F7220636F6D626F506F696E7473202O3D203520616E6420706C617965723A42752O665570287370652O6C2E726F6775652E636F2O6D6F6E732E6563686F696E6752657072696D616E643529207468656E0D0A4O2072657475726E20370D0A2O20656E640D0A2O2072657475726E20636F6D626F506F696E74730D0A656E640D0A00063O0012023O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);