local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110]=v83[v110](v83[v110 + 1 ]);elseif (v86>1) then local v113=v85[2];v83[v113](v13(v83,v113 + 1 ,v78));else do return;end end elseif (v86<=4) then if (v86>3) then local v114;local v115;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v115=v85[2];v83[v115]=v83[v115](v83[v115 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v115=v85[2];v78=(v115 + v84) -1 ;for v128=v115,v78 do v114=v79[v128-v115 ];v83[v128]=v114;end v77=v77 + 1 ;v85=v73[v77];v115=v85[2];v83[v115](v13(v83,v115 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else v83[v85[2]]=v59[v85[3]];end elseif (v86==5) then local v124=v85[2];v78=(v124 + v84) -1 ;for v131=v124,v78 do local v132=v79[v131-v124 ];v83[v131]=v132;end else v83[v85[2]]=v85[3];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703704C2O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A3O2D207O3D204C4F43414C495A45207O3D0D0A2O2D20412O646F6E0D0A6C6F63616C20612O646F6E4E616D652C20612O646F6E5461626C65203D203O2E0D0A2O2D204865726F4442430D0A6C6F63616C20444243203D204865726F4442432E4442430D0A2O2D204865726F4C69620D0A6C6F63616C20484C9O203D204865726F4C69620D0A6C6F63616C2043616368656O203D204865726F43616368650D0A6C6F63616C20556E69747O203D20484C2E556E69740D0A6C6F63616C20506C617965725O203D20556E69742E506C617965720D0A6C6F63616C205461726765745O203D20556E69742E5461726765740D0A6C6F63616C205065748O203D20556E69742E5065740D0A6C6F63616C205370652O6C6O203D20484C2E5370652O6C0D0A6C6F63616C204D756C74695370652O6C203D20484C2E4D756C74695370652O6C0D0A6C6F63616C204974656D7O203D20484C2E4974656D0D0A6C6F63616C204D657267655461626C6542794B6579203D20484C2E5574696C732E4D657267655461626C6542794B65790D0A2O2D20576F726C6479526F746174696F6E0D0A6C6F63616C2057529O203D20576F726C6479526F746174696F6E0D0A6C6F63616C204D6163726F6O203D2057522E4D6163726F0D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D3D0D0A2O2D205370652O6C730D0A6966206E6F74205370652O6C2E50616C6164696E207468656E205370652O6C2E50616C6164696E203D207B7D20656E640D0A5370652O6C2E50616C6164696E2E436F2O6D6F6E73203D207B0D0A2O202O2D2052616369616C730D0A2O20416E6365737472616C43612O6C9O209O207O203D205370652O6C28323734373338292C0D0A2O20417263616E6550756C73659O209O209O203D205370652O6C28323630333634292C0D0A2O20417263616E65546F2O72656E749O209O207O203D205370652O6C28312O35313435292C0D0A2O204261676F66547269636B739O209O209O203D205370652O6C28333132342O31292C0D0A2O204265727365726B696E679O209O209O20203D205370652O6C283236323937292C0D0A2O20426C2O6F64467572799O209O209O202O203D205370652O6C283230353732292C0D0A2O2046697265626C2O6F649O209O209O202O203D205370652O6C283236352O3231292C0D0A2O20476966746F667468654E2O6172759O209O206O203D205370652O6C283539353432292C0D0A2O204C69676874734A7564676D656E749O209O206O203D205370652O6C28322O35363437292C0D0A2O202O2D204162696C69746965730D0A2O20426C652O73696E676F6646722O65646F6D9O209O203O203D205370652O6C2831302O34292C0D0A2O20426C652O73696E676F6650726F74656374696F6E9O209O203D205370652O6C2831302O32292C0D0A2O20436F6E736563726174696F6E9O209O208O203D205370652O6C283236353733292C0D0A2O204372757361646572537472696B659O209O206O203D205370652O6C283335333935292C0D0A2O20436C65616E7365546F78696E739O209O207O203D205370652O6C28323133362O34292C0D0A2O20446976696E65536869656C649O209O208O203D205370652O6C28363432292C0D0A2O20446976696E6553742O65649O209O209O203D205370652O6C28313930373834292C0D0A2O20496E74657263652O73696F6E9O209O208O203D205370652O6C28333931303534292C0D0A2O20466C6173686F664C696768749O209O208O203D205370652O6C283139373530292C0D0A2O2048612O6D65726F664A7573746963659O209O205O203D205370652O6C28383533292C0D0A2O2048616E646F665265636B6F6E696E679O209O205O203D205370652O6C283632313234292C0D0A2O204A7564676D656E749O209O209O203O203D205370652O6C283230323731292C0D0A2O20526562756B659O209O209O205O203D205370652O6C283936323331292C0D0A2O20526564656D7074696F6E9O209O209O20203D205370652O6C2837333238292C0D0A2O20576F72646F66476C6F72799O209O209O203D205370652O6C283835363733292C0D0A2O202O2D2054616C656E74730D0A2O204176656E67696E6757726174689O209O207O203D205370652O6C2833312O3834292C0D0A2O20426C696E64696E674C696768749O209O207O203D205370652O6C282O3135373530292C0D0A2O2048612O6D65726F6657726174689O209O207O203D205370652O6C283234323735292C0D0A2O20486F6C794176656E6765729O209O209O203D205370652O6C28313035383039292C0D0A2O204C61796F6E48616E64739O209O209O20203D205370652O6C28362O33292C0D0A2O20526570656E74616E63659O209O209O20203D205370652O6C28322O302O36292C0D0A2O205475726E4576696C9O209O209O203O203D205370652O6C283130333236292C0D0A2O205A65616C6F747350617261676F6E9O209O206O203D205370652O6C2833392O313432292C0D0A2O202O2D2041757261730D0A2O20436F6E63656E74726174696F6E417572619O209O203O203D205370652O6C28333137393230292C0D0A2O204372757361646572417572619O209O208O203D205370652O6C28333O3233292C0D0A2O204465766F74696F6E417572619O209O208O203D205370652O6C28343635292C0D0A2O205265747269627574696F6E417572619O209O205O203D205370652O6C28313833343335292C0D0A2O202O2D2042752O66730D0A2O204176656E67696E67577261746842752O669O209O203O203D205370652O6C2833312O3834292C0D0A2O20426C652O73696E676F664475736B42752O669O209O202O203D205370652O6C28333835313236292C0D0A2O20436F6E736563726174696F6E42752O669O209O204O203D205370652O6C28312O38333730292C0D0A2O20446976696E65507572706F736542752O669O209O203O203D205370652O6C282O3233383139292C0D0A2O20486F6C794176656E67657242752O669O209O205O203D205370652O6C28313035383039292C0D0A2O202O2D20446562752O66730D0A2O20436F6E736563726174696F6E446562752O669O209O202O203D205370652O6C28323034323432292C0D0A2O204A7564676D656E74446562752O669O209O206O203D205370652O6C28313937322O37292C0D0A2O20466F7262656172616E6365446562752O669O209O203O203D205370652O6C2832352O3731292C0D0A2O202O2D20502O6F6C0D0A2O20502O6F6C9O209O209O207O203D205370652O6C284O393130292C0D0A7D0D0A0D0A5370652O6C2E50616C6164696E2E50726F74656374696F6E203D204D657267655461626C6542794B6579285370652O6C2E50616C6164696E2E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O204A7564676D656E749O209O209O203O203D205370652O6C283237352O3739292C0D0A2O202O2D2054616C656E74730D0A2O20417264656E74446566656E6465729O209O206O203D205370652O6C283331383530292C0D0A2O204176656E67657273536869656C649O209O206O203D205370652O6C283331393335292C0D0A2O2042617374696F6E6F664C696768749O209O206O203D205370652O6C28333738393734292C0D0A2O20426C652O73656448612O6D65729O209O207O203D205370652O6C28323034303139292C0D0A2O204372757361646572734A7564676D656E749O209O203O203D205370652O6C28323034303233292C0D0A2O20446976696E65546F2O6C9O209O209O20203D205370652O6C2833372O353736292C0D0A2O204579656F665479729O209O209O203O203D205370652O6C28333837313734292C0D0A2O2046696E616C5374616E649O209O209O20203D205370652O6C28323034302O37292C0D0A2O20477561726469616E6F66416E6369656E744B696E67739O207O203D204D756C74695370652O6C28382O3635392C323132363431292C0D0A2O2048612O6D65726F667468655269676874656F75739O209O203D205370652O6C283533353935292C0D0A2O20496E6D6F73744C696768749O209O209O203D205370652O6C28343035373537292C0D0A2O204D6F6D656E746F66476C6F72799O209O207O203D205370652O6C28333237313933292C0D0A2O205269676874656F757350726F746563746F729O209O202O203D205370652O6C28323034303734292C0D0A2O2053656E74696E656C9O209O209O203O203D205370652O6C28333839353339292C0D0A2O20536869656C646F667468655269676874656F75739O209O203D205370652O6C283533362O30292C0D0A2O202O2D2042752O66730D0A2O20412O6C796F667468654C6967687442752O669O209O202O203D205370652O6C28333934373134292C0D0A2O20417264656E74446566656E64657242752O669O209O202O203D205370652O6C283331383530292C0D0A2O2042617374696F6E6F664C6967687442752O669O209O202O203D205370652O6C28333738393734292C0D0A2O20477561726469616E6F66416E6369656E744B696E677342752O669O203O203D204D756C74695370652O6C28382O3635392C323132363431292C0D0A2O204D6F6D656E746F66476C6F727942752O669O209O203O203D205370652O6C28333237313933292C0D0A2O2053656E74696E656C42752O669O209O208O203D205370652O6C28333839353339292C0D0A2O20536869656C646F667468655269676874656F757342752O669O205O203D205370652O6C28313332343033292C0D0A2O205368696E696E674C6967687446722O6542752O669O209O203D205370652O6C28333237353130292C0D0A2O202O2D20446562752O66730D0A7D290D0A0D0A5370652O6C2E50616C6164696E2E5265747269627574696F6E203D204D657267655461626C6542794B6579285370652O6C2E50616C6164696E2E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O2054656D706C617273566572646963749O209O205O203D205370652O6C283835323536292C0D0A2O202O2D2054616C656E74730D0A2O204173686573746F447573749O209O209O203D205370652O6C2833382O332O30292C0D0A2O20426C6164656F664A7573746963659O209O206O203D205370652O6C28313834353735292C0D0A2O20426C6164656F6657726174689O209O208O203D205370652O6C28323331383332292C0D0A2O20426C652O7365644368616D70696F6E9O209O205O203D205370652O6C28343033303130292C0D0A2O20426F756E646C652O734A7564676D656E749O209O203O203D205370652O6C28343035323738292C0D0A2O20437275736164659O209O209O204O203D205370652O6C28323331383935292C0D0A2O20437275736164696E67537472696B65739O209O204O203D205370652O6C28343034353432292C0D0A2O20446976696E65417262697465729O209O207O203D205370652O6C28343034333036292C0D0A2O20446976696E65417578696C696172799O209O205O203D205370652O6C28343036313538292C0D0A2O20446976696E6548612O6D65729O209O208O203D205370652O6C28313938303334292C0D0A2O20446976696E655265736F6E616E63659O209O205O203D205370652O6C28333834303237292C0D0A2O20446976696E6550726F74656374696F6E9O209O204O203D205370652O6C28343033383736292C0D0A2O20446976696E6553746F726D9O209O209O203D205370652O6C28352O333835292C0D0A2O20446976696E65546F2O6C9O209O209O20203D205370652O6C2833372O353736292C0D0A2O20456D70797265616E4C65676163799O209O206O203D205370652O6C28333837313730292C0D0A2O20456D70797265616E506F7765729O209O207O203D205370652O6C28333236373332292C0D0A2O20457865637574696F6E53656E74656E63659O209O203O203D205370652O6C28333433353237292C0D0A2O20457865637574696F6E65727357692O6C9O209O204O203D205370652O6C28343036393430292C0D0A2O20457865637574696F6E65727357726174689O209O203O203D205370652O6C28333837313936292C0D0A2O2045786F726369736D9O209O209O203O203D205370652O6C28333833313835292C0D0A2O204578707572676174696F6E9O209O209O203D205370652O6C2833382O332O34292C0D0A2O2046696E616C5265636B6F6E696E679O209O206O203D205370652O6C28333433373231292C0D0A2O2046696E616C566572646963749O209O208O203D205370652O6C2833382O333238292C0D0A2O2046697265736F664A7573746963659O209O206O203D205370652O6C2832302O333136292C0D0A2O20486F6C79426C6164659O209O209O202O203D205370652O6C2833382O333432292C0D0A2O204A7572697364696374696F6E9O209O208O203D205370652O6C28343032393731292C0D0A2O204A757374696361727356656E6765616E63659O209O202O203D205370652O6C283231352O3631292C0D0A2O2052616469616E74446563722O659O209O207O203D205370652O6C28333833343639292C0D0A2O2052616469616E74446563722O6554616C656E749O209O20203D205370652O6C28333834303532292C0D0A2O205269676874656F7573566572646963749O209O204O203D205370652O6C28323637363130292C0D0A2O20536869656C646F6656656E6765616E63659O209O203O203D205370652O6C283138342O3632292C0D0A2O2054656D706C6172536C6173689O209O208O203D205370652O6C2834302O363437292C0D0A2O2054656D706C6172537472696B659O209O207O203D205370652O6C28343037343830292C0D0A2O2056616E6775617264734D6F6D656E74756D9O209O203O203D205370652O6C2833382O333134292C0D0A2O2057616B656F6641736865739O209O209O203D205370652O6C28322O35393337292C0D0A2O205A65616C9O209O209O207O203D205370652O6C28323639353639292C0D0A2O202O2D2042752O66730D0A2O204372757361646542752O669O209O209O203D205370652O6C28323331383935292C0D0A2O20446976696E654172626974657242752O669O209O203O203D205370652O6C28343036393735292C0D0A2O20446976696E655265736F6E616E636542752O669O209O20203D205370652O6C28333834303239292C0D0A2O20456D70797265616E4C656761637942752O669O209O202O203D205370652O6C28333837313738292C0D0A2O20456D70797265616E506F77657242752O669O209O203O203D205370652O6C28333236372O33292C0D0A2O202O2D20446562752O66730D0A7D290D0A0D0A5370652O6C2E50616C6164696E2E486F6C79203D204D657267655461626C6542794B6579285370652O6C2E50616C6164696E2E436F2O6D6F6E732C207B0D0A2O202O2D204162696C69746965730D0A2O20417572614D6173746572799O209O209O203D205370652O6C283331383231292C0D0A2O204162736F6C7574696F6E9O209O209O20203D205370652O6C28323132303536292C0D0A2O20426C652O73696E676F6653752O6D65729O209O204O203D205370652O6C28332O382O3037292C0D0A2O20426C652O73696E676F66417574756D6E9O209O204O203D205370652O6C28332O38303130292C0D0A2O20426C652O73696E676F6657696E7465729O209O204O203D205370652O6C28332O38302O31292C0D0A2O20426C652O73696E676F66537072696E679O209O204O203D205370652O6C28332O38303133292C0D0A2O20426C652O73696E676F665361637269666963659O209O20203D205370652O6C2836393430292C0D0A2O20426561636F6E6F665669727475659O209O206O203D205370652O6C28323O303235292C0D0A2O20436C65616E73659O209O209O204O203D205370652O6C2834393837292C0D0A2O20446976696E654661766F729O209O209O203D205370652O6C28323130323934292C0D0A2O20446976696E6550726F74656374696F6E9O209O204O203D205370652O6C28343938292C0D0A2O20446976696E65546F2O6C9O209O209O20203D205370652O6C2833372O353736292C0D0A2O20486F6C794C696768749O209O209O202O203D205370652O6C283832333236292C0D0A2O20486F6C7953686F636B9O209O209O202O203D205370652O6C283230343733292C0D0A2O20496E667573696F6E6F664C6967687442752O669O209O20203D205370652O6C283534313439292C0D0A2O204C696768746F664461776E9O209O209O203D205370652O6C2838353O32292C0D0A2O204C696768746F667468654D61727479729O209O204O203D205370652O6C283138332O3938292C0D0A2O204A7564676D656E749O209O209O203O203D205370652O6C283237352O3733292C0D0A2O20536869656C646F667468655269676874656F75739O209O203D205370652O6C28343135303931292C0D0A2O202O2D2054616C656E74730D0A2O204176656E67696E6743727573616465729O209O204O203D205370652O6C283231362O3331292C0D0A2O204177616B656E696E679O209O209O202O203D205370652O6C28323438302O33292C0D0A2O2042612O726965726F6646616974689O209O206O203D205370652O6C28313438303339292C0D0A2O20426573746F7746616974689O209O209O203D205370652O6C282O322O333036292C0D0A2O204372757361646572734D696768749O209O206O203D205370652O6C28313936393236292C0D0A2O20446179627265616B9O209O209O203O203D205370652O6C28343134313730292C0D0A2O20456D70797265616E4C656761637942752O669O209O202O203D205370652O6C28333837313738292C0D0A2O20476C692O6D65726F664C696768749O209O206O203D205370652O6C28323837323639292C0D0A2O20476C692O6D65726F664C6967687442752O669O209O202O203D205370652O6C28323837323830292C0D0A2O20476F6C64656E506174689O209O209O20203D205370652O6C28332O37313238292C0D0A2O2048616E646F66446976696E6974799O209O206O203D205370652O6C28343134323733292C0D0A2O20486F6C79507269736D9O209O209O202O203D205370652O6C282O3134313635292C0D0A2O20496D70726F766564436C65616E73659O209O205O203D205370652O6C28333933303234292C0D0A2O204C696768747348612O6D65729O209O208O203D205370652O6C282O3134313538292C0D0A2O204A7564676D656E746F664C696768749O209O205O203D205370652O6C283138332O3738292C0D0A2O204A7564676D656E746F664C69676874446562752O669O208O203D205370652O6C28313936393431292C0D0A2O205479727344656C69766572616E63659O209O205O203D205370652O6C28322O30363532292C0D0A2O20556E656E64696E674C6967687442752O669O209O203O203D205370652O6C28333934373039292C0D0A7D290D0A0D0A2O2D204974656D730D0A6966206E6F74204974656D2E50616C6164696E207468656E204974656D2E50616C6164696E203D207B7D20656E640D0A4974656D2E50616C6164696E2E436F2O6D6F6E73203D207B0D0A2O202O2D20506F74696F6E0D0A2O204865616C746873746F6E659O209O209O203D204974656D282O353132292C0D0A2O20456C656D656E74616C506F74696F6E4F66506F7765729O207O203D204974656D28313931333839292C0D0A2O2052656672657368696E674865616C696E67506F74696F6E9O206O203D204974656D28313931333830292C200D0A2O202O2D205472696E6B6574730D0A2O20416C67657468617250752O7A6C65426F789O209O203O203D204974656D283139333730312C207B31332C2031347D292C0D0A2O2057696E64736361725768657473746F6E659O209O203O203D204974656D283133373438362C207B31332C2031347D292C0D0A7D0D0A0D0A4974656D2E50616C6164696E2E50726F74656374696F6E203D204D657267655461626C6542794B6579284974656D2E50616C6164696E2E436F2O6D6F6E732C207B0D0A7D290D0A0D0A4974656D2E50616C6164696E2E5265747269627574696F6E203D204D657267655461626C6542794B6579284974656D2E50616C6164696E2E436F2O6D6F6E732C207B0D0A7D290D0A0D0A4974656D2E50616C6164696E2E486F6C79203D204D657267655461626C6542794B6579284974656D2E50616C6164696E2E436F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D204D6163726F730D0A6966206E6F74204D6163726F2E50616C6164696E207468656E204D6163726F2E50616C6164696E203D207B7D20656E640D0A4D6163726F2E50616C6164696E2E436F2O6D6F6E73203D207B0D0A2O202O2D205370652O6C730D0A2O20426C652O73696E676F6650726F74656374696F6E466F6375738O203D204D6163726F2822426C652O73696E676F6650726F74656374696F6E466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E426C652O73696E676F6650726F74656374696F6E3A4E616D65282O292C0D0A2O20426C652O73696E676F6650726F74656374696F6E4D6F7573656F7665724O203D204D6163726F2822426C652O73696E676F6650726F74656374696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E426C652O73696E676F6650726F74656374696F6E3A4E616D65282O292C0D0A2O20426C652O73696E676F6646722O65646F6D466F6375739O202O203D204D6163726F2822426C652O73696E676F6646722O65646F6D466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E426C652O73696E676F6646722O65646F6D3A4E616D65282O292C0D0A2O20426C652O73696E676F6646722O65646F6D4D6F7573656F7665727O203D204D6163726F2822426C652O73696E676F6646722O65646F6D4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E426C652O73696E676F6646722O65646F6D3A4E616D65282O292C0D0A2O20436C65616E7365546F78696E734D6F7573656F7665729O202O203D204D6163726F2822436C65616E7365546F78696E734D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E436C65616E7365546F78696E733A4E616D65282O292C0D0A2O204372757361646572537472696B654D6F7573656F7665729O20203D204D6163726F28224372757361646572537472696B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E4372757361646572537472696B653A4E616D65282O292C0D0A2O20466C6173686F664C69676874466F6375739O207O203D204D6163726F2822466C6173686F664C69676874466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E466C6173686F664C696768743A4E616D65282O292C0D0A2O20466C6173686F664C69676874506C617965729O206O203D204D6163726F2822466C6173686F664C69676874506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E466C6173686F664C696768743A4E616D65282O292C0D0A2O20496E74657263652O73696F6E4D6F7573656F7665729O203O203D204D6163726F2822496E74657263652O73696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E496E74657263652O73696F6E3A4E616D65282O292C0D0A2O204C61796F6E48616E6473466F6375739O209O203D204D6163726F28224C61796F6E48616E6473466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E4C61796F6E48616E64733A4E616D65282O292C0D0A2O204C61796F6E48616E6473506C617965729O208O203D204D6163726F28224C61796F6E48616E6473506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E4C61796F6E48616E64733A4E616D65282O292C0D0A2O204C61796F6E48616E64734D6F7573656F7665729O205O203D204D6163726F28224C61796F6E48616E64734D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E4C61796F6E48616E64733A4E616D65282O292C0D0A2O204A7564676D656E744D6F7573656F7665729O207O203D204D6163726F28224A7564676D656E744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E4A7564676D656E743A4E616D65282O292C0D0A2O2048612O6D65726F664A7573746963654D6F7573656F7665729O203D204D6163726F282248612O6D65726F664A7573746963654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E48612O6D65726F664A7573746963653A4E616D65282O292C0D0A2O20526562756B654D6F7573656F7665729O209O203D204D6163726F2822526562756B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E526562756B653A4E616D65282O292C0D0A2O20526564656D7074696F6E4D6F7573656F7665729O205O203D204D6163726F2822526564656D7074696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E526564656D7074696F6E3A4E616D65282O292C0D0A2O20526570656E74616E63654D6F7573656F7665729O205O203D204D6163726F2822526570656E74616E63654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E526570656E74616E63653A4E616D65282O292C0D0A2O205475726E4576696C4D6F7573656F7665729O207O203D204D6163726F28225475726E4576696C4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E5475726E4576696C3A4E616D65282O292C0D0A2O20576F72646F66476C6F7279466F6375739O208O203D204D6163726F2822576F72646F66476C6F7279466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E576F72646F66476C6F72793A4E616D65282O292C0D0A2O20576F72646F66476C6F72794D6F7573656F7665729O204O203D204D6163726F2822576F72646F66476C6F72794D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E576F72646F66476C6F72793A4E616D65282O292C0D0A2O20576F72646F66476C6F7279506C617965729O207O203D204D6163726F2822576F72646F66476C6F7279506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E50616C6164696E2E436F2O6D6F6E732E576F72646F66476C6F72793A4E616D65282O292C0D0A2O202O2D204974656D730D0A2O205472696E6B6574319O209O207O203D204D6163726F28225472696E6B657431222C20222F75736520313322292C0D0A2O205472696E6B6574329O209O207O203D204D6163726F28225472696E6B657432222C20222F75736520313422292C0D0A2O204865616C746873746F6E659O209O204O203D204D6163726F28224865616C746873746F6E65222C20222F757365206974656D3A2O35313222292C0D0A2O202O2D20466F6375730D0A2O20466F637573506C617965729O209O204O203D204D6163726F2822466F637573506C61796572222C20222F666F63757320706C6179657222292C0D0A2O20466F6375735061727479319O209O204O203D204D6163726F2822466F637573506172747931222C20222F666F6375732070617274793122292C0D0A2O20466F6375735061727479329O209O204O203D204D6163726F2822466F637573506172747932222C20222F666F6375732070617274793222292C0D0A2O20466F6375735061727479339O209O204O203D204D6163726F2822466F637573506172747933222C20222F666F6375732070617274793322292C0D0A2O20466F6375735061727479349O209O204O203D204D6163726F2822466F637573506172747934222C20222F666F6375732070617274793422292C0D0A7D0D0A0D0A4D6163726F2E50616C6164696E2E50726F74656374696F6E203D204D657267655461626C6542794B6579284D6163726F2E50616C6164696E2E436F2O6D6F6E732C207B0D0A7D290D0A0D0A4D6163726F2E50616C6164696E2E5265747269627574696F6E203D204D657267655461626C6542794B6579284D6163726F2E50616C6164696E2E436F2O6D6F6E732C207B0D0A2O2046696E616C5265636B6F6E696E67506C617965729O204O203D204D6163726F282246696E616C5265636B6F6E696E67506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E50616C6164696E2E5265747269627574696F6E2E46696E616C5265636B6F6E696E673A4E616D65282O292C0D0A7D290D0A0D0A4D6163726F2E50616C6164696E2E486F6C79203D204D657267655461626C6542794B6579284D6163726F2E50616C6164696E2E436F2O6D6F6E732C207B0D0A2O2042612O726965726F664661697468466F6375739O205O203D204D6163726F282242612O726965726F664661697468466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E42612O726965726F6646616974683A4E616D65282O292C0D0A2O20426561636F6E6F66566972747565466F6375739O205O203D204D6163726F2822426561636F6E6F66566972747565466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E426561636F6E6F665669727475653A4E616D65282O292C0D0A2O20426C652O73696E676F6653752O6D6572506C617965729O202O203D204D6163726F2822426C652O73696E676F6653752O6D6572506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E426C652O73696E676F6653752O6D65723A4E616D65282O292C0D0A2O20426C652O73696E676F6653752O6D6572466F6375739O203O203D204D6163726F2822426C652O73696E676F6653752O6D6572466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E426C652O73696E676F6653752O6D65723A4E616D65282O292C0D0A2O20426C652O73696E676F66536163726966696365466F6375739O203D204D6163726F2822426C652O73696E676F66536163726966696365466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E426C652O73696E676F665361637269666963653A4E616D65282O292C0D0A2O20426C652O73696E676F665361637269666963654D6F7573656F7665725O203D204D6163726F2822426C652O73696E676F665361637269666963654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E426C652O73696E676F665361637269666963653A4E616D65282O292C0D0A2O20436C65616E7365466F6375739O209O203O203D204D6163726F2822436C65616E7365466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E436C65616E73653A4E616D65282O292C0D0A2O20436C65616E73654D6F7573656F7665729O208O203D204D6163726F2822436C65616E73654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E436C65616E73653A4E616D65282O292C0D0A2O20446976696E65546F2O6C466F6375739O209O203D204D6163726F2822446976696E65546F2O6C466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E446976696E65546F2O6C3A4E616D65282O292C0D0A2O20486F6C794C69676874466F6375739O209O20203D204D6163726F2822486F6C794C69676874466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E486F6C794C696768743A4E616D65282O292C0D0A2O20486F6C794C696768744D6F7573656F7665729O206O203D204D6163726F2822486F6C794C696768744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E486F6C794C696768743A4E616D65282O292C0D0A2O20486F6C7953686F636B466F6375739O209O20203D204D6163726F2822486F6C7953686F636B466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E486F6C7953686F636B3A4E616D65282O292C0D0A2O20486F6C7953686F636B4D6F7573656F7665729O206O203D204D6163726F2822486F6C7953686F636B4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E486F6C7953686F636B3A4E616D65282O292C0D0A2O20486F6C79507269736D506C617965729O209O203D204D6163726F2822486F6C79507269736D506C61796572222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E486F6C79507269736D3A4E616D65282O292C0D0A2O204C696768746F667468654D6172747972466F6375739O203O203D204D6163726F28224C696768746F667468654D6172747972466F637573222C20222F63617374205B40666F6375735D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E4C696768746F667468654D61727479723A4E616D65282O292C0D0A2O204C696768747348612O6D6572506C617965729O206O203D204D6163726F28224C696768747348612O6D6572506C61796572222C20222F63617374205B40706C617965725D2022202O2E205370652O6C2E50616C6164696E2E486F6C792E4C696768747348612O6D65723A4E616D65282O292C0D0A2O202O2D20466F6375730D0A2O20466F6375735461726765749O209O204O203D204D6163726F2822466F637573546172676574222C20222F666F6375732074617267657422292C0D0A2O20466F63757352616964319O209O205O203D204D6163726F2822466F6375735261696431222C20222F666F63757320726169643122292C0D0A2O20466F63757352616964329O209O205O203D204D6163726F2822466F6375735261696432222C20222F666F63757320726169643222292C0D0A2O20466F63757352616964339O209O205O203D204D6163726F2822466F6375735261696433222C20222F666F63757320726169643322292C0D0A2O20466F63757352616964349O209O205O203D204D6163726F2822466F6375735261696434222C20222F666F63757320726169643422292C0D0A2O20466F63757352616964359O209O205O203D204D6163726F2822466F6375735261696435222C20222F666F63757320726169643522292C0D0A2O20466F63757352616964369O209O205O203D204D6163726F2822466F6375735261696436222C20222F666F63757320726169643622292C0D0A2O20466F63757352616964379O209O205O203D204D6163726F2822466F6375735261696437222C20222F666F63757320726169643722292C0D0A2O20466F63757352616964389O209O205O203D204D6163726F2822466F6375735261696438222C20222F666F63757320726169643822292C0D0A2O20466F63757352616964399O209O205O203D204D6163726F2822466F6375735261696439222C20222F666F63757320726169643922292C0D0A2O20466F6375735261696431309O209O204O203D204D6163726F2822466F637573526169643130222C20222F666F6375732072616964313022292C0D0A2O20466F637573526169642O319O209O204O203D204D6163726F2822466F637573526169642O31222C20222F666F63757320726169642O3122292C0D0A2O20466F6375735261696431329O209O204O203D204D6163726F2822466F637573526169643132222C20222F666F6375732072616964313222292C0D0A2O20466F6375735261696431339O209O204O203D204D6163726F2822466F637573526169643133222C20222F666F6375732072616964313322292C0D0A2O20466F6375735261696431349O209O204O203D204D6163726F2822466F637573526169643134222C20222F666F6375732072616964313422292C0D0A2O20466F6375735261696431359O209O204O203D204D6163726F2822466F637573526169643135222C20222F666F6375732072616964313522292C0D0A2O20466F6375735261696431369O209O204O203D204D6163726F2822466F637573526169643136222C20222F666F6375732072616964313622292C0D0A2O20466F6375735261696431379O209O204O203D204D6163726F2822466F637573526169643137222C20222F666F6375732072616964313722292C0D0A2O20466F6375735261696431389O209O204O203D204D6163726F2822466F637573526169643138222C20222F666F6375732072616964313822292C0D0A2O20466F6375735261696431399O209O204O203D204D6163726F2822466F637573526169643139222C20222F666F6375732072616964313922292C0D0A2O20466F6375735261696432309O209O204O203D204D6163726F2822466F637573526169643230222C20222F666F6375732072616964323022292C0D0A2O20466F6375735261696432319O209O204O203D204D6163726F2822466F637573526169643231222C20222F666F6375732072616964323122292C0D0A2O20466F637573526169642O329O209O204O203D204D6163726F2822466F637573526169642O32222C20222F666F63757320726169642O3222292C0D0A2O20466F6375735261696432339O209O204O203D204D6163726F2822466F637573526169643233222C20222F666F6375732072616964323322292C0D0A2O20466F6375735261696432349O209O204O203D204D6163726F2822466F637573526169643234222C20222F666F6375732072616964323422292C0D0A2O20466F6375735261696432359O209O204O203D204D6163726F2822466F637573526169643235222C20222F666F6375732072616964323522292C0D0A2O20466F6375735261696432369O209O204O203D204D6163726F2822466F637573526169643236222C20222F666F6375732072616964323622292C0D0A2O20466F6375735261696432379O209O204O203D204D6163726F2822466F637573526169643237222C20222F666F6375732072616964323722292C0D0A2O20466F6375735261696432389O209O204O203D204D6163726F2822466F637573526169643238222C20222F666F6375732072616964323822292C0D0A2O20466F6375735261696432399O209O204O203D204D6163726F2822466F637573526169643239222C20222F666F6375732072616964323922292C0D0A2O20466F6375735261696433309O209O204O203D204D6163726F2822466F637573526169643330222C20222F666F6375732072616964333022292C0D0A2O20466F6375735261696433319O209O204O203D204D6163726F2822466F637573526169643331222C20222F666F6375732072616964333122292C0D0A2O20466F6375735261696433329O209O204O203D204D6163726F2822466F637573526169643332222C20222F666F6375732072616964333222292C0D0A2O20466F637573526169642O339O209O204O203D204D6163726F2822466F637573526169642O33222C20222F666F63757320726169642O3322292C0D0A2O20466F6375735261696433349O209O204O203D204D6163726F2822466F637573526169643334222C20222F666F6375732072616964333422292C0D0A2O20466F6375735261696433359O209O204O203D204D6163726F2822466F637573526169643335222C20222F666F6375732072616964333522292C0D0A2O20466F6375735261696433369O209O204O203D204D6163726F2822466F637573526169643336222C20222F666F6375732072616964333622292C0D0A2O20466F6375735261696433379O209O204O203D204D6163726F2822466F637573526169643337222C20222F666F6375732072616964333722292C0D0A2O20466F6375735261696433389O209O204O203D204D6163726F2822466F637573526169643338222C20222F666F6375732072616964333822292C0D0A2O20466F6375735261696433399O209O204O203D204D6163726F2822466F637573526169643339222C20222F666F6375732072616964333922292C0D0A2O20466F6375735261696434309O209O204O203D204D6163726F2822466F637573526169643430222C20222F666F6375732072616964343022292C0D0A7D290D0A00063O0012043O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);