local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110](v13(v83,v110 + 1 ,v78));elseif (v86==1) then local v112=v85[2];v83[v112]=v83[v112](v83[v112 + 1 ]);else v83[v85[2]]=v59[v85[3]];end elseif (v86<=4) then if (v86>3) then local v116=v85[2];v78=(v116 + v84) -1 ;for v128=v116,v78 do local v129=v79[v128-v116 ];v83[v128]=v129;end else v83[v85[2]]=v85[3];end elseif (v86==5) then local v119;local v120;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v83[v120]=v83[v120](v83[v120 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v78=(v120 + v84) -1 ;for v131=v120,v78 do v119=v79[v131-v120 ];v83[v131]=v119;end v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v83[v120](v13(v83,v120 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else do return;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703AA182O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A2O2D204865726F4C69620D0A6C6F63616C20484C6O203D204865726F4C69620D0A6C6F63616C2043616368653O203D204865726F43616368650D0A6C6F63616C20556E69744O203D20484C2E556E69740D0A6C6F63616C20506C617965722O203D20556E69742E506C617965720D0A6C6F63616C205065745O203D20556E69742E5065740D0A6C6F63616C205461726765742O203D20556E69742E5461726765740D0A6C6F63616C205370652O6C3O203D20484C2E5370652O6C0D0A6C6F63616C204974656D4O203D20484C2E4974656D0D0A2O2D20576F726C6479526F746174696F6E0D0A6C6F63616C2057526O203D20576F726C6479526F746174696F6E0D0A2O2D205370652O6C730D0A6C6F63616C205370652O6C424D203D205370652O6C2E48756E7465722E42656173744D6173746572790D0A6C6F63616C205370652O6C2O4D203D205370652O6C2E48756E7465722E4D61726B736D616E736869700D0A6C6F63616C205370652O6C5356203D205370652O6C2E48756E7465722E537572766976616C0D0A2O2D2053652O74696E67730D0A6C6F63616C2053652O74696E6773203D2057522E47554953652O74696E67732E41504C2E48756E7465720D0A2O2D2048756E746572204C6F63616C0D0A6C6F63616C2048756E7465722O203D2057522E436F2O6D6F6E732E48756E7465720D0A2O2D204C75610D0A6C6F63616C206D6174686D6178203D206D6174682E6D61780D0A2O2D20576F57204150490D0A6C6F63616C2047657454696D65203D2047657454696D650D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D3D0D0A2O2D204265617374204D6173746572792C2049443A203235330D0A6C6F63616C204F6C64424D49734361737461626C650D0A4F6C64424D49734361737461626C65203D20484C2E412O64436F72654F76652O7269646528225370652O6C2E49734361737461626C65222C0D0A66756E6374696F6E202873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A2O206C6F63616C2042617365436865636B203D204F6C64424D49734361737461626C652873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A2O2069662073656C66202O3D205370652O6C424D2E53752O6D6F6E506574207468656E0D0A4O2072657475726E2048756E7465722E5065742E537461747573202O3D203020616E642042617365436865636B0D0A2O20656C736569662073656C66202O3D205370652O6C424D2E526576697665506574207468656E0D0A4O2072657475726E20285065743A4973446561644F7247686F73742829206F722048756E7465722E5065742E537461747573202O3D20322920616E642042617365436865636B0D0A2O20656C736569662073656C66202O3D205370652O6C424D2E4D656E64506574207468656E0D0A4O2072657475726E205065743A4865616C746850657263656E746167652829203E203020616E64205065743A4865616C746850657263656E746167652829203C3D2053652O74696E67732E436F2O6D6F6E732E48502E4D656E6450657420616E642042617365436865636B0D0A2O20656C73650D0A4O2072657475726E2042617365436865636B0D0A2O20656E640D0A656E640D0A2C20323533290D0A0D0A6C6F63616C20424D50657442752O6652656D61696E730D0A424D50657442752O6652656D61696E73203D20484C2E412O64436F72654F76652O726964652028225065742E42752O6652656D61696E73222C0D0A66756E6374696F6E202873656C662C205370652O6C2C20416E794361737465722C204F2O66736574290D0A2O206C6F63616C2042617365436865636B203D20424D50657442752O6652656D61696E732873656C662C205370652O6C2C20416E794361737465722C204F2O66736574290D0A2O202O2D20466F722073686F7274206475726174696F6E207065742062752O66732C2069662077652061726520696E207468652070726F63652O73206F662063617374696E6720616E20696E7374616E74207370652O6C2C2066616B6520746865206475726174696F6E2063616C63756C6174696F6E20756E74696C207765206B6E6F7720776861742069742069730D0A2O202O2D20546869732069732064756520746F207468652066616374207468617420696E7374616E74207370652O6C7320646F6E2774207472692O676572205350452O4C5F434153545F535441525420616E6420776520636F756C6420686176652061207265667265736820696E2070726F6772652O732035302D3135306D73206265666F7265207765206B6E6F772061626F75742069740D0A2O206966205370652O6C202O3D205370652O6C424D2E4672656E7A7942752O66207468656E0D0A4O20696620506C617965723A4973507265764361737450656E64696E672829207468656E0D0A6O2072657475726E2042617365436865636B202B202847657454696D652829202D20506C617965723A474344537461727454696D65282O290D0A4O20656E640D0A2O20656C73656966205370652O6C202O3D205370652O6C424D2E4265617374436C6561766542752O66207468656E0D0A4O202O2D2049662074686520706C617965722062752O6620686173206475726174696F6E2C20677261622074686174206F6E6520696E73746561642E2049742063616E20626520612O706C6964206120666577204D53206561726C6965722064756520746F206C6174656E63790D0A4O2042617365436865636B203D206D6174686D61782842617365436865636B2C20506C617965723A42752O6652656D61696E73285370652O6C424D2E4265617374436C65617665506C6179657242752O662O290D0A4O20696620506C617965723A4973507265764361737450656E64696E672829207468656E0D0A6O2072657475726E2042617365436865636B202B202847657454696D652829202D20506C617965723A474344537461727454696D65282O290D0A4O20656E640D0A2O20656E640D0A2O2072657475726E2042617365436865636B0D0A656E640D0A2C20323533290D0A0D0A2O2D204D61726B736D616E736869702C2049443A203235340D0A6C6F63616C204F6C642O4D49734361737461626C650D0A4F6C642O4D49734361737461626C65203D20484C2E412O64436F72654F76652O7269646528225370652O6C2E49734361737461626C65222C0D0A66756E6374696F6E202873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A2O206C6F63616C2042617365436865636B203D204F6C642O4D49734361737461626C652873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A2O2069662073656C66202O3D205370652O6C2O4D2E53752O6D6F6E506574207468656E0D0A4O2072657475726E2048756E7465722E5065742E537461747573202O3D203020616E642042617365436865636B0D0A2O20656C73650D0A4O2072657475726E2042617365436865636B0D0A2O20656E640D0A656E640D0A2C20323534290D0A0D0A6C6F63616C204F6C642O4D497352656164790D0A4F6C642O4D49735265616479203D20484C2E412O64436F72654F76652O7269646528225370652O6C2E49735265616479222C0D0A66756E6374696F6E202873656C662C2052616E67652C20416F455370652O6C2C2054686973556E69742C20427970612O735265636F766572792C204F2O66736574290D0A2O206C6F63616C2042617365436865636B203D204F6C642O4D497352656164792873656C662C2052616E67652C20416F455370652O6C2C2054686973556E69742C20427970612O735265636F766572792C204F2O66736574290D0A2O2069662073656C66202O3D205370652O6C2O4D2E41696D656453686F74207468656E0D0A4O206C6F63616C2053686F756C64436173744153203D20286E6F7420506C617965723A497343617374696E67285370652O6C2O4D2E41696D656453686F742920616E64205370652O6C2O4D2E41696D656453686F743A436861726765732829202O3D2031206F72205370652O6C2O4D2E41696D656453686F743A436861726765732829203E2031290D0A4O2072657475726E2042617365436865636B20616E642053686F756C6443617374415320616E6420286E6F7420506C617965723A49734D6F76696E672829206F7220506C617965723A42752O665570285370652O6C2O4D2E4C6F636B616E644C6F616442752O662O290D0A2O20656C736569662073656C66202O3D205370652O6C2O4D2E5761696C696E67412O726F77207468656E0D0A4O2072657475726E2042617365436865636B20616E64206E6F7420506C617965723A497343617374696E672873656C66290D0A2O20656C73650D0A4O2072657475726E2042617365436865636B0D0A2O20656E640D0A656E640D0A2C20323534290D0A0D0A6C6F63616C204F6C642O4D42752O6652656D61696E730D0A4F6C642O4D42752O6652656D61696E73203D20484C2E412O64436F72654F76652O726964652822506C617965722E42752O6652656D61696E73222C0D0A2O2066756E6374696F6E2873656C662C205370652O6C2C20416E794361737465722C204F2O66736574290D0A4O206966205370652O6C202O3D205370652O6C2O4D2E547269636B53686F747342752O6620616E642028506C617965723A497343617374696E67285370652O6C2O4D2E41696D656453686F7429206F7220506C617965723A49734368612O6E656C696E67285370652O6C2O4D2E5261706964466972652O29207468656E0D0A6O2072657475726E20300D0A4O20656C73650D0A6O2072657475726E204F6C642O4D42752O6652656D61696E732873656C662C205370652O6C2C20416E794361737465722C204F2O66736574290D0A4O20656E640D0A2O20656E640D0A2C20323534290D0A0D0A6C6F63616C204F6C642O4D42752O66446F776E0D0A4F6C642O4D42752O66446F776E203D20484C2E412O64436F72654F76652O726964652822506C617965722E42752O66446F776E222C0D0A2O2066756E6374696F6E2873656C662C205370652O6C2C20416E794361737465722C204F2O66736574290D0A4O206966205370652O6C202O3D205370652O6C2O4D2E5072656369736553686F747342752O6620616E6420506C617965723A497343617374696E67285370652O6C2O4D2E41696D656453686F7429207468656E0D0A6O2072657475726E2066616C73650D0A4O20656C73650D0A6O2072657475726E204F6C642O4D42752O66446F776E2873656C662C205370652O6C2C20416E794361737465722C204F2O66736574290D0A4O20656E640D0A2O20656E640D0A2C20323534290D0A0D0A484C2E412O64436F72654F76652O726964652822506C617965722E466F63757350222C0D0A2O2066756E6374696F6E28290D0A4O206C6F63616C20466F637573203D20506C617965723A466F6375732829202B20506C617965723A466F63757352656D61696E696E6743617374526567656E28290D0A4O206966206E6F7420506C617965723A497343617374696E672829207468656E0D0A6O2072657475726E20466F6375730D0A4O20656C73650D0A6O20696620506C617965723A497343617374696E67285370652O6C2O4D2E53746561647953686F7429207468656E0D0A8O2072657475726E20466F637573202B2031300D0A6O20656C7365696620506C617965723A49734368612O6E656C696E67285370652O6C2O4D2E52617069644669726529207468656E0D0A8O2072657475726E20466F637573202B20370D0A6O20656C7365696620506C617965723A497343617374696E67285370652O6C2O4D2E5761696C696E67412O726F7729207468656E0D0A8O2072657475726E20466F637573202D2031350D0A6O20656C7365696620506C617965723A497343617374696E67285370652O6C2O4D2E41696D656453686F7429207468656E0D0A8O2072657475726E20466F637573202D2033350D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2C20323534290D0A0D0A2O2D20537572766976616C2C2049443A20322O350D0A6C6F63616C204F6C64535649734361737461626C650D0A4F6C64535649734361737461626C65203D20484C2E412O64436F72654F76652O7269646528225370652O6C2E49734361737461626C65222C0D0A66756E6374696F6E202873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A2O206C6F63616C2042617365436865636B203D204F6C64535649734361737461626C652873656C662C20427970612O735265636F766572792C2052616E67652C20416F455370652O6C2C2054686973556E69742C204F2O66736574290D0A2O2069662073656C66202O3D205370652O6C53562E53752O6D6F6E506574207468656E0D0A4O2072657475726E2048756E7465722E5065742E537461747573202O3D203020616E642042617365436865636B0D0A2O20656C736569662073656C66202O3D205370652O6C53562E526576697665506574207468656E0D0A4O2072657475726E20285065743A4973446561644F7247686F73742829206F722048756E7465722E5065742E537461747573202O3D20322920616E642042617365436865636B0D0A2O20656C736569662073656C66202O3D205370652O6C53562E4D656E64506574207468656E0D0A4O2072657475726E205065743A4865616C746850657263656E746167652829203E203020616E64205065743A4865616C746850657263656E746167652829203C3D2053652O74696E67732E436F2O6D6F6E732E48502E4D656E6450657420616E642042617365436865636B0D0A2O20656C736569662073656C66202O3D205370652O6C53562E4173706563746F667468654561676C65207468656E0D0A4O2072657475726E2053652O74696E67732E537572766976616C2E456E61626C65642E4173706563744F665468654561676C6520616E642042617365436865636B0D0A2O20656C736569662073656C66202O3D205370652O6C53562E486172702O6F6E207468656E0D0A4O2072657475726E2042617365436865636B20616E64206E6F74205461726765743A4973496E52616E67652838290D0A2O20656C73650D0A4O2072657475726E2042617365436865636B0D0A2O20656E640D0A656E640D0A2C20322O35290D0A0D0A6C6F63616C204F6C645356497352656164790D0A4F6C64535649735265616479203D20484C2E412O64436F72654F76652O7269646528225370652O6C2E49735265616479222C0D0A66756E6374696F6E202873656C662C2052616E67652C20416F455370652O6C2C2054686973556E69742C20427970612O735265636F766572792C204F2O66736574290D0A2O2069662073656C66202O3D205370652O6C53562E4D6F6E672O6F736542697465206F722073656C66202O3D205370652O6C53562E526170746F72537472696B65207468656E0D0A4O2072657475726E204F6C645356497352656164792873656C662C20224D656C2O65222C20416F455370652O6C2C2054686973556E69742C20427970612O735265636F766572792C204F2O66736574290D0A2O20656C73650D0A4O206C6F63616C2042617365436865636B203D204F6C645356497352656164792873656C662C2052616E67652C20416F455370652O6C2C2054686973556E69742C20427970612O735265636F766572792C204F2O66736574290D0A4O2069662073656C66202O3D205370652O6C53562E4361727665206F722073656C66202O3D205370652O6C53562E4275746368657279207468656E0D0A6O2072657475726E2042617365436865636B20616E642028506C617965723A42752O66446F776E285370652O6C53562E4173706563746F667468654561676C6529206F7220506C617965723A42752O665570285370652O6C53562E4173706563746F667468654561676C652920616E64205461726765743A4973496E4D656C2O6552616E676528382O290D0A4O20656C73650D0A6O2072657475726E2042617365436865636B0D0A4O20656E640D0A2O20656E640D0A656E640D0A2C20322O352900063O0012053O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);