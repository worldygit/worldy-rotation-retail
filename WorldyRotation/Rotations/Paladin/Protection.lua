local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110](v13(v83,v110 + 1 ,v78));elseif (v86==1) then local v112;local v113;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v113=v85[2];v83[v113]=v83[v113](v83[v113 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v113=v85[2];v78=(v113 + v84) -1 ;for v125=v113,v78 do v112=v79[v125-v113 ];v83[v125]=v112;end v77=v77 + 1 ;v85=v73[v77];v113=v85[2];v83[v113](v13(v83,v113 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else do return;end end elseif (v86<=4) then if (v86==3) then local v119=v85[2];v78=(v119 + v84) -1 ;for v128=v119,v78 do local v129=v79[v128-v119 ];v83[v128]=v129;end else v83[v85[2]]=v85[3];end elseif (v86>5) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v122=v85[2];v83[v122]=v83[v122](v83[v122 + 1 ]);end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E670387382O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A2O2D206170692066756E6374696F6E730D0A6C6F63616C20412O6441706C203D206170692E412O6441706C0D0A6C6F63616C205072696E744465627567203D206170692E5072696E7444656275670D0A6C6F63616C2047657453652O74696E6773203D206170692E47657453652O74696E67730D0A6C6F63616C20416F454F6E203D206170692E416F454F6E0D0A6C6F63616C204344734F6E203D206170692E4344734F6E0D0A6C6F63616C204F70656E65724F6E203D206170692E4F70656E65724F6E0D0A6C6F63616C2052616369616C734F6E203D206170692E52616369616C734F6E0D0A6C6F63616C2048616E646C65412O666C69637465644F6E203D206170692E48616E646C65412O666C69637465644F6E0D0A6C6F63616C2048616E646C65496E636F72706F7265616C4F6E203D206170692E48616E646C65496E636F72706F7265616C4F6E0D0A6C6F63616C2042696E64203D206170692E42696E640D0A6C6F63616C2043617374203D206170692E436173740D0A6C6F63616C20436173744379636C65203D206170692E436173744379636C650D0A0D0A2O2D2061706920636C612O7365730D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C20756E6974203D206170692E756E69740D0A6C6F63616C20706C61796572203D20756E69742E706C617965720D0A6C6F63616C20746172676574203D20756E69742E7461726765740D0A6C6F63616C20666F637573203D20756E69742E666F6375730D0A6C6F63616C206D6F7573656F766572203D20756E69742E6D6F7573656F7665720D0A0D0A2O2D20646566696E65730D0A6C6F63616C2073203D207370652O6C2E70616C6164696E2E70726F74656374696F6E0D0A6C6F63616C2069203D206974656D2E70616C6164696E2E70726F74656374696F6E0D0A6C6F63616C206D203D206D6163726F2E70616C6164696E2E70726F74656374696F6E0D0A0D0A6C6F63616C20737065634964203D202O360D0A6C6F63616C2061706C4E616D65203D202264656661756C74220D0A6C6F63616C2064656661756C7453652O74696E6773203D207B0D0A2O20656E61626C6564203D207B0D0A4O206F75744F66436F6D6261744865616C696E67203D20747275652C0D0A2O207D2C0D0A2O206870203D207B0D0A4O20617264656E74446566656E646572203D2036302C0D0A4O20646976696E65536869656C64203D2032352C0D0A4O20677561726469616E6F66416E6369656E744B696E6773203D2034302C0D0A4O206C61796F6E48616E6473203D2032302C0D0A4O20736869656C646F667468655269676874656F7573203D2037302C0D0A4O20776F72646F66476C6F7279203D2035302C0D0A2O207D2C0D0A7D0D0A6C6F63616C2073652O74696E67730D0A0D0A2O2D20766172730D0A6C6F63616C206F6E5573654578636C75646573203D207B7D0D0A6C6F63616C2073686F756C6452657475726E0D0A6C6F63616C206163746976654D697469676174696F6E4E2O656465640D0A6C6F63616C20697354616E6B696E670D0A6C6F63616C20656E656D69657338792C20656E656D6965733330790D0A6C6F63616C20656E656D6965733879436F756E742C20656E656D696573333079436F756E740D0A0D0A6C6F63616C2066756E6374696F6E204576616C75617465546172676574496646696C7465724A7564676D656E7428746172676574556E6974290D0A2O2072657475726E20746172676574556E69743A446562752O6652656D61696E7328732E6A7564676D656E74446562752O66290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204D692O73696E674175726128290D0A2O2072657475726E20706C617965723A42752O66446F776E28732E7265747269627574696F6E417572612920616E6420706C617965723A42752O66446F776E28732E6465766F74696F6E417572612920616E6420706C617965723A42752O66446F776E28732E636F6E63656E74726174696F6E417572612920616E6420706C617965723A42752O66446F776E28732E637275736164657241757261290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20507265636F6D62617428290D0A2O2069662052616369616C734F6E282920616E64204344734F6E2829207468656E0D0A4O202O2D206C69676874735F6A7564676D656E740D0A4O20696620732E6C69676874734A7564676D656E743A49734361737461626C652829207468656E0D0A6O206966204361737428732E6C69676874734A7564676D656E742C206E6F74207461726765743A49735370652O6C496E52616E676528732E6C69676874734A7564676D656E742O29207468656E0D0A8O2072657475726E20226C69676874735F6A7564676D656E7420707265636F6D6261742034220D0A6O20656E640D0A4O20656E640D0A4O202O2D20617263616E655F746F2O72656E740D0A4O20696620732E617263616E65546F2O72656E743A49734361737461626C652829207468656E0D0A6O206966204361737428732E617263616E65546F2O72656E742C206E6F74207461726765743A4973496E52616E676528382O29207468656E0D0A8O2072657475726E2022617263616E655F746F2O72656E7420707265636F6D6261742036220D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2O202O2D20636F6E736563726174696F6E0D0A2O20696620732E636F6E736563726174696F6E3A49734361737461626C652829207468656E0D0A4O206966204361737428732E636F6E736563726174696F6E2C206E6F74207461726765743A4973496E4D656C2O6552616E676528382O29207468656E0D0A6O2072657475726E2022636F6E736563726174696F6E220D0A4O20656E640D0A2O20656E640D0A2O202O2D204D616E75612O6C7920612O6465643A206176656E676572735F736869656C640D0A2O20696620732E6176656E67657273536869656C643A49734361737461626C652829207468656E0D0A4O206966204361737428732E6176656E67657273536869656C642C206E6F74207461726765743A49735370652O6C496E52616E676528732E6176656E67657273536869656C642O29207468656E0D0A6O2072657475726E20226176656E676572735F736869656C6420707265636F6D626174203130220D0A4O20656E640D0A2O20656E640D0A2O202O2D204D616E75612O6C7920612O6465643A206A7564676D656E740D0A2O20696620732E6A7564676D656E743A497352656164792829207468656E0D0A4O206966204361737428732E6A7564676D656E742C206E6F74207461726765743A49735370652O6C496E52616E676528732E6A7564676D656E742O29207468656E0D0A6O2072657475726E20226A7564676D656E7420707265636F6D626174203132220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20446566656E736976657328290D0A2O20696620706C617965723A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E646976696E65536869656C6420616E6420732E646976696E65536869656C643A49734361737461626C65282920616E6420732E66696E616C5374616E643A4973417661696C61626C652829207468656E0D0A4O206966204361737428732E646976696E65536869656C642C206E696C2C206E696C2C207472756529207468656E0D0A6O2072657475726E2022646976696E655F736869656C6420646566656E73697665220D0A4O20656E640D0A2O20656E640D0A2O20696620706C617965723A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E6C61796F6E48616E647320616E6420732E6C61796F6E48616E64733A49734361737461626C652829207468656E0D0A4O2069662043617374286D2E6C61796F6E48616E6473506C617965722C206E696C2C206E696C2C207472756529207468656E0D0A6O2072657475726E20226C61795F6F6E5F68616E647320646566656E736976652032220D0A4O20656E640D0A2O20656E640D0A2O20696620732E677561726469616E6F66416E6369656E744B696E67733A49734361737461626C65282920616E642028706C617965723A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E677561726469616E6F66416E6369656E744B696E677320616E6420706C617965723A42752O66446F776E28732E617264656E74446566656E64657242752O662O29207468656E0D0A4O206966204361737428732E677561726469616E6F66416E6369656E744B696E677329207468656E0D0A6O2072657475726E2022677561726469616E5F6F665F616E6369656E745F6B696E677320646566656E736976652034220D0A4O20656E640D0A2O20656E640D0A2O20696620732E617264656E74446566656E6465723A49734361737461626C65282920616E642028706C617965723A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E617264656E74446566656E64657220616E6420706C617965723A42752O66446F776E28732E677561726469616E6F66416E6369656E744B696E677342752O662O29207468656E0D0A4O206966204361737428732E617264656E74446566656E64657229207468656E0D0A6O2072657475726E2022617264656E745F646566656E64657220646566656E736976652036220D0A4O20656E640D0A2O20656E640D0A2O20696620732E776F72646F66476C6F72793A49735265616479282920616E642028706C617965723A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E776F72646F66476C6F727920616E64206E6F7420706C617965723A4865616C696E674162736F72626564282O29207468656E0D0A4O2069662043617374286D2E776F72646F66476C6F7279506C6179657229207468656E0D0A6O2072657475726E2022776F72645F6F665F676C6F727920646566656E736976652038220D0A4O20656E640D0A2O20656E640D0A2O20696620732E736869656C646F667468655269676874656F75733A49735265616479282920616E642028706C617965723A42752O665265667265736861626C6528732E736869656C646F667468655269676874656F757342752O662920616E6420286163746976654D697469676174696F6E4E2O65646564206F7220706C617965723A4865616C746850657263656E746167652829203C3D2073652O74696E67732E68702E736869656C646F667468655269676874656F75732O29207468656E0D0A4O206966204361737428732E736869656C646F667468655269676874656F757329207468656E0D0A6O2072657475726E2022736869656C645F6F665F7468655F7269676874656F757320646566656E73697665203132220D0A4O20656E640D0A2O20656E640D0A2O202O2D2073656C666865616C0D0A2O2073686F756C6452657475726E203D206170692E5573654865616C696E6728290D0A2O2069662073686F756C6452657475726E207468656E0D0A4O2072657475726E2073686F756C6452657475726E0D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20432O6F6C646F776E7328290D0A2O202O2D206176656E67696E675F77726174680D0A2O20696620732E6176656E67696E6757726174683A49734361737461626C652829207468656E0D0A4O206966204361737428732E6176656E67696E6757726174682C206E6F74207461726765743A4973496E4D656C2O6552616E676528382O29207468656E0D0A6O2072657475726E20226176656E67696E675F777261746820632O6F6C646F776E732034220D0A4O20656E640D0A2O20656E640D0A2O202O2D204E6F74653A2050726F74656374696F6E2050616C6164696E2041504C20686173206261636B2D656E6420636F646520746F207265706C61636520415720776974682053656E74696E656C207768656E2074616C656E7465642E0D0A2O20696620732E73656E74696E656C3A49734361737461626C652829207468656E0D0A4O206966204361737428732E73656E74696E656C2C206E6F74207461726765743A4973496E4D656C2O6552616E676528382O29207468656E0D0A6O2072657475726E202273656E74696E656C20632O6F6C646F776E732036220D0A4O20656E640D0A2O20656E640D0A2O202O2D206D6F6D656E745F6F665F676C6F72792C69663D2862752O662E6176656E67696E675F77726174682E72656D61696E733C31357C2874696D653E31307C28632O6F6C646F776E2E6176656E67696E675F77726174682E72656D61696E733E31352O292628632O6F6C646F776E2E6176656E676572735F736869656C642E72656D61696E7326632O6F6C646F776E2E6A7564676D656E742E72656D61696E7326632O6F6C646F776E2E68612O6D65725F6F665F77726174682E72656D61696E732O290D0A2O20696620732E6D6F6D656E746F66476C6F72793A49734361737461626C65282920616E642028706C617965723A42752O6652656D61696E7328732E6176656E67696E67577261746842752O6629203C203135206F7220286170692E436F6D62617454696D652829203E203130206F722028732E6176656E67696E6757726174683A432O6F6C646F776E52656D61696E732829203E2031352O2920616E642028732E6176656E67657273536869656C643A432O6F6C646F776E446F776E282920616E6420732E6A7564676D656E743A432O6F6C646F776E446F776E282920616E6420732E68612O6D65726F6657726174683A432O6F6C646F776E446F776E283O29207468656E0D0A4O206966204361737428732E6D6F6D656E746F66476C6F72792C206E6F74207461726765743A4973496E4D656C2O6552616E676528382O29207468656E0D0A6O2072657475726E20226D6F6D656E745F6F665F676C6F727920632O6F6C646F776E732038220D0A4O20656E640D0A2O20656E640D0A2O202O2D2062617374696F6E5F6F665F6C696768742C69663D62752O662E6176656E67696E675F77726174682E75700D0A2O20696620732E62617374696F6E6F664C696768743A49734361737461626C65282920616E642028706C617965723A42752O66557028732E6176656E67696E67577261746842752O662O29207468656E0D0A4O206966204361737428732E62617374696F6E6F664C696768742C206E6F74207461726765743A4973496E4D656C2O6552616E676528382O29207468656E0D0A6O2072657475726E202262617374696F6E5F6F665F6C6967687420632O6F6C646F776E73203132220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E205374616E6461726428290D0A2O202O2D20736869656C645F6F665F7468655F7269676874656F75732C69663D282174616C656E742E7269676874656F75735F70726F746563746F722E656E61626C65647C632O6F6C646F776E2E7269676874656F75735F70726F746563746F725F6963642E72656D61696E733D3029262862752O662E62617374696F6E5F6F665F6C696768742E75707C62752O662E646976696E655F707572706F73652E75707C686F6C795F706F7765723E32290D0A2O202O2D20544F444F3A2046696E6420612077617920746F20747261636B205269676874656F757350726F746563746F72204943442E0D0A2O20696620732E736869656C646F667468655269676874656F75733A49735265616479282920616E642028706C617965723A42752O66557028732E62617374696F6E6F664C6967687442752O6629206F7220706C617965723A42752O66557028732E646976696E65507572706F736542752O6629206F7220706C617965723A486F6C79506F7765722829203E203229207468656E0D0A4O206966204361737428732E736869656C646F667468655269676874656F757329207468656E0D0A6O2072657475726E2022736869656C645F6F665F7468655F7269676874656F7573207374616E646172642032220D0A4O20656E640D0A2O20656E640D0A2O202O2D206176656E676572735F736869656C642C69663D62752O662E6D6F6D656E745F6F665F676C6F72792E75707C2174616C656E742E6D6F6D656E745F6F665F676C6F72792E656E61626C65640D0A2O20696620732E6176656E67657273536869656C643A49734361737461626C65282920616E642028706C617965723A42752O66557028732E6D6F6D656E746F66476C6F727942752O6629206F72206E6F7420732E6D6F6D656E746F66476C6F72793A4973417661696C61626C65282O29207468656E0D0A4O206966204361737428732E6176656E67657273536869656C642C206E6F74207461726765743A49735370652O6C496E52616E676528732E6176656E67657273536869656C642O29207468656E0D0A6O2072657475726E20226176656E676572735F736869656C64207374616E646172642034220D0A4O20656E640D0A2O20656E640D0A2O202O2D2068612O6D65725F6F665F77726174682C69663D62752O662E6176656E67696E675F77726174682E75700D0A2O20696620732E68612O6D65726F6657726174683A49735265616479282920616E642028706C617965723A42752O66557028732E6176656E67696E67577261746842752O662O29207468656E0D0A4O206966204361737428732E68612O6D65726F6657726174682C206E6F74207461726765743A49735370652O6C496E52616E676528732E68612O6D65726F6657726174682O29207468656E0D0A6O2072657475726E202268612O6D65725F6F665F7772617468207374616E646172642036220D0A4O20656E640D0A2O20656E640D0A2O202O2D206A7564676D656E742C7461726765745F69663D6D696E3A646562752O662E6A7564676D656E742E72656D61696E732C69663D636861726765733D327C2174616C656E742E6372757361646572735F6A7564676D656E742E656E61626C65640D0A2O20696620732E6A7564676D656E743A49735265616479282920616E642028732E6A7564676D656E743A436861726765732829202O3D2032206F72206E6F7420732E6372757361646572734A7564676D656E743A4973417661696C61626C65282O29207468656E0D0A4O20696620436173744379636C6528732E6A7564676D656E742C206D2E6A7564676D656E744D6F7573656F7665722C2033302C206E696C2C206E696C2C20656E656D6965733330792C20226D696E222C204576616C75617465546172676574496646696C7465724A7564676D656E7429207468656E0D0A6O2072657475726E20226A7564676D656E74207374616E646172642038220D0A4O20656E640D0A2O20656E640D0A2O202O2D20646976696E655F746F2O6C2C69663D74696D653E32307C2O2862752O662E6176656E67696E675F77726174682E75707C2174616C656E742E6176656E67696E675F77726174682E656E61626C656429262862752O662E6D6F6D656E745F6F665F676C6F72792E75707C2174616C656E742E6D6F6D656E745F6F665F676C6F72792E656E61626C65642O290D0A2O206966204344734F6E282920616E6420732E646976696E65546F2O6C3A497352656164792829207468656E0D0A4O206966204361737428732E646976696E65546F2O6C2C206E6F74207461726765743A4973496E52616E67652833302O29207468656E0D0A6O2072657475726E2022646976696E655F746F2O6C207374616E64617264203130220D0A4O20656E640D0A2O20656E640D0A2O202O2D206176656E676572735F736869656C640D0A2O20696620732E6176656E67657273536869656C643A49734361737461626C652829207468656E0D0A4O206966204361737428732E6176656E67657273536869656C642C206E6F74207461726765743A49735370652O6C496E52616E676528732E6176656E67657273536869656C642O29207468656E0D0A6O2072657475726E20226176656E676572735F736869656C64207374616E64617264203132220D0A4O20656E640D0A2O20656E640D0A2O202O2D2068612O6D65725F6F665F77726174680D0A2O20696620732E68612O6D65726F6657726174683A497352656164792829207468656E0D0A4O206966204361737428732E68612O6D65726F6657726174682C206E6F74207461726765743A49735370652O6C496E52616E676528732E68612O6D65726F6657726174682O29207468656E0D0A6O2072657475726E202268612O6D65725F6F665F7772617468207374616E64617264203134220D0A4O20656E640D0A2O20656E640D0A2O202O2D206A7564676D656E742C7461726765745F69663D6D696E3A646562752O662E6A7564676D656E742E72656D61696E730D0A2O20696620732E6A7564676D656E743A497352656164792829207468656E0D0A4O20696620436173744379636C6528732E6A7564676D656E742C206D2E6A7564676D656E744D6F7573656F7665722C2033302C206E696C2C206E696C2C20656E656D6965733330792C20226D696E222C204576616C75617465546172676574496646696C7465724A7564676D656E7429207468656E0D0A6O2072657475726E20226A7564676D656E74207374616E64617264203136220D0A4O20656E640D0A2O20656E640D0A2O202O2D20636F6E736563726174696F6E2C69663D21636F6E736563726174696F6E2E75700D0A2O20696620732E636F6E736563726174696F6E3A49734361737461626C65282920616E642028706C617965723A42752O66446F776E28732E636F6E736563726174696F6E42752O662O29207468656E0D0A4O206966204361737428732E636F6E736563726174696F6E2C206E6F74207461726765743A4973496E4D656C2O6552616E676528382O29207468656E0D0A6O2072657475726E2022636F6E736563726174696F6E207374616E64617264203138220D0A4O20656E640D0A2O20656E640D0A2O202O2D206579655F6F665F7479722C69663D74616C656E742E696E6D6F73745F6C696768742E656E61626C656426726169645F6576656E742E612O64732E696E3E3D34350D0A2O206966204344734F6E282920616E6420732E6579656F665479723A49734361737461626C65282920616E642028732E696E6D6F73744C696768743A4973417661696C61626C65282O29207468656E0D0A4O206966204361737428732E6579656F665479722C206E6F74207461726765743A4973496E4D656C2O6552616E676528382O29207468656E0D0A6O2072657475726E20226579655F6F665F747972207374616E64617264203230220D0A4O20656E640D0A2O20656E640D0A2O202O2D20626C652O7365645F68612O6D65720D0A2O20696620732E626C652O73656448612O6D65723A49734361737461626C652829207468656E0D0A4O206966204361737428732E626C652O73656448612O6D65722C206E6F74207461726765743A4973496E4D656C2O6552616E676528352O29207468656E0D0A6O2072657475726E2022626C652O7365645F68612O6D6572207374616E64617264202O32220D0A4O20656E640D0A2O20656E640D0A2O202O2D2068612O6D65725F6F665F7468655F7269676874656F75730D0A2O20696620732E68612O6D65726F667468655269676874656F75733A49734361737461626C652829207468656E0D0A4O206966204361737428732E68612O6D65726F667468655269676874656F75732C206E6F74207461726765743A4973496E4D656C2O6552616E676528352O29207468656E0D0A6O2072657475726E202268612O6D65725F6F665F7468655F7269676874656F7573207374616E64617264203234220D0A4O20656E640D0A2O20656E640D0A2O202O2D2063727573616465725F737472696B650D0A2O20696620732E6372757361646572537472696B653A49734361737461626C652829207468656E0D0A4O206966204361737428732E6372757361646572537472696B652C206E6F74207461726765743A4973496E4D656C2O6552616E676528352O29207468656E0D0A6O2072657475726E202263727573616465725F737472696B65207374616E64617264203236220D0A4O20656E640D0A2O20656E640D0A2O202O2D206579655F6F665F7479722C69663D2174616C656E742E696E6D6F73745F6C696768742E656E61626C656426726169645F6576656E742E612O64732E696E3E3D36300D0A2O206966204344734F6E282920616E6420732E6579656F665479723A49734361737461626C65282920616E6420286E6F7420732E696E6D6F73744C696768743A4973417661696C61626C65282O29207468656E0D0A4O206966204361737428732E6579656F665479722C206E6F74207461726765743A4973496E4D656C2O6552616E676528382O29207468656E0D0A6O2072657475726E20226579655F6F665F747972207374616E64617264203237220D0A4O20656E640D0A2O20656E640D0A2O202O2D20776F72645F6F665F676C6F72792C69663D62752O662E7368696E696E675F6C696768745F66722O652E75700D0A2O20696620732E776F72646F66476C6F72793A49735265616479282920616E6420706C617965723A42752O66557028732E7368696E696E674C6967687446722O6542752O6629207468656E0D0A4O20696620706C617965723A4865616C746850657263656E746167652829203E20393020616E6420706C617965723A4973496E5061727479282920616E64206E6F7420706C617965723A4973496E526169642829207468656E0D0A6O206966206D6F7573656F7665723A457869737473282920616E64206D6F7573656F7665723A4865616C746850657263656E746167652829203C203830207468656E0D0A8O2069662043617374286D2E776F72646F66476C6F72794D6F7573656F76657229207468656E0D0A9O202072657475726E2022776F72645F6F665F676C6F7279207374616E64617264207061727479203238220D0A8O20656E640D0A6O20656E640D0A4O20656C73650D0A6O2069662043617374286D2E776F72646F66476C6F7279506C6179657229207468656E0D0A8O2072657475726E2022776F72645F6F665F676C6F7279207374616E646172642073656C66203332220D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A2O202O2D20636F6E736563726174696F6E0D0A2O20696620732E636F6E736563726174696F6E3A49734361737461626C652829207468656E0D0A4O206966204361737428732E636F6E736563726174696F6E2C206E6F74207461726765743A4973496E4D656C2O6552616E676528382O29207468656E0D0A6O2072657475726E2022636F6E736563726174696F6E207374616E64617264203334220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A2O2D2041504C204D61696E0D0A6C6F63616C2066756E6374696F6E2041504C28290D0A2O20656E656D6965733879203D20706C617965723A476574456E656D696573496E4D656C2O6552616E676528382C20732E736869656C646F667468655269676874656F7573290D0A2O20656E656D696573333079203D20706C617965723A476574456E656D696573496E52616E6765283330290D0A2O2069662028416F454F6E282O29207468656E0D0A4O20656E656D6965733879436F756E74203D2023656E656D69657338790D0A4O20656E656D696573333079436F756E74203D2023656E656D6965733330790D0A2O20656C73650D0A4O20656E656D6965733879436F756E74203D20310D0A4O20656E656D696573333079436F756E74203D20310D0A2O20656E640D0A0D0A2O206163746976654D697469676174696F6E4E2O65646564203D20706C617965723A4163746976654D697469676174696F6E4E2O6564656428290D0A2O20697354616E6B696E67203D20706C617965723A497354616E6B696E67416F45283829206F7220706C617965723A497354616E6B696E6728746172676574290D0A0D0A2O206966206E6F7420706C617965723A412O66656374696E67436F6D6261742829207468656E0D0A4O202O2D207265766976650D0A4O206966206D6F7573656F7665723A457869737473282920616E64206D6F7573656F7665723A497341506C61796572282920616E64206D6F7573656F7665723A4973446561644F7247686F7374282920616E64206E6F7420706C617965723A43616E412O7461636B286D6F7573656F76657229207468656E0D0A6O20696620732E726564656D7074696F6E3A49734361737461626C652829207468656E0D0A8O2069662043617374286D2E726564656D7074696F6E4D6F7573656F7665722C206E6F74206D6F7573656F7665723A49735370652O6C496E52616E676528732E726564656D7074696F6E292C207472756529207468656E0D0A9O202072657475726E2022726564656D7074696F6E220D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A4O202O2D204D616E75612O6C7920612O6465643A206465766F74696F6E5F617572610D0A4O20696620732E6465766F74696F6E417572613A49734361737461626C65282920616E6420284D692O73696E6741757261282O29207468656E0D0A6O206966204361737428732E6465766F74696F6E4175726129207468656E0D0A8O2072657475726E20226465766F74696F6E5F61757261220D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A0D0A2O206966206170692E556E6974497356616C69642874617267657429207468656E0D0A4O202O2D20507265636F6D6261740D0A4O206966206E6F7420706C617965723A412O66656374696E67436F6D6261742829207468656E0D0A6O206966204F70656E65724F6E2829207468656E0D0A8O2073686F756C6452657475726E203D20507265636F6D62617428290D0A8O2069662073686F756C6452657475726E207468656E0D0A9O202072657475726E2073686F756C6452657475726E0D0A8O20656E640D0A6O20656E640D0A6O2072657475726E0D0A4O20656E640D0A4O20696620732E696E74657263652O73696F6E3A49734361737461626C65282920616E6420706C617965723A486F6C79506F7765722829203E3D203320616E6420732E696E74657263652O73696F6E3A49735265616479282920616E6420706C617965723A412O66656374696E67436F6D626174282920616E64206D6F7573656F7665723A457869737473282920616E64206D6F7573656F7665723A4973446561644F7247686F7374282920616E64206D6F7573656F7665723A497341506C61796572282920616E6420286E6F7420706C617965723A43616E412O7461636B286D6F7573656F7665722O29207468656E0D0A6O2069662043617374286D2E696E74657263652O73696F6E4D6F7573656F7665722C206E6F74206D6F7573656F7665723A49735370652O6C496E52616E676528732E696E74657263652O73696F6E2O29207468656E0D0A8O2072657475726E2022496E74657263652O73696F6E220D0A6O20656E640D0A4O20656E640D0A4O202O2D206175746F5F612O7461636B0D0A4O202O2D20496E74652O72757074730D0A4O206966206E6F7420706C617965723A497343617374696E67282920616E64206E6F7420706C617965723A49734368612O6E656C696E672829207468656E0D0A6O2073686F756C6452657475726E203D206170692E496E74652O7275707428732E726562756B652C206D2E726562756B654D6F7573656F7665722C20352C206E696C2C2074727565290D0A6O2069662073686F756C6452657475726E207468656E0D0A8O2072657475726E2073686F756C6452657475726E0D0A6O20656E640D0A6O2073686F756C6452657475726E203D206170692E496E74652O727570745374756E28732E68612O6D65726F664A7573746963652C206D2E68612O6D65726F664A7573746963654D6F7573656F7665722C2038290D0A6O2069662073686F756C6452657475726E207468656E0D0A8O2072657475726E2073686F756C6452657475726E0D0A6O20656E640D0A4O20656E640D0A4O202O2D204D616E75612O6C7920612O6465643A20446566656E7369766573210D0A4O20696620697354616E6B696E67207468656E0D0A6O2073686F756C6452657475726E203D20446566656E736976657328290D0A6O2069662073686F756C6452657475726E207468656E0D0A8O2072657475726E2073686F756C6452657475726E0D0A6O20656E640D0A4O20656E640D0A4O202O2D2063612O6C5F616374696F6E5F6C6973742C6E616D653D632O6F6C646F776E730D0A4O206966204344734F6E2829207468656E0D0A6O2073686F756C6452657475726E203D20432O6F6C646F776E7328290D0A6O2069662073686F756C6452657475726E207468656E0D0A8O2072657475726E2073686F756C6452657475726E0D0A6O20656E640D0A4O20656E640D0A4O202O2D2063612O6C5F616374696F6E5F6C6973742C6E616D653D7472696E6B6574730D0A4O2073686F756C6452657475726E203D206170692E5573655472696E6B65747328382C206F6E5573654578636C75646573290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A4O202O2D2063612O6C5F616374696F6E5F6C6973742C6E616D653D7374616E646172640D0A4O2073686F756C6452657475726E203D205374616E6461726428290D0A4O2069662073686F756C6452657475726E207468656E0D0A6O2072657475726E2073686F756C6452657475726E0D0A4O20656E640D0A4O202O2D204D616E75612O6C7920612O6465643A20502O6F6C2C206966206E6F7468696E6720656C736520746F20646F0D0A4O206966204361737428732E702O6F6C2C206E696C2C206E696C2C207472756529207468656E0D0A6O2072657475726E2022576169742F502O6F6C205265736F7572636573220D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204175746F42696E6428290D0A2O202O2D205370652O6C730D0A2O2042696E6428732E617263616E65546F2O72656E74290D0A2O2042696E6428732E617264656E74446566656E646572290D0A2O2042696E6428732E6176656E67657273536869656C64290D0A2O2042696E6428732E6176656E67696E675772617468290D0A2O2042696E6428732E62617374696F6E6F664C69676874290D0A2O2042696E6428732E626C652O73656448612O6D6572290D0A2O2042696E6428732E626C652O73696E676F6646722O65646F6D290D0A2O2042696E6428732E626C652O73696E676F6650726F74656374696F6E290D0A2O2042696E6428732E626C696E64696E674C69676874290D0A2O2042696E6428732E636F6E736563726174696F6E290D0A2O2042696E6428732E6372757361646572537472696B65290D0A2O2042696E6428732E6372757361646572734A7564676D656E74290D0A2O2042696E6428732E6465766F74696F6E41757261290D0A2O2042696E6428732E646976696E65546F2O6C290D0A2O2042696E6428732E646976696E65536869656C64290D0A2O2042696E6428732E6579656F66547972290D0A2O2042696E6428732E666C6173686F664C69676874290D0A2O2042696E6428732E677561726469616E6F66416E6369656E744B696E6773290D0A2O2042696E6428732E68612O6D65726F664A757374696365290D0A2O2042696E6428732E68616E646F665265636B6F6E696E67290D0A2O2042696E6428732E68612O6D65726F667468655269676874656F7573290D0A2O2042696E6428732E68612O6D65726F665772617468290D0A2O2042696E6428732E6C61796F6E48616E6473290D0A2O2042696E6428732E6C69676874734A7564676D656E74290D0A2O2042696E6428732E6D6F6D656E746F66476C6F7279290D0A2O2042696E6428732E6A7564676D656E74290D0A2O2042696E6428732E726562756B65290D0A2O2042696E6428732E73656E74696E656C290D0A2O2042696E6428732E736869656C646F667468655269676874656F7573290D0A2O2042696E6428732E776F72646F66476C6F7279290D0A2O2042696E6428732E686F6C794176656E676572290D0A2O2042696E6428732E7A65616C6F747350617261676F6E290D0A2O202O2D204D6163726F730D0A2O2042696E64286D2E626C652O73696E676F6646722O65646F6D4D6F7573656F766572290D0A2O2042696E64286D2E626C652O73696E676F6650726F74656374696F6E4D6F7573656F766572290D0A2O2042696E64286D2E636C65616E7365546F78696E734D6F7573656F766572290D0A2O2042696E64286D2E696E74657263652O73696F6E4D6F7573656F766572290D0A2O2042696E64286D2E6C61796F6E48616E6473506C61796572290D0A2O2042696E64286D2E6A7564676D656E744D6F7573656F766572290D0A2O2042696E64286D2E68612O6D65726F664A7573746963654D6F7573656F766572290D0A2O2042696E64286D2E726562756B654D6F7573656F766572290D0A2O2042696E64286D2E776F72646F66476C6F7279466F637573290D0A2O2042696E64286D2E776F72646F66476C6F7279506C61796572290D0A2O202O2D204974656D730D0A2O206170692E6D6163726F3A42696E644974656D7328290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E20496E697428290D0A2O205072696E744465627567282250726F74656374696F6E2050616C6164696E206C6F616465642E22290D0A2O2073652O74696E6773203D2047657453652O74696E6773287370656349642C2061706C4E616D65290D0A2O204175746F42696E6428290D0A656E640D0A0D0A412O6441706C287370656349642C2061706C4E616D652C2041504C2C20496E69742C2064656661756C7453652O74696E6773290D0A00063O0012013O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);