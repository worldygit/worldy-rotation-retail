local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110]=v83[v110](v83[v110 + 1 ]);elseif (v86>1) then local v113=v85[2];v83[v113](v13(v83,v113 + 1 ,v78));else do return;end end elseif (v86<=4) then if (v86>3) then v83[v85[2]]=v59[v85[3]];else local v116=v85[2];v78=(v116 + v84) -1 ;for v128=v116,v78 do local v129=v79[v128-v116 ];v83[v128]=v129;end end elseif (v86>5) then v83[v85[2]]=v85[3];else local v119;local v120;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v83[v120]=v83[v120](v83[v120 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v78=(v120 + v84) -1 ;for v131=v120,v78 do v119=v79[v131-v120 ];v83[v131]=v119;end v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v83[v120](v13(v83,v120 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67037C2F2O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A3O2D207O3D204C4F43414C495A45207O3D0D0A2O2D20412O646F6E0D0A6C6F63616C20612O646F6E4E616D652C20612O646F6E5461626C65203D203O2E0D0A2O2D204865726F4442430D0A6C6F63616C20444243203D204865726F4442432E4442430D0A2O2D204865726F4C69620D0A6C6F63616C20484C9O203D204865726F4C69620D0A6C6F63616C2043616368656O203D204865726F43616368650D0A6C6F63616C20556E69747O203D20484C2E556E69740D0A6C6F63616C20506C617965725O203D20556E69742E506C617965720D0A6C6F63616C205461726765745O203D20556E69742E5461726765740D0A6C6F63616C205065748O203D20556E69742E5065740D0A6C6F63616C205370652O6C6O203D20484C2E5370652O6C0D0A6C6F63616C204D756C74695370652O6C203D20484C2E4D756C74695370652O6C0D0A6C6F63616C204974656D7O203D20484C2E4974656D0D0A6C6F63616C204D657267655461626C6542794B6579203D20484C2E5574696C732E4D657267655461626C6542794B65790D0A2O2D20576F726C6479526F746174696F6E0D0A6C6F63616C2057529O203D20576F726C6479526F746174696F6E0D0A6C6F63616C204D6163726F6O203D2057522E4D6163726F0D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D3D0D0A0D0A2O2D205370652O6C0D0A6966206E6F74205370652O6C2E57612O72696F72207468656E205370652O6C2E57612O72696F72203D207B7D20656E640D0A5370652O6C2E57612O72696F722E436F2O6D6F6E73203D207B0D0A2O202O2D2052616369616C730D0A2O20416E6365737472616C43612O6C9O209O207O203D205370652O6C28323734373338292C0D0A2O20417263616E65546F2O72656E749O209O207O203D205370652O6C283238373330292C0D0A2O204261676F66547269636B739O209O209O203D205370652O6C28333132342O31292C0D0A2O204265727365726B696E679O209O209O20203D205370652O6C283236323937292C0D0A2O20426C2O6F64467572799O209O209O202O203D205370652O6C283230353732292C0D0A2O2046697265626C2O6F649O209O209O202O203D205370652O6C283236352O3231292C0D0A2O204C69676874734A7564676D656E749O209O206O203D205370652O6C28322O35363437292C0D0A2O2057617253746F6D709O209O209O203O203D205370652O6C283230353439292C0D0A2O202O2D204162696C69746965730D0A2O2042612O746C6553686F75749O209O209O203D205370652O6C282O363733292C0D0A2O204368617267659O209O209O205O203D205370652O6C28312O30292C0D0A2O204865726F69635468726F779O209O209O203D205370652O6C28352O372O35292C0D0A2O2050752O6D656C9O209O209O205O203D205370652O6C28362O3532292C0D0A2O20536C616D9O209O209O207O203D205370652O6C2831343634292C0D0A2O20566963746F7279527573689O209O209O203D205370652O6C28332O343238292C0D0A2O20446566656E736976655374616E63659O209O205O203D205370652O6C28333836323038292C0D0A2O202O2D2054616C656E74730D0A2O204176617461729O209O209O205O203D204D756C74695370652O6C283130373537342C2034302O313530292C0D0A2O2041766174617242752O669O209O209O20203D204D756C74695370652O6C283130373537342C2034302O313530292C0D0A2O204265727365726B6572526167659O209O207O203D205370652O6C283138342O39292C0D0A2O204265727365726B657273546F726D656E749O209O203O203D205370652O6C28333930313233292C0D0A2O20426C2O6F64616E645468756E6465729O209O205O203D205370652O6C28333834322O37292C0D0A2O20446F75626C6554696D659O209O209O20203D205370652O6C28313033383237292C0D0A2O204372757368696E67466F7263659O209O207O203D205370652O6C28333832373634292C0D0A2O2046726F7468696E674265727365726B65729O209O203O203D205370652O6C2832312O353731292C0D0A2O20492O6D6F7661626C654F626A6563749O209O205O203D205370652O6C28333934333037292C0D0A2O20496E74696D69646174696E6753686F75749O209O203O203D205370652O6C2835323436292C0D0A2O204865726F69634C6561709O209O209O20203D205370652O6C2836352O34292C0D0A2O20496D70656E64696E67566963746F72799O209O204O203D205370652O6C28323032313638292C0D0A2O204F7665727768656C6D696E67526167659O209O204O203D205370652O6C28333832373637292C0D0A2O2052612O6C79696E674372799O209O209O203D205370652O6C283937343632292C0D0A2O2052756D626C696E6745617274689O209O207O203D205370652O6C283237352O3339292C0D0A2O2053686F636B776176659O209O209O202O203D205370652O6C283436393638292C0D0A2O20536F6E6963422O6F6D9O209O209O202O203D205370652O6C28333930373235292C0D0A2O2053706561726F6642617374696F6E9O209O206O203D205370652O6C28333736303739292C0D0A2O205370652O6C5265666C656374696F6E9O209O205O203D205370652O6C283233393230292C0D0A2O2053746F726D426F6C749O209O209O202O203D205370652O6C28313037353730292C0D0A2O205468756E646572436C61709O209O209O203D204D756C74695370652O6C28363334332C20333936373139292C0D0A2O205468756E6465726F7573526F61729O209O206O203D205370652O6C28333834333138292C0D0A2O20546974616E69635468726F779O209O208O203D205370652O6C28333834303930292C0D0A2O205761724D616368696E6542752O669O209O206O203D205370652O6C2832362O323332292C0D0A2O20577265636B696E675468726F779O209O207O203D205370652O6C283338342O3130292C0D0A2O202O2D2042752O66730D0A2O2042612O746C6553686F757442752O669O209O205O203D205370652O6C282O363733292C0D0A2O202O2D20502O6F6C0D0A2O20502O6F6C9O209O209O207O203D205370652O6C284O393130292C0D0A7D0D0A0D0A5370652O6C2E57612O72696F722E41726D73203D204D657267655461626C6542794B6579285370652O6C2E57612O72696F722E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O2042612O746C655374616E63659O209O208O203D205370652O6C28333836313634292C0D0A2O20457865637574659O209O209O204O203D204D756C74695370652O6C283136333230312C203238313O30292C0D0A2O20576869726C77696E649O209O209O202O203D205370652O6C2831363830292C0D0A2O202O2D2054616C656E74730D0A2O20416E6765724D616E6167656D656E749O209O205O203D205370652O6C2831352O323738292C0D0A2O2042612O746C656C6F72649O209O209O20203D205370652O6C2833382O363330292C0D0A2O2042612O746C656C6F726442752O669O209O206O203D205370652O6C2833382O363331292C0D0A2O20426C6164656D617374657273546F726D656E749O209O20203D205370652O6C28333930313338292C0D0A2O20426C61646573746F726D9O209O209O20203D204D756C74695370652O6C282O32373834372C203338392O3734292C0D0A2O20436C656176659O209O209O205O203D205370652O6C28383435292C0D0A2O20436F6C6F2O737573536D6173689O209O207O203D204D756C74695370652O6C283136373130352C20323632313631292C0D0A2O20436F6C6F2O737573536D617368446562752O669O209O20203D205370652O6C28323038303836292C0D0A2O2044726561646E61756768749O209O209O203D205370652O6C28323632313530292C0D0A2O20457865637574696F6E657273507265636973696F6E9O208O203D205370652O6C2833382O363334292C0D0A2O20457865637574696F6E657273507265636973696F6E446562752O669O202O203D205370652O6C2833382O362O33292C0D0A2O20466572766F726F6642612O746C659O209O206O203D205370652O6C28323032333136292C0D0A2O2048752O726963616E659O209O209O202O203D205370652O6C28333930353633292C0D0A2O2048752O726963616E6542752O669O209O207O203D205370652O6C28333930353831292C0D0A2O2049676E6F72655061696E9O209O209O20203D205370652O6C28313930343536292C0D0A2O204A752O6765726E6175749O209O209O20203D205370652O6C28333833323932292C0D0A2O204A752O6765726E61757442752O669O209O206O203D205370652O6C28333833323932292C0D0A2O204D61727469616C50726F77652O7342752O669O209O202O203D205370652O6C2837333834292C0D0A2O204D612O73616372659O209O209O203O203D205370652O6C283238312O3031292C0D0A2O204D657263696C652O73426F6E656772696E6465729O209O203D205370652O6C2833382O333137292C0D0A2O204D657263696C652O73426F6E656772696E64657242752O669O205O203D205370652O6C2833382O333136292C0D0A2O204D6F7274616C537472696B659O209O208O203D205370652O6C28312O323934292C0D0A2O204F766572706F7765729O209O209O202O203D205370652O6C2837333834292C0D0A2O2052656E649O209O209O207O203D205370652O6C282O3732292C0D0A2O2052656E64446562752O669O209O209O20203D205370652O6C28332O38353339292C0D0A2O20536B752O6C73706C692O7465729O209O207O203D205370652O6C28323630363433292C0D0A2O2053746F726D6F6653776F7264739O209O207O203D205370652O6C2833382O353132292C0D0A2O2053752O64656E44656174689O209O209O203D205370652O6C283239373235292C0D0A2O2053752O64656E446561746842752O669O209O205O203D205370652O6C283532343337292C0D0A2O2053772O6570696E67537472696B65739O209O205O203D205370652O6C28323630373038292C0D0A2O2053772O6570696E67537472696B657342752O669O209O20203D205370652O6C28323630373038292C0D0A2O20546573746F664D696768749O209O209O203D205370652O6C283338352O3038292C0D0A2O20546573746F664D6967687442752O669O209O205O203D205370652O6C28333835303133292C0D0A2O20546964656F66426C2O6F649O209O209O203D205370652O6C28333836333537292C0D0A2O20556E68696E6765649O209O209O203O203D205370652O6C2833382O363238292C0D0A2O20576172627265616B65729O209O209O20203D205370652O6C28323632313631292C0D0A2O205761726C6F726473546F726D656E749O209O205O203D205370652O6C28333930313430292C0D0A2O202O2D2042752O66732F446562752O66730D0A2O204372757368696E67416476616E636542752O669O209O20203D205370652O6C28343130313338292C0D0A2O20442O6570576F756E6473446562752O669O209O204O203D205370652O6C283236322O3135292C0D0A7D290D0A0D0A5370652O6C2E57612O72696F722E46757279203D204D657267655461626C6542794B6579285370652O6C2E57612O72696F722E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O204265727365726B65725374616E63659O209O205O203D205370652O6C28333836313936292C0D0A2O20426C2O6F64626174689O209O209O202O203D205370652O6C282O3335303936292C0D0A2O204372757368696E67426C6F779O209O208O203D205370652O6C282O3335303937292C0D0A2O20457865637574659O209O209O204O203D204D756C74695370652O6C28353330382C20323830373335292C0D0A2O20576869726C77696E649O209O209O202O203D205370652O6C28313930342O31292C0D0A2O202O2D2054616C656E74730D0A2O20416E6765724D616E6167656D656E749O209O205O203D205370652O6C2831352O323738292C0D0A2O20412O6E6968696C61746F729O209O209O203D205370652O6C28333833393136292C0D0A2O20417368656E4A752O6765726E6175749O209O205O203D205370652O6C28333932353336292C0D0A2O20417368656E4A752O6765726E61757442752O669O209O20203D205370652O6C28333932353337292C0D0A2O20426C2O6F647468697273749O209O209O203D205370652O6C2832332O3831292C0D0A2O20436F6C6453742O656C486F74426C2O6F649O209O203O203D205370652O6C28333833393539292C0D0A2O2044616E63696E67426C616465739O209O207O203D205370652O6C28333931363833292C0D0A2O2044616E63696E67426C6164657342752O669O209O203O203D205370652O6C28333931362O38292C0D0A2O204672656E7A799O209O209O205O203D205370652O6C282O3335302O37292C0D0A2O204672656E7A7942752O669O209O209O20203D205370652O6C282O3335303832292C0D0A2O20496D70726F7665645768696C77696E649O209O204O203D205370652O6C283132393530292C0D0A2O204D656174436C65617665729O209O209O203D205370652O6C28323830333932292C0D0A2O204D656174436C656176657242752O669O209O205O203D205370652O6C283835373339292C0D0A2O204F64796E73467572799O209O209O202O203D205370652O6C28333835303539292C0D0A2O204F6E736C61756768749O209O209O202O203D205370652O6C28333135373230292C0D0A2O20526167696E67426C6F779O209O209O20203D205370652O6C283835322O38292C0D0A2O2052616D706167659O209O209O204O203D205370652O6C28313834333637292C0D0A2O20526176616765729O209O209O204O203D205370652O6C282O3238393230292C0D0A2O205265636B6C652O734162616E646F6E9O209O205O203D205370652O6C28333936373439292C0D0A2O205265636B6C652O736E652O739O209O208O203D205370652O6C2831373139292C0D0A2O205265636B6C652O736E652O7342752O669O209O204O203D205370652O6C2831373139292C0D0A2O2053746F726D6F6653776F7264739O209O207O203D205370652O6C28332O38393033292C0D0A2O2053752O64656E44656174689O209O209O203D205370652O6C28323830373231292C0D0A2O2053752O64656E446561746842752O669O209O205O203D205370652O6C283238302O3736292C0D0A2O2054656E646572697A659O209O209O202O203D205370652O6C28332O38392O33292C0D0A2O20546974616E6963526167659O209O209O203D205370652O6C28333934333239292C0D0A2O20546974616E73546F726D656E749O209O207O203D205370652O6C28333930313335292C0D0A2O205772617468616E64467572799O209O208O203D205370652O6C28333932393336292C0D0A2O202O2D2042752O66730D0A2O20426C2O6F646372617A6542752O669O209O206O203D205370652O6C28333933393531292C0D0A2O20456E7261676542752O669O209O209O20203D205370652O6C28313834333632292C0D0A2O204D657263696C652O73412O7361756C7442752O669O209O203D205370652O6C2834302O393833292C0D0A7D290D0A0D0A5370652O6C2E57612O72696F722E50726F74656374696F6E203D204D657267655461626C6542794B6579285370652O6C2E57612O72696F722E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O2042612O746C655374616E63659O209O208O203D205370652O6C28333836313634292C0D0A2O204465766173746174659O209O209O202O203D205370652O6C283230323433292C0D0A2O20457865637574659O209O209O204O203D205370652O6C28313633323031292C0D0A2O20536869656C64426C6F636B9O209O209O203D205370652O6C2832353635292C0D0A2O20536869656C64536C616D9O209O209O20203D205370652O6C283233392O32292C0D0A2O202O2D2054616C656E74730D0A2O204261726261726963547261696E696E679O209O204O203D205370652O6C28333930363735292C0D0A2O20426F6C737465729O209O209O204O203D205370652O6C2832383O3031292C0D0A2O20422O6F6D696E67566F6963659O209O208O203D205370652O6C28323032373433292C0D0A2O204368616D70696F6E7342756C7761726B9O209O204O203D205370652O6C28333836333238292C0D0A2O2044656D6F72616C697A696E6753686F75749O209O203O203D205370652O6C282O313630292C0D0A2O20456E647572696E67446566656E7365739O209O204O203D205370652O6C28333836303237292C0D0A2O204865617679526570657263752O73696F6E739O209O202O203D205370652O6C28323033312O37292C0D0A2O2049676E6F72655061696E9O209O209O20203D205370652O6C28313930343536292C0D0A2O20496E74657276656E659O209O209O202O203D205370652O6C2833342O31292C0D0A2O20496D70656E65747261626C6557612O6C9O209O204O203D205370652O6C28333834303732292C0D0A2O204A752O6765726E6175749O209O209O20203D205370652O6C28333933393637292C0D0A2O204C6173745374616E649O209O209O202O203D205370652O6C283132393735292C0D0A2O204D612O73616372659O209O209O203O203D205370652O6C283238312O3031292C0D0A2O20526176616765729O209O209O204O203D205370652O6C282O3238393230292C0D0A2O2052656E649O209O209O207O203D205370652O6C28333934303632292C0D0A2O20526576656E67659O209O209O204O203D205370652O6C2836353732292C0D0A2O20536569736D696352657665726265726174696F6E9O209O203D205370652O6C28333832393536292C0D0A2O20536869656C644368617267659O209O208O203D205370652O6C28333835393532292C0D0A2O20536869656C6457612O6C9O209O209O20203D205370652O6C28383731292C0D0A2O2053752O64656E44656174689O209O209O203D205370652O6C283239373235292C0D0A2O2053752O64656E446561746842752O669O209O205O203D205370652O6C283532343337292C0D0A2O20552O6E657276696E67466F6375739O209O206O203D205370652O6C28333834303432292C0D0A2O20556E73746F2O7061626C65466F7263659O209O204O203D205370652O6C283237352O3336292C0D0A2O202O2D2042752O66730D0A2O2041766174617242752O669O209O209O20203D205370652O6C2834302O313530292C0D0A2O204561727468656E54656E616369747942752O669O209O20203D205370652O6C28343130323138292C202O2D205433302034500D0A2O204C6173745374616E6442752O669O209O207O203D205370652O6C283132393735292C0D0A2O2052612O6C79696E6743727942752O669O209O205O203D205370652O6C283937343633292C0D0A2O20526576656E676542752O669O209O209O203D205370652O6C2835333032292C0D0A2O20532O65696E6752656442752O669O209O207O203D205370652O6C28333836343836292C0D0A2O20536869656C64426C6F636B42752O669O209O205O203D205370652O6C28313332343034292C0D0A2O20536869656C6457612O6C42752O669O209O206O203D205370652O6C28383731292C0D0A2O2056696F6C656E744F7574627572737442752O669O209O20203D205370652O6C28333836343738292C0D0A2O2056616E67756172647344657465726D696E6174696F6E42752O669O203O203D205370652O6C28333934303536292C202O2D205432392032500D0A2O202O2D20446562752O66730D0A2O2052656E64446562752O669O209O209O20203D205370652O6C28332O38353339292C0D0A7D290D0A0D0A2O2D204974656D730D0A6966206E6F74204974656D2E57612O72696F72207468656E204974656D2E57612O72696F72203D207B7D20656E640D0A4974656D2E57612O72696F722E436F2O6D6F6E73203D207B0D0A2O204865616C746873746F6E659O209O209O203D204974656D282O353132292C0D0A2O202O2D205472696E6B6574730D0A2O20416C67657468617250752O7A6C65426F789O209O203O203D204974656D283139333730312C207B31332C2031347D292C0D0A2O204D616E69634772696566746F7263689O209O205O203D204974656D283139343330382C207B31332C2031347D292C0D0A7D0D0A0D0A4974656D2E57612O72696F722E41726D73203D204D657267655461626C6542794B6579284974656D2E57612O72696F722E436F2O6D6F6E732C207B0D0A7D290D0A0D0A4974656D2E57612O72696F722E46757279203D204D657267655461626C6542794B6579284974656D2E57612O72696F722E436F2O6D6F6E732C207B0D0A7D290D0A0D0A4974656D2E57612O72696F722E50726F74656374696F6E203D204D657267655461626C6542794B6579284974656D2E57612O72696F722E436F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D204D6163726F730D0A6966206E6F74204D6163726F2E57612O72696F72207468656E204D6163726F2E57612O72696F72203D207B7D3B20656E640D0A4D6163726F2E57612O72696F722E436F2O6D6F6E73203D207B0D0A2O202O2D204974656D730D0A2O205472696E6B6574319O209O207O203D204D6163726F28225472696E6B657431222C20222F75736520313322292C0D0A2O205472696E6B6574329O209O207O203D204D6163726F28225472696E6B657432222C20222F75736520313422292C0D0A2O204865616C746873746F6E659O209O204O203D204D6163726F28224865616C746873746F6E65222C20222F757365206974656D3A2O35313222292C0D0A2O202O2D205370652O6C730D0A2O2050752O6D656C4D6F7573656F7665729O209O203D204D6163726F282250752O6D656C4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E57612O72696F722E436F2O6D6F6E732E50752O6D656C3A4E616D65282O292C0D0A2O2053746F726D426F6C744D6F7573656F7665729O206O203D204D6163726F282253746F726D426F6C744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E57612O72696F722E436F2O6D6F6E732E53746F726D426F6C743A4E616D65282O292C0D0A2O2053706561726F6642617374696F6E506C617965729O204O203D204D6163726F282253706561726F6642617374696F6E506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E57612O72696F722E436F2O6D6F6E732E53706561726F6642617374696F6E3A4E616D65282O292C0D0A7D0D0A0D0A4D6163726F2E57612O72696F722E41726D73203D204D657267655461626C6542794B6579284D6163726F2E57612O72696F722E436F2O6D6F6E732C207B0D0A7D290D0A0D0A4D6163726F2E57612O72696F722E46757279203D204D657267655461626C6542794B6579284D6163726F2E57612O72696F722E436F2O6D6F6E732C207B0D0A2O202O2D205370652O6C730D0A2O2052617661676572506C617965729O209O202O203D204D6163726F282252617661676572506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E57612O72696F722E467572792E526176616765723A4E616D65282O292C0D0A7D290D0A0D0A4D6163726F2E57612O72696F722E50726F74656374696F6E203D204D657267655461626C6542794B6579284D6163726F2E57612O72696F722E436F2O6D6F6E732C207B0D0A2O202O2D205370652O6C730D0A2O2052617661676572506C617965729O209O202O203D204D6163726F282252617661676572506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E57612O72696F722E50726F74656374696F6E2E526176616765723A4E616D65282O292C0D0A7D2900063O0012053O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);