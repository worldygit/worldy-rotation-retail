local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then do return;end elseif (v86==1) then local v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));else local v112;local v113;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v113=v85[2];v83[v113]=v83[v113](v83[v113 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v113=v85[2];v78=(v113 + v84) -1 ;for v125=v113,v78 do v112=v79[v125-v113 ];v83[v125]=v112;end v77=v77 + 1 ;v85=v73[v77];v113=v85[2];v83[v113](v13(v83,v113 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86<=4) then if (v86==3) then local v119=v85[2];v83[v119]=v83[v119](v83[v119 + 1 ]);else local v121=v85[2];v78=(v121 + v84) -1 ;for v128=v121,v78 do local v129=v79[v128-v121 ];v83[v128]=v129;end end elseif (v86==5) then v83[v85[2]]=v85[3];elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67036C222O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C206361636865203D2057522E63616368650D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C20626F2O73203D20756E69742E626F2O730D0A0D0A66756E6374696F6E20756E69743A436163686528290D0A2O2073656C663A52656D6F7665556E6974475549444D6170456E74727928290D0A2O2073656C662E756E6974457869737473203D20556E69744578697374732873656C662E756E6974494429206F722066616C73650D0A2O2073656C662E756E697447554944203D20556E6974475549442873656C662E756E69744944290D0A2O2073656C662E756E69744E616D65203D20556E69744E616D652873656C662E756E69744944290D0A2O2073656C662E756E697443616E4265412O7461636B6564203D20556E697443616E412O7461636B2822706C61796572222C2073656C662E756E6974494429206F722066616C73650D0A2O2073656C662E756E69744E50434944203D2073656C663A4E504349442874727565290D0A2O2069662073656C662E756E69744755494420616E642073656C662E756E69744944207468656E0D0A4O2073656C663A412O64556E6974475549444D6170456E74727928290D0A2O20656E640D0A2O202O2D204C6576656C3F0D0A2O202O2D20497344752O6D793F0D0A2O202O2D20497341506C617965723F0D0A2O202O2D20436C612O73696669636174696F6E3F0D0A656E640D0A0D0A66756E6374696F6E20756E69743A494428290D0A2O2072657475726E2073656C662E756E697449440D0A656E640D0A0D0A66756E6374696F6E20756E69743A4755494428290D0A2O2069662073656C662E7573654361636865207468656E0D0A4O2072657475726E2073656C662E756E6974475549440D0A2O20656E640D0A0D0A2O2072657475726E20556E6974475549442873656C662E756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A4E616D6528290D0A2O2069662073656C662E7573654361636865207468656E0D0A4O2072657475726E2073656C662E756E69744E616D650D0A2O20656E640D0A0D0A2O2072657475726E20556E69744E616D652873656C662E756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A45786973747328290D0A2O2069662073656C662E7573654361636865207468656E0D0A4O2072657475726E2073656C662E756E697445786973747320616E6420556E6974497356697369626C652873656C662E756E69744944290D0A2O20656E640D0A0D0A2O2072657475726E20556E69744578697374732873656C662E756E697449442920616E6420556E6974497356697369626C652873656C662E756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A4E5043494428627970612O734361636865290D0A2O206966206E6F7420627970612O73436163686520616E642073656C662E757365436163686520616E642073656C662E756E69744E50434944207468656E0D0A4O2072657475726E2073656C662E756E69744E504349440D0A2O20656E640D0A0D0A2O206C6F63616C2067756964203D2073656C663A4755494428290D0A2O206966206E6F742067756964207468656E2072657475726E202D3120656E640D0A0D0A2O206C6F63616C20756E6974496E666F203D2063616368652E756E6974496E666F5B677569645D0D0A2O206966206E6F7420756E6974496E666F207468656E0D0A4O20756E6974496E666F203D207B7D0D0A4O2063616368652E756E6974496E666F5B677569645D203D20756E6974496E666F0D0A2O20656E640D0A0D0A2O206C6F63616C206E70636964203D20756E6974496E666F2E6E706369640D0A2O206966206E6F74206E70636964207468656E0D0A4O206C6F63616C20747970652C205F2C205F2C205F2C205F2C206E7063696446726F6D47554944203D2073747273706C697428272D272C2067756964290D0A4O2069662074797065202O3D2022437265617475726522206F722074797065202O3D202250657422206F722074797065202O3D202256656869636C6522207468656E0D0A6O206E70636964203D20746F6E756D626572286E7063696446726F6D47554944290D0A4O20656C73650D0A6O206E70636964203D202D320D0A4O20656E640D0A4O20756E6974496E666F2E6E70636964203D206E706369640D0A2O20656E640D0A0D0A2O2072657475726E206E706369640D0A656E640D0A0D0A66756E6374696F6E20756E69743A4C6576656C28290D0A2O2072657475726E20556E69744C6576656C2873656C662E756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A4973496E426F2O734C697374286E70636964290D0A2O206C6F63616C20746869734E50434944203D206E70636964206F722073656C663A4E5043494428290D0A0D0A2O20666F72205F2C2074686973556E697420696E20706169727328626F2O732920646F0D0A4O2069662074686973556E69743A457869737473282920616E642074686973556E69743A4E504349442829202O3D20746869734E50434944207468656E0D0A6O2072657475726E20747275650D0A4O20656E640D0A2O20656E640D0A0D0A2O2072657475726E2066616C73650D0A656E640D0A0D0A66756E6374696F6E20756E69743A436865636B485046726F6D426F2O734C697374286E706369642C206870290D0A2O206C6F63616C20746869734E50434944203D206E70636964206F722073656C663A4E5043494428290D0A2O206C6F63616C20746869734850203D206870206F7220312O300D0A0D0A2O20666F72205F2C2074686973556E697420696E20706169727328626F2O732920646F0D0A4O2069662074686973556E69743A457869737473282920616E642074686973556E69743A4E504349442829202O3D20746869734E5043494420616E642074686973556E69743A4865616C746850657263656E746167652829203C3D20746869734850207468656E0D0A6O2072657475726E20747275650D0A4O20656E640D0A2O20656E640D0A0D0A2O2072657475726E2066616C73650D0A656E640D0A0D0A66756E6374696F6E20756E69743A43616E412O7461636B286F74686572290D0A2O206C6F63616C20756E69744944203D2073656C663A494428290D0A2O20696620756E69744944202O3D2022706C617965722220616E64206F746865722E7573654361636865207468656E0D0A4O2072657475726E206F746865722E756E697443616E4265412O7461636B65640D0A2O20656E640D0A0D0A2O2072657475726E20556E697443616E412O7461636B28756E697449442C206F746865723A4944282O290D0A656E640D0A0D0A6C6F63616C2064752O6D79556E697473203D207B0D0A2O202O2D2043697479202853572C204F726772692C203O2E290D0A2O205B332O3134365D203D20747275652C202O2D20526169646572277320547261696E696E672044752O6D790D0A2O205B332O312O345D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B33323O365D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B33322O36375D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B342O3634375D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B2O31343833325D203D20747275652C202O2D2050765020547261696E696E672044752O6D790D0A2O205B3135333238355D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B3135333239325D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O202O2D204D6F5020536872696E65206F662054776F204D2O6F6E730D0A2O205B36373132375D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O202O2D20576F4420412O6C69616E63652047612O7269736F6E0D0A2O205B38373331375D203D20747275652C202O2D204D61676520546F7765722044616D61676520547261696E696E672044752O6D790D0A2O205B38373331385D203D20747275652C202O2D204D61676520546F7765722044616D6167652044756E67656F6E2O6572277320547261696E696E672044752O6D792028262047612O7269736F6E290D0A2O205B38373332305D203D20747275652C202O2D204D61676520546F7765722044616D61676520526169646572277320547261696E696E672044752O6D790D0A2O205B2O383331345D203D20747275652C202O2D2054616E6B696E672044756E67656F6E2O6572277320547261696E696E672044752O6D790D0A2O205B2O383331365D203D20747275652C202O2D204865616C696E6720547261696E696E672044752O6D79204O2D3E20465249454E444C590D0A2O202O2D20576F4420486F7264652047612O7269736F6E0D0A2O205B382O3736305D203D20747275652C202O2D204D61676520546F7765722044616D61676520547261696E696E672044752O6D790D0A2O205B382O3736315D203D20747275652C202O2D204D61676520546F7765722044616D6167652044756E67656F6E2O6572277320547261696E696E672044752O6D792028262047612O7269736F6E290D0A2O205B382O3736325D203D20747275652C202O2D204D61676520546F7765722044616D61676520526169646572277320547261696E696E672044752O6D790D0A2O205B2O38322O385D203D20747275652C202O2D2054616E6B696E672044756E67656F6E2O6572277320547261696E696E672044752O6D790D0A2O205B2O383238395D203D20747275652C202O2D204865616C696E6720547261696E696E672044752O6D79204O2D3E20465249454E444C590D0A2O202O2D204C6567696F6E20447275696420436C612O73204F726465722048612O6C0D0A2O205B2O31333936345D203D20747275652C202O2D20526169646572277320547261696E696E672044752O6D790D0A2O205B2O3133392O365D203D20747275652C202O2D2044756E67656F6E2O6572277320547261696E696E672044752O6D790D0A2O202O2D204C6567696F6E204D61676520436C612O73204F726465722048612O6C0D0A2O205B31302O3339375D203D20747275652C202O2D20477265617465722042752O6C7761726B20436F6E7374727563740D0A2O205B3130333430345D203D20747275652C202O2D2042752O6C7761726B20436F6E7374727563740D0A2O205B3130333430325D203D20747275652C202O2D204C652O7365722042752O6C7761726B20436F6E7374727563740D0A2O202O2D204C6567696F6E2050726965737420436C612O73204F726465722048612O6C0D0A2O205B3130373O355D203D20747275652C202O2D20426F756E6420766F6964205772616974680D0A2O205B3130372O35365D203D20747275652C202O2D20426F756E6420766F69642057616C6B65720D0A2O202O2D204C6567696F6E20526F67756520436C612O73204F726465722048612O6C0D0A2O205B39323136345D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B39323136355D203D20747275652C202O2D2044756E67656F6E2O6572277320547261696E696E672044752O6D790D0A2O205B3932312O365D203D20747275652C202O2D20526169646572277320547261696E696E672044752O6D790D0A2O202O2D204C6567696F6E205761726C6F636B20436C612O73204F726465722048612O6C0D0A2O205B3130313935365D203D20747275652C202O2D20526562652O6C696F75732046656C204C6F72640D0A2O205B3130323034355D203D20747275652C202O2D20526562652O6C696F757320577261746847756172640D0A2O205B3130323034385D203D20747275652C202O2D20526562652O6C696F75732046656C67756172640D0A2O205B3130323035325D203D20747275652C202O2D20526562652O6C696F757320696D700D0A2O202O2D204266412044617A617227416C6F720D0A2O205B312O343038315D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B312O343038325D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B312O343038355D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B312O343038365D203D20747275652C202O2D20526169646572277320547261696E696E672044752O6D790D0A2O202O2D2042664120426F72616C75730D0A2O205B3132363738315D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B3133313938335D203D20747275652C202O2D20526169646572277320547261696E696E672044752O6D790D0A2O205B3133313938395D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B3133312O39325D203D20747275652C202O2D2044756E67656F6E2O6572277320547261696E696E672044752O6D790D0A2O202O2D20536861646F776C616E6473204B797269616E0D0A2O205B3135343536345D203D20747275652C202O2D2056616C69616E7427732048756D696C6974790D0A2O205B3135343536375D203D20747275652C202O2D20507572697479277320436C65616E696E670D0A2O205B3135343538305D203D20747275652C202O2D205265696E666F7263656420477561726469616E0D0A2O205B3135343538335D203D20747275652C202O2D20537461726C7761727420477561726469616E0D0A2O205B3135343538355D203D20747275652C202O2D2056616C69616E742773205265736F6C76650D0A2O205B3135343538365D203D20747275652C202O2D205374616C77617274205068616C616E780D0A2O205B3136303332355D203D20747275652C202O2D2048756D696C6974792773204F62656469656E63650D0A2O202O2D20536861646F776C616E64732056656E746879720D0A2O205B3137333934325D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B3137352O34395D203D20747275652C202O2D20526169646572277320547261696E696E672044752O6D790D0A2O205B3137353435305D203D20747275652C202O2D2044756E67656F6E2O6572277320547261696E696E672044752O6D790D0A2O205B3137353435315D203D20747275652C202O2D2044756E67656F6E2O657227732054616E6B696E672044752O6D790D0A2O205B3137353435325D203D20747275652C202O2D2052616964657227732054616E6B696E672044752O6D790D0A2O205B313735342O355D203D20747275652C202O2D20436C6561766520547261696E696E672044752O6D790D0A2O205B3137353435365D203D20747275652C202O2D20537761726D20547261696E696E672044752O6D790D0A2O205B3137353436325D203D20747275652C202O2D2053696E66612O6C204669656E640D0A2O202O2D20536861646F776C616E6473204E69676874204661650D0A2O205B3137343536355D203D20747275652C202O2D2044756E67656F6E2O657227732054616E6B696E672044752O6D790D0A2O205B313734352O365D203D20747275652C202O2D2052616964657227732054616E6B696E672044752O6D790D0A2O205B3137343536375D203D20747275652C202O2D20526169646572277320547261696E696E672044752O6D790D0A2O205B3137343536385D203D20747275652C202O2D2044756E67656F6E2O6572277320547261696E696E672044752O6D790D0A2O205B3137343536395D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B3137343537305D203D20747275652C202O2D20537761726D20547261696E696E672044752O6D790D0A2O205B3137343537315D203D20747275652C202O2D20436C6561766520547261696E696E672044752O6D790D0A2O202O2D20536861646F776C616E6473204E6563726F6C6F72640D0A2O205B31372O3438345D203D20747275652C202O2D2044756E67656F6E2O6572277320547261696E696E672044752O6D790D0A2O205B31372O3438375D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B31372O342O385D203D20747275652C202O2D20526169646572277320547261696E696E672044752O6D790D0A2O205B31372O3439315D203D20747275652C202O2D2054616E6B696E672044752O6D790D0A2O202O2D20446172676F6E466C696768742056616C6472612O6B656E0D0A2O205B3139383539345D203D20747275652C202O2D20436C6561766520547261696E696E672044752O6D790D0A2O205B3139343634385D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O205B3138393633325D203D20747275652C202O2D20416E696D61746564204475656C6973740D0A2O205B3139343634335D203D20747275652C202O2D2044756E67656F6E2O6572277320547261696E696E672044752O6D790D0A2O205B313934362O345D203D20747275652C202O2D2044756E67656F6E2O6572277320547261696E696E672044752O6D790D0A2O205B313937382O335D203D20747275652C202O2D2050765020547261696E696E672044752O6D790D0A2O205B3138393631375D203D20747275652C202O2D20426F756C646572666973740D0A2O205B3139343634395D203D20747275652C202O2D204E6F726D616C2054616E6B2044752O6D790D0A2O202O2D20446172676F6E466C696768742049736B2O6172610D0A2O205B3139333536335D203D20747275652C202O2D20547261696E696E672044752O6D790D0A2O202O2D204F746865720D0A2O205B36353331305D203D20747275652C202O2D205475726E69702050756E6368696E67204261672028746F79290D0A2O205B2O363337345D203D20747275652C202O2D20416E61746F6D6963616C2044752O6D792028746F79290D0A2O205B3139363339345D203D20747275652C202O2D205475736B612O7220547261696E696E672044752O6D792028746F79290D0A2O205B3139363430365D203D20747275652C202O2D2052752O62657279204669736820486561642028746F79290D0A2O205B312O393035375D203D20747275652C202O2D20426C61636B20447261676F6E2773204368612O6C656E67652044752O6D792028746F79290D0A7D0D0A66756E6374696F6E20756E69743A497344752O6D7928290D0A2O206C6F63616C206E70636964203D2073656C663A4E5043494428290D0A0D0A2O2072657475726E206E70636964203E3D203020616E642064752O6D79556E6974735B6E706369645D202O3D20747275650D0A656E640D0A0D0A66756E6374696F6E20756E69743A497341506C6179657228290D0A2O2072657475726E20556E69744973506C617965722873656C662E756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A4865616C746828290D0A2O2072657475726E20556E69744865616C74682873656C662E756E6974494429206F72202D31200D0A656E640D0A0D0A66756E6374696F6E20756E69743A4D61784865616C746828290D0A2O2072657475726E20556E69744865616C74684D61782873656C662E756E6974494429206F72202D310D0A656E640D0A0D0A66756E6374696F6E20756E69743A4865616C746850657263656E7461676528290D0A2O206C6F63616C206865616C7468203D2073656C663A4865616C746828290D0A2O206C6F63616C206D61784865616C7468203D2073656C663A4D61784865616C746828290D0A2O206C6F63616C206865616C4162736F7262203D2073656C663A4865616C4162736F726228290D0A0D0A2O2072657475726E206865616C7468203E203020616E64206D61784865616C7468203E203020616E64206865616C4162736F7262203E3D203020616E6420286D6174682E6D6178286865616C7468202D206865616C4162736F72622C20302O29202F206D61784865616C7468202A20312O30206F72202D310D0A656E640D0A0D0A6C6F63616C206865616C696E674162736F726265645370652O6C496473203D207B0D0A2O202O2D205468726F6E65206F66207468652054696465730D0A2O203432383534322C0D0A2O203330333832352C0D0A2O202O2D20446F74690D0A2O203431333031332C0D0A2O202O2D20416D69726472612O73696C0D0A2O203431353632332C202O2D2068656172742073746F2O7065720D0A7D0D0A66756E6374696F6E20756E69743A4865616C696E674162736F7262656428290D0A2O20666F722069203D20312C20236865616C696E674162736F726265645370652O6C49647320646F0D0A4O20696620706C617965723A446562752O665570286865616C696E674162736F726265645370652O6C4964735B695D2C207472756529207468656E0D0A6O2072657475726E20747275650D0A4O20656E640D0A2O20656E640D0A0D0A2O2072657475726E2066616C73650D0A656E640D0A0D0A66756E6374696F6E20756E69743A4865616C4162736F726228290D0A2O2072657475726E20556E6974476574546F74616C4865616C4162736F7262732873656C662E756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A4973446561644F7247686F737428290D0A2O2072657475726E20556E69744973446561644F7247686F73742873656C662E756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A412O66656374696E67436F6D62617428290D0A2O2072657475726E20556E6974412O66656374696E67436F6D6261742873656C662E756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A4973556E6974286F74686572290D0A2O2072657475726E20556E69744973556E69742873656C662E756E697449442C206F746865722E756E69744944290D0A656E640D0A0D0A66756E6374696F6E20756E69743A436C612O73696669636174696F6E28290D0A2O2072657475726E20556E6974436C612O73696669636174696F6E2873656C662E756E6974494429206F72202O220D0A656E640D0A0D0A66756E6374696F6E20756E69743A497354616E6B696E67286F746865722C207468726561745468726573686F6C64290D0A2O206C6F63616C20746872656174536974756174696F6E203D20556E6974546872656174536974756174696F6E2873656C663A494428292C206F746865723A4944282O290D0A0D0A2O2072657475726E2028746872656174536974756174696F6E20616E6420746872656174536974756174696F6E203E3D20287468726561745468726573686F6C64206F7220322O29206F722066616C73650D0A656E640D0A0D0A66756E6374696F6E20756E69743A497354616E6B696E67416F45287261646975732C20746872656174536974756174696F6E290D0A2O206C6F63616C20697354616E6B696E67414F45203D2066616C73650D0A2O20666F72205F2C2074686973556E697420696E20706169727328706C617965723A476574456E656D696573496E52616E676528726164697573206F7220362E352O2920646F0D0A4O2069662073656C663A497354616E6B696E672874686973556E69742C20746872656174536974756174696F6E29207468656E0D0A6O20697354616E6B696E67414F45203D20747275650D0A4O20656E640D0A2O20656E640D0A0D0A2O2072657475726E20697354616E6B696E67414F450D0A656E640D0A0D0A66756E6374696F6E20756E69743A49734D6F76696E6728290D0A2O2072657475726E20476574556E697453702O65642873656C662E756E6974494429207E3D20300D0A656E640D0A0D0A66756E6374696F6E20756E69743A54617267657428290D0A2O2072657475726E20756E69742873656C662E756E69744944202O2E202274617267657422290D0A656E640D0A00063O0012023O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);