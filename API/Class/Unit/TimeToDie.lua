local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86>1) then local v114=v85[2];v83[v114]=v83[v114](v83[v114 + 1 ]);else local v116=v85[2];v83[v116](v13(v83,v116 + 1 ,v78));end elseif (v86<=4) then if (v86>3) then do return;end else v83[v85[2]]=v85[3];end elseif (v86>5) then local v119;local v120;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v83[v120]=v83[v120](v83[v120 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v78=(v120 + v84) -1 ;for v128=v120,v78 do v119=v79[v128-v120 ];v83[v128]=v119;end v77=v77 + 1 ;v85=v73[v77];v120=v85[2];v83[v120](v13(v83,v120 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else local v126=v85[2];v78=(v126 + v84) -1 ;for v131=v126,v78 do local v132=v79[v131-v126 ];v83[v131]=v132;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67030E2B2O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C206361636865203D2057522E63616368650D0A6C6F63616C207574696C73203D2057522E7574696C730D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C20746172676574203D20756E69742E7461726765740D0A6C6F63616C20666F637573203D20756E69742E666F6375730D0A6C6F63616C206D6F7573656F766572203D20756E69742E6D6F7573656F7665720D0A6C6F63616C20626F2O73203D20756E69742E626F2O730D0A6C6F63616C206E616D65706C617465203D20756E69742E6E616D65706C6174650D0A0D0A6C6F63616C202O7464203D207B0D0A2O2073652O74696E6773203D207B0D0A4O202O2D20526566726573682074696D6520287365636F6E647329203A206D696E3D302E312C2O206D61783D322C4O2064656661756C74203D20302E310D0A4O2072656672657368203D20302E312C0D0A4O202O2D20486973746F72792074696D6520287365636F6E647329203A206D696E3D352C4O206D61783D3132302C2O2064656661756C74203D2031302B302E340D0A4O20686973746F727954696D65203D203130202B20302E342C0D0A4O202O2D204D617820686973746F727920636F756E74203A6O206D696E3D32302C3O206D61783D352O302C2O2064656661756C74203D20312O300D0A4O20686973746F7279436F756E74203D20312O300D0A2O207D2C0D0A2O206361636865203D207B7D2C202O2D2041206361636865206F6620756E75736564207B2074696D652C2076616C7565207D207461626C657320746F2072656475636520676172626167652064756520746F207461626C65206372656174696F6E0D0A2O206974657261626C65556E697473203D207B0D0A4O207461726765742C0D0A4O20666F6375732C0D0A4O206D6F7573656F7665722C0D0A4O20756E7061636B287574696C732E4D657267655461626C6528626F2O732C206E616D65706C6174652O290D0A2O207D2C202O2D2049742773206E6F7420706F2O7369626C6520746F20756E7061636B206D756C7469706C65207461626C657320647572696E6720746865206372656174696F6E2070726F63652O732C20736F207765206D65726765207468656D206265666F726520756E7061636B696E6720697420286E6F7420652O66696369656E742062757420646F6E65206F6E6C7920312074696D65290D0A2O202O2D20544F444F3A20496D70726F7665204974657261626C65556E697473206372656174696F6E0D0A2O20756E697473203D207B7D2C202O2D205573656420746F20747261636B20756E6974730D0A2O206578697374696E67556E697473203D207B7D2C202O2D205573656420746F20747261636B204755494473206F662063752O72656E746C79206578697374696E6720756E6974732028746F20626520636F6D7061726564207769746820747261636B656420756E697473290D0A2O207468726F2O746C65203D20300D0A7D0D0A6170692E2O7464203D202O74640D0A0D0A66756E6374696F6E206170692E2O54445265667265736828290D0A2O206C6F63616C2063752O72656E7454696D65203D2047657454696D6528290D0A2O206C6F63616C20686973746F7279436F756E74203D202O74642E73652O74696E67732E686973746F7279436F756E740D0A2O206C6F63616C20686973746F727954696D65203D202O74642E73652O74696E67732E686973746F727954696D650D0A2O206C6F63616C202O74644361636865203D202O74642E63616368650D0A2O206C6F63616C206974657261626C65556E697473203D202O74642E6974657261626C65556E6974730D0A2O206C6F63616C20756E697473203D202O74642E756E6974730D0A2O206C6F63616C206578697374696E67556E697473203D202O74642E6578697374696E67556E6974730D0A0D0A2O207461626C652E77697065286578697374696E67556E697473290D0A0D0A2O206C6F63616C2074686973556E69740D0A2O20666F722069203D20312C20236974657261626C65556E69747320646F0D0A4O2074686973556E6974203D206974657261626C65556E6974735B695D0D0A4O2069662074686973556E69743A4578697374732829207468656E0D0A6O206C6F63616C2067756964203D2074686973556E69743A4755494428290D0A6O206966206E6F74206578697374696E67556E6974735B677569645D207468656E0D0A8O206578697374696E67556E6974735B677569645D203D20747275650D0A8O206C6F63616C206865616C746850657263656E74616765203D2074686973556E69743A4865616C746850657263656E7461676528290D0A8O20696620706C617965723A43616E412O7461636B2874686973556E69742920616E64206865616C746850657263656E74616765203C20312O30207468656E0D0A9O20206C6F63616C20756E69745461626C65203D20756E6974735B677569645D0D0A9O20206966206E6F7420756E69745461626C65206F72206865616C746850657263656E74616765203E20756E69745461626C655B315D5B315D5B325D207468656E0D0A9O203O20756E69745461626C65203D207B207B7D2C2063752O72656E7454696D65207D0D0A9O203O20756E6974735B677569645D203D20756E69745461626C650D0A9O2020656E640D0A9O20206C6F63616C2076616C756573203D20756E69745461626C655B315D0D0A9O20206C6F63616C2074696D65203D2063752O72656E7454696D65202D20756E69745461626C655B325D0D0A9O20206966206E6F742076616C756573206F72206865616C746850657263656E74616765207E3D2076616C7565735B325D207468656E0D0A9O203O206C6F63616C2076616C75650D0A9O203O206C6F63616C206C617374496E646578203D20232O746443616368650D0A9O203O206966206C617374496E646578202O3D2030207468656E0D0A9O205O2076616C7565203D207B2074696D652C206865616C746850657263656E74616765207D0D0A9O203O20656C73650D0A9O205O2076616C7565203D202O746443616368655B6C617374496E6465785D0D0A9O205O202O746443616368655B6C617374496E6465785D203D206E696C0D0A9O205O2076616C75655B315D203D2074696D650D0A9O205O2076616C75655B325D203D206865616C746850657263656E746167650D0A9O203O20656E640D0A9O203O207461626C652E696E736572742876616C7565732C20312C2076616C7565290D0A9O203O206C6F63616C206E203D202376616C7565730D0A9O203O207768696C6520286E203E20686973746F7279436F756E7429206F72202874696D65202D2076616C7565735B6E5D5B315D203E20686973746F727954696D652920646F0D0A9O205O202O746443616368655B236361636865202B20315D203D2076616C7565735B6E5D0D0A9O205O2076616C7565735B6E5D203D206E696C0D0A9O205O206E203D206E202D20310D0A9O203O20656E640D0A9O2020656E640D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A0D0A2O20666F72206B657920696E20706169727328756E6974732920646F0D0A4O206966206E6F74206578697374696E67556E6974735B6B65795D207468656E0D0A6O20756E6974735B6B65795D203D206E696C0D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A2O2D2052657475726E7320436F646573203A0D0A2O2D205O31203A204E6F20475549440D0A2O2D2O204O39203A204E65676174697665202O54440D0A2O2D2O204O38203A204E6F7420456E6F7567682053616D706C6573206F72204E6F204865616C7468204368616E67650D0A2O2D2O204O37203A204E6F204450530D0A2O2D2O204O36203A2044752O6D790D0A2O2D4O203235203A204120506C617965720D0A66756E6374696F6E20756E69743A54696D65546F582870657263656E746167652C206D696E53616D706C6573290D0A2O2069662073656C663A497344752O6D792829207468656E2072657475726E204O3620656E640D0A2O2069662073656C663A497341506C61796572282920616E6420706C617965723A43616E412O7461636B2873656C6629207468656E2072657475726E20323520656E640D0A2O206C6F63616C207365636F6E6473203D204O380D0A2O206C6F63616C20756E69745461626C65203D202O74642E756E6974735B73656C663A4755494428295D0D0A2O20696620756E69745461626C65207468656E0D0A4O206C6F63616C206D696E53616D706C6573203D206D696E53616D706C6573206F7220330D0A4O206C6F63616C2076616C756573203D20756E69745461626C655B315D0D0A4O206C6F63616C206E203D202376616C7565730D0A4O206966206E203E206D696E53616D706C6573207468656E0D0A6O206C6F63616C20612C2062203D20302C20300D0A6O206C6F63616C206578322C2065782C206578792C206579203D20302C20302C20302C20300D0A0D0A6O20666F722069203D20312C206E20646F0D0A8O206C6F63616C2056616C7565203D2076616C7565735B695D0D0A8O206C6F63616C20782C2079203D2056616C75655B315D2C2056616C75655B325D0D0A0D0A8O20657832203D20657832202B2078202A20780D0A8O206578203D206578202B20780D0A8O20657879203D20657879202B2078202A20790D0A8O206579203D206579202B20790D0A6O20656E640D0A6O206C6F63616C20696E76617269616E74203D2031202F2028657832202A206E202D206578202A206578290D0A6O2061203D20282D6578202A20657879202A20696E76617269616E7429202B2028657832202A206579202A20696E76617269616E74290D0A6O2062203D20286E202A20657879202A20696E76617269616E7429202D20286578202A206579202A20696E76617269616E74290D0A6O2069662062207E3D2030207468656E0D0A8O207365636F6E6473203D202870657263656E74616765202D206129202F20620D0A8O207365636F6E6473203D206D6174682E6D696E284O372C207365636F6E6473202D202847657454696D652829202D20756E69745461626C655B325D2O290D0A8O206966207365636F6E6473203C2030207468656E207365636F6E6473203D204O3920656E640D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2O2072657475726E207365636F6E64730D0A656E640D0A0D0A6C6F63616C207370656369616C2O544450657263656E7461676544617461203D207B0D0A2O203O2D20447261676F6E666C696768740D0A2O205O2D2044756E67656F6E73205O2D0D0A2O203O2D20427261636B656E6869646520486F2O6C6F77200D0A2O202O2D2044656361747269617263682057726174686579650D0A2O205B3138363132315D203D20352C0D0A0D0A2O203O2D20536861646F776C616E64730D0A2O205O2D2044756E67656F6E73205O2D0D0A2O203O2D204465204F7468657220536964650D0A2O202O2D204D756568277A616C61206C656176657320746865206669676874206174203130252E0D0A2O205B313O3630385D203D2031302C0D0A2O203O2D204D69737473206F66205469726E61205363697468650D0A2O202O2D205469726E652O6E73206C656176657320746865206669676874206174203230252E0D0A2O205B3136343932395D203D2032302C202O2D205469726E652O6E2056692O6C616765720D0A2O205B3136343830345D203D2032302C202O2D2044726F6D616E204F756C66612O72616E0D0A2O203O2D2053616E6775696E65204465707468730D0A2O202O2D2047656E6572616C204B2O616C206C656176657320746865206669676874206174203530252E0D0A2O205B313632302O395D203D2035302C0D0A2O205O2D20436173746C65204E617468726961205O2D0D0A2O203O2D2053746F6E65204C6567696F6E2047656E6572616C730D0A2O202O2D2047656E6572616C204B2O616C206C656176657320746865206669676874206174203530252069662047656E6572616C2047726173682O616C20686173206E6F74206669676874207965742E2057652074616B652034392520617320636865636B2076616C75652073696E636520697420676574202D39352520646D6720726564756374696F6E2061742035302520756E74696C20696E7465726D692O73696F6E206973206F7665722E0D0A2O205B3136382O31325D203D2066756E6374696F6E2873656C66292072657475726E20286E6F742073656C663A436865636B485046726F6D426F2O734C697374283136382O31332C202O392920616E6420343929206F72203020656E642C0D0A2O203O2D2053756E204B696E6727732053616C766174696F6E0D0A2O202O2D205368616465206F66204B61656C277468617320666967687420697320363025202D3E2034352520616E64207468656E20313025202D3E2030252E0D0A2O205B3136353830355D203D2066756E6374696F6E2873656C66292072657475726E202873656C663A4865616C746850657263656E746167652829203E20323020616E6420343529206F72203020656E642C0D0A2O205O2D2053616E6374756D206F6620446F6D696E6174696F6E205O2D0D0A2O203O2D20457965206F6620746865204A61696C6572206C6561766573206174202O362520616E64202O33250D0A2O205B31382O3031385D203D2066756E6374696F6E2873656C66292072657475726E202873656C663A4865616C746850657263656E746167652829203E202O3620616E64202O3629206F72202873656C663A4865616C746850657263656E746167652829203C3D202O3620616E642073656C663A4865616C746850657263656E746167652829203E202O3320616E64202O3329206F72203020656E642C0D0A2O203O2D205061696E736D6974682052617A6E616C206C65617665732061742037302520616E64203430250D0A2O205B3137363532335D203D2066756E6374696F6E2873656C66292072657475726E202873656C663A4865616C746850657263656E746167652829203E20373020616E6420373029206F72202873656C663A4865616C746850657263656E746167652829203C3D20373020616E642073656C663A4865616C746850657263656E746167652829203E20343020616E6420343029206F72203020656E642C0D0A2O203O2D204661746573637269626520526F682D4B616C6F207068617365732061742037302520616E64203430250D0A2O205B3137393339305D203D2066756E6374696F6E2873656C66292072657475726E202873656C663A4865616C746850657263656E746167652829203E20373020616E6420373029206F72202873656C663A4865616C746850657263656E746167652829203C3D20373020616E642073656C663A4865616C746850657263656E746167652829203E20343020616E6420343029206F72203020656E642C0D0A2O203O2D2053796C76616E61732057696E6472752O6E657220696E7465726D692O73696F6E2061742038332520616E642022646965732220617420353025202834352520696E202O4D290D0A2O205B3138303832385D203D2066756E6374696F6E2873656C66292072657475726E202873656C663A4865616C746850657263656E746167652829203E20383320616E6420383329206F72202O28706C617965723A496E7374616E636544692O666963756C74792829202O3D20313620616E6420343529206F722035302920656E642C0D0A0D0A2O203O2D204C6567696F6E0D0A2O205O2D204F70656E20576F726C642O205O2D0D0A2O203O2D2053746F726D6865696D20496E766173696F6E0D0A2O202O2D204C6F726420436F2O6D616E64657220416C65786975730D0A2O205B2O3138352O365D203D2038352C0D0A2O205O2D2044756E67656F6E73205O2D0D0A2O203O2D2048612O6C73206F662056616C6F720D0A2O202O2D2048796D64612O6C206C656176657320746865206669676874206174203130252E0D0A2O205B39343936305D203D2031302C0D0A2O202O2D2046656E727972206C656176657320746865206669676874206174203630252E2057652074616B652035302520617320636865636B2076616C75652073696E636520697420646F65736E27742067657420692O6D756E65206174203630252E0D0A2O205B39353637345D203D2066756E6374696F6E2873656C66292072657475726E202873656C663A4865616C746850657263656E746167652829203E20353020616E6420363029206F72203020656E642C0D0A2O202O2D204F64796E206C656176657320746865206669676874206174203830252E0D0A2O205B39353637365D203D2038302C0D0A2O203O2D204D6177206F6620536F756C730D0A2O202O2D2048656C7961206C656176657320746865206669676874206174203730252E0D0A2O205B39363735395D203D2037302C0D0A2O205O2D20547269616C206F662056616C6F72205O2D0D0A2O203O2D204F64796E0D0A2O202O2D204879726A6120262048796D64612O6C206C6561766573207468652066696768742061742032352520647572696E6720666972737420737461676520616E64203835252F39302520647572696E67207365636F6E642073746167652028484D2F2O4D292E0D0A2O205B2O31343336305D203D2066756E6374696F6E2873656C66292072657475726E20286E6F742073656C663A436865636B485046726F6D426F2O734C697374282O31343236332C202O392920616E6420323529206F722028706C617965723A496E7374616E636544692O666963756C74792829202O3D20313620616E6420383529206F7220393020656E642C0D0A2O205B2O31343336315D203D2066756E6374696F6E2873656C66292072657475726E20286E6F742073656C663A436865636B485046726F6D426F2O734C697374282O31343236332C202O392920616E6420323529206F722028706C617965723A496E7374616E636544692O666963756C74792829202O3D20313620616E6420383529206F7220393020656E642C0D0A2O202O2D204F64796E206C656176657320746865206669676874206174203130252E0D0A2O205B2O31343236335D203D2031302C0D0A2O205O2D204E69676874686F6C64205O2D0D0A2O203O2D20456C6973616E6465206C6561766573207468652066696768742074776F2074696D657320617420313025207468656E206E6F726D612O6C7920646965732E20536865206C2O6F7365732035302520706F776572207065722073746167652028312O30202D3E203530202D3E2030292E0D0A2O205B31302O3634335D203D2066756E6374696F6E2873656C66292072657475726E202873656C663A506F7765722829203E203020616E6420313029206F72203020656E642C0D0A0D0A2O203O2D205761726C6F7264206F6620447261656E6F722028576F44290D0A2O205O2D2044756E67656F6E73205O2D0D0A2O203O2D20536861646F776D2O6F6E2042757269616C2047726F756E64730D0A2O202O2D2043612O72696F6E20576F726D20646F65736E27742064696520627574206C65617665207468652061726561206174203130252E0D0A2O205B2O383736395D203D2031302C0D0A2O205B37363035375D203D2031302C0D0A2O205O2D2048652O6C46697265204369746164656C205O2D0D0A2O203O2D2048652O6C6669726520412O7361756C740D0A2O202O2D204D61722754616B20646F65736E27742064696520616E64206C65617665206669676874206174203530252028626C6F636B65642061742031687020616E79776179292E0D0A2O205B39333032335D203D2035302C0D0A0D0A2O203O2D20436C612O7369630D0A2O205O2D2044756E67656F6E73205O2D0D0A2O203O2D20556C64616D616E200D0A2O202O2D20447761727665730D0A2O205B3138343538305D203D20352C0D0A2O205B3138343538315D203D20352C0D0A2O205B3138343538325D203D20352C0D0A7D0D0A66756E6374696F6E20756E69743A5370656369616C2O544450657263656E74616765286E70636964290D0A2O206C6F63616C207370656369616C2O544450657263656E74616765203D207370656369616C2O544450657263656E74616765446174615B6E706369645D0D0A2O206966206E6F74207370656369616C2O544450657263656E74616765207468656E2072657475726E203020656E640D0A0D0A2O2069662074797065287370656369616C2O544450657263656E7461676529202O3D20226E756D62657222207468656E0D0A4O2072657475726E207370656369616C2O544450657263656E746167650D0A2O20656E640D0A0D0A2O2072657475726E207370656369616C2O544450657263656E746167652873656C66290D0A656E640D0A0D0A2O2D204765742074686520756E69742054696D65546F4469650D0A66756E6374696F6E20756E69743A54696D65546F446965286D696E53616D706C6573290D0A2O206C6F63616C2067756964203D2073656C663A4755494428290D0A2O206966206E6F742067756964207468656E2072657475726E205O3120656E640D0A0D0A2O206C6F63616C206D696E53616D706C6573203D206D696E53616D706C6573206F7220330D0A2O206C6F63616C20756E6974496E666F203D2063616368652E756E6974496E666F5B677569645D0D0A2O206966206E6F7420756E6974496E666F207468656E0D0A4O20756E6974496E666F203D207B7D0D0A4O2063616368652E756E6974496E666F5B677569645D203D20756E6974496E666F0D0A2O20656E640D0A0D0A2O206C6F63616C202O7464203D20756E6974496E666F2E2O74640D0A2O206966206E6F74202O7464207468656E0D0A4O202O7464203D207B7D0D0A4O20756E6974496E666F2E2O7464203D202O74640D0A2O20656E640D0A2O206966206E6F74202O74645B6D696E53616D706C65735D207468656E0D0A4O202O74645B6D696E53616D706C65735D203D2073656C663A54696D65546F582873656C663A5370656369616C2O544450657263656E746167652873656C663A4E50434944282O292C206D696E53616D706C6573290D0A2O20656E640D0A0D0A2O2072657475726E202O74645B6D696E53616D706C65735D0D0A656E640D0A0D0A66756E6374696F6E20756E69743A426F2O7354696D65546F446965286D696E53616D706C6573290D0A2O2069662073656C663A4973496E426F2O734C6973742829206F722073656C663A497344752O6D792829207468656E0D0A4O2072657475726E2073656C663A54696D65546F446965286D696E53616D706C6573290D0A2O20656E640D0A0D0A2O2072657475726E205O310D0A656E640D0A0D0A66756E6374696F6E20756E69743A46696C746572656454696D65546F446965286F70657261746F722C2076616C75652C206F2O667365742C2076616C75655468726573686F6C642C206D696E53616D706C6573290D0A2O206C6F63616C202O7464203D2073656C663A54696D65546F446965286D696E53616D706C6573290D0A0D0A2O2072657475726E202O7464203C202876616C75655468726573686F6C64206F72204O31322920616E64207574696C732E436F6D7061726554686973286F70657261746F722C202O7464202B20286F2O66736574206F722030292C2076616C756529206F722066616C73650D0A656E640D0A0D0A66756E6374696F6E20756E69743A426F2O7346696C746572656454696D65546F446965286F70657261746F722C2076616C75652C206F2O667365742C2076616C75655468726573686F6C642C206D696E53616D706C6573290D0A2O2069662073656C663A4973496E426F2O734C6973742829206F722073656C663A497344752O6D792829207468656E0D0A4O2072657475726E2073656C663A46696C746572656454696D65546F446965286F70657261746F722C2076616C75652C206F2O667365742C2076616C75655468726573686F6C642C206D696E53616D706C6573290D0A2O20656E640D0A0D0A2O2072657475726E2066616C73650D0A656E640D0A0D0A66756E6374696F6E20756E69743A54696D65546F44696549734E6F7456616C6964286D696E53616D706C6573290D0A2O2072657475726E2073656C663A54696D65546F446965286D696E53616D706C657329203E3D204O370D0A656E640D0A0D0A66756E6374696F6E20756E69743A426F2O7354696D65546F44696549734E6F7456616C6964286D696E53616D706C6573290D0A2O2069662073656C663A4973496E426F2O734C6973742829207468656E0D0A4O2072657475726E2073656C663A54696D65546F44696549734E6F7456616C6964286D696E53616D706C6573290D0A2O20656E640D0A0D0A2O2072657475726E20747275650D0A656E640D0A0D0A66756E6374696F6E206170692E466967687452656D61696E7328656E656D6965732C20626F2O734F6E6C79290D0A2O206C6F63616C20626F2O734578697374732C206D617854696D65546F4469650D0A2O20666F72205F2C20626F2O73556E697420696E20706169727328626F2O732920646F0D0A4O20696620626F2O73556E69743A4578697374732829207468656E0D0A6O20626F2O73457869737473203D20747275650D0A6O206966206E6F7420626F2O73556E69743A54696D65546F44696549734E6F7456616C69642829207468656E0D0A8O206D617854696D65546F446965203D206D6174682E6D6178286D617854696D65546F446965206F7220302C20626F2O73556E69743A54696D65546F446965282O290D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A0D0A2O20696620626F2O73457869737473206F7220626F2O734F6E6C79207468656E0D0A4O2072657475726E206D617854696D65546F446965206F72205O310D0A2O20656E640D0A0D0A2O20696620656E656D696573207468656E0D0A4O20666F72205F2C206379636C65556E697420696E20706169727328656E656D6965732920646F0D0A6O206966206E6F74206379636C65556E69743A4973557365724379636C65426C61636B6C6973746564282920616E6420286379636C65556E69743A412O66656374696E67436F6D6261742829206F72206379636C65556E69743A497344752O6D79282O2920616E64206E6F74206379636C65556E69743A54696D65546F44696549734E6F7456616C69642829207468656E0D0A8O206D617854696D65546F446965203D206D6174682E6D6178286D617854696D65546F446965206F7220302C206379636C65556E69743A54696D65546F446965282O290D0A6O20656E640D0A4O20656E640D0A4O206966206D617854696D65546F446965207468656E0D0A6O2072657475726E206D617854696D65546F4469650D0A4O20656E640D0A2O20656E640D0A0D0A2O2072657475726E207461726765743A54696D65546F44696528290D0A656E640D0A0D0A66756E6374696F6E206170692E426F2O73466967687452656D61696E7328290D0A2O2072657475726E206170692E466967687452656D61696E73286E696C2C2074727565290D0A656E640D0A0D0A66756E6374696F6E206170692E426F2O73466967687452656D61696E7349734E6F7456616C696428290D0A2O2072657475726E206170692E426F2O73466967687452656D61696E732829203E3D204O370D0A656E640D0A0D0A66756E6374696F6E206170692E46696C7465726564466967687452656D61696E7328656E656D6965732C206F70657261746F722C2076616C75652C20636865636B496656616C69642C20626F2O734F6E6C79290D0A2O206C6F63616C20666967687452656D61696E73203D206170692E466967687452656D61696E7328656E656D6965732C20626F2O734F6E6C79290D0A2O20696620636865636B496656616C696420616E6420666967687452656D61696E73203E3D204O37207468656E0D0A4O2072657475726E2066616C73650D0A2O20656E640D0A0D0A2O2072657475726E207574696C732E436F6D7061726554686973286F70657261746F722C20666967687452656D61696E732C2076616C756529206F722066616C73650D0A656E640D0A0D0A66756E6374696F6E206170692E426F2O7346696C7465726564466967687452656D61696E73286F70657261746F722C2076616C75652C20636865636B496656616C6964290D0A2O2072657475726E206170692E46696C7465726564466967687452656D61696E73286E696C2C206F70657261746F722C2076616C75652C20636865636B496656616C69642C2074727565290D0A656E640D0A0D0A00063O0012063O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);