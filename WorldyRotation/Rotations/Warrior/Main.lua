local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then do return;end elseif (v86==1) then local v111=v85[2];v83[v111]=v83[v111](v83[v111 + 1 ]);elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86<=4) then if (v86==3) then local v113=v85[2];v83[v113](v13(v83,v113 + 1 ,v78));else v83[v85[2]]=v85[3];end elseif (v86==5) then local v116=v85[2];v78=(v116 + v84) -1 ;for v125=v116,v78 do local v126=v79[v125-v116 ];v83[v125]=v126;end else local v117;local v118;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v83[v118]=v83[v118](v83[v118 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v78=(v118 + v84) -1 ;for v128=v118,v78 do v117=v79[v128-v118 ];v83[v128]=v117;end v77=v77 + 1 ;v85=v73[v77];v118=v85[2];v83[v118](v13(v83,v118 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703761E2O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206D756C74695370652O6C203D206170692E6D756C74695370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C0D0A6966206E6F74207370652O6C2E77612O72696F72207468656E0D0A2O207370652O6C2E77612O72696F72203D207B7D0D0A656E640D0A7370652O6C2E77612O72696F722E636F2O6D6F6E73203D207B0D0A2O202O2D2072616369616C730D0A2O20616E6365737472616C43612O6C203D207370652O6C28323734373338292C0D0A2O20617263616E65546F2O72656E74203D207370652O6C283238373330292C0D0A2O206261676F66547269636B73203D207370652O6C28333132342O31292C0D0A2O206265727365726B696E67203D207370652O6C283236323937292C0D0A2O20626C2O6F6446757279203D207370652O6C283230353732292C0D0A2O2066697265626C2O6F64203D207370652O6C283236352O3231292C0D0A2O206C69676874734A7564676D656E74203D207370652O6C28322O35363437292C0D0A2O2077617253746F6D70203D207370652O6C283230353439292C0D0A2O202O2D206162696C69746965730D0A2O2062612O746C6553686F7574203D207370652O6C282O363733292C0D0A2O20636861726765203D207370652O6C28312O30292C0D0A2O206865726F69635468726F77203D207370652O6C28352O372O35292C0D0A2O2070752O6D656C203D207370652O6C28362O3532292C0D0A2O20736C616D203D207370652O6C2831343634292C0D0A2O20766963746F727952757368203D207370652O6C28332O343238292C0D0A2O20646566656E736976655374616E6365203D207370652O6C28333836323038292C0D0A2O202O2D2074616C656E74730D0A2O20617661746172203D206D756C74695370652O6C283130373537342C2034302O313530292C0D0A2O2061766174617242752O66203D206D756C74695370652O6C283130373537342C2034302O313530292C0D0A2O206265727365726B657252616765203D207370652O6C283138342O39292C0D0A2O206265727365726B657273546F726D656E74203D207370652O6C28333930313233292C0D0A2O20626C2O6F64616E645468756E646572203D207370652O6C28333834322O37292C0D0A2O20646F75626C6554696D65203D207370652O6C28313033383237292C0D0A2O206372757368696E67466F726365203D207370652O6C28333832373634292C0D0A2O2066726F7468696E674265727365726B6572203D207370652O6C2832312O353731292C0D0A2O20692O6D6F7661626C654F626A656374203D207370652O6C28333934333037292C0D0A2O20696E74696D69646174696E6753686F7574203D207370652O6C2835323436292C0D0A2O206865726F69634C656170203D207370652O6C2836352O34292C0D0A2O20696D70656E64696E67566963746F7279203D207370652O6C28323032313638292C0D0A2O206F7665727768656C6D696E6752616765203D207370652O6C28333832373637292C0D0A2O2072612O6C79696E67437279203D207370652O6C283937343632292C0D0A2O2072756D626C696E674561727468203D207370652O6C283237352O3339292C0D0A2O2073686F636B77617665203D207370652O6C283436393638292C0D0A2O20736F6E6963422O6F6D203D207370652O6C28333930373235292C0D0A2O2073706561726F6642617374696F6E203D207370652O6C28333736303739292C0D0A2O207370652O6C5265666C656374696F6E203D207370652O6C283233393230292C0D0A2O2073746F726D426F6C74203D207370652O6C28313037353730292C0D0A2O207468756E646572436C6170203D206D756C74695370652O6C28363334332C20333936373139292C0D0A2O207468756E6465726F7573526F6172203D207370652O6C28333834333138292C0D0A2O20746974616E69635468726F77203D207370652O6C28333834303930292C0D0A2O207761724D616368696E6542752O66203D207370652O6C2832362O323332292C0D0A2O20777265636B696E675468726F77203D207370652O6C283338342O3130292C0D0A2O202O2D2062752O66730D0A2O2062612O746C6553686F757442752O66203D207370652O6C282O363733292C0D0A2O202O2D20702O6F6C0D0A2O20702O6F6C203D207370652O6C284O393130292C0D0A7D0D0A0D0A7370652O6C2E77612O72696F722E61726D73203D204D657267655461626C6542794B6579287370652O6C2E77612O72696F722E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O2062612O746C655374616E6365203D207370652O6C28333836313634292C0D0A2O2065786563757465203D206D756C74695370652O6C283136333230312C203238313O30292C0D0A2O20776869726C77696E64203D207370652O6C2831363830292C0D0A2O202O2D2074616C656E74730D0A2O20616E6765724D616E6167656D656E74203D207370652O6C2831352O323738292C0D0A2O2062612O746C656C6F7264203D207370652O6C2833382O363330292C0D0A2O2062612O746C656C6F726442752O66203D207370652O6C2833382O363331292C0D0A2O20626C6164656D617374657273546F726D656E74203D207370652O6C28333930313338292C0D0A2O20626C61646573746F726D203D206D756C74695370652O6C282O32373834372C203338392O3734292C0D0A2O20626C2O6F646C652O74696E67203D207370652O6C28333833313534292C0D0A2O20636C65617665203D207370652O6C28383435292C0D0A2O20636F6C6F2O737573536D617368203D206D756C74695370652O6C283136373130352C20323632313631292C0D0A2O20636F6C6F2O737573536D617368446562752O66203D207370652O6C28323038303836292C0D0A2O2064726561646E6175676874203D207370652O6C28323632313530292C0D0A2O20657865637574696F6E657273507265636973696F6E203D207370652O6C2833382O363334292C0D0A2O20657865637574696F6E657273507265636973696F6E446562752O66203D207370652O6C2833382O362O33292C0D0A2O20666572766F726F6642612O746C65203D207370652O6C28323032333136292C0D0A2O2068752O726963616E65203D207370652O6C28333930353633292C0D0A2O2068752O726963616E6542752O66203D207370652O6C28333930353831292C0D0A2O2069676E6F72655061696E203D207370652O6C28313930343536292C0D0A2O20696D70726F766564536C616D203D207370652O6C28342O30323035292C0D0A2O206A752O6765726E617574203D207370652O6C28333833323932292C0D0A2O206A752O6765726E61757442752O66203D207370652O6C28333833323932292C0D0A2O206D61727469616C50726F77652O7342752O66203D207370652O6C2837333834292C0D0A2O206D612O7361637265203D207370652O6C283238312O3031292C0D0A2O206D657263696C652O73426F6E656772696E646572203D207370652O6C2833382O333137292C0D0A2O206D657263696C652O73426F6E656772696E64657242752O66203D207370652O6C2833382O333136292C0D0A2O206D6F7274616C537472696B65203D207370652O6C28312O323934292C0D0A2O206F766572706F776572203D207370652O6C2837333834292C0D0A2O2072656E64203D207370652O6C282O3732292C0D0A2O2072656E64446562752O66203D207370652O6C28332O38353339292C0D0A2O20736B752O6C73706C692O746572203D207370652O6C28323630363433292C0D0A2O2073746F726D6F6653776F726473203D207370652O6C2833382O353132292C0D0A2O2073752O64656E4465617468203D207370652O6C283239373235292C0D0A2O2073752O64656E446561746842752O66203D207370652O6C283532343337292C0D0A2O2073772O6570696E67537472696B6573203D207370652O6C28323630373038292C0D0A2O2073772O6570696E67537472696B657342752O66203D207370652O6C28323630373038292C0D0A2O20746573746F664D69676874203D207370652O6C283338352O3038292C0D0A2O20746573746F664D6967687442752O66203D207370652O6C28333835303133292C0D0A2O20746964656F66426C2O6F64203D207370652O6C28333836333537292C0D0A2O20756E68696E676564203D207370652O6C2833382O363238292C0D0A2O20776172627265616B6572203D207370652O6C28323632313631292C0D0A2O207761726C6F726473546F726D656E74203D207370652O6C28333930313430292C0D0A2O202O2D2062752O66732F646562752O66730D0A2O206372757368696E67416476616E636542752O66203D207370652O6C28343130313338292C0D0A2O20642O6570576F756E6473446562752O66203D207370652O6C283236322O3135292C0D0A7D290D0A0D0A7370652O6C2E77612O72696F722E66757279203D204D657267655461626C6542794B6579287370652O6C2E77612O72696F722E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O206265727365726B65725374616E6365203D207370652O6C28333836313936292C0D0A2O20626C2O6F6462617468203D207370652O6C282O3335303936292C0D0A2O206372757368696E67426C6F77203D207370652O6C282O3335303937292C0D0A2O2065786563757465203D206D756C74695370652O6C28353330382C20323830373335292C0D0A2O20776869726C77696E64203D207370652O6C28313930342O31292C0D0A2O202O2D2074616C656E74730D0A2O20616E6765724D616E6167656D656E74203D207370652O6C2831352O323738292C0D0A2O20612O6E6968696C61746F72203D207370652O6C28333833393136292C0D0A2O20617368656E4A752O6765726E617574203D207370652O6C28333932353336292C0D0A2O20617368656E4A752O6765726E61757442752O66203D207370652O6C28333932353337292C0D0A2O20626C2O6F64746869727374203D207370652O6C2832332O3831292C0D0A2O20636F6C6453742O656C486F74426C2O6F64203D207370652O6C28333833393539292C0D0A2O2064616E63696E67426C61646573203D207370652O6C28333931363833292C0D0A2O2064616E63696E67426C6164657342752O66203D207370652O6C28333931362O38292C0D0A2O206672656E7A79203D207370652O6C282O3335302O37292C0D0A2O206672656E7A7942752O66203D207370652O6C282O3335303832292C0D0A2O20667572696F7573426C2O6F6474686972737442752O66203D207370652O6C28343233322O31292C202O2D20543331203270630D0A2O20696D70726F7665645768696C77696E64203D207370652O6C283132393530292C0D0A2O206D612O7361637265203D207370652O6C28323036333135292C0D0A2O206D656174436C6561766572203D207370652O6C28323830333932292C0D0A2O206D656174436C656176657242752O66203D207370652O6C283835373339292C0D0A2O206F64796E7346757279203D207370652O6C28333835303539292C0D0A2O206F6E736C6175676874203D207370652O6C28333135373230292C0D0A2O20726167696E67426C6F77203D207370652O6C283835322O38292C0D0A2O2072616D70616765203D207370652O6C28313834333637292C0D0A2O2072617661676572203D207370652O6C282O3238393230292C0D0A2O207265636B6C652O734162616E646F6E203D207370652O6C28333936373439292C0D0A2O207265636B6C652O736E652O73203D207370652O6C2831373139292C0D0A2O207265636B6C652O736E652O7342752O66203D207370652O6C2831373139292C0D0A2O2073746F726D6F6653776F726473203D207370652O6C28332O38393033292C0D0A2O2073752O64656E4465617468203D207370652O6C28323830373231292C0D0A2O2073752O64656E446561746842752O66203D207370652O6C283238302O3736292C0D0A2O2074656E646572697A65203D207370652O6C28332O38392O33292C0D0A2O20746974616E696352616765203D207370652O6C28333934333239292C0D0A2O20746974616E73546F726D656E74203D207370652O6C28333930313335292C0D0A2O207772617468616E6446757279203D207370652O6C28333932393336292C0D0A2O202O2D2062752O66730D0A2O20626C2O6F646372617A6542752O66203D207370652O6C28333933393531292C0D0A2O20656E7261676542752O66203D207370652O6C28313834333632292C0D0A2O206D657263696C652O73412O7361756C7442752O66203D207370652O6C2834302O393833292C0D0A7D290D0A0D0A7370652O6C2E77612O72696F722E70726F74656374696F6E203D204D657267655461626C6542794B6579287370652O6C2E77612O72696F722E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O2062612O746C655374616E6365203D207370652O6C28333836313634292C0D0A2O20646576617374617465203D207370652O6C283230323433292C0D0A2O2065786563757465203D207370652O6C28313633323031292C0D0A2O20736869656C64426C6F636B203D207370652O6C2832353635292C0D0A2O20736869656C64536C616D203D207370652O6C283233392O32292C0D0A2O202O2D2074616C656E74730D0A2O206261726261726963547261696E696E67203D207370652O6C28333930363735292C0D0A2O20626F6C73746572203D207370652O6C2832383O3031292C0D0A2O20622O6F6D696E67566F696365203D207370652O6C28323032373433292C0D0A2O206368616D70696F6E7342756C7761726B203D207370652O6C28333836333238292C0D0A2O2064656D6F72616C697A696E6753686F7574203D207370652O6C282O313630292C0D0A2O20656E647572696E67446566656E736573203D207370652O6C28333836303237292C0D0A2O206865617679526570657263752O73696F6E73203D207370652O6C28323033312O37292C0D0A2O2069676E6F72655061696E203D207370652O6C28313930343536292C0D0A2O20696E74657276656E65203D207370652O6C2833342O31292C0D0A2O20696D70656E65747261626C6557612O6C203D207370652O6C28333834303732292C0D0A2O206A752O6765726E617574203D207370652O6C28333933393637292C0D0A2O206C6173745374616E64203D207370652O6C283132393735292C0D0A2O206D612O7361637265203D207370652O6C283238312O3031292C0D0A2O2072617661676572203D207370652O6C282O3238393230292C0D0A2O2072656E64203D207370652O6C28333934303632292C0D0A2O20726576656E6765203D207370652O6C2836353732292C0D0A2O20736569736D696352657665726265726174696F6E203D207370652O6C28333832393536292C0D0A2O20736869656C64436861726765203D207370652O6C28333835393532292C0D0A2O20736869656C6457612O6C203D207370652O6C28383731292C0D0A2O2073752O64656E4465617468203D207370652O6C283239373235292C0D0A2O2073752O64656E446561746842752O66203D207370652O6C283532343337292C0D0A2O20752O6E657276696E67466F637573203D207370652O6C28333834303432292C0D0A2O20756E73746F2O7061626C65466F726365203D207370652O6C283237352O3336292C0D0A2O202O2D2062752O66730D0A2O2061766174617242752O66203D207370652O6C2834302O313530292C0D0A2O206561727468656E54656E616369747942752O66203D207370652O6C28343130323138292C202O2D207433302034500D0A2O206C6173745374616E6442752O66203D207370652O6C283132393735292C0D0A2O2072612O6C79696E6743727942752O66203D207370652O6C283937343633292C0D0A2O20726576656E676542752O66203D207370652O6C2835333032292C0D0A2O20732O65696E6752656442752O66203D207370652O6C28333836343836292C0D0A2O20736869656C64426C6F636B42752O66203D207370652O6C28313332343034292C0D0A2O20736869656C6457612O6C42752O66203D207370652O6C28383731292C0D0A2O2076696F6C656E744F7574627572737442752O66203D207370652O6C28333836343738292C0D0A2O2076616E67756172647344657465726D696E6174696F6E42752O66203D207370652O6C28333934303536292C202O2D207432392032500D0A2O202O2D20646562752O66730D0A2O2072656E64446562752O66203D207370652O6C28332O38353339292C0D0A7D290D0A0D0A2O2D206974656D730D0A6966206E6F74206974656D2E77612O72696F72207468656E0D0A2O206974656D2E77612O72696F72203D207B7D0D0A656E640D0A6974656D2E77612O72696F722E636F2O6D6F6E73203D207B0D0A7D0D0A0D0A6974656D2E77612O72696F722E61726D73203D204D657267655461626C6542794B6579286974656D2E77612O72696F722E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E77612O72696F722E66757279203D204D657267655461626C6542794B6579286974656D2E77612O72696F722E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E77612O72696F722E70726F74656374696F6E203D204D657267655461626C6542794B6579286974656D2E77612O72696F722E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F730D0A6966206E6F74206D6163726F2E77612O72696F72207468656E0D0A2O206D6163726F2E77612O72696F72203D207B7D0D0A656E640D0A6D6163726F2E77612O72696F722E636F2O6D6F6E73203D207B0D0A2O202O2D207370652O6C730D0A2O2070752O6D656C4D6F7573656F766572203D206D6163726F282270752O6D656C4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E77612O72696F722E636F2O6D6F6E732E70752O6D656C3A4E616D65282O292C0D0A2O2073746F726D426F6C744D6F7573656F766572203D206D6163726F282273746F726D426F6C744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E77612O72696F722E636F2O6D6F6E732E73746F726D426F6C743A4E616D65282O292C0D0A2O2073706561726F6642617374696F6E506C61796572203D206D6163726F282273706561726F6642617374696F6E506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E77612O72696F722E636F2O6D6F6E732E73706561726F6642617374696F6E3A4E616D65282O292C0D0A7D0D0A0D0A6D6163726F2E77612O72696F722E61726D73203D204D657267655461626C6542794B6579286D6163726F2E77612O72696F722E636F2O6D6F6E732C207B0D0A2O20636F6C6F2O737573536D6173684D6F7573656F766572203D206D6163726F2822636F6C6F2O737573536D6173684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E77612O72696F722E61726D732E636F6C6F2O737573536D6173683A4E616D65282O292C0D0A2O20657865637574654D6F7573656F766572203D206D6163726F2822657865637574654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E77612O72696F722E61726D732E657865637574653A4E616D65282O292C0D0A2O206D6F7274616C537472696B654D6F7573656F766572203D206D6163726F28226D6F7274616C537472696B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E77612O72696F722E61726D732E6D6F7274616C537472696B653A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E77612O72696F722E66757279203D204D657267655461626C6542794B6579286D6163726F2E77612O72696F722E636F2O6D6F6E732C207B0D0A2O202O2D207370652O6C730D0A2O2072617661676572506C61796572203D206D6163726F282272617661676572506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E77612O72696F722E667572792E726176616765723A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E77612O72696F722E70726F74656374696F6E203D204D657267655461626C6542794B6579286D6163726F2E77612O72696F722E636F2O6D6F6E732C207B0D0A2O202O2D207370652O6C730D0A2O2072617661676572506C61796572203D206D6163726F282272617661676572506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E77612O72696F722E70726F74656374696F6E2E726176616765723A4E616D65282O292C0D0A7D290D0A00063O0012063O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);