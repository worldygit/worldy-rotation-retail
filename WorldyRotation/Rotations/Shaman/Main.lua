local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));elseif (v86==1) then v83[v85[2]]=v59[v85[3]];else do return;end end elseif (v86<=3) then local v112=v85[2];v78=(v112 + v84) -1 ;for v116=v112,v78 do local v117=v79[v116-v112 ];v83[v116]=v117;end elseif (v86>4) then local v124=v85[2];v83[v124]=v83[v124](v83[v124 + 1 ]);else local v126=v85[2];v83[v126]=v83[v126](v83[v126 + 1 ]);end elseif (v86<=8) then if (v86<=6) then local v113=v85[2];v78=(v113 + v84) -1 ;for v119=v113,v78 do local v120=v79[v119-v113 ];v83[v119]=v120;end elseif (v86==7) then v83[v85[2]]=v85[3];else v83[v85[2]]=v85[3];end elseif (v86<=9) then local v114=v85[2];v83[v114](v13(v83,v114 + 1 ,v78));elseif (v86>10) then do return;end else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703551A2O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206D756C74695370652O6C203D206170692E6D756C74695370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C730D0A6966206E6F74207370652O6C2E7368616D616E207468656E0D0A2O207370652O6C2E7368616D616E203D207B7D0D0A656E640D0A7370652O6C2E7368616D616E2E636F2O6D6F6E73203D207B0D0A2O202O2D2072616369616C730D0A2O20616E6365737472616C43612O6C203D207370652O6C28323734373338292C0D0A2O206261676F66547269636B73203D207370652O6C28333132342O31292C0D0A2O206265727365726B696E67203D207370652O6C283236323937292C0D0A2O20626C2O6F6446757279203D207370652O6C282O33363937292C0D0A2O2066697265626C2O6F64203D207370652O6C283236352O3231292C0D0A2O202O2D206162696C69746965730D0A2O20626C2O6F646C757374203D206D756C74695370652O6C28323832352C203332313832292C202O2D20626C2O6F646C7573742F6865726F69736D0D0A2O20666C616D6553686F636B203D207370652O6C28312O38333839292C0D0A2O20666C616D656E746F6E677565576561706F6E203D207370652O6C28333138303338292C0D0A2O2066726F737453686F636B203D207370652O6C28313936383430292C0D0A2O206865616C696E675375726765203D207370652O6C28382O3034292C0D0A2O206C696768746E696E67426F6C74203D207370652O6C28312O38313936292C0D0A2O206C696768746E696E67536869656C64203D207370652O6C28313932313036292C0D0A2O202O2D2074616C656E74730D0A2O2061737472616C5368696674203D207370652O6C28313038323731292C0D0A2O20636170616369746F72546F74656D203D207370652O6C28313932303538292C0D0A2O20636861696E4C696768746E696E67203D207370652O6C28312O382O3433292C0D0A2O206561727468456C656D656E74616C203D207370652O6C28313938313033292C0D0A2O206561727468536869656C64203D207370652O6C28393734292C0D0A2O20656C656D656E74616C426C617374203D207370652O6C282O3137303134292C0D0A2O206C6176614275727374203D207370652O6C283531353035292C0D0A2O20642O65706C79522O6F746564456C656D656E7473203D207370652O6C28333738323730292C0D0A2O206E61747572657353776966746E652O73203D207370652O6C28333738303831292C0D0A2O207072696D6F726469616C57617665203D207370652O6C28333735393832292C0D0A2O2073706972697477616C6B6572734772616365203D207370652O6C283739323036292C0D0A2O20746F74656D6963526563612O6C203D207370652O6C28313038323835292C0D0A2O2077696E645368656172203D207370652O6C2835372O3934292C0D0A2O202O2D2062752O66730D0A2O206C696768746E696E67536869656C6442752O66203D207370652O6C28313932313036292C0D0A2O207072696D6F726469616C5761766542752O66203D207370652O6C28333735393836292C0D0A2O2073706972697477616C6B657273477261636542752O66203D207370652O6C283739323036292C0D0A2O2073706C696E7465726564456C656D656E747342752O66203D207370652O6C28333832303433292C0D0A2O202O2D20646562752O66730D0A2O20666C616D6553686F636B446562752O66203D207370652O6C28312O38333839292C0D0A2O202O2D206D6973630D0A2O20702O6F6C203D207370652O6C284O393130292C0D0A7D0D0A0D0A7370652O6C2E7368616D616E2E656E68616E63656D656E74203D204D657267655461626C6542794B6579287370652O6C2E7368616D616E2E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O2077696E64737472696B65203D207370652O6C282O3135333536292C0D0A2O202O2D2074616C656E74730D0A2O20616C706861576F6C66203D207370652O6C28313938343334292C0D0A2O20617363656E64616E6365203D207370652O6C282O3134303531292C0D0A2O20617368656E436174616C797374203D207370652O6C28333930333730292C0D0A2O20636F6E76657267696E6753746F726D73203D207370652O6C28333834333633292C0D0A2O2063726173684C696768746E696E67203D207370652O6C28313837383734292C0D0A2O206372617368696E6753746F726D73203D207370652O6C282O3334333038292C0D0A2O20642O6F6D57696E6473203D207370652O6C28333834333532292C0D0A2O20656C656D656E74616C412O7361756C74203D207370652O6C28323130383533292C0D0A2O20656C656D656E74616C53706972697473203D207370652O6C28323632363234292C0D0A2O20666572616C537069726974203D207370652O6C283531352O33292C0D0A2O20666972654E6F7661203D207370652O6C283O33393734292C0D0A2O206861696C73746F726D203D207370652O6C282O3334313935292C0D0A2O20686F7448616E64203D207370652O6C28323031392O30292C0D0A2O20696365537472696B65203D207370652O6C2833342O323430292C0D0A2O206C617368696E67466C616D6573203D207370652O6C282O3334303436292C0D0A2O206C6176614C617368203D207370652O6C283630313033292C0D0A2O206D6F6C74656E412O7361756C74203D207370652O6C282O3334302O33292C0D0A2O206F766572666C6F77696E674D61656C7374726F6D203D207370652O6C28333834313439292C0D0A2O20737461746963412O63756D756C6174696F6E203D207370652O6C2833382O342O31292C0D0A2O2073746F726D626C617374203D207370652O6C2833312O393330292C0D0A2O2073746F726D666C752O7279203D207370652O6C28332O34333537292C0D0A2O2073746F726D737472696B65203D207370652O6C283137333634292C0D0A2O2073756E646572696E67203D207370652O6C28313937323134292C0D0A2O20737769726C696E674D61656C7374726F6D203D207370652O6C28333834333539292C0D0A2O2074686F72696D73496E766F636174696F6E203D207370652O6C2833384O34292C0D0A2O20756E72756C7957696E6473203D207370652O6C28333930322O38292C0D0A2O2077696E6466757279546F74656D203D207370652O6C2838353132292C0D0A2O2077696E6466757279576561706F6E203D207370652O6C282O33373537292C0D0A2O207769746368446F63746F7273416E636573747279203D207370652O6C2833383O3437292C0D0A2O202O2D2062752O66730D0A2O20617363656E64616E636542752O66203D207370652O6C282O3134303531292C0D0A2O20617368656E436174616C79737442752O66203D207370652O6C28333930333731292C0D0A2O20636F6E76657267696E6753746F726D7342752O66203D207370652O6C28313938332O30292C0D0A2O20637261636B6C696E675468756E64657242752O66203D207370652O6C28343039383334292C0D0A2O2063726173684C696768746E696E6742752O66203D207370652O6C28313837383738292C0D0A2O20634C43726173684C696768746E696E6742752O66203D207370652O6C283O33393634292C0D0A2O20642O6F6D57696E647342752O66203D207370652O6C28333834333532292C0D0A2O20666572616C53706972697442752O66203D207370652O6C283O33393537292C0D0A2O20676174686572696E6753746F726D7342752O66203D207370652O6C28313938332O30292C0D0A2O206861696C73746F726D42752O66203D207370652O6C282O3334313936292C0D0A2O20686F7448616E6442752O66203D207370652O6C28323135373835292C0D0A2O20696365537472696B6542752O66203D207370652O6C28333834333537292C0D0A2O206D61656C7374726F6D576561706F6E42752O66203D207370652O6C28332O34313739292C0D0A2O2073746F726D6272696E67657242752O66203D207370652O6C28323031383436292C0D0A2O2077696E6466757279546F74656D42752O66203D207370652O6C28333237393432292C0D0A2O202O2D20646562752O66730D0A2O206C617368696E67466C616D6573446562752O66203D207370652O6C282O3334313638292C0D0A2O202O2D20656C656D656E74616C20737069726974732062752O66730D0A2O20637261636B6C696E67537572676542752O66203D207370652O6C282O3234313237292C0D0A2O206561727468656E576561706F6E42752O66203D207370652O6C28333932333735292C0D0A2O206C65676163796F6674686546726F73745769746368203D207370652O6C282O3335393031292C0D0A2O206963794564676542752O66203D207370652O6C282O3234313236292C0D0A2O206D6F6C74656E576561706F6E42752O66203D207370652O6C282O3234313235292C0D0A2O202O2D20746965722032392062752O66730D0A2O206D61656C7374726F6D6F66456C656D656E747342752O66203D207370652O6C28333934362O37292C0D0A2O202O2D20746965722033302062752O66730D0A2O20766F6C63616E6963537472656E67746842752O66203D207370652O6C28343039382O33292C0D0A7D290D0A0D0A7370652O6C2E7368616D616E2E656C656D656E74616C203D204D657267655461626C6542794B6579287370652O6C2E7368616D616E2E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O20656172746853686F636B203D207370652O6C2838303432292C0D0A2O2065617274687175616B65203D207370652O6C2836312O3832292C0D0A2O2066697265456C656D656E74616C203D207370652O6C28313938303637292C0D0A2O202O2D2074616C656E74730D0A2O20616674657273686F636B203D207370652O6C283237332O3231292C0D0A2O20617363656E64616E6365203D207370652O6C282O3134303530292C0D0A2O206561727468656E52616765203D207370652O6C28313730333734292C0D0A2O206563682O6F66746865456C656D656E7473203D207370652O6C283O33393139292C0D0A2O206563686F65736F66477265617453756E646572696E67203D207370652O6C28333834303837292C0D0A2O206563686F696E6753686F636B203D207370652O6C28333230313235292C0D0A2O20656C65637472696669656453686F636B73203D207370652O6C28333832303836292C0D0A2O206579656F6674686553746F726D203D207370652O6C28333831373038292C0D0A2O20666C6F776F66506F776572203D207370652O6C28333835393233292C0D0A2O20666C75784D656C74696E67203D207370652O6C283338312O3736292C0D0A2O2069636566757279203D207370652O6C28323130373134292C0D0A2O20696D70726F766564466C616D65746F6E677565576561706F6E203D207370652O6C28333832303237292C0D0A2O206C6176614265616D203D207370652O6C282O3134303734292C0D0A2O206C6176615375726765203D207370652O6C283O373536292C0D0A2O206C696768746E696E67526F64203D207370652O6C28323130363839292C0D0A2O206C69717569644D61676D61546F74656D203D207370652O6C2831394O32292C0D0A2O206D61676D614368616D626572203D207370652O6C28333831393332292C0D0A2O206D61737465726F66746865456C656D656E7473203D207370652O6C283136312O36292C0D0A2O20706F7765726F667468654D61656C7374726F6D203D207370652O6C28313931383631292C0D0A2O207072696D616C456C656D656E74616C697374203D207370652O6C282O3137303133292C0D0A2O207072696D6F726469616C5375726765203D207370652O6C28333836343734292C0D0A2O2073656172696E67466C616D6573203D207370652O6C28333831373832292C0D0A2O20736B79627265616B657273466965727944656D697365203D207370652O6C28333738333130292C0D0A2O2073706C696E7465726564456C656D656E7473203D207370652O6C28333832303432292C0D0A2O20737461746963446973636861726765203D207370652O6C2833342O323433292C0D0A2O2073746F726D456C656D656E74616C203D207370652O6C2831392O323439292C0D0A2O2073746F726D6B2O65706572203D207370652O6C28313931363334292C0D0A2O2073757267656F66506F776572203D207370652O6C28323632333033292C0D0A2O207377652O6C696E674D61656C7374726F6D203D207370652O6C28333834333539292C0D0A2O20756E6C696D69746564506F776572203D207370652O6C28323630383935292C0D0A2O20756E72656C656E74696E6743616C616D697479203D207370652O6C28333832363835292C0D0A2O2077696E64737065616B6572734C617661526573757267656E6365203D207370652O6C28333738323638292C0D0A2O202O2D20706574730D0A2O206D6574656F72203D207370652O6C282O3137352O382C202270657422292C0D0A2O2063612O6C4C696768746E696E67203D207370652O6C283135373334382C202270657422292C0D0A2O202O2D2062752O66730D0A2O20617363656E64616E636542752O66203D207370652O6C282O3134303530292C0D0A2O2063612O6C4C696768746E696E6742752O66203D207370652O6C28313537333438292C0D0A2O206563686F65736F66477265617453756E646572696E6742752O66203D207370652O6C28333834302O38292C0D0A2O206563686F696E6753686F636B42752O66203D207370652O6C28333230313235292C0D0A2O20666C75784D656C74696E6742752O66203D207370652O6C283338313O37292C0D0A2O206963656675727942752O66203D207370652O6C28323130373134292C0D0A2O206C617661537572676542752O66203D207370652O6C283O373632292C0D0A2O206D61737465726F66746865456C656D656E747342752O66203D207370652O6C28323630373334292C0D0A2O20706F7765726F667468654D61656C7374726F6D42752O66203D207370652O6C28313931382O37292C0D0A2O2073746F726D6B2O6570657242752O66203D207370652O6C28313931363334292C0D0A2O2073757267656F66506F77657242752O66203D207370652O6C2832382O353134292C0D0A2O2077696E644775737442752O66203D207370652O6C28323633383036292C0D0A2O2077696E64737065616B6572734C617661526573757267656E636542752O66203D207370652O6C28333738323639292C0D0A2O202O2D20646562752O66730D0A2O20656C65637472696669656453686F636B73446562752O66203D207370652O6C28333832303839292C0D0A2O206C696768746E696E67526F64446562752O66203D207370652O6C28313937323039292C0D0A7D290D0A0D0A7370652O6C2E7368616D616E2E726573746F726174696F6E203D204D657267655461626C6542794B6579287370652O6C2E7368616D616E2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6966206E6F74206974656D2E7368616D616E207468656E0D0A2O206974656D2E7368616D616E203D207B7D0D0A656E640D0A6974656D2E7368616D616E2E636F2O6D6F6E73203D207B0D0A7D0D0A6974656D2E7368616D616E2E656E68616E63656D656E74203D204D657267655461626C6542794B6579286974656D2E7368616D616E2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E7368616D616E2E656C656D656E74616C203D204D657267655461626C6542794B6579286974656D2E7368616D616E2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E7368616D616E2E726573746F726174696F6E203D204D657267655461626C6542794B6579286974656D2E7368616D616E2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F0D0A6966206E6F74206D6163726F2E7368616D616E207468656E0D0A2O206D6163726F2E7368616D616E203D207B7D0D0A656E640D0A6D6163726F2E7368616D616E2E636F2O6D6F6E73203D207B0D0A2O20666C616D6553686F636B4D6F7573656F766572203D206D6163726F2822666C616D6553686F636B4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7368616D616E2E636F2O6D6F6E732E666C616D6553686F636B3A4E616D65282O292C0D0A2O207072696D6F726469616C576176654D6F7573656F766572203D206D6163726F28227072696D6F726469616C576176654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7368616D616E2E636F2O6D6F6E732E7072696D6F726469616C576176653A4E616D65282O292C0D0A2O2077696E6453686561724D6F7573656F766572203D206D6163726F282277696E6453686561724D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7368616D616E2E636F2O6D6F6E732E77696E6453686561723A4E616D65282O292C0D0A7D0D0A0D0A6D6163726F2E7368616D616E2E656E68616E63656D656E74203D204D657267655461626C6542794B6579286D6163726F2E7368616D616E2E636F2O6D6F6E732C207B0D0A2O206C6176614C6173684D6F7573656F766572203D206D6163726F28226C6176614C6173684D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7368616D616E2E656E68616E63656D656E742E6C6176614C6173683A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E7368616D616E2E656C656D656E74616C203D204D657267655461626C6542794B6579286D6163726F2E7368616D616E2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6D6163726F2E7368616D616E2E726573746F726174696F6E203D204D657267655461626C6542794B6579286D6163726F2E7368616D616E2E636F2O6D6F6E732C207B0D0A7D290D0A00063O00120A3O00013O001207000100024O00043O000200022O000300019O003O00012O000B3O00017O00",v9(),...);