local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then if (v85[3]=="_ENV") then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86==1) then do return;end else local v121=v85[2];v83[v121](v13(v83,v121 + 1 ,v78));end elseif (v86<=3) then local v111=v85[2];v83[v111]=v83[v111](v83[v111 + 1 ]);elseif (v86>4) then local v122=v85[2];v78=(v122 + v84) -1 ;for v132=v122,v78 do local v133=v79[v132-v122 ];v83[v132]=v133;end else local v123=v85[2];v83[v123]=v83[v123](v83[v123 + 1 ]);end elseif (v86<=8) then if (v86<=6) then do return;end elseif (v86==7) then local v125=v85[2];v83[v125](v13(v83,v125 + 1 ,v78));else v83[v85[2]]=v85[3];end elseif (v86<=9) then local v113=v85[2];v78=(v113 + v84) -1 ;for v115=v113,v78 do local v116=v79[v115-v113 ];v83[v115]=v116;end elseif (v86==10) then v83[v85[2]]=v85[3];elseif (v85[3]=="_ENV") then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703FA292O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206D756C74695370652O6C203D206170692E6D756C74695370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C0D0A6966206E6F74207370652O6C2E6D6F6E6B207468656E0D0A2O207370652O6C2E6D6F6E6B203D207B7D0D0A656E640D0A7370652O6C2E6D6F6E6B2E636F2O6D6F6E73203D207B0D0A2O202O2D2072616369616C730D0A2O20616E6365737472616C43612O6C203D207370652O6C28323734373338292C0D0A2O20617263616E65546F2O72656E74203D207370652O6C28313239353937292C0D0A2O206261676F66547269636B73203D207370652O6C28333132342O31292C0D0A2O206265727365726B696E67203D207370652O6C283236323937292C0D0A2O20626C2O6F6446757279203D207370652O6C283230353732292C0D0A2O20676966746F667468654E2O617275203D207370652O6C283539353437292C0D0A2O2066697265626C2O6F64203D207370652O6C283236352O3231292C0D0A2O206C69676874734A7564676D656E74203D207370652O6C28322O35363437292C0D0A2O207175616B696E6750616C6D203D207370652O6C28313037303739292C0D0A2O20736861646F776D656C64203D207370652O6C283538393834292C0D0A2O202O2D206162696C69746965730D0A2O20637261636B6C696E674A6164654C696768746E696E67203D207370652O6C282O3137393532292C0D0A2O20657870656C4861726D203D207370652O6C28332O32313031292C0D0A2O206C656753772O6570203D207370652O6C282O3139333831292C0D0A2O2070726F766F6B65203D207370652O6C282O312O353436292C0D0A2O207265737573636974617465203D207370652O6C282O3135313738292C0D0A2O20726973696E6753756E4B69636B203D207370652O6C28313037343238292C0D0A2O20726F2O6C203D207370652O6C28313039313332292C0D0A2O20746967657250616C6D203D207370652O6C28312O30373830292C0D0A2O20746F7563686F664465617468203D207370652O6C28332O32313039292C0D0A2O207472616E7363656E64656E6365203D207370652O6C28313031363433292C0D0A2O207472616E7363656E64656E63655472616E73666572203D207370652O6C282O313O3936292C0D0A2O20766976696679203D207370652O6C282O312O363730292C0D0A2O202O2D2074616C656E74730D0A2O20626F6E656475737442726577203D207370652O6C28333836323736292C0D0A2O2063656C6572697479203D207370652O6C282O3135313733292C0D0A2O206368694275727374203D207370652O6C28313233393836292C0D0A2O20636869546F727065646F203D207370652O6C282O31352O3038292C0D0A2O2063686957617665203D207370652O6C282O3135303938292C0D0A2O2064616D70656E4861726D203D207370652O6C28313O323738292C0D0A2O206465746F78203D207370652O6C28323138313634292C0D0A2O2064697361626C65203D207370652O6C282O3136303935292C0D0A2O2064692O667573654D61676963203D207370652O6C28312O32373833292C0D0A2O206579656F667468655469676572203D207370652O6C2831392O363037292C0D0A2O2066617374462O6574203D207370652O6C28333O383039292C0D0A2O20696D70546F7563686F664465617468203D207370652O6C28332O322O3133292C0D0A2O20692O6E6572537472656E67746842752O66203D207370652O6C28323631373639292C0D0A2O20706172616C79736973203D207370652O6C282O3135303738292C0D0A2O2072696E674F665065616365203D207370652O6C282O3136382O34292C0D0A2O2072757368696E674A61646557696E64203D207370652O6C282O3136383437292C0D0A2O20737065617248616E64537472696B65203D207370652O6C282O3136373035292C0D0A2O20737472656E6774686F66537069726974203D207370652O6C28333837323736292C0D0A2O2073752O6D6F6E57686974655469676572537461747565203D207370652O6C28332O38363836292C0D0A2O2074696765725461696C53772O6570203D207370652O6C28323634333438292C0D0A2O207469676572734C757374203D207370652O6C282O3136383431292C0D0A2O202O2D2062752O66730D0A2O20626F6E65647573744272657742752O66203D207370652O6C28333836323736292C0D0A2O2064616D70656E4861726D42752O66203D207370652O6C28313O323738292C0D0A2O2072757368696E674A61646557696E6442752O66203D207370652O6C282O3136383437292C0D0A2O202O2D20646562752O66730D0A2O20626F6E656475737442726577446562752O66203D207370652O6C28333836323736292C0D0A2O202O2D206974656D20652O66656374730D0A2O2063612O6C746F446F6D696E616E636542752O66203D207370652O6C2834302O333830292C202O2D206E656C74686172696F6E207472696E6B65742062752O660D0A2O20746865456D7065726F7273436170616369746F7242752O66203D207370652O6C28323335303534292C0D0A2O202O2D206D6973630D0A2O20702O6F6C456E65726779203D207370652O6C284O393130292C0D0A2O2073746F70466F46203D207370652O6C28333633363533290D0A7D0D0A0D0A7370652O6C2E6D6F6E6B2E77696E6477616C6B6572203D204D657267655461626C6542794B6579287370652O6C2E6D6F6E6B2E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O20626C61636B6F75744B69636B203D207370652O6C28312O30373834292C0D0A2O20666C79696E6753657270656E744B69636B203D207370652O6C28313031353435292C0D0A2O20666C79696E6753657270656E744B69636B4C616E64203D207370652O6C282O3135303537292C0D0A2O207370692O6E696E674372616E654B69636B203D207370652O6C28313031353436292C0D0A2O202O2D2074616C656E74730D0A2O206372616E65566F72746578203D207370652O6C28333O383438292C0D0A2O206472696E6B696E67486F726E436F766572203D207370652O6C28333931333730292C0D0A2O206661656C696E654861726D6F6E79203D207370652O6C28333931343132292C0D0A2O206661656C696E6553746F6D70203D207370652O6C28332O38313933292C0D0A2O2066697374736F6646757279203D207370652O6C282O3133363536292C0D0A2O20686974436F6D626F203D207370652O6C28313936373430292C0D0A2O20696E766F6B655875656E54686557686974655469676572203D207370652O6C28313233393034292C0D0A2O206A61646549676E6974696F6E203D207370652O6C28333932393739292C0D0A2O206D61726B6F667468654372616E65203D207370652O6C282O3230333537292C0D0A2O20736572656E697479203D207370652O6C28313532313733292C0D0A2O20736861646F77626F78696E67547265616473203D207370652O6C28333932393832292C0D0A2O20736B797265616368203D207370652O6C283339322O3931292C0D0A2O20736B79746F756368203D207370652O6C28343035302O34292C0D0A2O2073746F726D4561727468416E6446697265203D207370652O6C28313337363339292C0D0A2O2073746F726D4561727468416E6446697265466978617465203D207370652O6C282O32312O3731292C0D0A2O20737472696B656F6674686557696E646C6F7264203D207370652O6C28333932393833292C0D0A2O207465616368696E67736F667468654D6F6E617374657279203D207370652O6C282O312O363435292C0D0A2O207468756E64657266697374203D207370652O6C28333932393835292C0D0A2O20776869726C696E67447261676F6E50756E6368203D207370652O6C28313532313735292C0D0A2O207875656E7342612O746C6567656172203D207370652O6C283339322O3933292C0D0A2O202O2D20646566656E736976650D0A2O20666F7274696679696E6742726577203D207370652O6C28323433343335292C0D0A2O20746F7563686F664B61726D61203D207370652O6C28312O32343730292C0D0A2O202O2D2062752O66730D0A2O20626C61636B6F75744B69636B42752O66203D207370652O6C282O3136373638292C0D0A2O20636869456E6572677942752O66203D207370652O6C28333933303537292C0D0A2O2064616E63656F664368696A6942752O66203D207370652O6C28333235323032292C0D0A2O2068692O64656E4D617374657273466F7262692O64656E546F75636842752O66203D207370652O6C283231332O3134292C0D0A2O20686974436F6D626F42752O66203D207370652O6C28313936373431292C0D0A2O20696E766F6B65727344656C6967687442752O66203D207370652O6C28332O382O3633292C0D0A2O20706F776572537472696B657342752O66203D207370652O6C2831322O393134292C0D0A2O207072652O73757265506F696E7442752O66203D207370652O6C282O3337343832292C0D0A2O20736572656E69747942752O66203D207370652O6C28313532313733292C0D0A2O2073746F726D4561727468416E644669726542752O66203D207370652O6C28313337363339292C0D0A2O207465616368696E67736F667468654D6F6E61737465727942752O66203D207370652O6C28323032303930292C0D0A2O20776869726C696E67447261676F6E50756E636842752O66203D207370652O6C28313936373432292C0D0A2O202O2D20646562752O66730D0A2O206661654578706F73757265446562752O66203D207370652O6C28333935343134292C0D0A2O206D61726B6F667468654372616E65446562752O66203D207370652O6C282O3238323837292C0D0A2O20736B79726561636843726974446562752O66203D207370652O6C28333933303437292C0D0A2O20736B79726561636845786861757374696F6E446562752O66203D207370652O6C28333933303530292C0D0A2O202O2D207469657220323920652O66656374730D0A2O206B69636B736F66466C6F77696E674D6F6D656E74756D42752O66203D207370652O6C28333934392O34292C0D0A2O2066697374736F66466C6F77696E674D6F6D656E74756D42752O66203D207370652O6C28333934393439292C0D0A7D290D0A0D0A7370652O6C2E6D6F6E6B2E627265776D6173746572203D204D657267655461626C6542794B6579287370652O6C2E6D6F6E6B2E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O20626C61636B6F75744B69636B203D207370652O6C2832302O353233292C0D0A2O20636C617368203D207370652O6C28333234333132292C0D0A2O206B6567536D617368203D207370652O6C28313231323533292C0D0A2O207370692O6E696E674372616E654B69636B203D207370652O6C28332O32373239292C0D0A2O202O2D2074616C656E74730D0A2O20626C61636B6F7574436F6D626F203D207370652O6C28313936373336292C0D0A2O20626C61636B4F7842726577203D207370652O6C282O3135332O39292C0D0A2O206272656174686F6646697265203D207370652O6C282O3135313831292C0D0A2O20626F62416E645765617665203D207370652O6C28323830353135292C0D0A2O2063656C65737469616C466C616D6573203D207370652O6C28333235312O37292C0D0A2O206368612O72656450612O73696F6E73203D207370652O6C28333836393635292C0D0A2O206578706C6F64696E674B6567203D207370652O6C28333235313533292C0D0A2O2068696768546F6C6572616E6365203D207370652O6C28313936373337292C0D0A2O20696D70726F766564496E766F6B654E69757A616F203D207370652O6C28332O32373430292C0D0A2O20696E766F6B654E69757A616F546865426C61636B4F78203D207370652O6C28313332353738292C0D0A2O206B6567536D617368203D207370652O6C28313231323533292C0D0A2O206C6967687442726577696E67203D207370652O6C28333235303933292C0D0A2O207072652O73746865416476616E74616765203D207370652O6C28343138333539292C0D0A2O207368752O666C65203D207370652O6C28332O32313230292C0D0A2O207370656369616C44656C6976657279203D207370652O6C28313936373330292C0D0A2O207370656369616C44656C6976657279203D207370652O6C28313936373330292C0D0A2O2073752O6D6F6E426C61636B4F78537461747565203D207370652O6C282O3135333135292C0D0A2O20776561706F6E736F664F72646572203D207370652O6C28333837313834292C0D0A2O202O2D20646566656E736976650D0A2O2063656C65737469616C42726577203D207370652O6C28332O32353037292C0D0A2O20666F7274696679696E6742726577203D207370652O6C282O3135323033292C0D0A2O20707572696679696E6742726577203D207370652O6C282O3139353832292C0D0A2O202O2D2042752O66730D0A2O20626C61636B6F7574436F6D626F42752O66203D207370652O6C282O3238353633292C0D0A2O206368612O72656450612O73696F6E7342752O66203D207370652O6C28333836393633292C0D0A2O20656C7573697665427261776C657242752O66203D207370652O6C28313935363330292C0D0A2O20666F7274696679696E674272657742752O66203D207370652O6C28313230393534292C0D0A2O207072652O73746865416476616E7461676542752O66203D207370652O6C28343138333631292C0D0A2O20776561706F6E736F664F7264657242752O66203D207370652O6C28333837313834292C0D0A2O202O2D20446562752O66730D0A2O206272656174686F6646697265446F74446562752O66203D207370652O6C28313233373235292C0D0A2O20776561706F6E736F664F72646572446562752O66203D207370652O6C28333837313739292C0D0A2O202O2D207374612O676572206C6576656C730D0A2O2068656176795374612O676572203D207370652O6C28313234323733292C0D0A2O206D6F6465726174655374612O676572203D207370652O6C28313234323734292C0D0A2O206C696768745374612O676572203D207370652O6C28313234323735292C0D0A7D290D0A0D0A7370652O6C2E6D6F6E6B2E6D697374776561766572203D204D657267655461626C6542794B6579287370652O6C2E6D6F6E6B2E636F2O6D6F6E732C207B0D0A2O202O2D206162696C69746965730D0A2O20626C61636B6F75744B69636B203D207370652O6C28312O30373834292C0D0A2O206465746F78203D207370652O6C282O3135343530292C0D0A2O20656E76656C6F70696E674D697374203D207370652O6C28313234363832292C0D0A2O20652O73656E6365466F6E74203D207370652O6C28313931383337292C0D0A2O20652O73656E6365466F6E7442752O66203D207370652O6C28313931383430292C0D0A2O206661656C696E6553746F6D70203D207370652O6C28332O38313933292C0D0A2O20666F7274696679696E6742726577203D207370652O6C282O3135323033292C0D0A2O206C696665436F632O6F6E203D207370652O6C282O3136383439292C0D0A2O206865616C696E67456C69786972203D207370652O6C28313O323831292C0D0A2O2072656E6577696E674D697374203D207370652O6C282O3135313531292C0D0A2O2072656E6577696E674D69737442752O66203D207370652O6C282O3139362O31292C0D0A2O2072656177616B656E203D207370652O6C28323132303531292C0D0A2O20726573746F72616C203D207370652O6C28332O38363135292C0D0A2O207265766976616C203D207370652O6C282O3135333130292C0D0A2O20732O6F7468696E674D697374203D207370652O6C282O3135313735292C0D0A2O207370692O6E696E674372616E654B69636B203D207370652O6C28313031353436292C0D0A2O207465616368696E67734F665468654D6F6E61737465727942752O66203D207370652O6C28323032303930292C0D0A2O207468756E646572466F637573546561203D207370652O6C282O312O363830292C0D0A2O202O2D2074616C656E74730D0A2O20616E6369656E745465616368696E6773203D207370652O6C28332O38303233292C0D0A2O20616E6369656E745465616368696E677342752O66203D207370652O6C28332O38303236292C0D0A2O206177616B656E65644661656C696E65203D207370652O6C28333839333837292C0D0A2O20696E766F6B654368694A695468655265644372616E65203D207370652O6C28333235313937292C0D0A2O20696E766F6B6559756C6F6E5468654A61646553657270656E74203D207370652O6C28332O322O3138292C0D0A2O206C6966656379636C6573456E76656C6F70696E674D69737442752O66203D207370652O6C28313937393139292C0D0A2O206C6966656379636C657356697669667942752O66203D207370652O6C28313937393136292C0D0A2O20696D70726F7665644465746F78203D207370652O6C28333O383734292C0D0A2O206D616E61546561203D207370652O6C282O3135323934292C0D0A2O20726170696444692O667573696F6E203D207370652O6C28333O383437292C0D0A2O2072656672657368696E674A61646557696E64203D207370652O6C28313936373235292C0D0A2O20726973696E674D697374203D207370652O6C28323734393039292C0D0A2O20736563726574496E667573696F6E203D207370652O6C28332O38343931292C0D0A2O207368616F68616F734C652O736F6E73203D207370652O6C28343O303839292C0D0A2O20736865696C756E7347696674203D207370652O6C28332O39343931292C0D0A2O20736F6E676F664368694A69203D207370652O6C2831392O383938292C0D0A2O2073752O6D6F6E4A61646553657270656E74537461747565203D207370652O6C282O3135333133292C0D0A2O207669766163696F7573566976696669636174696F6E42752O66203D207370652O6C283339322O3833292C0D0A2O207A656E50756C7365203D207370652O6C28313234303831292C0D0A7D290D0A0D0A2O2D206974656D730D0A6966206E6F74206974656D2E6D6F6E6B207468656E0D0A2O206974656D2E6D6F6E6B203D207B7D0D0A656E640D0A6974656D2E6D6F6E6B2E636F2O6D6F6E73203D207B0D0A7D0D0A0D0A6974656D2E6D6F6E6B2E77696E6477616C6B6572203D204D657267655461626C6542794B6579286974656D2E6D6F6E6B2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E6D6F6E6B2E627265776D6173746572203D204D657267655461626C6542794B6579286974656D2E6D6F6E6B2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E6D6F6E6B2E6D697374776561766572203D204D657267655461626C6542794B6579286974656D2E6D6F6E6B2E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F0D0A6966206E6F74206D6163726F2E6D6F6E6B207468656E0D0A2O206D6163726F2E6D6F6E6B203D207B7D0D0A656E640D0A6D6163726F2E6D6F6E6B2E636F2O6D6F6E73203D207B0D0A2O202O2D206D6973630D0A2O2073746F7043617374696E67203D206D6163726F282273746F7043617374696E67222C20222F73746F7063617374696E6722292C0D0A2O202O2D207370652O6C730D0A2O20626F6E656475737442726577506C61796572203D206D6163726F2822626F6E656475737442726577506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E6D6F6E6B2E636F2O6D6F6E732E626F6E6564757374427265773A4E616D65282O292C0D0A2O206465746F78466F637573203D206D6163726F28226465746F78466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E6D6F6E6B2E636F2O6D6F6E732E6465746F783A4E616D65282O292C0D0A2O206465746F784D6F7573656F766572203D206D6163726F28226465746F784D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6F6E6B2E636F2O6D6F6E732E6465746F783A4E616D65282O292C0D0A2O20706172616C797369734D6F7573656F766572203D206D6163726F2822706172616C797369734D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6F6E6B2E636F2O6D6F6E732E706172616C797369733A4E616D65282O292C0D0A2O2072657375736369746174654D6F7573656F766572203D206D6163726F282272657375736369746174654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6F6E6B2E636F2O6D6F6E732E72657375736369746174653A4E616D65282O292C0D0A2O2072696E676F665065616365437572736F72203D206D6163726F282272696E676F665065616365437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E6D6F6E6B2E636F2O6D6F6E732E72696E674F6650656163653A4E616D65282O292C0D0A2O20726973696E6753756E4B69636B4D6F7573656F766572203D206D6163726F2822726973696E6753756E4B69636B4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6F6E6B2E636F2O6D6F6E732E726973696E6753756E4B69636B3A4E616D65282O292C0D0A2O20737065617248616E64537472696B654D6F7573656F766572203D206D6163726F2822737065617248616E64537472696B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6F6E6B2E636F2O6D6F6E732E737065617248616E64537472696B653A4E616D65282O292C0D0A2O2073752O6D6F6E57686974655469676572537461747565506C61796572203D206D6163726F282273752O6D6F6E57686974655469676572537461747565506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E6D6F6E6B2E636F2O6D6F6E732E73752O6D6F6E576869746554696765725374617475653A4E616D65282O292C0D0A2O20746967657250616C6D4D6F7573656F766572203D206D6163726F2822746967657250616C6D4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6F6E6B2E636F2O6D6F6E732E746967657250616C6D3A4E616D65282O292C0D0A2O20766976696679466F637573203D206D6163726F2822766976696679466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E6D6F6E6B2E636F2O6D6F6E732E7669766966793A4E616D65282O292C0D0A2O207669766966794D6F7573656F766572203D206D6163726F28227669766966794D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6F6E6B2E636F2O6D6F6E732E7669766966793A4E616D65282O292C0D0A7D0D0A0D0A6D6163726F2E6D6F6E6B2E77696E6477616C6B6572203D204D657267655461626C6542794B6579286D6163726F2E6D6F6E6B2E636F2O6D6F6E732C207B0D0A2O20626C61636B6F75744B69636B4D6F7573656F766572203D206D6163726F2822626C61636B6F75744B69636B4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6F6E6B2E77696E6477616C6B65722E626C61636B6F75744B69636B3A4E616D65282O292C0D0A2O20737472696B656F6674686557696E646C6F72644D6F7573656F766572203D206D6163726F2822737472696B656F6674686557696E646C6F72644D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6F6E6B2E77696E6477616C6B65722E737472696B656F6674686557696E646C6F72643A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E6D6F6E6B2E627265776D6173746572203D204D657267655461626C6542794B6579286D6163726F2E6D6F6E6B2E636F2O6D6F6E732C207B0D0A2O206578706C6F64696E674B6567506C61796572203D206D6163726F28226578706C6F64696E674B6567506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E6D6F6E6B2E627265776D61737465722E6578706C6F64696E674B65673A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E6D6F6E6B2E6D697374776561766572203D204D657267655461626C6542794B6579286D6163726F2E6D6F6E6B2E636F2O6D6F6E732C207B0D0A2O20656E76656C6F70696E674D697374466F637573203D206D6163726F2822656E76656C6F70696E674D697374466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E656E76656C6F70696E674D6973743A4E616D65282O292C0D0A2O206C696665436F632O6F6E466F637573203D206D6163726F28226C696665436F632O6F6E466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E6C696665436F632O6F6E3A4E616D65282O292C0D0A2O206C696665436F632O6F6E4D6F7573656F766572203D206D6163726F28226C696665436F632O6F6E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E6C696665436F632O6F6E3A4E616D65282O292C0D0A2O206C696665436F632O6F6E506C61796572203D206D6163726F28226C696665436F632O6F6E506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E6C696665436F632O6F6E3A4E616D65282O292C0D0A2O2072656E6577696E674D697374466F637573203D206D6163726F282272656E6577696E674D697374466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E72656E6577696E674D6973743A4E616D65282O292C0D0A2O20736865696C756E7347696674466F637573203D206D6163726F2822736865696C756E7347696674466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E736865696C756E73476966743A4E616D65282O292C0D0A2O20732O6F7468696E674D697374466F637573203D206D6163726F2822732O6F7468696E674D697374466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E732O6F7468696E674D6973743A4E616D65282O292C0D0A2O2073752O6D6F6E4A61646553657270656E74537461747565506C61796572203D206D6163726F282273752O6D6F6E4A61646553657270656E74537461747565506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E73752O6D6F6E4A61646553657270656E745374617475653A4E616D65282O292C0D0A2O20746674456E76656C6F70696E674D697374466F637573203D206D6163726F2822746674456E76656C6F70696E674D697374466F637573222C20222F636173742022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E7468756E646572466F6375735465613A4E616D652829202O2E20225C6E22202O2E20222F63617374205B40666F6375735D2022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E656E76656C6F70696E674D6973743A4E616D65282O292C0D0A2O20746674452O73656E6365466F6E74203D206D6163726F2822746674452O73656E6365466F6E74222C20222F636173742022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E7468756E646572466F6375735465613A4E616D652829202O2E20225C6E22202O2E20222F636173742022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E652O73656E6365466F6E743A4E616D65282O292C0D0A2O207A656E50756C7365466F637573203D206D6163726F28227A656E50756C7365466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E7A656E50756C73653A4E616D65282O292C0D0A2O207A656E50756C7365506C61796572203D206D6163726F28227A656E50756C7365506C61796572222C20222F63617374205B40706C617965725D2022202O2E207370652O6C2E6D6F6E6B2E6D6973747765617665722E7A656E50756C73653A4E616D65282O292C0D0A7D290D0A00063O00120B3O00013O001208000100024O00043O000200022O000900016O00075O00012O00013O00017O00",v9(),...);