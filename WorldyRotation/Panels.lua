local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then v83[v85[2]]=v85[3];elseif (v86>1) then local v113=v85[2];v78=(v113 + v84) -1 ;for v128=v113,v78 do local v129=v79[v128-v113 ];v83[v128]=v129;end else local v114=v85[2];v83[v114]=v83[v114](v83[v114 + 1 ]);end elseif (v86<=4) then if (v86==3) then local v116;local v117;v83[v85[2]]=v59[v85[3]];v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v83[v117]=v83[v117](v83[v117 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v78=(v117 + v84) -1 ;for v131=v117,v78 do v116=v79[v131-v117 ];v83[v131]=v116;end v77=v77 + 1 ;v85=v73[v77];v117=v85[2];v83[v117](v13(v83,v117 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else local v124=v85[2];v83[v124](v13(v83,v124 + 1 ,v78));end elseif (v86>5) then do return;end else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E670321452O003O2D209O3D9O3D9O3D3D20484541444552209O3D9O3D9O3D3D0D0A3O2D207O3D204C4F43414C495A45207O3D0D0A2O2D20412O646F6E0D0A6C6F63616C20612O646F6E4E616D652C205752203D203O2E3B0D0A2O2D204865726F4C69620D0A6C6F63616C20484C203D204865726F4C69623B0D0A6C6F63616C205574696C73203D20484C2E5574696C733B0D0A2O2D204C75610D0A6C6F63616C20737472696E67666F726D6174203D20737472696E672E666F726D61743B0D0A6C6F63616C20737472696E2O676D61746368203D20737472696E672E676D617463683B0D0A6C6F63616C2073747273706C6974203D2073747273706C69743B0D0A6C6F63616C207461626C65636F6E636174203D207461626C652E636F6E6361743B0D0A2O2D2046696C65204C6F63616C730D0A57522E475549203D207B7D3B0D0A6C6F63616C20475549203D2057522E4755493B0D0A6C6F63616C20537472696E67546F4E756D6265724966506F2O7369626C65203D205574696C732E537472696E67546F4E756D6265724966506F2O7369626C653B0D0A6C6F63616C20537562537472696E67436F756E74203D205574696C732E537562537472696E67436F756E743B0D0A0D0A66756E6374696F6E2057522E4755492E4C6F616453652O74696E67735265637572736976656C7920285461626C652C204B6579436861696E290D0A2O206C6F63616C204B6579436861696E203D204B6579436861696E206F72202O223B0D0A2O20666F72204B65792C2056616C756520696E207061697273285461626C652920646F0D0A4O202O2D2047656E657261746520746865204E65774B6579436861696E0D0A4O206C6F63616C204E65774B6579436861696E3B0D0A4O206966204B6579436861696E207E3D202O22207468656E0D0A6O204E65774B6579436861696E203D204B6579436861696E202O2E20222E22202O2E204B65793B0D0A4O20656C73650D0A6O204E65774B6579436861696E203D204B65793B0D0A4O20656E640D0A4O202O2D20436F6E74696E756520746865207461626C652062726F7773696E670D0A4O20696620747970652856616C756529202O3D20227461626C6522207468656E0D0A6O204755492E4C6F616453652O74696E67735265637572736976656C792856616C75652C204E65774B6579436861696E293B0D0A4O202O2D20557064617465207468652076616C75650D0A4O20656C73650D0A6O202O2D20436865636B206966207468652066696E616C206B6579206973206120737472696E67206F722061206E756D6265722028746865206361736520666F72207461626C652076616C7565732077697468206E756D6572696320696E646578290D0A6O206C6F63616C205061727365644B6579203D20537472696E67546F4E756D6265724966506F2O7369626C65284B6579293B0D0A6O202O2D204C6F6164207468652073617665642076616C75650D0A6O206C6F63616C20444253652O74696E67203D20576F726C6479526F746174696F6E44422E47554953652O74696E67735B4E65774B6579436861696E5D3B0D0A6O202O2D204966207468652073617665642076616C7565206578697374732C2074616B652069740D0A6O20696620444253652O74696E67207E3D206E696C207468656E0D0A8O205461626C655B5061727365644B65795D203D20444253652O74696E673B0D0A6O202O2D20456C73652C2073617665207468652064656661756C742076616C75650D0A6O20656C73650D0A8O20576F726C6479526F746174696F6E44422E47554953652O74696E67735B4E65774B6579436861696E5D203D2056616C75653B0D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A2O2D2046696E6420612073652O74696E67207265637572736976656C790D0A6C6F63616C2066756E6374696F6E2046696E6453652O74696E6728496E697469616C4B65792C203O2E290D0A2O206C6F63616C204B657973203D207B203O2E207D0D0A2O206C6F63616C2053652O74696E675461626C65203D20496E697469616C4B65790D0A2O20666F722069203D20312C20234B657973202D203120646F0D0A4O2053652O74696E675461626C65203D2053652O74696E675461626C655B4B6579735B692O5D0D0A2O20656E640D0A2O202O2D20436865636B206966207468652066696E616C206B6579206973206120737472696E67206F722061206E756D6265722028746865206361736520666F72207461626C652076616C7565732077697468206E756D6572696320696E646578290D0A2O206C6F63616C205061727365644B6579203D20537472696E67546F4E756D6265724966506F2O7369626C65284B6579735B234B6579735D290D0A2O2072657475726E2053652O74696E675461626C652C205061727365644B65790D0A656E640D0A0D0A2O2D2046696C74657220742O6F6C74697073206261736564206F6E204F7074696F6E616C7320696E7075740D0A6C6F63616C2066756E6374696F6E2046696C746572542O6F6C74697028542O6F6C7469702C204F7074696F6E616C73290D0A2O206C6F63616C20542O6F6C746970203D20542O6F6C7469700D0A2O206966204F7074696F6E616C73207468656E0D0A4O206966204F7074696F6E616C735B2252656C6F61645265717569726564225D207468656E0D0A6O20542O6F6C746970203D20542O6F6C746970202O2E20225C6E5C6E7C634O464O3054686973206F7074696F6E20726571756972657320612072656C6F616420746F2074616B6520652O666563742E7C72220D0A4O20656E640D0A2O20656E640D0A2O2072657475726E20542O6F6C7469700D0A656E640D0A0D0A2O2D20416E63686F72206120742O6F6C74697020746F2061206672616D650D0A6C6F63616C2066756E6374696F6E20416E63686F72542O6F6C746970284672616D652C20542O6F6C746970290D0A2O204672616D653A53657453637269707428224F6E456E746572222C0D0A4O2066756E6374696F6E2873656C66290D0A6O204D6978696E2847616D65542O6F6C7469702C204261636B64726F7054656D706C6174654D6978696E290D0A6O2047616D65542O6F6C7469703A5365744F776E65722873656C662C2022414E43484F525F524947485422290D0A6O2047616D65542O6F6C7469703A436C6561724C696E657328290D0A6O2047616D65542O6F6C7469703A5365744261636B64726F70436F6C6F7228302C20302C20302C2031290D0A6O2047616D65542O6F6C7469703A5365745465787428542O6F6C7469702C206E696C2C206E696C2C206E696C2C20312C2074727565290D0A6O2047616D65542O6F6C7469703A53686F7728290D0A4O20656E64290D0A2O204672616D653A53657453637269707428224F6E4C65617665222C0D0A4O2066756E6374696F6E2873656C66290D0A6O2047616D65542O6F6C7469703A4869646528290D0A4O20656E64290D0A656E640D0A0D0A6C6F63616C204C6173744F7074696F6E412O746163686564203D207B7D0D0A2O2D204D616B65206120636865636B2062752O746F6E0D0A6C6F63616C2066756E6374696F6E20437265617465436865636B42752O746F6E28506172656E742C2053652O74696E672C20546578742C20542O6F6C7469702C204F7074696F6E616C73290D0A2O202O2D20436F6E7374727563746F720D0A2O206C6F63616C20436865636B42752O746F6E203D204372656174654672616D652822436865636B42752O746F6E222C202224706172656E745F22202O2E2053652O74696E672C20506172656E742C2022496E746572666163654F7074696F6E73436865636B42752O746F6E54656D706C61746522290D0A2O20506172656E745B53652O74696E675D203D20436865636B42752O746F6E0D0A2O20436865636B42752O746F6E2E53652O74696E675461626C652C20436865636B42752O746F6E2E53652O74696E674B6579203D2046696E6453652O74696E6728506172656E742E53652O74696E67735461626C652C2073747273706C697428222E222C2053652O74696E672O290D0A2O20436865636B42752O746F6E2E53617665645661726961626C65735461626C652C20436865636B42752O746F6E2E53617665645661726961626C65734B6579203D20506172656E742E53617665645661726961626C65735461626C652C2053652O74696E670D0A0D0A2O202O2D204672616D6520696E69740D0A2O206966206E6F74204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D207468656E0D0A4O20436865636B42752O746F6E3A536574506F696E742822544F504C454654222C2031352C202D3130290D0A2O20656C73650D0A4O20436865636B42752O746F6E3A536574506F696E742822544F504C454654222C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B315D2C2022424F2O544F4D4C454654222C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B325D2C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B335D290D0A2O20656E640D0A2O204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D203D207B20436865636B42752O746F6E2C20302C2030207D0D0A0D0A2O20436865636B42752O746F6E3A536574436865636B656428436865636B42752O746F6E2E53652O74696E675461626C655B436865636B42752O746F6E2E53652O74696E674B65795D290D0A0D0A2O205F475B436865636B42752O746F6E3A4765744E616D652829202O2E202254657874225D3A5365745465787428227C632O3064666238303222202O2E2054657874202O2E20227C7222290D0A0D0A2O20416E63686F72542O6F6C74697028436865636B42752O746F6E2C2046696C746572542O6F6C74697028542O6F6C7469702C204F7074696F6E616C732O290D0A0D0A2O202O2D2053652O74696E67207570646174650D0A2O206C6F63616C2055706461746553652O74696E670D0A2O206966204F7074696F6E616C7320616E64204F7074696F6E616C735B2252656C6F61645265717569726564225D207468656E0D0A4O2055706461746553652O74696E67203D2066756E6374696F6E2873656C66290D0A6O2073656C662E53617665645661726961626C65735461626C655B73656C662E53617665645661726961626C65734B65795D203D206E6F742073656C662E53652O74696E675461626C655B73656C662E53652O74696E674B65795D0D0A4O20656E640D0A2O20656C73650D0A4O2055706461746553652O74696E67203D2066756E6374696F6E2873656C66290D0A6O206C6F63616C204E657756616C7565203D206E6F742073656C662E53652O74696E675461626C655B73656C662E53652O74696E674B65795D0D0A6O2073656C662E53652O74696E675461626C655B73656C662E53652O74696E674B65795D203D204E657756616C75650D0A6O2073656C662E53617665645661726961626C65735461626C655B73656C662E53617665645661726961626C65734B65795D203D204E657756616C75650D0A4O20656E640D0A2O20656E640D0A2O20436865636B42752O746F6E3A53657453637269707428226F6E436C69636B222C2055706461746553652O74696E67290D0A656E640D0A0D0A2O2D204D616B6520612064726F70646F776E0D0A6C6F63616C2066756E6374696F6E2043726561746544726F70646F776E28506172656E742C2053652O74696E672C2056616C7565732C20546578742C20542O6F6C7469702C204F7074696F6E616C73290D0A2O202O2D20436F6E7374727563746F720D0A2O206C6F63616C2044726F70646F776E203D204372656174654672616D6528224672616D65222C202224706172656E745F22202O2E2053652O74696E672C20506172656E742C2022554944726F70446F776E4D656E7554656D706C61746522290D0A2O20506172656E745B53652O74696E675D203D2044726F70646F776E0D0A2O2044726F70646F776E2E53652O74696E675461626C652C2044726F70646F776E2E53652O74696E674B6579203D2046696E6453652O74696E6728506172656E742E53652O74696E67735461626C652C2073747273706C697428222E222C2053652O74696E672O290D0A2O2044726F70646F776E2E53617665645661726961626C65735461626C652C2044726F70646F776E2E53617665645661726961626C65734B6579203D20506172656E742E53617665645661726961626C65735461626C652C2053652O74696E670D0A0D0A2O202O2D2053652O74696E67207570646174650D0A2O206C6F63616C2055706461746553652O74696E670D0A2O206966204F7074696F6E616C7320616E64204F7074696F6E616C735B2252656C6F61645265717569726564225D207468656E0D0A4O2055706461746553652O74696E67203D2066756E6374696F6E2873656C66290D0A6O20554944726F70446F776E4D656E755F53657453656C656374656449442844726F70646F776E2C2073656C663A4765744944282O290D0A6O2044726F70646F776E2E53617665645661726961626C65735461626C655B44726F70646F776E2E53617665645661726961626C65734B65795D203D20554944726F70446F776E4D656E755F476574546578742844726F70646F776E290D0A4O20656E640D0A2O20656C73650D0A4O2055706461746553652O74696E67203D2066756E6374696F6E2873656C66290D0A6O20554944726F70446F776E4D656E755F53657453656C656374656449442844726F70646F776E2C2073656C663A4765744944282O290D0A6O206C6F63616C2053652O74696E6756616C7565203D20554944726F70446F776E4D656E755F476574546578742844726F70646F776E290D0A6O2044726F70646F776E2E53652O74696E675461626C655B44726F70646F776E2E53652O74696E674B65795D203D2053652O74696E6756616C75650D0A6O2044726F70646F776E2E53617665645661726961626C65735461626C655B44726F70646F776E2E53617665645661726961626C65734B65795D203D2053652O74696E6756616C75650D0A4O20656E640D0A2O20656E640D0A0D0A2O202O2D204672616D6520696E69740D0A2O206966206E6F74204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D207468656E0D0A4O2044726F70646F776E3A536574506F696E742822544F504C454654222C20302C202D3330290D0A2O20656C73650D0A4O2044726F70646F776E3A536574506F696E742822544F504C454654222C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B315D2C2022424F2O544F4D4C454654222C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B325D202D2031352C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B335D202D203230290D0A2O20656E640D0A2O204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D203D207B2044726F70646F776E2C2031352C2030207D0D0A0D0A2O206C6F63616C2066756E6374696F6E20496E697469616C697A652853656C662C204C6576656C290D0A4O206C6F63616C20496E666F203D20554944726F70446F776E4D656E755F437265617465496E666F28290D0A4O20666F72204B65792C2056616C756520696E2070616972732856616C7565732920646F0D0A6O20496E666F203D20554944726F70446F776E4D656E755F437265617465496E666F28290D0A6O20496E666F2E74657874203D2056616C75650D0A6O20496E666F2E76616C7565203D2056616C75650D0A6O20496E666F2E66756E63203D2055706461746553652O74696E670D0A6O20554944726F70446F776E4D656E755F412O6442752O746F6E28496E666F2C204C6576656C290D0A4O20656E640D0A2O20656E640D0A0D0A2O20554944726F70446F776E4D656E755F496E697469616C697A652844726F70646F776E2C20496E697469616C697A65290D0A2O20554944726F70446F776E4D656E755F53657453656C656374656456616C75652844726F70646F776E2C2044726F70646F776E2E53652O74696E675461626C655B44726F70646F776E2E53652O74696E674B65795D290D0A2O20554944726F70446F776E4D656E755F4A757374696679546578742844726F70646F776E2C20224C45465422290D0A0D0A2O206C6F63616C205469746C65203D2044726F70646F776E3A437265617465466F6E74537472696E67286E696C2C20224F5645524C4159222C202247616D65466F6E74486967686C6967687422290D0A2O20506172656E745B53652O74696E67202O2E202244726F70646F776E5469746C65225D203D205469746C650D0A2O205469746C653A536574506F696E742822424F2O544F4D4C454654222C2044726F70646F776E2C2022544F504C454654222C2032302C2035290D0A2O202O2D5469746C653A536574576964746828496E746572666163654F7074696F6E734672616D6550616E656C436F6E7461696E65723A47657452696768742829202D20496E746572666163654F7074696F6E734672616D6550616E656C436F6E7461696E65723A4765744C6566742829202D203330290D0A2O205469746C653A5365744A7573746966794828224C45465422290D0A2O205469746C653A5365745465787428227C632O3064666238303222202O2E2054657874202O2E20227C7222290D0A0D0A2O20416E63686F72542O6F6C7469702844726F70646F776E2C2046696C746572542O6F6C74697028542O6F6C7469702C204F7074696F6E616C732O290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2043726561746544726F70646F776E457828506172656E742C2053652O74696E672C2053617665645661726961626C65735461626C652C2056616C7565732C20546578742C20542O6F6C7469702C204F7074696F6E616C73290D0A2O202O2D20436F6E7374727563746F720D0A2O206C6F63616C2044726F70646F776E203D204372656174654672616D6528224672616D65222C202224706172656E745F22202O2E2053652O74696E672C20506172656E742C2022554944726F70446F776E4D656E7554656D706C61746522290D0A2O20506172656E745B53652O74696E675D203D2044726F70646F776E0D0A2O2044726F70646F776E2E53652O74696E675461626C652C2044726F70646F776E2E53652O74696E674B6579203D2046696E6453652O74696E6728506172656E742E53652O74696E67735461626C652C2073747273706C697428222E222C2053652O74696E672O290D0A2O2044726F70646F776E2E53617665645661726961626C65735461626C652C2044726F70646F776E2E53617665645661726961626C65734B6579203D2053617665645661726961626C65735461626C652C2053652O74696E670D0A0D0A2O202O2D2053652O74696E67207570646174650D0A2O206C6F63616C2055706461746553652O74696E670D0A2O206966204F7074696F6E616C7320616E64204F7074696F6E616C735B2252656C6F61645265717569726564225D207468656E0D0A4O2055706461746553652O74696E67203D2066756E6374696F6E2873656C66290D0A6O20554944726F70446F776E4D656E755F53657453656C656374656449442844726F70646F776E2C2073656C663A4765744944282O290D0A6O2069662044726F70646F776E2E53617665645661726961626C65735461626C655B44726F70646F776E2E53617665645661726961626C65734B65795D207E3D20554944726F70446F776E4D656E755F476574546578742844726F70646F776E29207468656E0D0A8O2044726F70646F776E2E53617665645661726961626C65735461626C655B44726F70646F776E2E53617665645661726961626C65734B65795D203D20554944726F70446F776E4D656E755F476574546578742844726F70646F776E290D0A8O2052656C6F6164554928290D0A6O20656E640D0A4O20656E640D0A2O20656C73650D0A4O2055706461746553652O74696E67203D2066756E6374696F6E2873656C66290D0A6O20554944726F70446F776E4D656E755F53657453656C656374656449442844726F70646F776E2C2073656C663A4765744944282O290D0A6O206C6F63616C2053652O74696E6756616C7565203D20554944726F70446F776E4D656E755F476574546578742844726F70646F776E290D0A6O2044726F70646F776E2E53652O74696E675461626C655B44726F70646F776E2E53652O74696E674B65795D203D2053652O74696E6756616C75650D0A6O2044726F70646F776E2E53617665645661726961626C65735461626C655B44726F70646F776E2E53617665645661726961626C65734B65795D203D2053652O74696E6756616C75650D0A4O20656E640D0A2O20656E640D0A0D0A2O202O2D204672616D6520696E69740D0A2O206966206E6F74204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D207468656E0D0A4O2044726F70646F776E3A536574506F696E742822544F504C454654222C20302C202D3330290D0A2O20656C73650D0A4O2044726F70646F776E3A536574506F696E742822544F504C454654222C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B315D2C2022424F2O544F4D4C454654222C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B325D202D2031352C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B335D202D203230290D0A2O20656E640D0A2O204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D203D207B2044726F70646F776E2C2031352C2030207D0D0A0D0A2O206C6F63616C2066756E6374696F6E20496E697469616C697A652853656C662C204C6576656C290D0A4O206C6F63616C20496E666F203D20554944726F70446F776E4D656E755F437265617465496E666F28290D0A4O20666F72204B65792C2056616C756520696E2070616972732856616C7565732920646F0D0A6O20496E666F203D20554944726F70446F776E4D656E755F437265617465496E666F28290D0A6O20496E666F2E74657874203D2056616C75650D0A6O20496E666F2E76616C7565203D2056616C75650D0A6O20496E666F2E66756E63203D2055706461746553652O74696E670D0A6O20554944726F70446F776E4D656E755F412O6442752O746F6E28496E666F2C204C6576656C290D0A4O20656E640D0A0D0A2O20656E640D0A0D0A2O20554944726F70446F776E4D656E755F496E697469616C697A652844726F70646F776E2C20496E697469616C697A65290D0A2O20554944726F70446F776E4D656E755F53657453656C656374656456616C75652844726F70646F776E2C2044726F70646F776E2E53617665645661726961626C65735461626C655B44726F70646F776E2E53617665645661726961626C65734B65795D290D0A2O20554944726F70446F776E4D656E755F4A757374696679546578742844726F70646F776E2C20224C45465422290D0A0D0A2O206C6F63616C205469746C65203D2044726F70646F776E3A437265617465466F6E74537472696E67286E696C2C20224F5645524C4159222C202247616D65466F6E74486967686C6967687422290D0A2O20506172656E745B53652O74696E67202O2E202244726F70646F776E5469746C65225D203D205469746C650D0A2O205469746C653A536574506F696E742822424F2O544F4D4C454654222C2044726F70646F776E2C2022544F504C454654222C2032302C2035290D0A2O205469746C653A5365744A7573746966794828224C45465422290D0A2O205469746C653A5365745465787428227C632O3064666238303222202O2E2054657874202O2E20227C7222290D0A0D0A2O20416E63686F72542O6F6C7469702844726F70646F776E2C2046696C746572542O6F6C74697028542O6F6C7469702C204F7074696F6E616C732O290D0A2O2072657475726E2044726F70646F776E0D0A656E640D0A0D0A2O2D204D616B65206120536C696465720D0A6C6F63616C2066756E6374696F6E20437265617465536C6964657228506172656E742C2053652O74696E672C2056616C7565732C20546578742C20542O6F6C7469702C20416374696F6E2C204F7074696F6E616C73290D0A2O202O2D20436F6E7374727563746F720D0A2O206C6F63616C20536C69646572203D204372656174654672616D652822536C69646572222C202224706172656E745F22202O2E2053652O74696E672C20506172656E742C20224F7074696F6E73536C6964657254656D706C61746522290D0A2O20506172656E745B53652O74696E675D203D20536C696465720D0A2O20536C696465722E53652O74696E675461626C652C20536C696465722E53652O74696E674B6579203D2046696E6453652O74696E6728506172656E742E53652O74696E67735461626C652C2073747273706C697428222E222C2053652O74696E672O290D0A0D0A2O20536C696465722E53617665645661726961626C65735461626C652C20536C696465722E53617665645661726961626C65734B6579203D20506172656E742E53617665645661726961626C65735461626C652C2053652O74696E670D0A0D0A2O202O2D204672616D6520696E69740D0A2O206966206E6F74204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D207468656E0D0A4O20536C696465723A536574506F696E742822544F504C454654222C2032302C202D3235290D0A2O20656C73650D0A4O20536C696465723A536574506F696E742822544F504C454654222C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B315D2C2022424F2O544F4D4C454654222C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B325D202B20352C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B335D202D203230290D0A2O20656E640D0A2O204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D203D207B20536C696465722C202D352C202D3230207D0D0A0D0A2O20536C696465723A5365744D696E4D617856616C7565732856616C7565735B315D2C2056616C7565735B325D290D0A2O20536C696465722E6D696E56616C75652C20536C696465722E6D617856616C7565203D20536C696465723A4765744D696E4D617856616C75657328290D0A2O20536C696465723A53657456616C756528536C696465722E53652O74696E675461626C655B536C696465722E53652O74696E674B65795D290D0A2O20536C696465723A53657456616C7565537465702856616C7565735B335D290D0A2O20536C696465723A5365744F626579537465704F6E447261672874727565290D0A0D0A2O206C6F63616C204E616D65203D20536C696465723A4765744E616D6528290D0A2O205F475B4E616D65202O2E20224C6F77225D3A5365745465787428536C696465722E6D696E56616C7565290D0A2O205F475B4E616D65202O2E202248696768225D3A5365745465787428536C696465722E6D617856616C7565290D0A0D0A2O20416E63686F72542O6F6C74697028536C696465722C2046696C746572542O6F6C74697028542O6F6C7469702C204F7074696F6E616C732O290D0A0D0A2O202O2D2053652O74696E67207570646174650D0A2O206C6F63616C2053686F7756616C7565203D20536C696465723A437265617465466F6E74537472696E67286E696C2C20224F5645524C4159222C202247616D65466F6E74486967686C69676874536D612O6C22290D0A2O20506172656E745B53652O74696E67202O2E2022536C6964657253686F7756616C7565225D203D2053686F7756616C75650D0A2O2053686F7756616C75653A536574506F696E742822544F50222C20536C696465722C2022424F2O544F4D222C20302C2030290D0A2O2053686F7756616C75653A5365745769647468283530290D0A2O2053686F7756616C75653A5365744A75737469667948282243454E54455222290D0A2O2053686F7756616C75653A5365745465787428737472696E67666F726D61742822252E3266222C20536C696465722E53652O74696E675461626C655B536C696465722E53652O74696E674B65795D2O290D0A0D0A2O206C6F63616C204C6162656C203D20536C696465723A437265617465466F6E74537472696E67286E696C2C20224F5645524C4159222C202247616D65466F6E744E6F726D616C22290D0A2O204C6162656C3A536574506F696E742822424F2O544F4D4C454654222C20536C696465722C2022544F504C45465422290D0A2O204C6162656C3A5365744A7573746966794828224C45465422290D0A2O204C6162656C3A5365745465787428227C632O3064666238303222202O2E2054657874202O2E20227C7222290D0A0D0A2O206C6F63616C2055706461746553652O74696E670D0A2O206966204F7074696F6E616C7320616E64204F7074696F6E616C735B2252656C6F61645265717569726564225D207468656E0D0A4O2055706461746553652O74696E67203D2066756E6374696F6E2873656C66290D0A6O206C6F63616C2056616C7565203D2073656C663A47657456616C756528290D0A6O2073656C662E53617665645661726961626C65735461626C655B73656C662E53617665645661726961626C65734B65795D203D2056616C75650D0A6O2053686F7756616C75653A5365745465787428737472696E67666F726D61742822252E3266222C2056616C75652O290D0A6O20696620416374696F6E207468656E0D0A8O20416374696F6E2873656C663A47657456616C7565282O290D0A6O20656E640D0A4O20656E640D0A2O20656C73650D0A4O2055706461746553652O74696E67203D2066756E6374696F6E2873656C66290D0A6O206C6F63616C2056616C7565203D2073656C663A47657456616C756528290D0A6O2073656C662E53652O74696E675461626C655B73656C662E53652O74696E674B65795D203D2056616C75650D0A6O2073656C662E53617665645661726961626C65735461626C655B73656C662E53617665645661726961626C65734B65795D203D2056616C75650D0A6O20696620416374696F6E207468656E0D0A8O20416374696F6E2873656C663A47657456616C7565282O290D0A6O20656E640D0A6O2053686F7756616C75653A5365745465787428737472696E67666F726D61742822252E3266222C2056616C75652O290D0A4O20656E640D0A2O20656E640D0A2O20536C696465723A53657453637269707428224F6E56616C75654368616E676564222C2055706461746553652O74696E67290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2043726561746542752O746F6E28506172656E742C2053652O74696E672C20546578742C20542O6F6C7469702C20416374696F6E2C2057696474682C204865696768742C204F7074696F6E616C73290D0A2O206C6F63616C2042752O746F6E203D204372656174654672616D65282242752O746F6E222C202224706172656E745F22202O2E2053652O74696E672C20506172656E742C2022554950616E656C42752O746F6E54656D706C61746522290D0A2O20506172656E745B53652O74696E675D203D2042752O746F6E0D0A0D0A2O206966205769647468207468656E0D0A4O2042752O746F6E3A5365745769647468285769647468290D0A2O20656C73650D0A4O2042752O746F6E3A536574576964746828313530290D0A2O20656E640D0A2O20696620486569676874207468656E0D0A4O2042752O746F6E3A53657448656967687428486569676874290D0A2O20656C73650D0A4O2042752O746F6E3A536574486569676874283230290D0A2O20656E640D0A0D0A2O202O2D204672616D6520696E69740D0A2O206966206E6F74204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D207468656E0D0A4O2042752O746F6E3A536574506F696E742822544F504C454654222C2031352C202D3130290D0A2O20656C73650D0A4O2042752O746F6E3A536574506F696E742822544F504C454654222C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B315D2C2022424F2O544F4D4C454654222C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B325D2C204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D5B335D290D0A2O20656E640D0A2O204C6173744F7074696F6E412O7461636865645B506172656E742E757365644E616D655D203D207B2042752O746F6E2C20302C2030207D0D0A0D0A2O205F475B42752O746F6E3A4765744E616D652829202O2E202254657874225D3A5365745465787428227C632O3064666238303222202O2E2054657874202O2E20227C7222290D0A0D0A2O20416E63686F72542O6F6C7469702842752O746F6E2C2046696C746572542O6F6C74697028542O6F6C7469702C204F7074696F6E616C732O290D0A0D0A2O2042752O746F6E3A53657453637269707428226F6E436C69636B222C20416374696F6E290D0A656E640D0A0D0A3O2D207O3D205055424C49432050414E454C532046554E4354494F4E53207O3D0D0A4755492E50616E656C735461626C65203D207B7D0D0A2O2D204D616B6520612070616E656C0D0A66756E6374696F6E204755492E43726561746550616E656C28506172656E742C20412O646F6E2C20504E616D652C2053652O74696E67735461626C652C2053617665645661726961626C65735461626C65290D0A2O206C6F63616C2050616E656C203D204372656174654672616D6528224672616D65222C20412O646F6E202O2E20225F22202O2E20504E616D652C205549506172656E74290D0A2O20506172656E742E50616E656C203D2050616E656C0D0A2O20506172656E742E50616E656C2E4368696C6472656E203D207B7D0D0A2O20506172656E742E50616E656C2E53652O74696E67735461626C65203D2053652O74696E67735461626C650D0A2O20506172656E742E50616E656C2E53617665645661726961626C65735461626C65203D2053617665645661726961626C65735461626C650D0A2O2050616E656C2E6E616D65203D20412O646F6E0D0A2O2050616E656C2E757365644E616D65203D20412O646F6E3A67737562282220222C202O22290D0A2O206C6F63616C2063617465676F7279203D2053652O74696E67732E526567697374657243616E7661734C61796F757443617465676F72792850616E656C2C20412O646F6E290D0A2O2053652O74696E67732E5265676973746572412O644F6E43617465676F72792863617465676F7279290D0A2O2050616E656C2E63617465676F7279203D2063617465676F72790D0A2O204755492E50616E656C735461626C655B50616E656C2E757365644E616D655D203D2050616E656C0D0A2O204755492E50616E656C735461626C655B50616E656C2E63617465676F72795D203D2063617465676F72790D0A2O2072657475726E2050616E656C0D0A656E640D0A0D0A2O2D204D616B652061206368696C642070616E656C0D0A66756E6374696F6E204755492E4372656174654368696C6450616E656C28506172656E742C20434E616D65290D0A2O202O2D20496E64656E7420746865206368696C64206966206E2O656465640D0A2O206C6F63616C20506172656E744E616D65203D20506172656E743A4765744E616D6528290D0A2O206C6F63616C20434C6576656C203D20537562537472696E67436F756E7428506172656E744E616D652C20225F4368696C6450616E656C5F22290D0A2O206C6F63616C20434E616D65203D20434E616D650D0A2O206C6F63616C204350203D204372656174654672616D6528224672616D65222C20506172656E744E616D65202O2E20225F4368696C6450616E656C5F22202O2E20434E616D652C20506172656E74290D0A2O20506172656E742E4368696C6472656E5B434E616D655D203D2043500D0A2O2043502E4368696C6472656E203D207B7D0D0A2O2043502E53652O74696E67735461626C65203D20506172656E742E53652O74696E67735461626C650D0A2O2043502E53617665645661726961626C65735461626C65203D20506172656E742E53617665645661726961626C65735461626C650D0A2O2043502E6E616D65203D20434E616D650D0A2O2043502E706172656E74203D20506172656E742E6E616D650D0A2O2043502E757365644E616D65203D20506172656E744E616D65202O2E20225F4368696C6450616E656C5F22202O2E20434E616D653A67737562282220222C202O22290D0A2O206C6F63616C2063617465676F7279203D2053652O74696E67732E526567697374657243616E7661734C61796F757453756263617465676F727928506172656E742E63617465676F72792C2043502C20434E616D65290D0A2O2053652O74696E67732E5265676973746572412O644F6E43617465676F72792863617465676F7279290D0A2O2043502E63617465676F7279203D2063617465676F72790D0A2O204755492E50616E656C735461626C655B43502E757365644E616D655D203D2043500D0A2O204755492E50616E656C735461626C655B43502E63617465676F72795D203D2063617465676F72790D0A2O2072657475726E2043500D0A656E640D0A0D0A2O2D20546F2O676C6520612070616E656C0D0A66756E6374696F6E204755492E546F2O676C6550616E656C2850616E656C290D0A2O206C6F63616C205461626C65203D207B7D0D0A2O205461626C652E656C656D656E74203D2050616E656C0D0A2O20496E746572666163654F7074696F6E734C69737442752O746F6E5F546F2O676C6553756243617465676F72696573285461626C65290D0A656E640D0A0D0A66756E6374696F6E204755492E53657444726F70646F776E56616C7565732844726F70646F776E2C2056616C7565732C2053656C656374656456616C7565290D0A2O206C6F63616C2066756E6374696F6E20496E697469616C697A652853656C662C204C6576656C290D0A4O206C6F63616C20496E666F203D20554944726F70446F776E4D656E755F437265617465496E666F28290D0A4O20666F72204B65792C2056616C756520696E2070616972732856616C7565732920646F0D0A6O20496E666F203D20554944726F70446F776E4D656E755F437265617465496E666F28290D0A6O20496E666F2E74657874203D2056616C75650D0A6O20496E666F2E76616C7565203D2056616C75650D0A6O20496E666F2E66756E63203D2055706461746553652O74696E670D0A6O20554944726F70446F776E4D656E755F412O6442752O746F6E28496E666F2C204C6576656C290D0A4O20656E640D0A2O20656E640D0A0D0A2O20554944726F70446F776E4D656E755F496E697469616C697A652844726F70646F776E2C20496E697469616C697A65290D0A2O20554944726F70446F776E4D656E755F53657453656C656374656456616C75652844726F70646F776E2C2053656C656374656456616C7565290D0A656E640D0A0D0A2O2D204D616B6520612070616E656C206F7074696F6E0D0A6C6F63616C2043726561746550616E656C4F7074696F6E203D207B0D0A2O20436865636B42752O746F6E203D20437265617465436865636B42752O746F6E2C0D0A2O2044726F70646F776E203D2043726561746544726F70646F776E2C0D0A2O2044726F70646F776E4578203D2043726561746544726F70646F776E45782C0D0A2O20536C69646572203D20437265617465536C696465722C0D0A2O2042752O746F6E203D2043726561746542752O746F6E0D0A7D0D0A66756E6374696F6E204755492E43726561746550616E656C4F7074696F6E28547970652C203O2E290D0A2O2072657475726E2043726561746550616E656C4F7074696F6E5B547970655D283O2E290D0A656E640D0A0D0A66756E6374696F6E204755492E47657450616E656C42794E616D652850616E656C4E616D65290D0A2O2072657475726E204755492E50616E656C735461626C655B50616E656C4E616D655D0D0A656E640D0A0D0A646F0D0A2O206C6F63616C20437265617465415250616E656C4F7074696F6E203D207B0D0A4O20456E61626C6564203D2066756E6374696F6E202850616E656C2C2053652O74696E672C204E616D65290D0A6O204755492E43726561746550616E656C4F7074696F6E2822436865636B42752O746F6E222C2050616E656C2C2053652O74696E672C20225573653A2022202O2E204E616D652C2022456E61626C6520696620796F752077616E7420746F207573652022202O2E204E616D65202O2E20222E22293B0D0A4O20656E642C0D0A4O205468726573686F6C64203D2066756E6374696F6E2850616E656C2C2053652O74696E672C204E616D65290D0A6O204755492E43726561746550616E656C4F7074696F6E2822536C69646572222C2050616E656C2C2053652O74696E672C207B302C20312O302C20317D2C20225468726573686F6C643A2022202O2E204E616D652C202253657420746865207468726573686F6C64206F662022202O2E204E616D65202O2E20222E2053657420746F203020746F2064697361626C652E22293B0D0A4O20656E642C0D0A4O204850203D2066756E6374696F6E2850616E656C2C2053652O74696E672C204E616D65290D0A6O204755492E43726561746550616E656C4F7074696F6E2822536C69646572222C2050616E656C2C2053652O74696E672C207B302C20312O302C20317D2C202248503A2022202O2E204E616D652C202253657420746865204850207468726573686F6C64206F662022202O2E204E616D65202O2E20222E2053657420746F203020746F2064697361626C652E22293B0D0A4O20656E642C0D0A4O20416F45203D2066756E6374696F6E2850616E656C2C2053652O74696E672C204E616D65290D0A6O204755492E43726561746550616E656C4F7074696F6E2822536C69646572222C2050616E656C2C2053652O74696E672C207B302C20352C20317D2C2022416F453A2022202O2E204E616D652C20225365742074686520416F4520636F756E74206F662022202O2E204E616D65202O2E20222E2053657420746F203020746F2064697361626C652E22293B0D0A4O20656E642C0D0A4O20416F4547726F7570203D2066756E6374696F6E2850616E656C2C2053652O74696E672C204E616D65290D0A6O204755492E43726561746550616E656C4F7074696F6E2822536C69646572222C2050616E656C2C2053652O74696E672C207B312C20352C20317D2C202247726F75703A2022202O2E204E616D652C20225365742074686520416F452067726F757020636F756E74206F662022202O2E204E616D65202O2E20222E22293B0D0A4O20656E642C0D0A4O20416F4552616964203D2066756E6374696F6E2850616E656C2C2053652O74696E672C204E616D65290D0A6O204755492E43726561746550616E656C4F7074696F6E2822536C69646572222C2050616E656C2C2053652O74696E672C207B312C2032302C20317D2C2022526169643A2022202O2E204E616D652C20225365742074686520416F45207261696420636F756E74206F662022202O2E204E616D65202O2E20222E22293B0D0A4O20656E642C0D0A2O207D3B0D0A2O2066756E6374696F6E204755492E437265617465415250616E656C4F7074696F6E2028547970652C2050616E656C2C2053652O74696E672C203O2E290D0A4O20437265617465415250616E656C4F7074696F6E5B547970655D2850616E656C2C2053652O74696E672C203O2E293B0D0A2O20656E640D0A0D0A2O2066756E6374696F6E204755492E437265617465415250616E656C4F7074696F6E73202850616E656C2C2053652O74696E6773290D0A4O202O2D2046696E642074686520636F2O726573706F6E64696E672073652O74696E67207461626C650D0A4O206C6F63616C2053652O74696E677353706C6974203D207B73747273706C697428222E222C2053652O74696E6773297D3B0D0A4O206C6F63616C2053652O74696E67735461626C65203D2057522E47554953652O74696E67733B0D0A4O20666F722069203D20312C202353652O74696E677353706C697420646F0D0A6O2053652O74696E67735461626C65203D2053652O74696E67735461626C655B53652O74696E677353706C69745B692O5D3B0D0A4O20656E640D0A4O202O2D2049746572617465206F76657220612O6C206F7074696F6E7320617661696C61626C650D0A4O20666F7220547970652C205F20696E20706169727328437265617465415250616E656C4F7074696F6E2920646F0D0A6O2053652O74696E677354797065203D2053652O74696E67735461626C655B547970655D3B0D0A6O2069662053652O74696E677354797065207468656E0D0A8O20666F722053652O74696E674E616D652C205F20696E2070616972732853652O74696E6773547970652920646F0D0A9O20202O2D2053706C697420746865206B6579206F6E20752O70657263617365206D6174636865730D0A9O20206C6F63616C204E616D65203D202O223B0D0A9O2020666F7220576F726420696E20737472696E2O676D617463682853652O74696E674E616D652C20225B412D5A5D5B612D7A5D2A222920646F0D0A9O203O206966204E616D65202O3D202O22207468656E0D0A9O205O204E616D65203D20576F72643B0D0A9O203O20656C73650D0A9O205O204E616D65203D204E616D65202O2E20222022202O2E20576F72643B0D0A9O203O20656E640D0A9O2020656E640D0A9O20202O2D2052657772697465207468652073652O74696E6720737472696E670D0A9O20206C6F63616C2053652O74696E67203D207461626C65636F6E636174287B53652O74696E67732C20547970652C2053652O74696E674E616D657D2C20222E22293B0D0A9O20202O2D20436F6E73747275637420746865206F7074696F6E0D0A9O20204755492E437265617465415250616E656C4F7074696F6E28547970652C2050616E656C2C2053652O74696E672C204E616D65293B0D0A8O20656E640D0A6O20656E640D0A4O20656E640D0A2O20656E640D0A656E640D0A00063O0012033O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);