local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then v83[v85[2]]=v85[3];elseif (v86>1) then do return;end else v83[v85[2]]=v59[v85[3]];end elseif (v86<=4) then if (v86==3) then local v115=v85[2];v83[v115](v13(v83,v115 + 1 ,v78));else local v116;local v117;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v83[v117]=v83[v117](v83[v117 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v78=(v117 + v84) -1 ;for v128=v117,v78 do v116=v79[v128-v117 ];v83[v128]=v116;end v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v83[v117](v13(v83,v117 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end end elseif (v86>5) then local v124=v85[2];v83[v124]=v83[v124](v83[v124 + 1 ]);else local v126=v85[2];v78=(v126 + v84) -1 ;for v131=v126,v78 do local v132=v79[v131-v126 ];v83[v131]=v132;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E670363272O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A3O2D207O3D204C4F43414C495A45207O3D0D0A2O2D20412O646F6E0D0A6C6F63616C20612O646F6E4E616D652C20612O646F6E5461626C65203D203O2E0D0A2O202O2D204865726F4C69620D0A6C6F63616C20484C203D204865726F4C69620D0A2O2D20576F726C6479526F746174696F6E0D0A6C6F63616C205752203D20576F726C6479526F746174696F6E0D0A2O2D2046696C65204C6F63616C730D0A6C6F63616C20475549203D20484C2E4755490D0A6C6F63616C204372656174654368696C6450616E656C203D204755492E4372656174654368696C6450616E656C0D0A6C6F63616C2043726561746550616E656C4F7074696F6E203D204755492E43726561746550616E656C4F7074696F6E0D0A6C6F63616C20437265617465415250616E656C4F7074696F6E203D2057522E4755492E437265617465415250616E656C4F7074696F6E0D0A6C6F63616C20437265617465415250616E656C4F7074696F6E73203D2057522E4755492E437265617465415250616E656C4F7074696F6E730D0A0D0A0D0A3O2D209O3D9O3D9O3D3D20434F4E54454E54209O3D9O3D9O3D3D0D0A2O2D2044656661756C742073652O74696E67730D0A57522E47554953652O74696E67732E41504C2E526F677565203D207B0D0A2O20436F2O6D6F6E73203D207B0D0A4O20506F69736F6E52656672657368203D2031352C0D0A4O20506F69736F6E52656672657368436F6D626174203D20332C0D0A4O2052616E6765644D756C7469446F54203D20747275652C202O2D2053752O67657374204D756C74692D446F54206174203130792052616E67650D0A4O205573655072696F72697479526F746174696F6E203D20224E65766572222C202O2D204F6E6C7920666F7220412O73612O73696E6174696F6E202F20537562746C6574790D0A4O205573655472696E6B657473203D20747275652C0D0A4O205472696E6B6574446973706C61795374796C65203D202253752O676573746564222C0D0A4O20436F76656E616E74446973706C61795374796C65203D202253752O676573746564222C0D0A4O2053652O7261746564426F6E655370696B6544756D70446973706C61795374796C65203D202253752O676573746564222C0D0A4O2053686F77502O6F6C696E67203D2066616C73652C0D0A4O2053544D664441734450534344203D2066616C73652C202O2D2053696E676C6520546172676574204D6644206173204450532043440D0A4O20456E61626C6564203D207B0D0A6O204B69646E657953686F74496E74652O72757074203D2066616C73652C0D0A4O207D2C0D0A4O2047434461734F2O66474344203D207B0D0A6O2052616369616C73203D20747275652C0D0A4O207D2C0D0A4O204F2O6647434461734F2O66474344203D207B0D0A6O2052616369616C73203D20747275652C0D0A6O2056616E697368203D20747275652C0D0A6O20536861646F7744616E6365203D20747275652C0D0A6O2054686973746C65546561203D20747275652C0D0A6O20436F6C64426C2O6F64203D20747275652C0D0A6O204D61726B6564666F724465617468203D20747275652C0D0A4O207D0D0A2O207D2C0D0A2O20436F2O6D6F6E7332203D207B0D0A4O204372696D736F6E5669616C4850203D2032302C0D0A4O204665696E744850203D2031302C0D0A4O20537465616C74682O4F43203D20747275652C0D0A4O2047434461734F2O66474344203D207B0D0A6O204372696D736F6E5669616C203D20747275652C0D0A6O204665696E74203D20747275652C0D0A4O207D2C0D0A4O204F2O6647434461734F2O66474344203D207B0D0A6O204B69636B203D20747275652C0D0A6O20537465616C7468203D20747275652C0D0A4O207D0D0A2O207D2C0D0A2O20412O73612O73696E6174696F6E203D207B0D0A4O20456E76656E6F6D444D474F2O66736574203D20332C0D0A4O204D7574696C617465444D474F2O66736574203D20332C0D0A4O20416C7761797353752O6765737447612O726F7465203D2066616C73652C202O2D2053752O676573742047612O726F7465206576656E207768656E2056616E6973682069732075700D0A4O20506F74696F6E54797065203D207B0D0A6O2053656C6563746564203D2022506F776572222C0D0A4O207D2C0D0A4O2047434461734F2O66474344203D207B0D0A6O20457873616E6775696E617465203D2066616C73652C0D0A6O204B696E677362616E65203D2066616C73652C0D0A6O2053686976203D2066616C73652C0D0A4O207D2C0D0A4O204F2O6647434461734F2O66474344203D207B0D0A6O2044656174686D61726B203D20747275652C0D0A6O20496E6469736372696D696E6174654361726E616765203D20747275652C0D0A4O207D0D0A2O207D2C0D0A2O204F75746C6177203D207B0D0A4O20456E61626C6564203D207B0D0A4O207D2C0D0A4O202O2D20526F2O6C2074686520426F6E6573204C6F6769632C20612O6365707473202253696D43222C2022312B2042752O662220616E6420657665727920225274424E616D65222E0D0A4O202O2D202253696D43222C2022312B2042752O66222C202242726F616473696465222C2022427572696564205472656173757265222C20224772616E64204D656C2O65222C2022536B752O6C20616E642043726F2O73626F6E6573222C2022527574686C652O7320507265636973696F6E222C2022547275652042656172696E67220D0A4O20526F2O6C746865426F6E65734C6F676963203D202253696D43222C0D0A4O202O2D20536F6C6F4D6F64652053652O74696E67730D0A4O20526F2O6C746865426F6E65734C2O6563684B2O65704850203D2036302C202O2D2025204850207468726573686F6C6420746F206B2O6570204772616E64204D656C2O65207768696C6520736F6C6F2E0D0A4O20526F2O6C746865426F6E65734C2O6563685265726F2O6C4850203D2034302C202O2D2025204850207468726573686F6C6420746F207265726F2O6C20666F72204772616E64204D656C2O65207768696C6520736F6C6F2E0D0A4O2055736544505356616E697368203D2066616C73652C202O2D205573652056616E69736820696E2074686520726F746174696F6E20666F72204450530D0A4O204B692O6C696E675370722O65446973706C61795374796C65203D202253752O676573746564222C0D0A4O20506F74696F6E54797065203D207B0D0A6O2053656C6563746564203D2022506F776572222C0D0A4O207D2C0D0A4O2047434461734F2O66474344203D207B0D0A6O20426C616465466C752O7279203D2066616C73652C0D0A6O20426C61646552757368203D2066616C73652C0D0A6O2047686F73746C79537472696B65203D2066616C73652C0D0A6O204472656164626C61646573203D2066616C73652C0D0A6O204B2O65704974526F2O6C696E67203D2066616C73652C0D0A4O207D2C0D0A4O204F2O6647434461734F2O66474344203D207B0D0A6O20416472656E616C696E6552757368203D20747275652C0D0A4O207D0D0A2O207D2C0D0A2O20537562746C657479203D207B0D0A4O2045766973636572617465444D474F2O66736574203D20332C202O2D205573656420746F20636F6D70757465207468652072757074757265207468726573686F6C640D0A4O2053684445636F436861726765203D20312E37352C202O2D20536861646F772044616E63652045636F204D6F646520284D696E204672616374696F6E616C2043686172676573206265666F7265207573696E67206974207768696C6520434473206172652064697361626C6564290D0A4O204275726E536861646F7744616E6365203D20224F6E20426F2O736573206E6F7420696E2044756E67656F6E73222C202O2D204275726E20536861646F772044616E63652063686172676573207768656E20746865207461726765742069732061626F757420746F206469650D0A4O20506F74696F6E54797065203D207B0D0A6O2053656C6563746564203D2022506F776572222C0D0A4O207D2C0D0A4O2047434461734F2O66474344203D207B0D0A6O2053687572696B656E546F726E61646F203D2066616C73652C0D0A4O207D2C0D0A4O204F2O6647434461734F2O66474344203D207B0D0A6O2053796D626F6C736F664465617468203D20747275652C0D0A6O20536861646F7744616E6365203D20747275652C0D0A6O20536861646F77426C61646573203D20747275652C0D0A4O207D2C0D0A4O20537465616C74684D6163726F203D207B0D0A6O2056616E697368203D20747275652C0D0A6O20536861646F776D656C64203D20747275652C0D0A6O20536861646F7744616E6365203D20747275650D0A4O207D0D0A2O207D0D0A7D0D0A0D0A57522E4755492E4C6F616453652O74696E67735265637572736976656C792857522E47554953652O74696E6773290D0A0D0A2O2D204368696C642050616E656C730D0A6C6F63616C20415250616E656C203D2057522E4755492E50616E656C0D0A6C6F63616C2043505F526F677565203D204372656174654368696C6450616E656C28415250616E656C2C2022526F67756522290D0A6C6F63616C2043505F526F67756532203D204372656174654368696C6450616E656C28415250616E656C2C2022526F677565203222290D0A6C6F63616C2043505F412O73612O73696E6174696F6E203D204372656174654368696C6450616E656C28415250616E656C2C2022412O73612O73696E6174696F6E22290D0A6C6F63616C2043505F4F75746C6177203D204372656174654368696C6450616E656C28415250616E656C2C20224F75746C617722290D0A6C6F63616C2043505F537562746C657479203D204372656174654368696C6450616E656C28415250616E656C2C2022537562746C65747922290D0A2O2D20436F6E74726F6C730D0A2O2D20526F6775650D0A43726561746550616E656C4F7074696F6E2822536C69646572222C2043505F526F6775652C202241504C2E526F6775652E436F2O6D6F6E732E506F69736F6E52656672657368222C207B352C202O352C20317D2C20222O4F4320506F69736F6E2052656672657368222C2022536574207468652074696D657220666F722074686520506F69736F6E205265667265736820282O4F432922290D0A43726561746550616E656C4F7074696F6E2822536C69646572222C2043505F526F6775652C202241504C2E526F6775652E436F2O6D6F6E732E506F69736F6E52656672657368436F6D626174222C207B302C202O352C20317D2C2022436F6D62617420506F69736F6E2052656672657368222C2022536574207468652074696D657220666F722074686520506F69736F6E20526566726573682028496E20436F6D6261742922290D0A43726561746550616E656C4F7074696F6E2822436865636B42752O746F6E222C2043505F526F6775652C202241504C2E526F6775652E436F2O6D6F6E732E52616E6765644D756C7469446F54222C202253752O676573742052616E676564204D756C74692D446F54222C202253752O67657374206D756C74692D446F5420746172676574732061742046616E206F66204B6E697665732072616E6765202831302079617264732920696E7374656164206F66206F6E6C79206D656C2O652072616E67652E2044697361626C696E672077692O6C206F6E6C792073752O6765737420446F5420746172676574732077697468696E206D656C2O652072616E67652E22290D0A43726561746550616E656C4F7074696F6E282244726F70646F776E222C2043505F526F6775652C202241504C2E526F6775652E436F2O6D6F6E732E5573655072696F72697479526F746174696F6E222C207B224E65766572222C20224F6E20426F2O736573222C2022416C77617973222C20224175746F227D2C2022557365205072696F7269747920526F746174696F6E222C202253656C656374207768656E20746F2073686F7720726F746174696F6E20666F72206D6178696D756D207072696F726974792064616D616765202861742074686520636F7374206F66206F766572612O6C20416F452064616D6167652E295C6E4175746F2077692O6C2066756E6374696F6E206173204E6576657220657863657074206F6E20737065636966696320656E636F756E7465727320776865726520416F45206973206E6F74207265636F2O6D656E6465642E22290D0A43726561746550616E656C4F7074696F6E2822436865636B42752O746F6E222C2043505F526F6775652C202241504C2E526F6775652E436F2O6D6F6E732E5573655472696E6B657473222C2022557365205472696E6B657473222C2022557365205472696E6B6574732061732070617274206F662074686520726F746174696F6E22290D0A43726561746550616E656C4F7074696F6E282244726F70646F776E222C2043505F526F6775652C202241504C2E526F6775652E436F2O6D6F6E732E5472696E6B6574446973706C61795374796C65222C207B224D61696E2049636F6E222C202253752O676573746564222C202253752O6765737465645269676874222C2022432O6F6C646F776E227D2C20225472696E6B657420446973706C6179205374796C65222C2022446566696E652077686963682069636F6E20646973706C6179207374796C6520746F2075736520666F72205472696E6B6574732E22290D0A43726561746550616E656C4F7074696F6E282244726F70646F776E222C2043505F526F6775652C202241504C2E526F6775652E436F2O6D6F6E732E436F76656E616E74446973706C61795374796C65222C207B224D61696E2049636F6E222C202253752O676573746564222C202253752O6765737465645269676874222C2022432O6F6C646F776E227D2C2022436F76656E616E7420446973706C6179205374796C65222C2022446566696E652077686963682069636F6E20646973706C6179207374796C6520746F2075736520666F7220436F76656E616E74732E22290D0A43726561746550616E656C4F7074696F6E282244726F70646F776E222C2043505F526F6775652C202241504C2E526F6775652E436F2O6D6F6E732E53652O7261746564426F6E655370696B6544756D70446973706C61795374796C65222C207B224D61696E2049636F6E222C202253752O676573746564222C202253752O6765737465645269676874222C2022432O6F6C646F776E227D2C202253652O726174656420426F6E65205370696B65204275726E20446973706C6179205374796C65222C2022446566696E652077686963682069636F6E20646973706C6179207374796C6520746F2075736520666F722053652O726174656420426F6E65205370696B6520636861726765206275726E696E672E22290D0A43726561746550616E656C4F7074696F6E2822436865636B42752O746F6E222C2043505F526F6775652C202241504C2E526F6775652E436F2O6D6F6E732E53686F77502O6F6C696E67222C202253686F7720502O6F6C696E67222C202253686F7720702O6F6C696E672069636F6E20696E7374656164206F6620702O6F6C696E672070726564696374696F6E2E22290D0A43726561746550616E656C4F7074696F6E2822436865636B42752O746F6E222C2043505F526F6775652C202241504C2E526F6775652E436F2O6D6F6E732E53544D664441734450534344222C20225354204D61726B656420666F7220446561746820617320445053204344222C2022456E61626C6520696620796F752077616E7420746F207075742053696E676C6520546172676574204D61726B656420666F722044656174682073686F776E206173204F2O66204743442028746F702069636F6E732920696E7374656164206F662053752O6765737465642E22290D0A437265617465415250616E656C4F7074696F6E732843505F526F6775652C202241504C2E526F6775652E436F2O6D6F6E7322290D0A2O2D20526F67756520320D0A43726561746550616E656C4F7074696F6E2822536C69646572222C2043505F526F677565322C202241504C2E526F6775652E436F2O6D6F6E73322E4372696D736F6E5669616C4850222C207B302C20312O302C20317D2C20224372696D736F6E205669616C204850222C202253657420746865204372696D736F6E205669616C204850207468726573686F6C642E22290D0A43726561746550616E656C4F7074696F6E2822536C69646572222C2043505F526F677565322C202241504C2E526F6775652E436F2O6D6F6E73322E4665696E744850222C207B302C20312O302C20317D2C20224665696E74204850222C202253657420746865204665696E74204850207468726573686F6C642E22290D0A43726561746550616E656C4F7074696F6E2822436865636B42752O746F6E222C2043505F526F677565322C202241504C2E526F6775652E436F2O6D6F6E73322E537465616C74682O4F43222C2022537465616C74682052656D696E64657220282O4F4329222C202253686F7720537465616C74682052656D696E646572207768656E206F7574206F6620636F6D6261742E22290D0A437265617465415250616E656C4F7074696F6E732843505F526F677565322C202241504C2E526F6775652E436F2O6D6F6E733222290D0A2O2D20412O73612O73696E6174696F6E0D0A43726561746550616E656C4F7074696F6E2822536C69646572222C2043505F412O73612O73696E6174696F6E2C202241504C2E526F6775652E412O73612O73696E6174696F6E2E456E76656E6F6D444D474F2O66736574222C207B312C20352C20302E32357D2C2022456E76656E6F6D20444D47204F2O66736574222C20225365742074686520456E76656E6F6D20444D47204F2O667365742E22290D0A43726561746550616E656C4F7074696F6E2822536C69646572222C2043505F412O73612O73696E6174696F6E2C202241504C2E526F6775652E412O73612O73696E6174696F6E2E4D7574696C617465444D474F2O66736574222C207B312C20352C20302E32357D2C20224D7574696C61746520444D47204F2O66736574222C202253657420746865204D7574696C61746520444D47204F2O667365742E22290D0A43726561746550616E656C4F7074696F6E2822436865636B42752O746F6E222C2043505F412O73612O73696E6174696F6E2C202241504C2E526F6775652E412O73612O73696E6174696F6E2E416C7761797353752O6765737447612O726F7465222C2022416C776179732053752O676573742047612O726F7465222C2022446F6E27742070726576656E742047612O726F74652073752O67657374696F6E73207768656E207573696E67205375627465726675676520616E642056616E6973682069732072656164792E2054686573652073686F756C6420696465612O6C792062652073796E6365642C206275742063616E2062652075736566756C20696620686F6C64696E672056616E69736820666F72207370656369666963206669676874732E22290D0A437265617465415250616E656C4F7074696F6E732843505F412O73612O73696E6174696F6E2C202241504C2E526F6775652E412O73612O73696E6174696F6E22290D0A2O2D204F75746C61770D0A43726561746550616E656C4F7074696F6E282244726F70646F776E222C2043505F4F75746C61772C202241504C2E526F6775652E4F75746C61772E526F2O6C746865426F6E65734C6F676963222C207B2253696D43222C2022312B2042752O66222C202242726F616473696465222C2022427572696564205472656173757265222C20224772616E64204D656C2O65222C2022536B752O6C20616E642043726F2O73626F6E6573222C2022527574686C652O7320507265636973696F6E222C2022547275652042656172696E67227D2C2022526F2O6C2074686520426F6E6573204C6F676963222C2022446566696E652074686520526F2O6C2074686520426F6E6573206C6F67696320746F20666F2O6C6F772E5C6E2853696D4320686967686C79207265636F2O6D656E646564212922290D0A43726561746550616E656C4F7074696F6E2822536C69646572222C2043505F4F75746C61772C202241504C2E526F6775652E4F75746C61772E526F2O6C746865426F6E65734C2O6563684B2O65704850222C207B312C20312O302C20317D2C20224B2O6570204C2O656368204850205468726573686F6C64222C202253657420746865204850207468726573686F6C6420666F72206B2O6570696E6720746865206C2O6563682062752O6620696E7374656164206F66207265726F2O6C696E67206E6F726D612O6C792028776F726B696E67206F6E6C7920696620536F6C6F204D6F646520697320656E61626C656420616E6420646F6573206E6F7420776F726B20696E2064756E67656F6E732E2922290D0A43726561746550616E656C4F7074696F6E2822536C69646572222C2043505F4F75746C61772C202241504C2E526F6775652E4F75746C61772E526F2O6C746865426F6E65734C2O6563685265726F2O6C4850222C207B312C20312O302C20317D2C20225265726F2O6C20466F72204C2O656368204850205468726573686F6C64222C202253657420746865204850207468726573686F6C6420746F206163746976656C792072652D726F2O6C20666F7220746865206C2O6563682062752O662028776F726B696E67206F6E6C7920696620536F6C6F204D6F646520697320656E61626C656420616E6420646F6573206E6F7420776F726B20696E2064756E67656F6E732E2922290D0A43726561746550616E656C4F7074696F6E2822436865636B42752O746F6E222C2043505F4F75746C61772C202241504C2E526F6775652E4F75746C61772E55736544505356616E697368222C20225573652056616E69736820666F7220445053222C202253752O676573742056616E697368202D3E20416D6275736820666F72204450532E5C6E44697361626C6520746F20736176652056616E69736820666F72207574696C69747920707572706F7365732E22290D0A43726561746550616E656C4F7074696F6E2822436865636B42752O746F6E222C2043505F4F75746C61772C202241504C2E526F6775652E4F75746C61772E44756D705370696B6573222C202244756D7020626F6E657370696B65206368617267657320617420656E64206F6620626F2O73206669676874222C202255736566756C20696E20726169642C2070657268617073206C652O7320736F20696E2064756E67656F6E732E22290D0A43726561746550616E656C4F7074696F6E282244726F70646F776E222C2043505F4F75746C61772C202241504C2E526F6775652E4F75746C61772E4B692O6C696E675370722O65446973706C61795374796C65222C207B224D61696E2049636F6E222C202253752O676573746564222C202253752O6765737465645269676874222C2022432O6F6C646F776E227D2C20224B692O6C696E67205370722O6520446973706C6179205374796C65222C2022446566696E652077686963682069636F6E20646973706C6179207374796C6520746F2075736520666F72204B692O6C696E67205370722O652E22290D0A437265617465415250616E656C4F7074696F6E732843505F4F75746C61772C202241504C2E526F6775652E4F75746C617722290D0A2O2D20537562746C6574790D0A43726561746550616E656C4F7074696F6E2822536C69646572222C2043505F537562746C6574792C202241504C2E526F6775652E537562746C6574792E45766973636572617465444D474F2O66736574222C207B312C20352C20302E32357D2C2022457669736365726174652044616D616765204F2O66736574222C20225365742074686520457669736365726174652044616D616765204F2O667365742C207573656420746F20636F6D70757465207468652072757074757265207468726573686F6C642E22290D0A43726561746550616E656C4F7074696F6E2822536C69646572222C2043505F537562746C6574792C202241504C2E526F6775652E537562746C6574792E53684445636F436861726765222C207B312C20322C20302E317D2C20225368442045636F20436861726765222C20225365742074686520536861646F772044616E63652045636F20436861726765207468726573686F6C642E22290D0A43726561746550616E656C4F7074696F6E282244726F70646F776E222C2043505F537562746C6574792C202241504C2E526F6775652E537562746C6574792E4275726E536861646F7744616E6365222C207B22416C77617973222C20224F6E20426F2O736573222C20224F6E20426F2O736573206E6F7420696E2044756E67656F6E73227D2C20224275726E20536861646F772044616E6365206265666F7265204465617468222C20225573652072656D61696E696E6720536861646F772044616E63652063686172676573207768656E20746865207461726765742069732061626F757420746F206469652E22290D0A43726561746550616E656C4F7074696F6E2822436865636B42752O746F6E222C2043505F537562746C6574792C202241504C2E526F6775652E537562746C6574792E537465616C74684D6163726F2E56616E697368222C2022537465616C746820436F6D626F202D2056616E697368222C2022412O6C6F772073752O67657374696E672056616E69736820737465616C7468206162696C69747920636F6D626F7320287265636F2O6D656E6465642922290D0A43726561746550616E656C4F7074696F6E2822436865636B42752O746F6E222C2043505F537562746C6574792C202241504C2E526F6775652E537562746C6574792E537465616C74684D6163726F2E536861646F776D656C64222C2022537465616C746820436F6D626F202D20536861646F776D656C64222C2022412O6C6F772073752O67657374696E6720536861646F776D656C6420737465616C7468206162696C69747920636F6D626F7320287265636F2O6D656E6465642922290D0A43726561746550616E656C4F7074696F6E2822436865636B42752O746F6E222C2043505F537562746C6574792C202241504C2E526F6775652E537562746C6574792E537465616C74684D6163726F2E536861646F7744616E6365222C2022537465616C746820436F6D626F202D20536861646F772044616E6365222C2022412O6C6F772073752O67657374696E6720536861646F772044616E636520737465616C7468206162696C69747920636F6D626F7320287265636F2O6D656E6465642922290D0A437265617465415250616E656C4F7074696F6E732843505F537562746C6574792C202241504C2E526F6775652E537562746C65747922290D0A00063O0012043O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);