local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then v83[v85[2]]=v85[3];elseif (v86==1) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v113=v85[2];v78=(v113 + v84) -1 ;for v125=v113,v78 do local v126=v79[v125-v113 ];v83[v125]=v126;end end elseif (v86<=4) then if (v86==3) then local v114;local v115;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v115=v85[2];v83[v115]=v83[v115](v83[v115 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v115=v85[2];v78=(v115 + v84) -1 ;for v128=v115,v78 do v114=v79[v128-v115 ];v83[v128]=v114;end v77=v77 + 1 ;v85=v73[v77];v115=v85[2];v83[v115](v13(v83,v115 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else local v121=v85[2];v83[v121](v13(v83,v121 + 1 ,v78));end elseif (v86>5) then do return;end else local v122=v85[2];v83[v122]=v83[v122](v83[v122 + 1 ]);end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703AE1A2O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C206361636865203D2057522E63616368650D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A0D0A6C6F63616C2066756E6374696F6E20422O6F6B5363616E28626C616E6B5363616E290D0A2O202O2D2050657420422O6F6B0D0A2O20646F0D0A4O206C6F63616C206E756D5065745370652O6C73203D204861735065745370652O6C7328290D0A4O206966206E756D5065745370652O6C73207468656E0D0A6O206C6F63616C207370652O6C4C6561726E6564203D2063616368652E70657273697374656E742E7370652O6C4C6561726E65642E7065740D0A6O20666F722069203D20312C206E756D5065745370652O6C7320646F0D0A8O206C6F63616C2063752O72656E745370652O6C4944203D2073656C65637428372C204765745370652O6C496E666F28692C20422O4F4B545950455F5045542O290D0A8O2069662063752O72656E745370652O6C4944207468656E0D0A9O20206C6F63616C2063752O72656E745370652O6C203D207370652O6C2863752O72656E745370652O6C49442C202250657422290D0A9O202069662063752O72656E745370652O6C3A4973417661696C61626C6528747275652920616E64202863752O72656E745370652O6C3A49734B6E6F776E287472756529206F7220497354616C656E745370652O6C28692C20422O4F4B545950455F5045542O29207468656E0D0A9O203O206966206E6F7420626C616E6B5363616E207468656E0D0A9O205O207370652O6C4C6561726E65645B63752O72656E745370652O6C3A494428295D203D20747275650D0A9O203O20656E640D0A9O2020656E640D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2O202O2D20506C6179657220422O6F6B0D0A2O20646F0D0A4O206C6F63616C207370652O6C4C6561726E6564203D2063616368652E70657273697374656E742E7370652O6C4C6561726E65642E706C617965720D0A0D0A4O20666F722069203D20312C204765744E756D5370652O6C54616273282920646F0D0A6O206C6F63616C206F2O667365742C206E756D5370652O6C732C205F2C206F2O6653706563203D2073656C65637428332C204765745370652O6C546162496E666F28692O290D0A6O206966206F2O6653706563202O3D2030207468656E0D0A8O20666F72206A203D20312C20286F2O66736574202B206E756D5370652O6C732920646F0D0A9O20206C6F63616C2063752O72656E745370652O6C4944203D2073656C65637428372C204765745370652O6C496E666F286A2C20422O4F4B545950455F5350452O4C2O290D0A9O202069662063752O72656E745370652O6C494420616E64204765745370652O6C422O6F6B4974656D496E666F286A2C20422O4F4B545950455F5350452O4C29202O3D20225350452O4C22207468656E0D0A9O203O206966206E6F7420626C616E6B5363616E207468656E0D0A9O205O207370652O6C4C6561726E65645B63752O72656E745370652O6C49445D203D20747275650D0A9O203O20656E640D0A9O2020656E640D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A0D0A4O202O2D20466C796F7574205370652O6C730D0A4O20666F722069203D20312C204765744E756D466C796F757473282920646F0D0A6O206C6F63616C20666C796F75744944203D20476574466C796F757449442869290D0A6O206C6F63616C206E756D536C6F74732C2069734B6E6F776E203D2073656C65637428332C20476574466C796F7574496E666F28666C796F757449442O290D0A6O2069662069734B6E6F776E20616E64206E756D536C6F7473203E2030207468656E0D0A8O20666F72206A203D20312C206E756D536C6F747320646F0D0A9O20206C6F63616C2063752O72656E745370652O6C49442C205F2C2069734B6E6F776E5370652O6C203D20476574466C796F7574536C6F74496E666F28666C796F757449442C206A290D0A9O202069662063752O72656E745370652O6C494420616E642069734B6E6F776E5370652O6C207468656E0D0A9O203O207370652O6C4C6561726E65645B63752O72656E745370652O6C49445D203D20747275650D0A9O2020656E640D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20426C616E6B422O6F6B5363616E2028290D0A2O20422O6F6B5363616E2874727565290D0A656E640D0A0D0A6170692E636F6D62617453746172746564203D20300D0A6170692E636F6D626174456E646564203D20310D0A0D0A6170693A5265676973746572466F724576656E74280D0A4O2066756E6374696F6E28290D0A6O206170692E636F6D62617453746172746564203D2047657454696D6528290D0A6O206170692E636F6D626174456E646564203D20300D0A4O20656E642C0D0A4O2022504C415945525F524547454E5F44495341424C4544220D0A290D0A0D0A6170693A5265676973746572466F724576656E74280D0A4O2066756E6374696F6E28290D0A6O206170692E636F6D62617453746172746564203D20300D0A6O206170692E636F6D626174456E646564203D2047657454696D6528290D0A4O20656E642C0D0A4O2022504C415945525F524547454E5F454E41424C4544220D0A290D0A0D0A6170693A5265676973746572466F724576656E74280D0A4O2066756E6374696F6E286576656E742C207072656669782C206D652O73616765290D0A6O20696620707265666978202O3D202244342220616E6420737472696E672E66696E64286D652O736167652C202250542229207468656E0D0A8O206170692E626F2O734D6F6454696D65203D20746F6E756D62657228737472696E672E737562286D652O736167652C20342C20352O290D0A8O206170692E626F2O734D6F64456E6454696D65203D2047657454696D652829202B206170692E626F2O734D6F6454696D650D0A6O20656C7365696620707265666978202O3D2022426967576967732220616E6420737472696E672E66696E64286D652O736167652C202250752O6C2229207468656E0D0A8O206170692E626F2O734D6F6454696D65203D20746F6E756D62657228737472696E672E737562286D652O736167652C20382C20392O290D0A8O206170692E626F2O734D6F64456E6454696D65203D2047657454696D652829202B206170692E626F2O734D6F6454696D650D0A6O20656E640D0A4O20656E642C0D0A4O2022434841545F4D53475F412O444F4E220D0A290D0A0D0A6170693A5265676973746572466F724576656E74280D0A4O2066756E6374696F6E286576656E742C2061726731290D0A6O206966206576656E74202O3D2022504C415945525F5350454349414C495A4154494F4E5F4348414E4745442220616E642061726731207E3D2022706C6179657222207468656E0D0A8O2072657475726E0D0A6O20656E640D0A0D0A6O2063616368652E70657273697374656E742E706C617965722E636C612O73203D207B20556E6974436C612O732822706C617965722229207D0D0A6O2063616368652E70657273697374656E742E706C617965722E73706563203D207B204765745370656369616C697A6174696F6E496E666F284765745370656369616C697A6174696F6E282O29207D0D0A0D0A6O207461626C652E776970652863616368652E70657273697374656E742E746578747572652E7370652O6C290D0A6O207461626C652E776970652863616368652E70657273697374656E742E746578747572652E6974656D290D0A0D0A6O20706C617965723A55706461746545717569706D656E7428290D0A0D0A6O206966206576656E74202O3D2022504C415945525F5350454349414C495A4154494F4E5F4348414E47454422207468656E0D0A8O206C6F63616C207570646174654F76652O72696465730D0A8O207570646174654F76652O7269646573203D2066756E6374696F6E28290D0A9O202069662063616368652E70657273697374656E742E706C617965722E737065635B315D207E3D206E696C207468656E0D0A9O203O206170692E4C6F6164526573746F72657328290D0A9O203O206170692E4C6F61644F76652O72696465732863616368652E70657273697374656E742E706C617965722E737065635B315D290D0A9O2020656C73650D0A9O203O20435F54696D65722E416674657228322C207570646174654F76652O7269646573290D0A9O2020656E640D0A8O20656E640D0A8O207570646174654F76652O726964657328290D0A6O20656E640D0A0D0A6O206966206576656E74202O3D2022504C415945525F5350454349414C495A4154494F4E5F4348414E47454422206F72206576656E74202O3D2022504C415945525F54414C454E545F55504441544522206F72206576656E74202O3D202254524149545F434F4E4649475F5550444154454422207468656E0D0A8O2055706461746554616C656E7473203D2066756E6374696F6E28290D0A9O2020776970652863616368652E70657273697374656E742E74616C656E7473290D0A9O20206C6F63616C2074616C656E74436F6E6669674944203D20435F436C612O7354616C656E74732E476574416374697665436F6E666967494428290D0A9O20206C6F63616C2074616C656E74436F6E666967496E666F0D0A9O202069662074616C656E74436F6E6669674944207468656E0D0A9O203O2074616C656E74436F6E666967496E666F203D20435F5472616974732E476574436F6E666967496E666F2874616C656E74436F6E6669674944290D0A9O2020656E640D0A9O202069662074616C656E74436F6E6669674944207E3D206E696C20616E642074616C656E74436F6E666967496E666F207E3D206E696C207468656E0D0A9O203O206C6F63616C2074616C656E7454722O65494473203D2074616C656E74436F6E666967496E666F5B2274722O65494473225D0D0A9O203O20666F722069203D20312C202374616C656E7454722O6549447320646F0D0A9O205O206C6F63616C206E6F646573203D20435F5472616974732E47657454722O654E6F6465732874616C656E7454722O654944735B695D290D0A9O205O20666F72206A203D20312C20236E6F64657320646F0D0A9O207O206C6F63616C206E6F64654944203D206E6F6465735B6A5D0D0A9O207O206C6F63616C206E6F6465496E666F203D20435F5472616974732E4765744E6F6465496E666F2874616C656E74436F6E66696749442C206E6F64654944290D0A9O207O206C6F63616C2061637469766554616C656E74203D206E6F6465496E666F2E616374697665456E7472790D0A9O207O206C6F63616C2074616C656E7452616E6B203D206E6F6465496E666F2E61637469766552616E6B0D0A9O207O206966202861637469766554616C656E7420616E642074616C656E7452616E6B203E203029207468656E0D0A9O209O206C6F63616C2074616C656E74456E7472794944203D2061637469766554616C656E742E656E74727949440D0A9O209O206C6F63616C2074616C656E74456E747279496E666F203D20435F5472616974732E476574456E747279496E666F2874616C656E74436F6E66696749442C2074616C656E74456E7472794944290D0A9O209O206C6F63616C20646566696E6974696F6E4944203D2074616C656E74456E747279496E666F5B22646566696E6974696F6E4944225D0D0A9O209O206C6F63616C20646566696E6974696F6E496E666F203D20435F5472616974732E476574446566696E6974696F6E496E666F28646566696E6974696F6E4944290D0A9O209O206C6F63616C207370652O6C4944203D20646566696E6974696F6E496E666F5B227370652O6C4944225D0D0A9O209O2063616368652E70657273697374656E742E74616C656E74735B7370652O6C49445D203D202863616368652E70657273697374656E742E74616C656E74735B7370652O6C49445D2920616E64202863616368652E70657273697374656E742E74616C656E74735B7370652O6C49445D202B2074616C656E7452616E6B29206F722074616C656E7452616E6B0D0A9O207O20656E640D0A9O205O20656E640D0A9O203O20656E640D0A9O2020656C73650D0A9O203O20435F54696D65722E416674657228322C2055706461746554616C656E7473290D0A9O2020656E640D0A8O20656E640D0A8O2055706461746554616C656E747328290D0A6O20656E640D0A4O20656E642C0D0A4O2022504C415945525F4C4F47494E222C20225A4F4E455F4348414E4745445F4E45575F41524541222C2022504C415945525F5350454349414C495A4154494F4E5F4348414E474544222C2022504C415945525F54414C454E545F555044415445222C2022504C415945525F45515549504D454E545F4348414E474544222C202254524149545F434F4E4649475F55504441544544220D0A290D0A0D0A6170693A5265676973746572466F724576656E74280D0A4O2066756E6374696F6E286576656E742C2061726731290D0A6O20706C617965723A436163686528290D0A6O202O2D20544F444F3A206669782074696D696E6720692O73756520766961206576656E743F0D0A6O20435F54696D65722E416674657228332C2066756E6374696F6E28290D0A8O20706C617965723A436163686528290D0A6O20656E64290D0A4O20656E642C0D0A4O2022504C415945525F4C4F47494E220D0A290D0A0D0A6170693A5265676973746572466F724576656E74280D0A4O2066756E6374696F6E286576656E742C2061726731290D0A6O206966206576656E74202O3D2022504C415945525F5350454349414C495A4154494F4E5F4348414E4745442220616E642061726731207E3D2022706C6179657222207468656E0D0A8O2072657475726E0D0A6O20656E640D0A0D0A6O202O2D204649584D453A20776F726B61726F756E6420746F2070726576656E74204C756120652O726F7273207768656E20426C692O7A20646F20736F6D65207368656E616E6967616E73207769746820622O6F6B20696E204172656E612F54696D6577616C6B696E670D0A6O206966207063612O6C28426C616E6B422O6F6B5363616E29207468656E0D0A8O20776970652863616368652E70657273697374656E742E622O6F6B496E6465782E706C61796572290D0A8O20776970652863616368652E70657273697374656E742E622O6F6B496E6465782E706574290D0A8O20776970652863616368652E70657273697374656E742E7370652O6C4C6561726E65642E706C61796572290D0A8O20776970652863616368652E70657273697374656E742E7370652O6C4C6561726E65642E706574290D0A8O20422O6F6B5363616E28290D0A6O20656E640D0A4O20656E642C0D0A4O20225350452O4C535F4348414E474544222C20224C4541524E45445F5350452O4C5F494E5F544142222C2022534B492O4C5F4C494E45535F4348414E474544222C2022504C415945525F4755494C445F555044415445222C2022504C415945525F5350454349414C495A4154494F4E5F4348414E474544222C20225553455F474C595048222C202243414E43454C5F474C5950485F43415354222C202241435449564154455F474C595048220D0A290D0A0D0A6170692E756E69744E6F74496E46726F6E74203D20706C617965720D0A6170692E756E69744E6F74496E46726F6E7454696D65203D20300D0A6170692E6C617374556E69744379636C6564203D20706C617965720D0A6170692E6C617374556E69744379636C656454696D65203D20300D0A6170693A5265676973746572466F724576656E74280D0A4O2066756E6374696F6E286576656E742C206D652O73616765547970652C206D652O73616765290D0A6O206966206D652O7361676554797065202O3D20353020616E64206D652O73616765202O3D205350452O4C5F4641494C45445F554E49545F4E4F545F494E46524F4E54207468656E0D0A8O206170692E756E69744E6F74496E46726F6E74203D206170692E6C617374556E69744379636C65640D0A8O206170692E756E69744E6F74496E46726F6E7454696D65203D206170692E6C617374556E69744379636C656454696D650D0A6O20656E640D0A4O20656E642C0D0A4O202255495F452O524F525F4D452O53414745220D0A290D0A00063O0012033O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);