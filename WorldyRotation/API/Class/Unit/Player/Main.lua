local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110]=v83[v110](v83[v110 + 1 ]);elseif (v86==1) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v113=v85[2];v78=(v113 + v84) -1 ;for v125=v113,v78 do local v126=v79[v125-v113 ];v83[v125]=v126;end end elseif (v86<=4) then if (v86>3) then local v114;local v115;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v115=v85[2];v83[v115]=v83[v115](v83[v115 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v115=v85[2];v78=(v115 + v84) -1 ;for v128=v115,v78 do v114=v79[v128-v115 ];v83[v128]=v114;end v77=v77 + 1 ;v85=v73[v77];v115=v85[2];v83[v115](v13(v83,v115 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else local v121=v85[2];v83[v121](v13(v83,v121 + 1 ,v78));end elseif (v86>5) then do return;end else v83[v85[2]]=v85[3];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67037B112O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C20706574203D20756E69742E7065740D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A0D0A66756E6374696F6E20706C617965723A49734D6F756E74656428290D0A2O2072657475726E2049734D6F756E746564282920616E64206E6F742073656C663A49734F6E436F6D6261744D6F756E7428290D0A656E640D0A0D0A66756E6374696F6E20706C617965723A4973496E506172747928290D0A2O2072657475726E20556E6974496E50617274792873656C662E756E69744944290D0A656E640D0A0D0A66756E6374696F6E20706C617965723A4973496E5261696428290D0A2O2072657475726E20556E6974496E526169642873656C662E756E69744944290D0A656E640D0A0D0A2O2D204765742074686520706C6179657220726163652E0D0A2O2D2044776172662C20447261656E65692C20476E6F6D652C2048756D616E2C204E69676874456C662C20576F7267656E0D0A2O2D20426C2O6F64456C662C20476F626C696E2C204F72632C2054617572656E2C2054726F2O6C2C2053636F757267650D0A2O2D2050616E646172656E0D0A66756E6374696F6E20706C617965723A5261636528290D0A2O206C6F63616C205F2C2072616365203D20556E6974526163652873656C662E756E69744944290D0A2O2072657475726E20726163650D0A656E640D0A0D0A66756E6374696F6E20706C617965723A497352616365287468697352616365290D0A2O2072657475726E20746869735261636520616E642073656C663A526163652829202O3D207468697352616365206F722066616C73650D0A656E640D0A0D0A646F0D0A2O206C6F63616C20636F6D6261744D6F756E7442752O66203D207B0D0A4O203O2D20436C612O7365730D0A4O207370652O6C28313331333437292C202O2D2044656D6F6E2048756E74657220476C6964650D0A4O207370652O6C28373833292C202O2D2044727569642054726176656C20466F726D0D0A4O207370652O6C28313635393632292C202O2D20447275696420466C6967687420466F726D0D0A4O207370652O6C282O3230353039292C202O2D2050616C6164696E20446976696E652053742O65640D0A4O207370652O6C282O32312O3833292C202O2D2050616C6164696E20446976696E652053742O65640D0A4O207370652O6C282O32312O3835292C202O2D2050616C6164696E20446976696E652053742O65640D0A4O207370652O6C282O32312O3836292C202O2D2050616C6164696E20446976696E652053742O65640D0A4O207370652O6C282O32312O3837292C202O2D2050616C6164696E20446976696E652053742O65640D0A4O207370652O6C2832352O343731292C202O2D2050616C6164696E20446976696E652053742O65640D0A4O207370652O6C2832352O343732292C202O2D2050616C6164696E20446976696E652053742O65640D0A4O207370652O6C2832352O343733292C202O2D2050616C6164696E20446976696E652053742O65640D0A4O207370652O6C2832352O343734292C202O2D2050616C6164696E20446976696E652053742O65640D0A0D0A4O203O2D204C6567696F6E0D0A4O202O2D20436C612O73204F726465722048612O6C0D0A4O207370652O6C282O3230343830292C202O2D204465617468204B6E696768742045626F6E20426C616465204465617468636861726765720D0A4O207370652O6C282O3230343834292C202O2D204465617468204B6E69676874204E617A6772696D2773204465617468636861726765720D0A4O207370652O6C282O3230342O38292C202O2D204465617468204B6E696768742054726F2O6C62616E652773204465617468636861726765720D0A4O207370652O6C282O3230343839292C202O2D204465617468204B6E696768742057686974656D616E652773204465617468636861726765720D0A4O207370652O6C282O3230343931292C202O2D204465617468204B6E69676874204D6F677261696E652773204465617468636861726765720D0A4O207370652O6C282O3230353034292C202O2D2050616C6164696E2053696C7665722048616E6420436861726765720D0A4O207370652O6C282O3230353037292C202O2D2050616C6164696E2053696C7665722048616E6420436861726765720D0A4O202O2D2053746F726D6865696D205056502051756573742028426172656261636B20427261776C290D0A4O207370652O6C282O3231353935292C202O2D2053746F726D277320526561636820436C692O6677616C6B65720D0A4O207370652O6C282O3231363731292C202O2D2053746F726D277320526561636820576172626561720D0A4O207370652O6C282O3231363732292C202O2D2053746F726D2773205265616368204772656174737461670D0A4O207370652O6C282O3231363733292C202O2D2053746F726D277320526561636820576F72670D0A4O207370652O6C28323138393634292C202O2D2053746F726D74616C6F6E0D0A0D0A4O203O2D205761726C6F7264206F6620447261656E6F720D0A4O202O2D204E616772616E640D0A4O207370652O6C283136343O32292C202O2D2046726F7374776F6C662057617220576F6C660D0A4O207370652O6C2831363538303329202O2D2054656C2O6172692054616C62756B0D0A2O207D0D0A2O2066756E6374696F6E20706C617965723A49734F6E436F6D6261744D6F756E7428290D0A4O20666F722069203D20312C2023636F6D6261744D6F756E7442752O6620646F0D0A6O2069662073656C663A42752O66557028636F6D6261744D6F756E7442752O665B695D2C207472756529207468656E0D0A8O2072657475726E20747275650D0A6O20656E640D0A4O20656E640D0A4O2072657475726E2066616C73650D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E20706C617965723A4973496E56656869636C6528290D0A2O2072657475726E20556E6974496E56656869636C652873656C662E756E697449442920616E64206E6F742073656C663A4973496E57686974656C697374656456656869636C6528290D0A656E640D0A0D0A646F0D0A2O206C6F63616C20696E56656869636C6557686974656C697374203D207B0D0A4O207370652O6C73203D207B0D0A6O203O2D20447261676F6E666C696768740D0A6O207370652O6C28332O373O32292C202O2D20436F6E73756D65202854722O656D6F7574682C20427261636B656E6869646520486F2O6C6F77290D0A6O203O2D20536861646F776C616E64730D0A6O202O2D20506C6167756566612O6C0D0A6O207370652O6C28333238343239292C202O2D204372757368696E6720456D62726163652028536C696D652054656E7461636C65290D0A6O202O2D20546865204D61770D0A6O207370652O6C28333436383335292C202O2D20536F756C204272616E64202857696E676564204162647563746F7273290D0A0D0A6O203O2D205761726C6F7264206F6620447261656E6F720D0A6O202O2D2048652O6C66697265204369746164656C0D0A6O207370652O6C28313837383139292C202O2D20437275736820284B6F726D726F6B27732048616E6473290D0A6O207370652O6C28313831333435292C202O2D20466F756C20437275736820284B6F726D726F6B27732054616E6B2048616E64290D0A6O202O2D20426C61636B726F636B20466F756E6472790D0A6O207370652O6C28313537303539292C202O2D2052756E65206F66204772617370696E6720456172746820284B726F6D6F6727732048616E64290D0A4O207D2C0D0A4O207065744D6F756E7473203D207B0D0A6O203O2D204C6567696F6E0D0A6O202O2D204B6172617A68616E0D0A6O202O31363830322C202O2D20526F64656E74206F6620557375616C2053697A650D0A0D0A6O203O2D205761726C6F7264206F6620447261656E6F720D0A6O202O2D2047612O7269736F6E20537461626C65732051756573740D0A6O2038373038322C202O2D2053696C7665727065726C740D0A6O2038373037382C202O2D20496365682O6F660D0A6O2038373038312C202O2D20526F636B7475736B0D0A6O2038373038302C202O2D20526976657277612O6C6F770D0A6O2038373037392C202O2D204D6561646F7773746F6D7065720D0A6O2038373037362C202O2D20536E61726C65720D0A4O207D0D0A2O207D0D0A2O2066756E6374696F6E20706C617965723A4973496E57686974656C697374656456656869636C6528290D0A4O202O2D205370652O6C0D0A4O206C6F63616C2076656869636C655370652O6C73203D20696E56656869636C6557686974656C6973742E7370652O6C730D0A4O20666F722069203D20312C202376656869636C655370652O6C7320646F0D0A6O206C6F63616C2076656869636C655370652O6C203D2076656869636C655370652O6C735B695D0D0A6O2069662073656C663A446562752O6655702876656869636C655370652O6C2C206E696C2C207472756529207468656E0D0A8O2072657475726E20747275650D0A6O20656E640D0A4O20656E640D0A0D0A4O202O2D205065744D6F756E740D0A4O206C6F63616C207065744D6F756E7473203D20696E56656869636C6557686974656C6973742E7065744D6F756E74730D0A4O206966207065743A49734163746976652829207468656E0D0A6O20666F722069203D20312C20237065744D6F756E747320646F0D0A8O206C6F63616C207065744D6F756E74203D207065744D6F756E74735B695D0D0A8O206966207065743A4E504349442829202O3D207065744D6F756E74207468656E0D0A9O202072657475726E20747275650D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A0D0A4O2072657475726E2066616C73650D0A2O20656E640D0A656E640D0A0D0A646F0D0A2O206C6F63616C2073746F7043617374203D207B0D0A4O20646562752O6673203D207B0D0A6O207B207370652O6C283234302O3437292C2031207D202O2D205175616B6520284D2B20412O666978290D0A4O207D0D0A2O207D0D0A2O2066756E6374696F6E20706C617965723A53686F756C6453746F7043617374696E6728290D0A4O206C6F63616C20646562752O6673203D2073746F70436173742E646562752O66730D0A4O20666F722069203D20312C2023646562752O667320646F0D0A6O206C6F63616C207265636F7264203D20646562752O66735B695D0D0A6O206C6F63616C20646562752O662C206475726174696F6E0D0A6O2069662074797065287265636F726429202O3D20227461626C6522207468656E0D0A8O20646562752O662C206475726174696F6E203D207265636F72645B315D2C207265636F72645B325D0D0A6O20656C73650D0A8O20646562752O66203D207265636F72640D0A6O20656E640D0A6O2069662073656C663A446562752O66557028646562752O662C206E696C2C20747275652920616E6420286E6F74206475726174696F6E206F722073656C663A446562752O6652656D61696E7328646562752O662C206E696C2C207472756529203C3D206475726174696F6E29207468656E0D0A8O2072657475726E20747275650D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A00063O0012043O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);