local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v78=(v111 + v84) -1 ;for v119=v111,v78 do local v120=v79[v119-v111 ];v83[v119]=v120;end elseif (v86>1) then local v122=v85[2];v83[v122](v13(v83,v122 + 1 ,v78));else v83[v85[2]]=v59[v85[3]];end elseif (v86<=3) then v83[v85[2]]=v85[3];elseif (v86==4) then v83[v85[2]]=v59[v85[3]];else do return;end end elseif (v86<=8) then if (v86<=6) then local v114=v85[2];v83[v114]=v83[v114](v83[v114 + 1 ]);elseif (v86>7) then local v127=v85[2];v78=(v127 + v84) -1 ;for v133=v127,v78 do local v134=v79[v133-v127 ];v83[v133]=v134;end else v83[v85[2]]=v85[3];end elseif (v86<=9) then local v116=v85[2];v83[v116]=v83[v116](v83[v116 + 1 ]);elseif (v86>10) then do return;end else local v130=v85[2];v83[v130](v13(v83,v130 + 1 ,v78));end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703A2142O006C6F63616C20612O646F6E4E616D65203D203O2E2O0A5752203D204C6962537475622822416365412O646F6E2D332E3022293A4E6577412O646F6E28612O646F6E4E616D652C2022416365436F6E736F6C652D332E30222C20224163654576656E742D332E3022292O0A57522E61706C73203D207B7D0A57522E617069203D207B7D0A57522E62696E64203D207B7D0A57522E6361636865203D207B7D0A57522E646263203D207B7D0A57522E677569203D207B7D0A57522E7574696C73203D207B7D2O0A66756E6374696F6E2057523A4F6E496E697469616C697A6528290A2O2073656C663A496E6974446228290A2O2073656C663A496E69744F7074696F6E7328290A2O2073656C663A496E697443686174436F2O6D616E647328290A2O2073656C663A496E69744672616D657328292O0A2O2073656C663A5265676973746572476C6F62616C4576656E747328292O0A2O2073656C663A496E697450756C736528292O0A2O2073656C663A5072696E74446562756728612O646F6E4E616D65202O2E2022206C6F616465642E22290A656E642O0A57522E696E697469616C697A656450756C7365203D2066616C73650A6C6F63616C2063752O72656E745370656349640A66756E6374696F6E2057522E496E697450756C736528290A2O2057522E70756C736554696D6572203D20302O0A2O206C6F63616C2073706563203D204765745370656369616C697A6174696F6E28290A2O2069662073706563202O3D206E696C207468656E0A4O2057522E696E697469616C697A656450756C7365203D2066616C73650A4O20435F54696D65722E416674657228312C2066756E6374696F6E28290A6O2057522E496E697450756C736528290A4O20656E64290A2O20656C73650A4O2057522E63616368652E70657273697374656E742E706C617965722E73706563203D207B204765745370656369616C697A6174696F6E496E666F287370656329207D0A4O206C6F63616C20737065634944203D2057522E63616368652E70657273697374656E742E706C617965722E737065635B315D2O0A4O20696620737065634944202O3D206E696C207468656E0A6O2057522E696E697469616C697A656450756C7365203D2066616C73650A6O20435F54696D65722E416674657228312C2066756E6374696F6E28290A8O2057522E496E697450756C736528290A6O20656E64290A4O20656C73650A6O2069662063752O72656E74537065634964207E3D20737065634944207468656E0A8O206C6F63616C20636C612O734E616D65203D2057522E6170692E636C612O736573537065637342795370656349445B7370656349445D5B315D0A8O206C6F63616C20737065634E616D65203D2057522E6170692E636C612O736573537065637342795370656349445B7370656349445D5B325D0A8O206C6F63616C2061706C203D2057522E61706C735B7370656349445D20616E642057522E61706C735B7370656349445D5B57522E64622E676C6F62616C2E61706C735B636C612O734E616D655D5B737065634E616D652O5D206F72206E696C0A8O2069662061706C207468656E0A9O202057522E6672616D65732E722O6F743A53657453637269707428224F6E557064617465222C2057522E50756C7365290A9O202057522E6170692E556E726567697374657241757261547261636B696E6728292O0A9O202069662061706C2E61706C496E6974207468656E0A9O203O2057522E6672616D65732E746F2O676C65733A526573657428290A9O203O2057522E62696E642E526573657428290A9O203O2061706C2E61706C496E697428290A9O2020656E642O0A9O202057522E6170692E756E69742E706C617965723A52656769737465724C697374656E65645370652O6C7328737065634944290A9O202057522E6170692E756E69742E706C617965723A46696C7465725472692O67657247434428737065634944290A9O202057522E6170692E7370652O6C3A46696C74657250726F6A656374696C6553702O656428737065634944290A9O202057522E6170692E4C6F61644F76652O726964657328737065634944292O0A9O2020696620746F6E756D626572284765744356617228226E616D65706C61746553686F77456E656D696573222O29207E3D2031207468656E0A9O203O2057523A5072696E745761726E696E672822596F752073686F756C6420656E61626C6520656E656D79206E616D65706C6174657320696E206F7264657220746F206765742070726F70657220416F4520726F746174696F6E2E22290A9O2020656E640A9O2020696620746F6E756D6265722847657443566172282267784D6178696D697A65222O29207E3D2031207468656E0A9O203O2057523A5072696E745761726E696E672822596F752073686F756C642073657420796F757220646973706C6179206D6F646520746F2066752O6C7363722O656E2077696E646F776564206D6F646520746F206765742070726F70657220726F746174696F6E2073752O706F72742E22290A9O2020656E640A9O2020696620746F6E756D6265722847657443566172282267784D6F6E69746F72222O29207E3D2030207468656E0A9O203O2057523A5072696E745761726E696E672822596F752073686F756C642073657420796F757220646973706C6179206D6F6E69746F7220746F20796F7572207072696D617279206D6F6E69746F7220746F206765742070726F70657220726F746174696F6E2073752O706F72742E22290A9O2020656E640A9O2020696620746F6E756D62657228476574435661722822636F6C6F72626C696E6453696D756C61746F72222O29207E3D2030207468656E0A9O203O2057523A5072696E745761726E696E672822596F752073686F756C642064697361626C6520636F6C6F72626C696E64206D6F646520746F206765742070726F70657220726F746174696F6E2073752O706F72742E22290A9O2020656E640A9O2020696620746F6E756D626572284765744356617228224272696768746E652O73222O29207E3D203530207468656E0A9O203O2057523A5072696E745761726E696E672822596F752073686F756C642073657420796F7572206772617068696373206272696768746E652O7320746F20353020746F206765742070726F70657220726F746174696F6E2073752O706F72742E22290A9O2020656E640A9O2020696620746F6E756D62657228476574435661722822436F6E7472617374222O29207E3D203530207468656E0A9O203O2057523A5072696E745761726E696E672822596F752073686F756C642073657420796F757220677261706869637320636F6E747261737420746F20353020746F206765742070726F70657220726F746174696F6E2073752O706F72742E22290A9O2020656E640A9O2020696620746F6E756D6265722847657443566172282247612O6D61222O29207E3D2031207468656E0A9O203O2057523A5072696E745761726E696E672822596F752073686F756C642073657420796F75722067726170686963732067612O6D6120746F203120746F206765742070726F70657220726F746174696F6E2073752O706F72742E22290A9O2020656E640A9O2020696620746F6E756D6265722847657443566172282252656E6465725363616C65222O29207E3D2031207468656E0A9O203O2057523A5072696E745761726E696E672822596F752073686F756C642073657420796F75722067726170686963732072656E646572207363616C6520746F203120746F206765742070726F70657220726F746174696F6E2073752O706F72742E22290A9O2020656E640A8O20656C73650A9O202057523A5072696E74446562756728224E6F20526F746174696F6E2073656C656374656420666F72207468697320636C612O732F7370656320285370656349443A2022202O2E20737065634944202O2E2022292C20612O646F6E2064697361626C65642E2054686973206973206C696B656C792064756520746F2074686520726F746174696F6E206265696E6720756E73752O706F7274656420617420746869732074696D65206F7220796F75206861766520746F2073656C65637420697420696E2074686520612O646F6E2073652O74696E67732E20506C6561736520636865636B2073752O706F7274656420726F746174696F6E732E22290A9O202057522E6672616D65732E722O6F743A53657453637269707428224F6E557064617465222C206E696C290A8O20656E640A8O2063752O72656E74537065634964203D207370656349440A6O20656E642O0A6O202O2D20544F444F0A6O202O2D45766572796F6E652E496E697454696D65727328290A6O206966206E6F742057522E696E697469616C697A656450756C7365207468656E0A8O2057522E696E697469616C697A656450756C7365203D20747275650A6O20656E640A4O20656E640A2O20656E640A656E642O0A6C6F63616C2070726576526573756C742C2063752O72526573756C740A66756E6374696F6E2057522E50756C736528290A2O2069662047657454696D652829203E2057522E70756C736554696D6572207468656E0A4O2057522E70756C736554696D6572203D2047657454696D652829202B20302E312O0A4O202O2D20544F444F0A4O202O2D45766572796F6E652E50756C736554696D65727328292O0A4O206C6F63616C20737065634944203D2057522E63616368652E70657273697374656E742E706C617965722E737065635B315D0A4O20696620737065634944207468656E0A6O206C6F63616C20636C612O734E616D65203D2057522E6170692E636C612O736573537065637342795370656349445B7370656349445D5B315D0A6O206C6F63616C20737065634E616D65203D2057522E6170692E636C612O736573537065637342795370656349445B7370656349445D5B325D0A6O206C6F63616C2061706C203D2057522E61706C735B7370656349445D5B57522E64622E676C6F62616C2E61706C735B636C612O734E616D655D5B737065634E616D652O5D0A6O2069662057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E6F6E20616E642057522E6170692E49735265616479282920616E64206E6F742057522E6170692E49735061757365642829207468656E0A8O2057522E63616368652E686173422O656E5265736574203D2066616C73650A8O2057522E63616368652E526573657428290A8O2069662057522E64622E676C6F62616C2E67656E6572616C2E656E61626C65642E6465627567207468656E0A9O202063752O72526573756C74203D2061706C2E61706C28290A9O202069662063752O72526573756C7420616E642063752O72526573756C74207E3D2070726576526573756C74207468656E0A9O203O2057523A5072696E7444656275672863752O72526573756C74290A9O203O2070726576526573756C74203D2063752O72526573756C740A9O2020656C736569662063752O72526573756C74202O3D206E696C207468656E0A9O203O2057522E6672616D65732E722O6F743A53657442696E64286E696C290A9O203O2070726576526573756C74203D206E696C0A9O2020656E640A8O20656C73650A9O202069662061706C2E61706C2829202O3D206E696C207468656E0A9O203O2057522E6672616D65732E722O6F743A53657442696E64286E696C290A9O2020656E640A8O20656E640A6O20656C73650A8O2057522E6672616D65732E722O6F743A53657442696E64286E696C290A8O2070726576526573756C74203D206E696C0A6O20656E640A4O20656E640A2O20656E640A656E642O0A66756E6374696F6E2057523A4368616E676550756C736554696D6572286F2O66736574290A2O2073656C662E6672616D65732E722O6F743A53657442696E64286E696C290A2O2073656C662E70756C736554696D6572203D2047657454696D652829202B206F2O667365740A656E642O0A66756E6374696F6E2057523A412O6441706C287370656349442C2061706C4E616D652C2061706C2C2061706C496E69742C2064656661756C7453652O74696E6773290A2O206966206E6F742073656C662E61706C735B7370656349445D207468656E0A4O2073656C662E61706C735B7370656349445D203D207B7D0A2O20656E640A2O2073656C662E61706C735B7370656349445D5B61706C4E616D655D203D207B2061706C203D2061706C2C2061706C496E6974203D2061706C496E69742C2064656661756C7453652O74696E6773203D2064656661756C7453652O74696E6773207D0A2O206966206E6F742073656C662E6462207468656E0A4O2072657475726E0A2O20656E642O0A2O2073656C663A41706C734368616E67656428290A656E642O0A66756E6374696F6E2057523A41706C734368616E67656428290A2O2073656C663A496E697450726F66696C657328290A2O2073656C663A496E69744F7074696F6E735461626C6528290A2O2073656C663A4F6E50726F66696C654368616E67656428290A656E640A00063O0012013O00013O001203000100024O00093O000200022O000800016O000A5O00012O00053O00017O00",v9(),...);