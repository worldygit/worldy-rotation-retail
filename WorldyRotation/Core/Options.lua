local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));elseif (v86==1) then v83[v85[2]]=v85[3];else local v119=v85[2];v83[v119]=v83[v119](v83[v119 + 1 ]);end elseif (v86<=3) then v83[v85[2]]=v59[v85[3]];elseif (v86==4) then local v121=v85[2];v83[v121](v13(v83,v121 + 1 ,v78));else do return;end end elseif (v86<=8) then if (v86<=6) then local v114=v85[2];v83[v114]=v83[v114](v83[v114 + 1 ]);elseif (v86>7) then local v122=v85[2];v78=(v122 + v84) -1 ;for v130=v122,v78 do local v131=v79[v130-v122 ];v83[v130]=v131;end else local v123=v85[2];v78=(v123 + v84) -1 ;for v133=v123,v78 do local v134=v79[v133-v123 ];v83[v133]=v134;end end elseif (v86<=9) then do return;end elseif (v86>10) then v83[v85[2]]=v85[3];else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67031E1A2O006C6F63616C20612O646F6E4E616D65203D203O2E0D0A0D0A6C6F63616C2061706C73203D2057522E61706C730D0A6C6F63616C20617069203D2057522E6170690D0A6C6F63616C20677569203D2057522E6775690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C2066756E6374696F6E2047657441706C734F7074696F6E7328290D0A2O206C6F63616C2074203D207B7D0D0A2O20666F72207370656349442C20737065635461626C6520696E207574696C732E536F7274656450616972732861706C732920646F0D0A4O206C6F63616C20636C612O734E616D65203D206170692E636C612O736573537065637342795370656349445B7370656349445D5B315D0D0A4O206C6F63616C20737065634E616D65203D206170692E636C612O736573537065637342795370656349445B7370656349445D5B325D0D0A4O206C6F63616C20636C612O73537065634B6579203D207574696C732E552O70657246697273744368617228636C612O734E616D6529202O2E207574696C732E552O70657246697273744368617228737065634E616D65290D0A4O206C6F63616C2061706C4E616D6573203D207B7D0D0A4O20666F722061706C4E616D652C205F20696E20706169727328737065635461626C652920646F0D0A6O2061706C4E616D65735B61706C4E616D655D203D207574696C732E552O7065724669727374436861722861706C4E616D65290D0A4O20656E640D0A4O207461626C652E696E7365727428742C207B0D0A6O2074797065203D202273656C656374222C0D0A6O206E616D65203D207574696C732E53706C69744F6E552O70657228636C612O73537065634B6579292C0D0A6O2076616C756573203D2061706C4E616D65732C0D0A6O20676574203D2066756E6374696F6E28696E666F290D0A8O2072657475726E2057522E64622E676C6F62616C2E61706C735B636C612O734E616D655D5B737065634E616D655D0D0A6O20656E642C0D0A6O20736574203D2066756E6374696F6E28696E666F2C2076616C7565290D0A8O2057522E64622E676C6F62616C2E61706C735B636C612O734E616D655D5B737065634E616D655D203D2076616C75650D0A8O2057523A4F6E50726F66696C65526573657428290D0A8O2057522E62696E642E526573657428290D0A8O2057522E61706C735B7370656349445D5B76616C75655D2E61706C496E697428290D0A6O20656E640D0A4O207D290D0A2O20656E640D0A2O2072657475726E20740D0A656E640D0A0D0A66756E6374696F6E2057523A496E69744F7074696F6E7328290D0A2O2073656C663A496E69744F7074696F6E735461626C6528290D0A2O204C6962537475622822416365436F6E6669674469616C6F672D332E3022293A412O64546F426C697A4F7074696F6E7328612O646F6E4E616D652C20612O646F6E4E616D65290D0A0D0A2O2073656C663A4F6E50726F66696C654368616E67656428290D0A2O20666F72207370656349442C205F20696E207574696C732E536F7274656450616972732873656C662E64622E70726F66696C652920646F0D0A4O206C6F63616C20636C612O734E616D65203D206170692E636C612O736573537065637342795370656349445B7370656349445D5B315D0D0A4O206C6F63616C20737065634E616D65203D206170692E636C612O736573537065637342795370656349445B7370656349445D5B325D0D0A4O206C6F63616C20636C612O73537065634B6579203D207574696C732E552O70657246697273744368617228636C612O734E616D6529202O2E207574696C732E552O70657246697273744368617228737065634E616D65290D0A4O204C6962537475622822416365436F6E6669674469616C6F672D332E3022293A412O64546F426C697A4F7074696F6E7328636C612O73537065634B6579202O2E202250726F66696C65222C207574696C732E53706C69744F6E552O70657228636C612O73537065634B6579292C20612O646F6E4E616D65290D0A2O20656E640D0A0D0A2O2073656C662E64622E526567697374657243612O6C6261636B2873656C662C20224F6E50726F66696C654368616E676564222C20224F6E50726F66696C654368616E67656422290D0A2O2073656C662E64622E526567697374657243612O6C6261636B2873656C662C20224F6E50726F66696C65436F70696564222C20224F6E50726F66696C654368616E67656422290D0A2O2073656C662E64622E526567697374657243612O6C6261636B2873656C662C20224F6E50726F66696C655265736574222C20224F6E50726F66696C65526573657422290D0A2O2073656C662E64622E526567697374657243612O6C6261636B2873656C662C20224F6E4E657750726F66696C65222C20224F6E50726F66696C65526573657422290D0A656E640D0A0D0A66756E6374696F6E2057523A496E69744F7074696F6E735461626C6528290D0A2O206C6F63616C2061706C734F7074696F6E73203D2047657441706C734F7074696F6E7328290D0A2O206C6F63616C2067656E6572616C4F7074696F6E73203D206775692E46692O6C2873656C662E64622E676C6F62616C2E67656E6572616C290D0A2O206C6F63616C206672616D65734F7074696F6E73203D206775692E46692O6C2873656C662E64622E676C6F62616C2E6672616D65732C206E696C2C206E696C2C20225570646174654672616D657322290D0A2O207461626C652E696E73657274286672616D65734F7074696F6E732C207B0D0A4O2074797065203D202273656C656374222C0D0A4O206E616D65203D2022506978656C20506F736974696F6E222C0D0A4O2076616C756573203D207B0D0A6O205B22544F504C454654225D203D2022544F504C454654222C0D0A6O205B22544F505249474854225D203D2022544F505249474854222C0D0A6O205B22424F2O544F4D4C454654225D203D2022424F2O544F4D4C454654222C0D0A6O205B22424F2O544F4D5249474854225D203D2022424F2O544F4D5249474854222C0D0A4O207D2C0D0A4O20676574203D2066756E6374696F6E28696E666F290D0A6O2072657475726E2057522E64622E676C6F62616C2E6672616D65732E722O6F742E706F736974696F6E0D0A4O20656E642C0D0A4O20736574203D2066756E6374696F6E28696E666F2C2076616C7565290D0A6O2057522E64622E676C6F62616C2E6672616D65732E722O6F742E706F736974696F6E203D2076616C75650D0A6O2057523A5570646174654672616D657328290D0A4O20656E640D0A2O207D290D0A0D0A2O206C6F63616C206F7074696F6E73203D207B0D0A4O206E616D65203D20612O646F6E4E616D652C0D0A4O2068616E646C6572203D2073656C662C0D0A4O2074797065203D202267726F7570222C0D0A4O206368696C6447726F757073203D2022746162222C0D0A4O2061726773203D207B0D0A6O2067656E6572616C203D206775692E47726F7570282247656E6572616C222C2066616C73652C2067656E6572616C4F7074696F6E732C207B206F72646572203D2031207D292C0D0A6O2061706C73203D206775692E47726F7570282241504C73222C2066616C73652C2061706C734F7074696F6E732C207B206F72646572203D2032207D292C0D0A6O206672616D6573203D206775692E47726F757028224672616D6573222C2066616C73652C206672616D65734F7074696F6E732C207B206F72646572203D2033207D292C0D0A4O207D0D0A2O207D0D0A0D0A2O206F7074696F6E732E617267732E70726F66696C65203D204C696253747562282241636544424F7074696F6E732D332E3122293A4765744F7074696F6E735461626C652873656C662E6462290D0A2O204C6962537475622822416365436F6E6669672D332E3022293A52656769737465724F7074696F6E735461626C6528612O646F6E4E616D652C206F7074696F6E73290D0A656E640D0A0D0A66756E6374696F6E2057523A496E697443686174436F2O6D616E647328290D0A2O2073656C663A526567697374657243686174436F2O6D616E6428227772222C202248616E646C6543686174436F2O6D616E6422290D0A656E640D0A0D0A66756E6374696F6E2057523A48616E646C6543686174436F2O6D616E6428696E707574290D0A2O206C6F63616C20636D64203D20737472696E672E6C6F77657228696E707574290D0A0D0A2O20696620636D64202O3D20226C6F636B22207468656E0D0A4O2073656C662E6672616D65732E746F2O676C65733A5365744C6F636B65642874727565290D0A4O2073656C663A5072696E74446562756728226C6F636B65642E22290D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O20696620636D64202O3D2022756E6C6F636B22207468656E0D0A4O2073656C662E6672616D65732E746F2O676C65733A5365744C6F636B65642866616C7365290D0A4O2073656C663A5072696E7444656275672822756E6C6F636B65642E22290D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O20696620636D64202O3D2022726573657422207468656E0D0A4O2073656C662E64623A5265736574444228290D0A4O2073656C663A5570646174654672616D657328290D0A4O2073656C663A5072696E744465627567282264617461626173652072657365742E22290D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O20696620636D64202O3D2022746F2O676C6522207468656E0D0A4O2073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E6F6E203D206E6F742073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E6F6E0D0A4O2073656C663A5570646174654672616D657328290D0A4O2073656C663A5072696E74446562756728226F6E3A2022202O2E20746F737472696E672873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E6F6E2O290D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O20696620636D64202O3D202263647322207468656E0D0A4O2073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E636473203D206E6F742073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E6364730D0A4O2073656C663A5570646174654672616D657328290D0A4O2073656C663A5072696E74446562756728226364733A2022202O2E20746F737472696E672873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E6364732O290D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O20696620636D64202O3D2022616F6522207468656E0D0A4O2073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E616F65203D206E6F742073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E616F650D0A4O2073656C663A5570646174654672616D657328290D0A4O2073656C663A5072696E7444656275672822616F653A2022202O2E20746F737472696E672873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E616F652O290D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O206966207574696C732E5374617274735769746828636D642C2022636173742229207468656E0D0A4O206C6F63616C207370652O6C4944203D20746F6E756D6265722873747273706C692O7461626C65282720272C20696E707574295B325D290D0A4O206966206E6F742073656C662E62696E642E7370652O6C5B7370652O6C49445D207468656E0D0A6O2073656C663A5072696E742822436F756C64206E6F742063617374207370652O6C202722202O2E20746F737472696E67287370652O6C494429202O2E2022272E22290D0A6O2072657475726E0D0A4O20656E640D0A4O206C6F63616C2062696E64696E674B6579203D2073656C662E62696E642E7370652O6C5B7370652O6C49445D2E6B65790D0A4O2073656C662E6672616D65732E722O6F743A53657442696E642862696E64696E674B6579290D0A4O2073656C662E70756C736554696D6572203D206170692E756E69742E706C617965723A47434452656D61696E732829203E203020616E642047657454696D652829202B206170692E756E69742E706C617965723A47434452656D61696E732829202B20302E313530206F722047657454696D652829202B20302E3135300D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O206966207574696C732E5374617274735769746828636D642C20226D6163726F2229207468656E0D0A4O206C6F63616C206D6163726F4944203D2073747273706C692O7461626C65282720272C20696E707574295B325D0D0A4O206966206E6F742073656C662E62696E642E6D6163726F5B6D6163726F49445D207468656E0D0A6O2073656C663A5072696E742822436F756C64206E6F7420757365206D6163726F202722202O2E206D6163726F4944202O2E2022272E22290D0A6O2072657475726E0D0A4O20656E640D0A4O206C6F63616C2062696E64696E674B6579203D2073656C662E62696E642E6D6163726F5B6D6163726F49445D2E6B65790D0A4O2073656C662E6672616D65732E722O6F743A53657442696E642862696E64696E674B6579290D0A4O2073656C662E70756C736554696D6572203D206170692E756E69742E706C617965723A47434452656D61696E732829203E203020616E642047657454696D652829202B206170692E756E69742E706C617965723A47434452656D61696E732829202B20302E313530206F722047657454696D652829202B20302E3135300D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O20496E746572666163654F7074696F6E734672616D655F4F70656E546F43617465676F727928612O646F6E4E616D65290D0A656E640D0A0D0A66756E6374696F6E2057523A4F6E50726F66696C654368616E67656428290D0A2O20666F72207370656349442C205F20696E2070616972732873656C662E61706C732920646F0D0A4O206C6F63616C20636C612O734E616D65203D206170692E636C612O736573537065637342795370656349445B7370656349445D5B315D0D0A4O206C6F63616C20737065634E616D65203D206170692E636C612O736573537065637342795370656349445B7370656349445D5B325D0D0A4O206C6F63616C20636C612O73537065634B6579203D207574696C732E552O70657246697273744368617228636C612O734E616D6529202O2E207574696C732E552O70657246697273744368617228737065634E616D65290D0A4O206C6F63616C20636C612O73537065634F7074696F6E73203D206775692E46692O6C2873656C662E64622E70726F66696C655B7370656349445D5B73656C662E64622E676C6F62616C2E61706C735B636C612O734E616D655D5B737065634E616D652O5D290D0A4O206C6F63616C20636C612O73537065634F7074696F6E735461626C65203D207B0D0A6O206E616D65203D207574696C732E53706C69744F6E552O70657228636C612O73537065634B6579292C0D0A6O2068616E646C6572203D2073656C662C0D0A6O2074797065203D202267726F7570222C0D0A6O206368696C6447726F757073203D2022746162222C0D0A6O2061726773203D207B0D0A8O2067656E6572616C203D206775692E47726F7570282247656E6572616C222C2066616C73652C20636C612O73537065634F7074696F6E73290D0A6O207D0D0A4O207D0D0A4O204C6962537475622822416365436F6E6669672D332E3022293A52656769737465724F7074696F6E735461626C6528636C612O73537065634B6579202O2E202250726F66696C65222C20636C612O73537065634F7074696F6E735461626C65290D0A2O20656E640D0A2O202O2D20544F444F3A2044697274792066697820666F72206E6F772E205468697320636F756C6420626520696D70726F7665642062792063612O6C696E67207468652061706C2E496E69742829206D6574686F6420616761696E2061667465727761726473206361757365207468657265207468652073652O74696E67732061726520726574726965766564206F6E63652E0D0A2O2052656C6F6164554928290D0A656E640D0A0D0A66756E6374696F6E2057523A4F6E50726F66696C65526573657428290D0A2O20666F72207370656349442C20737065635461626C6520696E2070616972732873656C662E61706C732920646F0D0A4O206966206E6F742073656C662E64622E70726F66696C655B7370656349445D207468656E0D0A6O2073656C662E64622E70726F66696C655B7370656349445D203D207B7D0D0A4O20656E640D0A0D0A4O206C6F63616C20636C612O734E616D65203D206170692E636C612O736573537065637342795370656349445B7370656349445D5B315D0D0A4O206C6F63616C20737065634E616D65203D206170692E636C612O736573537065637342795370656349445B7370656349445D5B325D0D0A4O2073656C662E64622E70726F66696C655B7370656349445D5B73656C662E64622E676C6F62616C2E61706C735B636C612O734E616D655D5B737065634E616D652O5D203D207574696C732E436F70795461626C6542794B657928737065635461626C655B73656C662E64622E676C6F62616C2E61706C735B636C612O734E616D655D5B737065634E616D652O5D2E64656661756C7453652O74696E6773290D0A2O20656E640D0A0D0A2O2073656C663A4F6E50726F66696C654368616E67656428290D0A656E640D0A00063O00120A3O00013O001201000100024O00023O000200022O000700016O00045O00012O00093O00017O00",v9(),...);