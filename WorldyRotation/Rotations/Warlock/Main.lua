local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));elseif (v86>1) then v83[v85[2]]=v59[v85[3]];else local v119=v85[2];v78=(v119 + v84) -1 ;for v130=v119,v78 do local v131=v79[v130-v119 ];v83[v130]=v131;end end elseif (v86<=3) then do return;end elseif (v86==4) then local v120=v85[2];v83[v120](v13(v83,v120 + 1 ,v78));else v83[v85[2]]=v59[v85[3]];end elseif (v86<=8) then if (v86<=6) then v83[v85[2]]=v85[3];elseif (v86==7) then do return;end else local v123=v85[2];v83[v123]=v83[v123](v83[v123 + 1 ]);end elseif (v86<=9) then local v114=v85[2];v83[v114]=v83[v114](v83[v114 + 1 ]);elseif (v86>10) then v83[v85[2]]=v85[3];else local v127=v85[2];v78=(v127 + v84) -1 ;for v133=v127,v78 do local v134=v79[v133-v127 ];v83[v133]=v134;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67033C3D2O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C730D0A6966206E6F74207370652O6C2E7761726C6F636B207468656E0D0A2O207370652O6C2E7761726C6F636B203D207B7D0D0A656E640D0A7370652O6C2E7761726C6F636B2E636F2O6D6F6E73203D207B0D0A2O202O2D2072616369616C730D0A2O206265727365726B696E67203D207370652O6C283236323937292C0D0A2O20626C2O6F6446757279203D207370652O6C282O33373032292C0D0A2O2066697265626C2O6F64203D207370652O6C283236352O3231292C0D0A2O202O2D206162696C69746965730D0A2O20636F2O72757074696F6E203D207370652O6C28313732292C0D0A2O206461726B50616374203D207370652O6C28313038343136292C0D0A2O20736861646F77426F6C74203D207370652O6C28363836292C0D0A2O2073752O6D6F6E4461726B676C617265203D207370652O6C28323035313830292C0D0A2O20756E656E64696E675265736F6C7665203D207370652O6C283130342O3733292C0D0A2O202O2D2074616C656E74730D0A2O206772696D6F6972656F66536163726966696365203D207370652O6C28313038353033292C0D0A2O206772696D6F6972656F6653616372696669636542752O66203D207370652O6C28313936302O39292C0D0A2O20736F756C436F6E64756974203D207370652O6C28323135393431292C0D0A2O2073752O6D6F6E536F756C6B2O65706572203D207370652O6C28333836323536292C0D0A2O20696E7175697369746F727347617A65203D207370652O6C28333836332O34292C0D0A2O20696E7175697369746F727347617A6542752O66203D207370652O6C28332O38303638292C0D0A2O20736F756C6275726E203D207370652O6C28333835382O39292C0D0A2O202O2D2062752O66730D0A2O20706F776572496E667573696F6E42752O66203D207370652O6C28312O303630292C0D0A2O202O2D20646562752O66730D0A2O202O2D20636F2O6D616E642064656D6F6E206162696C69746965730D0A2O20617865546F2O73203D207370652O6C282O312O393134292C0D0A2O20736564756374696F6E203D207370652O6C282O312O393039292C0D0A2O20736861646F7742756C7761726B203D207370652O6C282O312O393037292C0D0A2O2073696E67654D61676963203D207370652O6C282O312O393035292C0D0A2O207370652O6C4C6F636B203D207370652O6C282O312O393130292C0D0A7D0D0A0D0A7370652O6C2E7761726C6F636B2E64656D6F6E6F6C6F6779203D204D657267655461626C6542794B6579287370652O6C2E7761726C6F636B2E636F2O6D6F6E732C207B0D0A2O202O2D2062617365206162696C69746965730D0A2O2066656C73746F726D203D207370652O6C283839373531292C0D0A2O2068616E646F6647756C64616E203D207370652O6C28313035313734292C202O2D2073706C6173682C20380D0A2O2073752O6D6F6E506574203D207370652O6C283330313436292C0D0A2O202O2D2074616C656E74730D0A2O2062696C6573636F75726765426F6D62657273203D207370652O6C28323637322O31292C202O2D2073706C6173682C20380D0A2O2063612O6C44726561647374616C6B657273203D207370652O6C28313034333136292C0D0A2O2064656D6F6E626F6C74203D207370652O6C28323634313738292C0D0A2O2064656D6F6E696343612O6C696E67203D207370652O6C28323035313435292C0D0A2O2064656D6F6E6963537472656E677468203D207370652O6C28323637313731292C0D0A2O20642O6F6D203D207370652O6C28363033292C0D0A2O2066656C446F6D696E6174696F6E203D207370652O6C283O332O3839292C0D0A2O2066656C436F76656E616E74203D207370652O6C28333837343332292C0D0A2O2066726F6D746865536861646F7773203D207370652O6C28323637313730292C0D0A2O206772696D6F69726546656C6775617264203D207370652O6C283O31383938292C0D0A2O206775692O6C6F74696E65203D207370652O6C28333836382O33292C0D0A2O20696D7047616E67426F2O73203D207370652O6C283338372O3435292C0D0A2O20696D706C6F73696F6E203D207370652O6C28313936322O37292C202O2D2073706C6173682C20380D0A2O20692O6E657244656D6F6E73203D207370652O6C28323637323136292C0D0A2O206E6574686572506F7274616C203D207370652O6C28323637323137292C0D0A2O20706F776572536970686F6E203D207370652O6C28323634313330292C0D0A2O2073616372696669636564536F756C73203D207370652O6C28323637323134292C0D0A2O20736F756C626F756E64547972616E74203D207370652O6C282O3334353835292C0D0A2O20736F756C537472696B65203D207370652O6C28323634303537292C0D0A2O2073752O6D6F6E44656D6F6E6963547972616E74203D207370652O6C28323635313837292C0D0A2O2073752O6D6F6E56696C656669656E64203D207370652O6C283236342O3139292C0D0A2O20746865457870656E6461626C6573203D207370652O6C28333837362O30292C0D0A2O202O2D2062752O66730D0A2O2064656D6F6E696343612O6C696E6742752O66203D207370652O6C28323035313436292C0D0A2O2064656D6F6E6963436F726542752O66203D207370652O6C28323634313733292C0D0A2O2064656D6F6E6963506F77657242752O66203D207370652O6C28323635323733292C0D0A2O2066656C436F76656E616E7442752O66203D207370652O6C28333837343337292C0D0A2O206E6574686572506F7274616C42752O66203D207370652O6C28323637323138292C0D0A2O202O2D20646562752O66730D0A2O20642O6F6D446562752O66203D207370652O6C28363033292C0D0A2O2066726F6D746865536861646F7773446562752O66203D207370652O6C28323730353639292C0D0A7D290D0A0D0A7370652O6C2E7761726C6F636B2E612O666C696374696F6E203D204D657267655461626C6542794B6579287370652O6C2E7761726C6F636B2E636F2O6D6F6E732C207B0D0A2O202O2D2062617365206162696C69746965730D0A2O2061676F6E79203D207370652O6C28393830292C0D0A2O20647261696E4C696665203D207370652O6C28323334313533292C0D0A2O2073752O6D6F6E506574203D207370652O6C28362O38292C0D0A2O202O2D2074616C656E74730D0A2O206162736F6C757465436F2O72757074696F6E203D207370652O6C28313936313033292C0D0A2O20647261696E536F756C203D207370652O6C28313938353930292C0D0A2O206472656164546F756368203D207370652O6C283338392O3735292C0D0A2O206861756E74203D207370652O6C283438313831292C0D0A2O20696E6576697461626C6544656D697365203D207370652O6C282O3334333139292C0D0A2O206D616C65666963412O666C696374696F6E203D207370652O6C28333839373631292C0D0A2O206D616C6566696352617074757265203D207370652O6C28333234353336292C0D0A2O206E6967687466612O6C203D207370652O6C283130382O3538292C0D0A2O207068616E746F6D53696E67756C6172697479203D207370652O6C28323035313739292C0D0A2O20736F77546865532O656473203D207370652O6C283139362O3236292C0D0A2O20732O65646F66436F2O72757074696F6E203D207370652O6C283237323433292C0D0A2O20736861646F77456D6272616365203D207370652O6C283237323433292C0D0A2O20736970686F6E4C696665203D207370652O6C283633313036292C0D0A2O20736F756C526F74203D207370652O6C283338362O3937292C0D0A2O20736F756C53776170203D207370652O6C28333836393531292C0D0A2O20736F756C546170203D207370652O6C28333837303733292C0D0A2O20736F756C656174657273476C752O746F6E79203D207370652O6C28333839363330292C0D0A2O20736F77746865532O656473203D207370652O6C283139362O3236292C0D0A2O20746F726D656E7465644372657363656E646F203D207370652O6C28333837303735292C0D0A2O20756E737461626C65412O666C696374696F6E203D207370652O6C28333136302O39292C0D0A2O2076696C655461696E74203D207370652O6C28323738333530292C0D0A2O202O2D2062752O66730D0A2O20696E6576697461626C6544656D69736542752O66203D207370652O6C282O3334333230292C0D0A2O206E6967687466612O6C42752O66203D207370652O6C28323634353731292C0D0A2O206D616C65666963412O666C696374696F6E42752O66203D207370652O6C28333839383435292C0D0A2O20746F726D656E7465644372657363656E646F42752O66203D207370652O6C28333837303739292C0D0A2O202O2D20646562752O66730D0A2O2061676F6E79446562752O66203D207370652O6C28393830292C0D0A2O20636F2O72757074696F6E446562752O66203D207370652O6C28313436373339292C0D0A2O206861756E74446562752O66203D207370652O6C283438313831292C0D0A2O207068616E746F6D53696E67756C6172697479446562752O66203D207370652O6C28323035313739292C0D0A2O20732O65646F66436F2O72757074696F6E446562752O66203D207370652O6C283237323433292C0D0A2O20736970686F6E4C696665446562752O66203D207370652O6C283633313036292C0D0A2O20756E737461626C65412O666C696374696F6E446562752O66203D207370652O6C28333136302O39292C0D0A2O2076696C655461696E74446562752O66203D207370652O6C28323738333530292C0D0A2O20736F756C526F74446562752O66203D207370652O6C283338362O3937292C0D0A2O206472656164546F756368446562752O66203D207370652O6C28333839383638292C0D0A2O20736861646F77456D6272616365446562752O66203D207370652O6C283332333930292C0D0A7D290D0A0D0A7370652O6C2E7761726C6F636B2E6465737472756374696F6E203D204D657267655461626C6542794B6579287370652O6C2E7761726C6F636B2E636F2O6D6F6E732C207B0D0A2O202O2D2062617365206162696C69746965730D0A2O20692O6D6F6C617465203D207370652O6C28333438292C0D0A2O20696E63696E6572617465203D207370652O6C283239372O32292C0D0A2O2073752O6D6F6E506574203D207370652O6C28362O38292C0D0A2O202O2D2074616C656E74730D0A2O20617368656E52656D61696E73203D207370652O6C28333837323532292C0D0A2O206176617461726F664465737472756374696F6E203D207370652O6C28333837313539292C0D0A2O206261636B6472616674203D207370652O6C28313936343036292C0D0A2O206275726E746F4173686573203D207370652O6C28333837313533292C0D0A2O2063617461636C79736D203D207370652O6C28313532313038292C0D0A2O206368612O6E656C44656D6F6E66697265203D207370652O6C283139362O3437292C0D0A2O206368616F73426F6C74203D207370652O6C282O3136383538292C0D0A2O20636F6E666C616772617465203D207370652O6C283137393632292C0D0A2O206372794861766F63203D207370652O6C28333837352O32292C0D0A2O20646961626F6C6963456D62657273203D207370652O6C28333837313733292C0D0A2O2064696D656E73696F6E616C52696674203D207370652O6C28333837393736292C0D0A2O206572616469636174696F6E203D207370652O6C28313936343132292C0D0A2O2066697265616E644272696D73746F6E65203D207370652O6C28313936343038292C0D0A2O206861766F63203D207370652O6C283830323430292C0D0A2O20696E6665726E6F203D207370652O6C28323730353435292C0D0A2O20696E7465726E616C436F6D62757374696F6E203D207370652O6C28322O36313334292C0D0A2O206D61646E652O736F66746865417A6A41716972203D207370652O6C28333837342O30292C0D0A2O206D617968656D203D207370652O6C28333837353036292C0D0A2O20726167696E6744656D6F6E66697265203D207370652O6C28333837312O36292C0D0A2O207261696E6F664368616F73203D207370652O6C28322O36303836292C0D0A2O207261696E6F6646697265203D207370652O6C2835373430292C0D0A2O20726F6172696E67426C617A65203D207370652O6C28323035313834292C0D0A2O207275696E203D207370652O6C28333837313033292C0D0A2O20736F756C46697265203D207370652O6C2836333533292C0D0A2O2073752O6D6F6E496E6665726E616C203D207370652O6C282O312O32292C0D0A2O202O2D2062752O66730D0A2O206261636B647261667442752O66203D207370652O6C282O3137383238292C0D0A2O206D61646E652O73432O42752O66203D207370652O6C28333837343039292C0D0A2O207261696E6F664368616F7342752O66203D207370652O6C28322O36303837292C0D0A2O2072697475616C6F665275696E42752O66203D207370652O6C28333837313537292C0D0A2O206275726E746F417368657342752O66203D207370652O6C28333837313534292C0D0A2O202O2D20646562752O66730D0A2O206572616469636174696F6E446562752O66203D207370652O6C28313936343134292C0D0A2O206861766F63446562752O66203D207370652O6C283830323430292C0D0A2O20692O6D6F6C617465446562752O66203D207370652O6C2831352O373336292C0D0A2O20726F6172696E67426C617A65446562752O66203D207370652O6C28323635393331292C0D0A7D290D0A0D0A2O2D206974656D730D0A6966206E6F74206974656D2E7761726C6F636B207468656E0D0A2O206974656D2E7761726C6F636B203D207B7D0D0A656E640D0A6974656D2E7761726C6F636B2E636F2O6D6F6E73203D207B0D0A7D0D0A0D0A6974656D2E7761726C6F636B2E612O666C696374696F6E203D204D657267655461626C6542794B6579286974656D2E7761726C6F636B2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E7761726C6F636B2E64656D6F6E6F6C6F6779203D204D657267655461626C6542794B6579286974656D2E7761726C6F636B2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E7761726C6F636B2E6465737472756374696F6E203D204D657267655461626C6542794B6579286974656D2E7761726C6F636B2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F730D0A6966206E6F74206D6163726F2E7761726C6F636B207468656E0D0A2O206D6163726F2E7761726C6F636B203D207B7D0D0A656E640D0A6D6163726F2E7761726C6F636B2E636F2O6D6F6E73203D207B0D0A2O202O2D207370652O6C730D0A2O20617865546F2O734D6F7573656F766572203D206D6163726F2822617865546F2O734D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7761726C6F636B2E636F2O6D6F6E732E617865546F2O733A4E616D65282O292C0D0A2O20636F2O72757074696F6E4D6F7573656F766572203D206D6163726F2822636F2O72757074696F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7761726C6F636B2E636F2O6D6F6E732E636F2O72757074696F6E3A4E616D65282O292C0D0A2O207370652O6C4C6F636B4D6F7573656F766572203D206D6163726F28227370652O6C4C6F636B4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7761726C6F636B2E636F2O6D6F6E732E7370652O6C4C6F636B3A4E616D65282O292C0D0A2O20736861646F77426F6C74506574412O7461636B203D206D6163726F2822736861646F77426F6C74506574412O7461636B222C20222F636173742022202O2E207370652O6C2E7761726C6F636B2E636F2O6D6F6E732E736861646F77426F6C743A4E616D652829202O2E20225C6E2F706574612O7461636B22292C0D0A7D0D0A0D0A6D6163726F2E7761726C6F636B2E612O666C696374696F6E203D204D657267655461626C6542794B6579286D6163726F2E7761726C6F636B2E636F2O6D6F6E732C207B0D0A2O2061676F6E794D6F7573656F766572203D206D6163726F282261676F6E794D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7761726C6F636B2E612O666C696374696F6E2E61676F6E793A4E616D65282O292C0D0A2O2076696C655461696E74437572736F72203D206D6163726F282276696C655461696E74437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E7761726C6F636B2E612O666C696374696F6E2E76696C655461696E743A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E7761726C6F636B2E64656D6F6E6F6C6F6779203D204D657267655461626C6542794B6579286D6163726F2E7761726C6F636B2E636F2O6D6F6E732C207B0D0A2O2064656D6F6E626F6C74506574412O7461636B203D206D6163726F282264656D6F6E626F6C74506574412O7461636B222C20222F636173742022202O2E207370652O6C2E7761726C6F636B2E64656D6F6E6F6C6F67792E64656D6F6E626F6C743A4E616D652829202O2E20225C6E2F706574612O7461636B22292C0D0A2O20642O6F6D4D6F7573656F766572203D206D6163726F2822642O6F6D4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7761726C6F636B2E64656D6F6E6F6C6F67792E642O6F6D3A4E616D65282O292C0D0A2O206775692O6C6F74696E65437572736F72203D206D6163726F28226775692O6C6F74696E65437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E7761726C6F636B2E64656D6F6E6F6C6F67792E6775692O6C6F74696E653A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E7761726C6F636B2E6465737472756374696F6E203D204D657267655461626C6542794B6579286D6163726F2E7761726C6F636B2E636F2O6D6F6E732C207B0D0A2O206861766F634D6F7573656F766572203D206D6163726F28226861766F634D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7761726C6F636B2E6465737472756374696F6E2E6861766F633A4E616D65282O292C0D0A2O20692O6D6F6C6174654D6F7573656F766572203D206D6163726F2822692O6D6F6C6174654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E7761726C6F636B2E6465737472756374696F6E2E692O6D6F6C6174653A4E616D65282O292C0D0A2O20692O6D6F6C617465506574412O7461636B203D206D6163726F2822692O6D6F6C617465506574412O7461636B222C20222F636173742022202O2E207370652O6C2E7761726C6F636B2E6465737472756374696F6E2E692O6D6F6C6174653A4E616D652829202O2E20225C6E2F706574612O7461636B22292C0D0A2O207261696E6F6646697265437572736F72203D206D6163726F28227261696E6F6646697265437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E7761726C6F636B2E6465737472756374696F6E2E7261696E6F66466972653A4E616D65282O292C0D0A2O2073752O6D6F6E496E6665726E616C437572736F72203D206D6163726F282273752O6D6F6E496E6665726E616C437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E7761726C6F636B2E6465737472756374696F6E2E73752O6D6F6E496E6665726E616C3A4E616D65282O292C0D0A7D290D0A0D0A2O2D206D6973630D0A6170692E677561726469616E735461626C65203D207B0D0A2O202O2D7B49442C206E616D652C20737061776E54696D652C20496D7043617374732C204475726174696F6E2C206465737061776E54696D657D0D0A2O2070657473203D207B7D2C0D0A2O20696D70436F756E74203D20302C0D0A2O2066656C67756172644475726174696F6E203D20302C0D0A2O2064726561647374616C6B65724475726174696F6E203D20302C0D0A2O2064656D6F6E6963547972616E744475726174696F6E203D20302C0D0A2O2076696C656669656E644475726174696F6E203D20302C0D0A2O20696E6665726E616C203D20302C0D0A2O20626C61737068656D79203D20302C0D0A2O206461726B676C6172654475726174696F6E203D20302C0D0A0D0A2O202O2D205573656420666F722057696C6420496D707320737061776E2070726564696374696F6E0D0A2O20692O6E657244656D6F6E734E65787443617374203D20302C0D0A2O20696D7073537061776E656446726F6D486F47203D20300D0A7D0D0A6170692E7065747344617461203D207B0D0A2O205B39383033355D203D207B0D0A4O206E616D65203D202244726561647374616C6B6572222C0D0A4O206475726174696F6E203D2031322E32350D0A2O207D2C0D0A2O205B2O353635395D203D207B0D0A4O206E616D65203D202257696C6420496D70222C0D0A4O206475726174696F6E203D2032300D0A2O207D2C0D0A2O205B313433362O325D203D207B0D0A4O206E616D65203D202257696C6420496D70222C0D0A4O206475726174696F6E203D2032300D0A2O207D2C0D0A2O205B31373235325D203D207B0D0A4O206E616D65203D202246656C6775617264222C0D0A4O206475726174696F6E203D2031370D0A2O207D2C0D0A2O205B3133352O30325D203D207B0D0A4O206E616D65203D202244656D6F6E696320547972616E74222C0D0A4O206475726174696F6E203D2031350D0A2O207D2C0D0A2O205B3133353831365D203D207B0D0A4O206E616D65203D202256696C656669656E64222C0D0A4O206475726174696F6E203D2031350D0A2O207D2C0D0A2O205B38395D203D207B0D0A4O206E616D65203D2022496E6665726E616C222C0D0A4O206475726174696F6E203D2033300D0A2O207D2C0D0A2O205B31382O3538345D203D207B0D0A4O206E616D65203D2022426C61737068656D79222C0D0A4O206475726174696F6E203D20380D0A2O207D2C0D0A2O205B3130333637335D203D207B0D0A4O206E616D65203D20224461726B676C617265222C0D0A4O206475726174696F6E203D2032350D0A2O207D2C0D0A7D0D0A0D0A0D0A66756E6374696F6E206170692E5570646174655065745461626C6528290D0A2O20666F72206B65792C207065745461626C6520696E207061697273286170692E677561726469616E735461626C652E706574732920646F0D0A4O206966207065745461626C65207468656E0D0A6O202O2D2052656D6F7665206578706972656420706574730D0A6O2069662047657454696D652829203E3D207065745461626C652E6465737061776E54696D65207468656E0D0A8O206966207065745461626C652E6E616D65202O3D202257696C6420496D7022207468656E0D0A9O20206170692E677561726469616E735461626C652E696D70436F756E74203D206170692E677561726469616E735461626C652E696D70436F756E74202D20310D0A8O20656E640D0A8O206966207065745461626C652E6E616D65202O3D202246656C677561726422207468656E0D0A9O20206170692E677561726469616E735461626C652E66656C67756172644475726174696F6E203D20300D0A8O20656C73656966207065745461626C652E6E616D65202O3D202244726561647374616C6B657222207468656E0D0A9O20206170692E677561726469616E735461626C652E64726561647374616C6B65724475726174696F6E203D20300D0A8O20656C73656966207065745461626C652E6E616D65202O3D202244656D6F6E696320547972616E7422207468656E0D0A9O20206170692E677561726469616E735461626C652E64656D6F6E6963547972616E744475726174696F6E203D20300D0A8O20656C73656966207065745461626C652E6E616D65202O3D202256696C656669656E6422207468656E0D0A9O20206170692E677561726469616E735461626C652E76696C656669656E644475726174696F6E203D20300D0A8O20656C73656966207065745461626C652E6E616D65202O3D2022496E6665726E616C22207468656E0D0A9O20206170692E677561726469616E735461626C652E696E6665726E616C4475726174696F6E203D20300D0A8O20656C73656966207065745461626C652E6E616D65202O3D2022426C61737068656D7922207468656E0D0A9O20206170692E677561726469616E735461626C652E626C61737068656D794475726174696F6E203D20300D0A8O20656C73656966207065745461626C652E6E616D65202O3D20224461726B676C61726522207468656E0D0A9O20206170692E677561726469616E735461626C652E6461726B676C6172654475726174696F6E203D20300D0A8O20656E640D0A8O206170692E677561726469616E735461626C652E706574735B6B65795D203D206E696C0D0A6O20656E640D0A4O20656E640D0A4O202O2D2052656D6F766520616E7920696D702074686174206861732063617374656420612O6C206F662069747320626F6C74730D0A4O206966207065745461626C652E696D704361737473203C3D2030207468656E0D0A6O206170692E677561726469616E735461626C652E696D70436F756E74203D206170692E677561726469616E735461626C652E696D70436F756E74202D20310D0A6O206170692E677561726469616E735461626C652E706574735B6B65795D203D206E696C0D0A4O20656E640D0A4O202O2D20557064617465204475726174696F6E730D0A4O2069662047657454696D652829203C3D207065745461626C652E6465737061776E54696D65207468656E0D0A6O207065745461626C652E6475726174696F6E203D207065745461626C652E6465737061776E54696D65202D2047657454696D6528290D0A6O206966207065745461626C652E6E616D65202O3D202246656C677561726422207468656E0D0A8O206170692E677561726469616E735461626C652E66656C67756172644475726174696F6E203D207065745461626C652E6475726174696F6E0D0A6O20656C73656966207065745461626C652E6E616D65202O3D202244726561647374616C6B657222207468656E0D0A8O206170692E677561726469616E735461626C652E64726561647374616C6B65724475726174696F6E203D207065745461626C652E6475726174696F6E0D0A6O20656C73656966207065745461626C652E6E616D65202O3D202244656D6F6E696320547972616E7422207468656E0D0A8O206170692E677561726469616E735461626C652E64656D6F6E6963547972616E744475726174696F6E203D207065745461626C652E6475726174696F6E0D0A6O20656C73656966207065745461626C652E6E616D65202O3D202256696C656669656E6422207468656E0D0A8O206170692E677561726469616E735461626C652E76696C656669656E644475726174696F6E203D207065745461626C652E6475726174696F6E0D0A6O20656C73656966207065745461626C652E6E616D65202O3D2022496E6665726E616C22207468656E0D0A8O206170692E677561726469616E735461626C652E696E6665726E616C4475726174696F6E203D207065745461626C652E6475726174696F6E0D0A6O20656C73656966207065745461626C652E6E616D65202O3D2022426C617370687922207468656E0D0A8O206170692E677561726469616E735461626C652E626C61737068656D794475726174696F6E203D207065745461626C652E6475726174696F6E0D0A6O20656C73656966207065745461626C652E6E616D65202O3D20224461726B676C61726522207468656E0D0A8O206170692E677561726469616E735461626C652E6461726B676C6172654475726174696F6E203D207065745461626C652E6475726174696F6E0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A0D0A6170692E736F756C536861726473203D20300D0A66756E6374696F6E206170692E557064617465536F756C53686172647328290D0A2O206170692E736F756C536861726473203D20706C617965723A536F756C53686172647328290D0A656E640D0A0D0A66756E6374696F6E206170692E52656769737465725761726C6F636B28290D0A2O206170693A5265676973746572466F7253656C66436F6D6261744576656E74280D0A6O2066756E6374696F6E283O2E290D0A8O206C6F63616C205F2C206576656E742C205F2C205F2C205F2C205F2C205F2C20756E6974506574475549442C205F2C205F2C205F2C207370652O6C4944203D2073656C65637428312C203O2E290D0A8O206C6F63616C205F2C205F2C205F2C205F2C205F2C205F2C205F2C20756E69745065744944203D20737472696E672E66696E6428756E6974506574475549442C20222825532B292D2825642B292D2825642B292D2825642B292D2825642B292D2825642B292D2825532B2922290D0A8O20756E69745065744944203D20746F6E756D62657228756E69745065744944290D0A0D0A8O202O2D20412O64207065740D0A8O2069662028756E697450657447554944207E3D20556E6974475549442822706574222920616E64206576656E74202O3D20225350452O4C5F53552O4D4F4E2220616E64206170692E70657473446174615B756E697450657449445D29207468656E0D0A9O20206C6F63616C2073752O6D6F6E6564506574203D206170692E70657473446174615B756E697450657449445D0D0A9O20206C6F63616C207065744475726174696F6E0D0A9O202069662073752O6D6F6E65645065742E6E616D65202O3D202257696C6420496D7022207468656E0D0A9O203O206170692E677561726469616E735461626C652E696D70436F756E74203D206170692E677561726469616E735461626C652E696D70436F756E74202B20310D0A9O203O207065744475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O2020656C736569662073752O6D6F6E65645065742E6E616D65202O3D202246656C677561726422207468656E0D0A9O203O206170692E677561726469616E735461626C652E66656C67756172644475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O203O207065744475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O2020656C736569662073752O6D6F6E65645065742E6E616D65202O3D202244726561647374616C6B657222207468656E0D0A9O203O206170692E677561726469616E735461626C652E64726561647374616C6B65724475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O203O207065744475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O2020656C736569662073752O6D6F6E65645065742E6E616D65202O3D202244656D6F6E696320547972616E7422207468656E0D0A9O203O20696620287370652O6C4944202O3D2032363531383729207468656E0D0A9O205O206170692E677561726469616E735461626C652E64656D6F6E6963547972616E744475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O205O207065744475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O203O20656E640D0A9O2020656C736569662073752O6D6F6E65645065742E6E616D65202O3D202256696C656669656E6422207468656E0D0A9O203O206170692E677561726469616E735461626C652E76696C656669656E644475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O203O207065744475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O2020656C736569662073752O6D6F6E65645065742E6E616D65202O3D2022496E6665726E616C22207468656E0D0A9O203O206170692E677561726469616E735461626C652E696E6665726E616C4475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O203O207065744475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O2020656C736569662073752O6D6F6E65645065742E6E616D65202O3D2022426C61737068656D7922207468656E0D0A9O203O206170692E677561726469616E735461626C652E626C61737068656D794475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O203O207065744475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O2020656C736569662073752O6D6F6E65645065742E6E616D65202O3D20224461726B676C61726522207468656E0D0A9O203O206170692E677561726469616E735461626C652E6461726B676C6172654475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O203O207065744475726174696F6E203D2073752O6D6F6E65645065742E6475726174696F6E0D0A9O2020656E640D0A9O20206C6F63616C207065745461626C65203D207B0D0A9O203O206964203D20756E6974506574475549442C0D0A9O203O206E616D65203D2073752O6D6F6E65645065742E6E616D652C0D0A9O203O20737061776E54696D65203D2047657454696D6528292C0D0A9O203O20696D704361737473203D20352C0D0A9O203O206475726174696F6E203D207065744475726174696F6E2C0D0A9O203O206465737061776E54696D65203D2047657454696D652829202B20746F6E756D626572287065744475726174696F6E290D0A9O20207D0D0A9O20207461626C652E696E73657274286170692E677561726469616E735461626C652E706574732C207065745461626C65290D0A8O20656E640D0A0D0A8O202O2D20412O64203135207365636F6E647320616E64203720636173747320746F20612O6C2070657473207768656E20547972616E7420697320636173740D0A8O206966206170692E70657473446174615B756E697450657449445D20616E64206170692E70657473446174615B756E697450657449445D2E6E616D65202O3D202244656D6F6E696320547972616E7422207468656E0D0A9O2020666F72206B65792C207065745461626C6520696E207061697273286170692E677561726469616E735461626C652E706574732920646F0D0A9O203O20696620287065745461626C6520616E64207065745461626C652E6E616D65207E3D202244656D6F6E696320547972616E742229207468656E0D0A9O205O207065745461626C652E6465737061776E54696D65203D207065745461626C652E6465737061776E54696D65202B2031350D0A9O205O207065745461626C652E696D704361737473203D207065745461626C652E696D704361737473202B20370D0A9O203O20656E640D0A9O2020656E640D0A8O20656E640D0A0D0A8O202O2D20557064617465207768656E206E6578742057696C6420496D702077692O6C20737061776E2066726F6D20492O6E65722044656D6F6E732074616C656E740D0A8O20696620756E69745065744944202O3D20313433362O32207468656E0D0A9O20206170692E677561726469616E735461626C652E692O6E657244656D6F6E734E65787443617374203D2047657454696D652829202B2031320D0A8O20656E640D0A0D0A8O202O2D205570646174657320686F77206D616E792057696C6420496D707320686176652079657420746F20737061776E2066726F6D20486F4720636173740D0A8O20696620756E69745065744944202O3D202O3536353920616E64206170692E677561726469616E735461626C652E696D7073537061776E656446726F6D486F47203E2030207468656E0D0A9O20206170692E677561726469616E735461626C652E696D7073537061776E656446726F6D486F47203D206170692E677561726469616E735461626C652E696D7073537061776E656446726F6D486F47202D20310D0A8O20656E640D0A0D0A8O202O2D205570646174652074686520706574207461626C650D0A8O206170692E5570646174655065745461626C6528290D0A6O20656E640D0A2O202C20225350452O4C5F53552O4D4F4E220D0A2O202C20225350452O4C5F434153545F53552O43452O53220D0A2O20290D0A0D0A2O202O2D2044656372656D656E7420496D70436173747320616E6420496D706C6F73696F6E204C697374656E65720D0A2O206170693A5265676973746572466F72436F6D6261744576656E74280D0A6O2066756E6374696F6E283O2E290D0A8O206C6F63616C20736F75726365475549442C205F2C205F2C205F2C205F2C205F2C205F2C205F2C207370652O6C4944203D2073656C65637428342C203O2E290D0A0D0A8O202O2D20436865636B20666F7220696D7020626F6C742063617374730D0A8O206966207370652O6C4944202O3D20313034333138207468656E0D0A9O2020666F72205F2C207065745461626C6520696E207061697273286170692E677561726469616E735461626C652E706574732920646F0D0A9O203O20696620736F7572636547554944202O3D207065745461626C652E6964207468656E0D0A9O205O207065745461626C652E696D704361737473203D207065745461626C652E696D704361737473202D20310D0A9O203O20656E640D0A9O2020656E640D0A8O20656E640D0A0D0A8O202O2D20436C6561722074686520696D70207461626C652075706F6E20496D706C6F73696F6E20636173740D0A8O20696620736F7572636547554944202O3D20706C617965723A47554944282920616E64207370652O6C4944202O3D20313936322O37207468656E0D0A9O2020666F72206B65792C207065745461626C6520696E207061697273286170692E677561726469616E735461626C652E706574732920646F0D0A9O203O206966207065745461626C652E6E616D65202O3D202257696C6420496D7022207468656E0D0A9O205O206170692E677561726469616E735461626C652E706574735B6B65795D203D206E696C0D0A9O203O20656E640D0A9O2020656E640D0A9O20206170692E677561726469616E735461626C652E696D70436F756E74203D20300D0A8O20656E640D0A0D0A8O202O2D205570646174652074686520696D70207461626C650D0A8O206170692E5570646174655065745461626C6528290D0A6O20656E640D0A2O202C20225350452O4C5F434153545F53552O43452O53220D0A2O20290D0A0D0A2O202O2D204F6E2053752O63652O7366756C20486F47206361737420612O6420686F77206D616E7920496D70732077692O6C20737061776E0D0A2O206170693A5265676973746572466F7253656C66436F6D6261744576656E74280D0A6O2066756E6374696F6E285F2C206576656E742C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C205F2C207370652O6C4944290D0A8O206966207370652O6C4944202O3D20313035313734207468656E0D0A9O20206170692E677561726469616E735461626C652E696D7073537061776E656446726F6D486F47203D206170692E677561726469616E735461626C652E696D7073537061776E656446726F6D486F47202B20286170692E736F756C536861726473203E3D203320616E642033206F72206170692E736F756C536861726473290D0A8O20656E640D0A6O20656E640D0A2O202C20225350452O4C5F434153545F53552O43452O53220D0A2O20290D0A656E640D0A00063O0012053O00013O00120B000100024O00093O000200022O000100016O00045O00012O00033O00017O00",v9(),...);