local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110]=v83[v110](v83[v110 + 1 ]);elseif (v86>1) then local v113=v85[2];v78=(v113 + v84) -1 ;for v125=v113,v78 do local v126=v79[v125-v113 ];v83[v125]=v126;end else local v114=v85[2];v83[v114](v13(v83,v114 + 1 ,v78));end elseif (v86<=4) then if (v86>3) then local v115;local v116;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v83[v116]=v83[v116](v83[v116 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v78=(v116 + v84) -1 ;for v128=v116,v78 do v115=v79[v128-v116 ];v83[v128]=v115;end v77=v77 + 1 ;v85=v73[v77];v116=v85[2];v83[v116](v13(v83,v116 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86>5) then v83[v85[2]]=v85[3];else do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703172D2O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206D756C74695370652O6C203D206170692E6D756C74695370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C730D0A6966206E6F74207370652O6C2E70616C6164696E207468656E0D0A2O207370652O6C2E70616C6164696E203D207B7D0D0A656E640D0A7370652O6C2E70616C6164696E2E636F2O6D6F6E73203D207B0D0A2O202O2D2072616369616C730D0A2O20616E6365737472616C43612O6C203D207370652O6C28323734373338292C0D0A2O20617263616E6550756C7365203D207370652O6C28323630333634292C0D0A2O20617263616E65546F2O72656E74203D207370652O6C28312O35313435292C0D0A2O206261676F66547269636B73203D207370652O6C28333132342O31292C0D0A2O206265727365726B696E67203D207370652O6C283236323937292C0D0A2O20626C2O6F6446757279203D207370652O6C283230353732292C0D0A2O2066697265626C2O6F64203D207370652O6C283236352O3231292C0D0A2O20676966746F667468654E2O617275203D207370652O6C283539353432292C0D0A2O206C69676874734A7564676D656E74203D207370652O6C28322O35363437292C0D0A2O202O2D206162696C69746965730D0A2O20626C652O73696E676F6646722O65646F6D203D207370652O6C2831302O34292C0D0A2O20626C652O73696E676F6650726F74656374696F6E203D207370652O6C2831302O32292C0D0A2O20636F6E736563726174696F6E203D207370652O6C283236353733292C0D0A2O206372757361646572537472696B65203D207370652O6C283335333935292C0D0A2O20636C65616E7365546F78696E73203D207370652O6C28323133362O34292C0D0A2O20646976696E65536869656C64203D207370652O6C28363432292C0D0A2O20646976696E6553742O6564203D207370652O6C28313930373834292C0D0A2O20696E74657263652O73696F6E203D207370652O6C28333931303534292C0D0A2O20666C6173686F664C69676874203D207370652O6C283139373530292C0D0A2O2068612O6D65726F664A757374696365203D207370652O6C28383533292C0D0A2O2068616E646F665265636B6F6E696E67203D207370652O6C283632313234292C0D0A2O206A7564676D656E74203D207370652O6C283230323731292C0D0A2O20726562756B65203D207370652O6C283936323331292C0D0A2O20726564656D7074696F6E203D207370652O6C2837333238292C0D0A2O20776F72646F66476C6F7279203D207370652O6C283835363733292C0D0A2O202O2D2074616C656E74730D0A2O206176656E67696E675772617468203D207370652O6C2833312O3834292C0D0A2O20626C696E64696E674C69676874203D207370652O6C282O3135373530292C0D0A2O2068612O6D65726F665772617468203D207370652O6C283234323735292C0D0A2O20686F6C794176656E676572203D207370652O6C28313035383039292C0D0A2O206C61796F6E48616E6473203D207370652O6C28362O33292C0D0A2O20726570656E74616E6365203D207370652O6C28322O302O36292C0D0A2O207475726E4576696C203D207370652O6C283130333236292C0D0A2O207A65616C6F747350617261676F6E203D207370652O6C2833392O313432292C0D0A2O202O2D2061757261730D0A2O20636F6E63656E74726174696F6E41757261203D207370652O6C28333137393230292C0D0A2O20637275736164657241757261203D207370652O6C28333O3233292C0D0A2O206465766F74696F6E41757261203D207370652O6C28343635292C0D0A2O207265747269627574696F6E41757261203D207370652O6C28313833343335292C0D0A2O202O2D2062752O66730D0A2O206176656E67696E67577261746842752O66203D207370652O6C2833312O3834292C0D0A2O20626C652O73696E676F664475736B42752O66203D207370652O6C28333835313236292C0D0A2O20636F6E736563726174696F6E42752O66203D207370652O6C28312O38333730292C0D0A2O20646976696E65507572706F736542752O66203D207370652O6C282O3233383139292C0D0A2O20686F6C794176656E67657242752O66203D207370652O6C28313035383039292C0D0A2O202O2D20646562752O66730D0A2O20636F6E736563726174696F6E446562752O66203D207370652O6C28323034323432292C0D0A2O206A7564676D656E74446562752O66203D207370652O6C28313937322O37292C0D0A2O20666F7262656172616E6365446562752O66203D207370652O6C2832352O3731292C0D0A2O202O2D20702O6F6C0D0A2O20702O6F6C203D207370652O6C284O393130292C0D0A7D0D0A0D0A7370652O6C2E70616C6164696E2E70726F74656374696F6E203D204D657267655461626C6542794B6579287370652O6C2E70616C6164696E2E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O206A7564676D656E74203D207370652O6C283237352O3739292C0D0A2O202O2D2074616C656E74730D0A2O20617264656E74446566656E646572203D207370652O6C283331383530292C0D0A2O206176656E67657273536869656C64203D207370652O6C283331393335292C0D0A2O2062617374696F6E6F664C69676874203D207370652O6C28333738393734292C0D0A2O20626C652O73656448612O6D6572203D207370652O6C28323034303139292C0D0A2O206372757361646572734A7564676D656E74203D207370652O6C28323034303233292C0D0A2O20646976696E65546F2O6C203D207370652O6C2833372O353736292C0D0A2O206579656F66547972203D207370652O6C28333837313734292C0D0A2O2066696E616C5374616E64203D207370652O6C28323034302O37292C0D0A2O20677561726469616E6F66416E6369656E744B696E6773203D206D756C74695370652O6C28382O3635392C20323132363431292C0D0A2O2068612O6D65726F667468655269676874656F7573203D207370652O6C283533353935292C0D0A2O20696E6D6F73744C69676874203D207370652O6C28343035373537292C0D0A2O206D6F6D656E746F66476C6F7279203D207370652O6C28333237313933292C0D0A2O207269676874656F757350726F746563746F72203D207370652O6C28323034303734292C0D0A2O2073656E74696E656C203D207370652O6C28333839353339292C0D0A2O20736869656C646F667468655269676874656F7573203D207370652O6C283533362O30292C0D0A2O202O2D2062752O66730D0A2O20612O6C796F667468654C6967687442752O66203D207370652O6C28333934373134292C0D0A2O20617264656E74446566656E64657242752O66203D207370652O6C283331383530292C0D0A2O2062617374696F6E6F664C6967687442752O66203D207370652O6C28333738393734292C0D0A2O20677561726469616E6F66416E6369656E744B696E677342752O66203D206D756C74695370652O6C28382O3635392C20323132363431292C0D0A2O206D6F6D656E746F66476C6F727942752O66203D207370652O6C28333237313933292C0D0A2O2073656E74696E656C42752O66203D207370652O6C28333839353339292C0D0A2O20736869656C646F667468655269676874656F757342752O66203D207370652O6C28313332343033292C0D0A2O207368696E696E674C6967687446722O6542752O66203D207370652O6C28333237353130292C0D0A2O202O2D20646562752O66730D0A7D290D0A0D0A7370652O6C2E70616C6164696E2E7265747269627574696F6E203D204D657267655461626C6542794B6579287370652O6C2E70616C6164696E2E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O2074656D706C61727356657264696374203D207370652O6C283835323536292C0D0A2O202O2D2074616C656E74730D0A2O206173686573746F44757374203D207370652O6C2833382O332O30292C0D0A2O20626C6164656F664A757374696365203D207370652O6C28313834353735292C0D0A2O20626C6164656F665772617468203D207370652O6C28323331383332292C0D0A2O20626C652O7365644368616D70696F6E203D207370652O6C28343033303130292C0D0A2O20626F756E646C652O734A7564676D656E74203D207370652O6C28343035323738292C0D0A2O2063727573616465203D207370652O6C28323331383935292C0D0A2O20637275736164696E67537472696B6573203D207370652O6C28343034353432292C0D0A2O20646976696E6541726269746572203D207370652O6C28343034333036292C0D0A2O20646976696E65417578696C69617279203D207370652O6C28343036313538292C0D0A2O20646976696E6548612O6D6572203D207370652O6C28313938303334292C0D0A2O20646976696E655265736F6E616E6365203D207370652O6C28333834303237292C0D0A2O20646976696E6550726F74656374696F6E203D207370652O6C28343033383736292C0D0A2O20646976696E6553746F726D203D207370652O6C28352O333835292C0D0A2O20646976696E65546F2O6C203D207370652O6C2833372O353736292C0D0A2O20656D70797265616E4C6567616379203D207370652O6C28333837313730292C0D0A2O20656D70797265616E506F776572203D207370652O6C28333236373332292C0D0A2O20657865637574696F6E53656E74656E6365203D207370652O6C28333433353237292C0D0A2O20657865637574696F6E65727357692O6C203D207370652O6C28343036393430292C0D0A2O20657865637574696F6E6572735772617468203D207370652O6C28333837313936292C0D0A2O2065786F726369736D203D207370652O6C28333833313835292C0D0A2O206578707572676174696F6E203D207370652O6C2833382O332O34292C0D0A2O2066696E616C5265636B6F6E696E67203D207370652O6C28333433373231292C0D0A2O2066696E616C56657264696374203D207370652O6C2833382O333238292C0D0A2O2066697265736F664A757374696365203D207370652O6C2832302O333136292C0D0A2O20686F6C79426C616465203D207370652O6C2833382O333432292C0D0A2O206A7572697364696374696F6E203D207370652O6C28343032393731292C0D0A2O206A757374696361727356656E6765616E6365203D207370652O6C283231352O3631292C0D0A2O2072616469616E74446563722O65203D207370652O6C28333833343639292C0D0A2O2072616469616E74446563722O6554616C656E74203D207370652O6C28333834303532292C0D0A2O207269676874656F757356657264696374203D207370652O6C28323637363130292C0D0A2O20736869656C646F6656656E6765616E6365203D207370652O6C283138342O3632292C0D0A2O2074656D706C6172536C617368203D207370652O6C2834302O363437292C0D0A2O2074656D706C6172537472696B65203D207370652O6C28343037343830292C0D0A2O2076616E6775617264734D6F6D656E74756D203D207370652O6C2833382O333134292C0D0A2O2077616B656F664173686573203D207370652O6C28322O35393337292C0D0A2O207A65616C203D207370652O6C28323639353639292C0D0A2O202O2D2062752O66730D0A2O206372757361646542752O66203D207370652O6C28323331383935292C0D0A2O20646976696E654172626974657242752O66203D207370652O6C28343036393735292C0D0A2O20646976696E655265736F6E616E636542752O66203D207370652O6C28333834303239292C0D0A2O206563686F65736F66577261746842752O66203D207370652O6C28343233353930292C202O2D205433312C203470630D0A2O20656D70797265616E4C656761637942752O66203D207370652O6C28333837313738292C0D0A2O20656D70797265616E506F77657242752O66203D207370652O6C28333236372O33292C0D0A2O202O2D20646562752O66730D0A2O206578707572676174696F6E446562752O66203D207370652O6C2833382O333436292C0D0A7D290D0A0D0A7370652O6C2E70616C6164696E2E686F6C79203D204D657267655461626C6542794B6579287370652O6C2E70616C6164696E2E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O20617572614D617374657279203D207370652O6C283331383231292C0D0A2O206162736F6C7574696F6E203D207370652O6C28323132303536292C0D0A2O20626C652O73696E676F6653752O6D6572203D207370652O6C28332O382O3037292C0D0A2O20626C652O73696E676F66417574756D6E203D207370652O6C28332O38303130292C0D0A2O20626C652O73696E676F6657696E746572203D207370652O6C28332O38302O31292C0D0A2O20626C652O73696E676F66537072696E67203D207370652O6C28332O38303133292C0D0A2O20626C652O73696E676F66536163726966696365203D207370652O6C2836393430292C0D0A2O20626561636F6E6F664661697468203D207370652O6C28313536393130292C0D0A2O20626561636F6E6F664C69676874203D207370652O6C283533353633292C0D0A2O20626561636F6E6F66566972747565203D207370652O6C28323O303235292C0D0A2O20636C65616E7365203D207370652O6C2834393837292C0D0A2O20646976696E654661766F72203D207370652O6C28323130323934292C0D0A2O20646976696E6550726F74656374696F6E203D207370652O6C28343938292C0D0A2O20646976696E65546F2O6C203D207370652O6C2833372O353736292C0D0A2O20686F6C794C69676874203D207370652O6C283832333236292C0D0A2O20686F6C7953686F636B203D207370652O6C283230343733292C0D0A2O20696E667573696F6E6F664C6967687442752O66203D207370652O6C283534313439292C0D0A2O206C696768746F664461776E203D207370652O6C2838353O32292C0D0A2O206C696768746F667468654D6172747972203D207370652O6C283138332O3938292C0D0A2O206A7564676D656E74203D207370652O6C283237352O3733292C0D0A2O20736869656C646F667468655269676874656F7573203D207370652O6C28343135303931292C0D0A2O202O2D2074616C656E74730D0A2O206176656E67696E674372757361646572203D207370652O6C283231362O3331292C0D0A2O206177616B656E696E67203D207370652O6C28323438302O33292C0D0A2O2062612O726965726F664661697468203D207370652O6C28313438303339292C0D0A2O20626573746F774661697468203D207370652O6C282O322O333036292C0D0A2O20626F756E646C652O7353616C766174696F6E203D207370652O6C28333932393531292C0D0A2O206372757361646572734D69676874203D207370652O6C28313936393236292C0D0A2O20646179627265616B203D207370652O6C28343134313730292C0D0A2O20656D70797265616E4C656761637942752O66203D207370652O6C28333837313738292C0D0A2O20676C692O6D65726F664C69676874203D207370652O6C28323837323639292C0D0A2O20676C692O6D65726F664C6967687442752O66203D207370652O6C28323837323830292C0D0A2O20676F6C64656E50617468203D207370652O6C28332O37313238292C0D0A2O2068616E646F66446976696E697479203D207370652O6C28343134323733292C0D0A2O20686F6C79507269736D203D207370652O6C282O3134313635292C0D0A2O20696D70726F766564436C65616E7365203D207370652O6C28333933303234292C0D0A2O206C696768747348612O6D6572203D207370652O6C282O3134313538292C0D0A2O206A7564676D656E746F664C69676874203D207370652O6C283138332O3738292C0D0A2O206A7564676D656E746F664C69676874446562752O66203D207370652O6C28313936393431292C0D0A2O207479727344656C69766572616E6365203D207370652O6C28322O30363532292C0D0A2O207479727344656C69766572616E636542752O66203D207370652O6C28322O30363534292C0D0A2O20756E656E64696E674C6967687442752O66203D207370652O6C28333934373039292C0D0A7D290D0A0D0A2O2D206974656D730D0A6966206E6F74206974656D2E70616C6164696E207468656E0D0A2O206974656D2E70616C6164696E203D207B7D0D0A656E640D0A6974656D2E70616C6164696E2E636F2O6D6F6E73203D207B0D0A7D0D0A0D0A6974656D2E70616C6164696E2E70726F74656374696F6E203D204D657267655461626C6542794B6579286974656D2E70616C6164696E2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E70616C6164696E2E7265747269627574696F6E203D204D657267655461626C6542794B6579286974656D2E70616C6164696E2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E70616C6164696E2E686F6C79203D204D657267655461626C6542794B6579286974656D2E70616C6164696E2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F730D0A6966206E6F74206D6163726F2E70616C6164696E207468656E0D0A2O206D6163726F2E70616C6164696E203D207B7D0D0A656E640D0A6D6163726F2E70616C6164696E2E636F2O6D6F6E73203D207B0D0A2O202O2D207370652O6C730D0A2O20626C652O73696E676F6650726F74656374696F6E466F637573203D206D6163726F2822626C652O73696E676F6650726F74656374696F6E466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E626C652O73696E676F6650726F74656374696F6E3A4E616D65282O292C0D0A2O20626C652O73696E676F6650726F74656374696F6E4D6F7573656F766572203D206D6163726F2822626C652O73696E676F6650726F74656374696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E626C652O73696E676F6650726F74656374696F6E3A4E616D65282O292C0D0A2O20626C652O73696E676F6646722O65646F6D466F637573203D206D6163726F2822626C652O73696E676F6646722O65646F6D466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E626C652O73696E676F6646722O65646F6D3A4E616D65282O292C0D0A2O20626C652O73696E676F6646722O65646F6D4D6F7573656F766572203D206D6163726F2822626C652O73696E676F6646722O65646F6D4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E626C652O73696E676F6646722O65646F6D3A4E616D65282O292C0D0A2O20636C65616E7365546F78696E734D6F7573656F766572203D206D6163726F2822636C65616E7365546F78696E734D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E636C65616E7365546F78696E733A4E616D65282O292C0D0A2O206372757361646572537472696B654D6F7573656F766572203D206D6163726F28226372757361646572537472696B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E6372757361646572537472696B653A4E616D65282O292C0D0A2O20666C6173686F664C69676874466F637573203D206D6163726F2822666C6173686F664C69676874466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E666C6173686F664C696768743A4E616D65282O292C0D0A2O20666C6173686F664C69676874506C61796572203D206D6163726F2822666C6173686F664C69676874506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E666C6173686F664C696768743A4E616D65282O292C0D0A2O20696E74657263652O73696F6E4D6F7573656F766572203D206D6163726F2822696E74657263652O73696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E696E74657263652O73696F6E3A4E616D65282O292C0D0A2O206C61796F6E48616E6473466F637573203D206D6163726F28226C61796F6E48616E6473466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E6C61796F6E48616E64733A4E616D65282O292C0D0A2O206C61796F6E48616E6473506C61796572203D206D6163726F28226C61796F6E48616E6473506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E6C61796F6E48616E64733A4E616D65282O292C0D0A2O206C61796F6E48616E64734D6F7573656F766572203D206D6163726F28226C61796F6E48616E64734D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E6C61796F6E48616E64733A4E616D65282O292C0D0A2O206A7564676D656E744D6F7573656F766572203D206D6163726F28226A7564676D656E744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E6A7564676D656E743A4E616D65282O292C0D0A2O2068612O6D65726F664A7573746963654D6F7573656F766572203D206D6163726F282268612O6D65726F664A7573746963654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E68612O6D65726F664A7573746963653A4E616D65282O292C0D0A2O20726562756B654D6F7573656F766572203D206D6163726F2822726562756B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E726562756B653A4E616D65282O292C0D0A2O20726564656D7074696F6E4D6F7573656F766572203D206D6163726F2822726564656D7074696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E726564656D7074696F6E3A4E616D65282O292C0D0A2O20726570656E74616E63654D6F7573656F766572203D206D6163726F2822726570656E74616E63654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E726570656E74616E63653A4E616D65282O292C0D0A2O207475726E4576696C4D6F7573656F766572203D206D6163726F28227475726E4576696C4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E7475726E4576696C3A4E616D65282O292C0D0A2O20776F72646F66476C6F7279466F637573203D206D6163726F2822776F72646F66476C6F7279466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E776F72646F66476C6F72793A4E616D65282O292C0D0A2O20776F72646F66476C6F72794D6F7573656F766572203D206D6163726F2822776F72646F66476C6F72794D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E776F72646F66476C6F72793A4E616D65282O292C0D0A2O20776F72646F66476C6F7279506C61796572203D206D6163726F2822776F72646F66476C6F7279506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E70616C6164696E2E636F2O6D6F6E732E776F72646F66476C6F72793A4E616D65282O292C0D0A7D0D0A0D0A6D6163726F2E70616C6164696E2E70726F74656374696F6E203D204D657267655461626C6542794B6579286D6163726F2E70616C6164696E2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6D6163726F2E70616C6164696E2E7265747269627574696F6E203D204D657267655461626C6542794B6579286D6163726F2E70616C6164696E2E636F2O6D6F6E732C207B0D0A2O2066696E616C5265636B6F6E696E67506C61796572203D206D6163726F282266696E616C5265636B6F6E696E67506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E70616C6164696E2E7265747269627574696F6E2E66696E616C5265636B6F6E696E673A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E70616C6164696E2E686F6C79203D204D657267655461626C6542794B6579286D6163726F2E70616C6164696E2E636F2O6D6F6E732C207B0D0A2O2062612O726965726F664661697468466F637573203D206D6163726F282262612O726965726F664661697468466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E62612O726965726F6646616974683A4E616D65282O292C0D0A2O20626561636F6E6F664661697468466F637573203D206D6163726F2822626561636F6E6F664661697468466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E626561636F6E6F6646616974683A4E616D65282O292C0D0A2O20626561636F6E6F664C69676874466F637573203D206D6163726F2822626561636F6E6F664C69676874466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E626561636F6E6F664C696768743A4E616D65282O292C0D0A2O20626561636F6E6F66566972747565466F637573203D206D6163726F2822626561636F6E6F66566972747565466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E626561636F6E6F665669727475653A4E616D65282O292C0D0A2O20626C652O73696E676F6653752O6D6572506C61796572203D206D6163726F2822626C652O73696E676F6653752O6D6572506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E626C652O73696E676F6653752O6D65723A4E616D65282O292C0D0A2O20626C652O73696E676F6653752O6D6572466F637573203D206D6163726F2822626C652O73696E676F6653752O6D6572466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E626C652O73696E676F6653752O6D65723A4E616D65282O292C0D0A2O20626C652O73696E676F66536163726966696365466F637573203D206D6163726F2822626C652O73696E676F66536163726966696365466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E626C652O73696E676F665361637269666963653A4E616D65282O292C0D0A2O20626C652O73696E676F665361637269666963654D6F7573656F766572203D206D6163726F2822626C652O73696E676F665361637269666963654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E626C652O73696E676F665361637269666963653A4E616D65282O292C0D0A2O20636C65616E7365466F637573203D206D6163726F2822636C65616E7365466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E636C65616E73653A4E616D65282O292C0D0A2O20636C65616E73654D6F7573656F766572203D206D6163726F2822636C65616E73654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E636C65616E73653A4E616D65282O292C0D0A2O20646976696E65546F2O6C466F637573203D206D6163726F2822646976696E65546F2O6C466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E646976696E65546F2O6C3A4E616D65282O292C0D0A2O20686F6C794C69676874466F637573203D206D6163726F2822686F6C794C69676874466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E686F6C794C696768743A4E616D65282O292C0D0A2O20686F6C794C696768744D6F7573656F766572203D206D6163726F2822686F6C794C696768744D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E686F6C794C696768743A4E616D65282O292C0D0A2O20686F6C7953686F636B466F637573203D206D6163726F2822686F6C7953686F636B466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E686F6C7953686F636B3A4E616D65282O292C0D0A2O20686F6C7953686F636B4D6F7573656F766572203D206D6163726F2822686F6C7953686F636B4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E686F6C7953686F636B3A4E616D65282O292C0D0A2O20686F6C79507269736D506C61796572203D206D6163726F2822686F6C79507269736D506C61796572222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E686F6C79507269736D3A4E616D65282O292C0D0A2O206C696768746F667468654D6172747972466F637573203D206D6163726F28226C696768746F667468654D6172747972466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E6C696768746F667468654D61727479723A4E616D65282O292C0D0A2O206C696768747348612O6D6572506C61796572203D206D6163726F28226C696768747348612O6D6572506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E70616C6164696E2E686F6C792E6C696768747348612O6D65723A4E616D65282O292C0D0A7D290D0A00063O0012043O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);