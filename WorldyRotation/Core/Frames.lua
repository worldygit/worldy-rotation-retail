local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111]=v83[v111](v83[v111 + 1 ]);elseif (v86==1) then v83[v85[2]]=v85[3];else do return;end end elseif (v86<=3) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86>4) then local v123=v85[2];v78=(v123 + v84) -1 ;for v129=v123,v78 do local v130=v79[v129-v123 ];v83[v129]=v130;end else do return;end end elseif (v86<=8) then if (v86<=6) then v83[v85[2]]=v85[3];elseif (v86==7) then local v124=v85[2];v78=(v124 + v84) -1 ;for v132=v124,v78 do local v133=v79[v132-v124 ];v83[v132]=v133;end else local v125=v85[2];v83[v125](v13(v83,v125 + 1 ,v78));end elseif (v86<=9) then local v115=v85[2];v83[v115]=v83[v115](v83[v115 + 1 ]);elseif (v86>10) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v126=v85[2];v83[v126](v13(v83,v126 + 1 ,v78));end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E6703D13A2O006C6F63616C20612O646F6E4E616D65203D203O2E0D0A0D0A6C6F63616C207574696C73203D2057522E7574696C730D0A6C6F63616C20616365677569203D204C6962537475622822576F726C64794163654755492D332E3022290D0A0D0A57522E6672616D6573203D207B7D0D0A57522E6672616D65732E722O6F74203D204372656174654672616D6528224672616D65222C20612O646F6E4E616D65202O2E20225F522O6F74222C205549506172656E74290D0A57522E6672616D65732E746F2O676C6573203D204372656174654672616D6528224672616D65222C20612O646F6E4E616D65202O2E20225F546F2O676C6573222C205549506172656E74290D0A57522E6672616D65732E6E616D65706C617465203D204372656174654672616D6528224672616D65222C20612O646F6E4E616D65202O2E20225F4E616D65706C617465222C205549506172656E74290D0A57522E6672616D65732E7370656353652O74696E6773203D206163656775693A43726561746528224672616D6522290D0A57522E6672616D65732E7370656353652O74696E67733A4869646528290D0A0D0A66756E6374696F6E2057523A496E69744672616D657328290D0A2O2073656C662E6672616D65732E722O6F743A496E697428290D0A2O2073656C662E6672616D65732E746F2O676C65733A496E697428290D0A2O2073656C662E6672616D65732E6E616D65706C6174653A496E697428290D0A2O2073656C662E6672616D65732E7370656353652O74696E67733A496E697428290D0A656E640D0A0D0A66756E6374696F6E2057523A5570646174654672616D657328290D0A2O202O2D20722O6F740D0A2O2073656C662E6672616D65732E722O6F743A436C656172412O6C506F696E747328290D0A2O2073656C662E6672616D65732E722O6F743A536574506F696E742873656C662E64622E676C6F62616C2E6672616D65732E722O6F742E706F736974696F6E2C20302C2030290D0A2O2073656C662E6672616D65732E722O6F743A536574506978656C28312C2073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E6F6E290D0A0D0A2O202O2D20746F2O676C65730D0A2O2069662073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E656E61626C65642E73686F77546F2O676C6573207468656E0D0A4O2073656C662E6672616D65732E746F2O676C65733A53686F7728290D0A2O20656C73650D0A4O2073656C662E6672616D65732E746F2O676C65733A4869646528290D0A2O20656E640D0A2O2073656C662E6672616D65732E746F2O676C65733A436C656172412O6C506F696E747328290D0A2O2073656C662E6672616D65732E746F2O676C65733A536574506F696E742873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E706F736974696F6E2E616E63686F722C2073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E706F736974696F6E2E782C2073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E706F736974696F6E2E79290D0A2O2073656C662E6672616D65732E746F2O676C65733A5365745769647468282373656C662E6672616D65732E746F2O676C65732E62752O746F6E73202A202873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C655769647468202B2073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C6550612O64696E6729202B202873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C654D617267696E202A20322O290D0A2O2073656C662E6672616D65732E746F2O676C65733A5365744865696768742873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C65486569676874202B202873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C654D617267696E202A20322O290D0A2O2073656C662E6672616D65732E746F2O676C65733A5365744D6F7661626C65286E6F742073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E656E61626C65642E6C6F636B546F2O676C6573290D0A2O2073656C662E6672616D65732E746F2O676C65733A456E61626C654D6F757365286E6F742073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E656E61626C65642E6C6F636B546F2O676C6573290D0A2O2073656C662E6672616D65732E746F2O676C65732E746578747572653A536574436F6C6F725465787475726528302C20302C20302C2073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E656E61626C65642E6C6F636B546F2O676C657320616E642030206F7220302E35290D0A2O20666F722069203D20312C202373656C662E6672616D65732E746F2O676C65732E62752O746F6E7320646F0D0A4O206C6F63616C2062752O746F6E203D2073656C662E6672616D65732E746F2O676C65732E62752O746F6E735B695D0D0A4O2062752O746F6E3A536574506F696E742822544F504C454654222C2073656C662E6672616D65732E746F2O676C65732C2022544F504C454654222C2073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C654D617267696E202B202O2869202D203129202A202873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C655769647468202B2073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C6550612O64696E672O292C202D73656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C654D617267696E290D0A4O2062752O746F6E3A53657457696474682873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C655769647468290D0A4O2062752O746F6E3A5365744865696768742873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C65486569676874290D0A4O2062752O746F6E2E666F6E743A536574466F6E742822466F6E74732F4652495A51542O5F2E2O5446222C2073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C655769647468202F20332C20224F55544C494E4522290D0A4O2069662062752O746F6E2E64625B62752O746F6E2E7661725D207468656E0D0A6O2062752O746F6E2E666F6E743A53657454657874436F6C6F72287574696C732E486578546F5247422873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E636F6C6F722E746F2O676C65466F6E74456E61626C65642O290D0A6O2062752O746F6E2E746578747572653A536574436F6C6F7254657874757265287574696C732E486578546F5247422873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E636F6C6F722E746F2O676C6542752O746F6E456E61626C65642O290D0A4O20656C73650D0A6O2062752O746F6E2E666F6E743A53657454657874436F6C6F72287574696C732E486578546F5247422873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E636F6C6F722E746F2O676C65466F6E7444697361626C65642O290D0A6O2062752O746F6E2E746578747572653A536574436F6C6F7254657874757265287574696C732E486578546F5247422873656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E636F6C6F722E746F2O676C6542752O746F6E44697361626C65642O290D0A4O20656E640D0A2O20656E640D0A0D0A2O202O2D206E616D65706C6174650D0A2O206966206E6F742073656C662E64622E676C6F62616C2E6672616D65732E6E616D65706C6174652E656E61626C65642E73686F774379636C6549636F6E206F72206E6F742073656C662E64622E676C6F62616C2E6672616D65732E746F2O676C65732E6F6E207468656E0D0A4O2073656C662E6672616D65732E6E616D65706C6174653A4869646528290D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E722O6F743A496E697428290D0A2O2073656C663A5365744672616D655374726174612822542O4F4C54495022290D0A2O2073656C663A5365744672616D654C6576656C28314O30290D0A2O2073656C663A53657453697A6528352C203129202O2D203120566572696679207C203220546F2O676C65207C2033204B6579207C2034204D6F6431207C2035204D6F64320D0A2O2073656C663A536574506F696E742857522E64622E676C6F62616C2E6672616D65732E722O6F742E706F736974696F6E2C20302C2030290D0A2O2073656C663A53657449676E6F7265506172656E74416C7068612874727565290D0A2O2073656C663A53657449676E6F7265506172656E745363616C652874727565290D0A2O2073656C663A536574436C616D706564546F5363722O656E2874727565290D0A2O2073656C662E7465787475726573203D207B7D0D0A2O2073656C662E6D6163726F73203D207B7D0D0A2O20666F722069203D20302C203420646F0D0A4O2073656C662E74657874757265735B695D203D2073656C663A4372656174655465787475726528290D0A4O2073656C662E74657874757265735B695D3A536574436F6C6F725465787475726528302C20302C20302C2031290D0A4O2073656C662E74657874757265735B695D3A536574506F696E742822544F504C454654222C2073656C662C20692C2030290D0A2O20656E640D0A0D0A2O2073656C663A536574506978656C28302C20343134313431290D0A2O2073656C663A536574506978656C28312C2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E6F6E290D0A0D0A2O2073656C663A53686F7728290D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E722O6F743A53657442696E642862696E64696E674B6579290D0A2O206C6F63616C2062696E64496E666F203D2057522E62696E642E47657442696E64496E666F2862696E64696E674B6579290D0A2O2073656C663A536574506978656C28322C2062696E64496E666F2E6B6579290D0A2O2073656C663A536574506978656C28332C2062696E64496E666F2E6D6F6431290D0A2O2073656C663A536574506978656C28342C2062696E64496E666F2E6D6F6432290D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E722O6F743A536574506978656C28706978656C2C2064617461290D0A2O206C6F63616C206E756D6265720D0A2O2069662064617461202O3D206E696C207468656E0D0A4O206E756D626572203D20300D0A2O20656C736569662074797065286461746129202O3D2022622O6F6C65616E22207468656E0D0A4O206E756D626572203D206461746120616E642031206F7220300D0A2O20656C73650D0A4O206E756D626572203D20746F6E756D6265722864617461290D0A2O20656E640D0A2O206C6F63616C2063203D206D6174682E6D696E286D6174682E6D6178286E756D6265722C2030292C2031363O37323136290D0A2O206C6F63616C2062203D20632025203235360D0A2O206C6F63616C2067203D202O2863202D206229202F20323536292025203235360D0A2O206C6F63616C2072203D202O2863202D206229202F20362O35333629202D202867202F20323536290D0A2O2073656C662E74657874757265735B706978656C5D3A536574436F6C6F72546578747572652872202F20322O352C2067202F20322O352C2062202F20322O352C2031290D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E722O6F743A412O644D6163726F286F626A656374290D0A2O2073656C662E6D6163726F735B6F626A6563742E6D6163726F49445D203D204372656174654672616D65282242752O746F6E222C206F626A6563742E6D6163726F49442C2073656C662C2022536563757265416374696F6E42752O746F6E54656D706C61746522290D0A2O2073656C662E6D6163726F735B6F626A6563742E6D6163726F49445D3A536574412O74726962757465282274797065222C20226D6163726F22290D0A2O2073656C662E6D6163726F735B6F626A6563742E6D6163726F49445D3A536574412O7472696275746528226D6163726F74657874222C206F626A6563742E6D6163726F54657874290D0A2O2073656C662E6D6163726F735B6F626A6563742E6D6163726F49445D3A5265676973746572466F72436C69636B732822416E79446F776E22290D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E746F2O676C65733A496E697428290D0A2O2073656C662E62752O746F6E73203D207B7D0D0A2O2073656C663A5365744672616D6553747261746128224241434B47524F554E4422290D0A2O2073656C663A5365744672616D654C6576656C2857522E6672616D65732E722O6F743A4765744672616D654C6576656C2829202D2031290D0A2O2073656C663A536574506F696E742857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E706F736974696F6E2E616E63686F722C2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E706F736974696F6E2E782C2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E706F736974696F6E2E79290D0A2O2073656C663A536574436C616D706564546F5363722O656E2874727565290D0A0D0A2O2073656C662E74657874757265203D2073656C663A43726561746554657874757265286E696C2C20224241434B47524F554E4422290D0A2O2073656C662E746578747572653A536574412O6C506F696E74732873656C66290D0A2O2073656C662E746578747572653A536574436F6C6F725465787475726528302C20302C20302C2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E656E61626C65642E6C6F636B546F2O676C657320616E642030206F7220302E35290D0A0D0A2O2073656C663A412O6442752O746F6E2822436F6E666967222C2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732C2022636F6E66696722290D0A2O2073656C663A412O6442752O746F6E28224F6E222C2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732C20226F6E22290D0A2O2073656C663A412O6442752O746F6E2822434473222C2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732C202263647322290D0A2O2073656C663A412O6442752O746F6E2822416F45222C2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732C2022616F6522290D0A0D0A2O2073656C663A5365745769647468282373656C662E62752O746F6E73202A202857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C655769647468202B2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C6550612O64696E6729202B202857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C654D617267696E202A20322O290D0A2O2073656C663A5365744865696768742857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C65486569676874202B202857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C654D617267696E202A20322O290D0A0D0A2O2073656C663A5365744D6F7661626C65286E6F742057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E656E61626C65642E6C6F636B546F2O676C6573290D0A2O2073656C663A456E61626C654D6F757365286E6F742057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E656E61626C65642E6C6F636B546F2O676C6573290D0A2O2073656C663A53657453637269707428224F6E4D6F757365446F776E222C2066756E6374696F6E286672616D652C2062752O746F6E290D0A4O206966206E6F742057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E656E61626C65642E6C6F636B546F2O676C657320616E642062752O746F6E202O3D20224C65667442752O746F6E2220616E64206E6F74206672616D652E69734D6F76696E67207468656E0D0A6O206672616D653A53746172744D6F76696E6728290D0A6O206672616D652E69734D6F76696E67203D20747275650D0A4O20656E640D0A2O20656E64290D0A0D0A2O2073656C663A53657453637269707428224F6E4D6F7573655570222C2066756E6374696F6E286672616D652C2062752O746F6E290D0A4O2069662062752O746F6E202O3D20224C65667442752O746F6E2220616E64206672616D652E69734D6F76696E67207468656E0D0A6O206672616D653A53746F704D6F76696E674F7253697A696E6728290D0A6O206672616D652E69734D6F76696E67203D2066616C73650D0A0D0A6O206C6F63616C20616E63686F722C205F2C205F2C20782C2079203D2073656C663A476574506F696E742831290D0A6O2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E706F736974696F6E2E616E63686F72203D20616E63686F720D0A6O2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E706F736974696F6E2E78203D20780D0A6O2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E706F736974696F6E2E79203D20790D0A4O20656E640D0A2O20656E64290D0A0D0A2O2073656C663A53657453637269707428224F6E48696465222C2066756E6374696F6E286672616D65290D0A4O206966206672616D652E69734D6F76696E67207468656E0D0A6O206672616D653A53746F704D6F76696E674F7253697A696E6728290D0A6O206672616D652E69734D6F76696E67203D2066616C73650D0A4O20656E640D0A2O20656E64290D0A0D0A2O2069662057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E656E61626C65642E73686F77546F2O676C6573207468656E0D0A4O2073656C663A53686F7728290D0A2O20656C73650D0A4O2073656C663A4869646528290D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E746F2O676C65733A412O6442752O746F6E286E616D652C2064622C20766172290D0A2O206966206E6F742073656C662E62752O746F6E73206F7220747970652873656C662E62752O746F6E7329207E3D20227461626C6522207468656E0D0A4O2073656C662E62752O746F6E73203D207B7D0D0A2O20656E640D0A0D0A2O206C6F63616C2062752O746F6E203D204372656174654672616D6528224672616D65222C2022746F2O676C6522202O2E206E616D652C2073656C66290D0A2O2062752O746F6E3A536574506F696E742822544F504C454654222C2073656C662C2022544F504C454654222C2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C654D617267696E202B20282373656C662E62752O746F6E73202A202857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C655769647468202B2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C6550612O64696E672O292C202D57522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C654D617267696E290D0A2O2062752O746F6E2E74657874757265203D2062752O746F6E3A43726561746554657874757265286E696C2C20224241434B47524F554E4422290D0A2O2062752O746F6E2E746578747572653A536574412O6C506F696E74732862752O746F6E290D0A2O2062752O746F6E2E666F6E74203D2062752O746F6E3A437265617465466F6E74537472696E6728290D0A2O2062752O746F6E2E666F6E743A536574466F6E742822466F6E74732F4652495A51542O5F2E2O5446222C2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C655769647468202F20332C20224F55544C494E4522290D0A2O2062752O746F6E2E666F6E743A536574506F696E74282243454E544552222C2062752O746F6E2C202243454E544552222C20302C2030290D0A2O2062752O746F6E2E666F6E743A53657454657874286E616D65290D0A2O2062752O746F6E2E6462203D2064620D0A2O2062752O746F6E2E766172203D207661720D0A0D0A2O2069662062752O746F6E2E64625B62752O746F6E2E7661725D207468656E0D0A4O2062752O746F6E2E666F6E743A53657454657874436F6C6F72287574696C732E486578546F5247422857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E636F6C6F722E746F2O676C65466F6E74456E61626C65642O290D0A4O2062752O746F6E2E746578747572653A536574436F6C6F7254657874757265287574696C732E486578546F5247422857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E636F6C6F722E746F2O676C6542752O746F6E456E61626C65642O290D0A2O20656C73650D0A4O2062752O746F6E2E666F6E743A53657454657874436F6C6F72287574696C732E486578546F5247422857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E636F6C6F722E746F2O676C65466F6E7444697361626C65642O290D0A4O2062752O746F6E2E746578747572653A536574436F6C6F7254657874757265287574696C732E486578546F5247422857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E636F6C6F722E746F2O676C6542752O746F6E44697361626C65642O290D0A2O20656E640D0A0D0A2O2062752O746F6E3A53657457696474682857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C655769647468290D0A2O2062752O746F6E3A5365744865696768742857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E73697A652E746F2O676C65486569676874290D0A0D0A2O2062752O746F6E3A53657453637269707428224F6E4D6F757365446F776E222C2066756E6374696F6E28290D0A4O2062752O746F6E2E64625B62752O746F6E2E7661725D203D206E6F742062752O746F6E2E64625B62752O746F6E2E7661725D0D0A4O2057523A5072696E74446562756728766172202O2E20223A2022202O2E20746F737472696E672862752O746F6E2E64625B62752O746F6E2E7661725D2O290D0A4O2069662062752O746F6E2E64625B62752O746F6E2E7661725D207468656E0D0A6O2062752O746F6E2E666F6E743A53657454657874436F6C6F72287574696C732E486578546F5247422857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E636F6C6F722E746F2O676C65466F6E74456E61626C65642O290D0A6O2062752O746F6E2E746578747572653A536574436F6C6F7254657874757265287574696C732E486578546F5247422857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E636F6C6F722E746F2O676C6542752O746F6E456E61626C65642O290D0A4O20656C73650D0A6O2062752O746F6E2E666F6E743A53657454657874436F6C6F72287574696C732E486578546F5247422857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E636F6C6F722E746F2O676C65466F6E7444697361626C65642O290D0A6O2062752O746F6E2E746578747572653A536574436F6C6F7254657874757265287574696C732E486578546F5247422857522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E7374796C652E636F6C6F722E746F2O676C6542752O746F6E44697361626C65642O290D0A4O20656E640D0A4O20696620766172202O3D20226F6E22207468656E0D0A6O2057522E6672616D65732E722O6F743A536574506978656C28312C2062752O746F6E2E64625B62752O746F6E2E7661725D290D0A4O20656C7365696620766172202O3D2022636F6E66696722207468656E0D0A6O2069662062752O746F6E2E64625B62752O746F6E2E7661725D207468656E0D0A8O2057522E6672616D65732E7370656353652O74696E67733A53686F7728290D0A6O20656C73650D0A8O2057522E6672616D65732E7370656353652O74696E67733A4869646528290D0A6O20656E640D0A4O20656E640D0A2O20656E64290D0A0D0A2O207461626C652E696E736572742873656C662E62752O746F6E732C2062752O746F6E290D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E746F2O676C65733A5365744C6F636B65642876616C7565290D0A2O2069662076616C7565202O3D2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E656E61626C65642E6C6F636B546F2O676C6573207468656E0D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E656E61626C65642E6C6F636B546F2O676C6573203D2076616C75650D0A2O2073656C662E746578747572653A536574436F6C6F725465787475726528302C20302C20302C2076616C756520616E642030206F7220302E35290D0A2O2073656C663A5365744D6F7661626C65286E6F742076616C7565290D0A2O2073656C663A456E61626C654D6F757365286E6F742076616C7565290D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E746F2O676C65733A526573657428290D0A2O20666F722069203D20312C202373656C662E62752O746F6E7320646F0D0A4O206C6F63616C2062752O746F6E203D2073656C662E62752O746F6E735B695D0D0A4O2069662069203E2033207468656E0D0A6O2062752O746F6E3A4869646528290D0A6O2073656C662E62752O746F6E735B695D203D206E696C0D0A4O20656E640D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E6E616D65706C6174653A496E697428290D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E6E616D65706C6174653A53657449636F6E2874686973556E69742C206F626A656374290D0A2O206966206E6F742057522E64622E676C6F62616C2E6672616D65732E6E616D65706C6174652E656E61626C65642E73686F774379636C6549636F6E207468656E0D0A4O2072657475726E20747275650D0A2O20656E640D0A2O206C6F63616C20746F6B656E203D20737472696E672E6C6F7765722874686973556E69742E756E69744944290D0A2O206C6F63616C206E616D65706C617465556E6974203D20435F4E616D65506C6174652E4765744E616D65506C617465466F72556E697428746F6B656E290D0A2O206966206E616D65706C617465556E6974207468656E0D0A4O202O2D204C6F63616C730D0A4O206C6F63616C207363722O656E486569676874203D204765745363722O656E48656967687428290D0A4O206C6F63616C206E616D65706C6174655363616C6572203D20287363722O656E486569676874203E203736382920616E642028373638202F207363722O656E48656967687429206F7220310D0A4O206C6F63616C206E616D65706C61746549636F6E53697A65203D206E616D65706C617465556E69743A4765744865696768742829202F206E616D65706C6174655363616C65720D0A0D0A4O206966206E6F742073656C662E696E697469616C697A6564207468656E0D0A6O202O2D204672616D650D0A6O2073656C663A5365744672616D65537472617461286E616D65706C617465556E69743A4765744672616D65537472617461282O290D0A6O2073656C663A5365744672616D654C6576656C286E616D65706C617465556E69743A4765744672616D654C6576656C2829202B203530290D0A6O2073656C663A5365745769647468286E616D65706C61746549636F6E53697A65290D0A6O2073656C663A536574486569676874286E616D65706C61746549636F6E53697A65290D0A6O202O2D20546578747572650D0A6O2073656C662E74657874757265203D2073656C663A43726561746554657874757265286E696C2C20224241434B47524F554E4422290D0A6O2073656C662E746578747572653A536574546578432O6F7264282E30382C202E39322C202E30382C202E3932290D0A6O2073656C663A4372656174654261636B64726F702873656C662C206E616D65706C617465556E69743A4765744672616D65537472617461282O290D0A0D0A6O2073656C662E696E697469616C697A6564203D20747275650D0A4O20656E640D0A0D0A4O202O2D205365742074686520546578747572650D0A4O2073656C662E746578747572653A536574546578747572652857522E6170692E47657454657874757265286F626A6563742O290D0A4O2073656C662E746578747572653A536574412O6C506F696E74732873656C66290D0A4O2073656C662E746578747572653A536574416C7068612831290D0A4O2073656C663A436C656172412O6C506F696E747328290D0A4O2073656C663A536574416C7068612831290D0A4O2069662057522E64622E676C6F62616C2E6672616D65732E6E616D65706C6174652E706F736974696F6E2E616E63686F72202O3D202243454E54455222207468656E0D0A6O2073656C663A536574506F696E74282243454E544552222C206E616D65706C617465556E6974290D0A4O20656C736569662057522E64622E676C6F62616C2E6672616D65732E6E616D65706C6174652E706F736974696F6E2E616E63686F72202O3D20224C45465422207468656E0D0A6O2073656C663A536574506F696E7428225269676874222C206E616D65706C617465556E69742C20224C65667422290D0A4O20656C736569662057522E64622E676C6F62616C2E6672616D65732E6E616D65706C6174652E706F736974696F6E2E616E63686F72202O3D2022524947485422207468656E0D0A6O2073656C663A536574506F696E7428224C454654222C206E616D65706C617465556E69742C2022524947485422290D0A4O20656E640D0A4O2073656C663A53686F7728290D0A0D0A4O2057522E6170692E6C617374556E69744379636C6564203D2074686973556E69740D0A4O2057522E6170692E6C617374556E69744379636C656454696D65203D2047657454696D6528290D0A0D0A4O2072657475726E20747275650D0A2O20656E640D0A2O2072657475726E2066616C73650D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E6E616D65706C6174653A4372656174654261636B64726F70286672616D652C20737472617461290D0A2O206966206672616D652E6261636B64726F70207468656E0D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O206C6F63616C206261636B64726F70203D204372656174654672616D6528224672616D65222C206E696C2C206672616D652C204261636B64726F7054656D706C6174654D6978696E20616E6420224261636B64726F7054656D706C61746522290D0A2O206672616D652E6261636B64726F70203D206261636B64726F700D0A2O206261636B64726F703A436C656172412O6C506F696E747328290D0A2O206261636B64726F703A536574506F696E742822544F504C454654222C206672616D652C2022544F504C454654222C202D312C2031290D0A2O206261636B64726F703A536574506F696E742822424F2O544F4D5249474854222C206672616D652C2022424F2O544F4D5249474854222C20312C202D31290D0A0D0A2O206261636B64726F703A5365744261636B64726F70287B0D0A4O20626746696C65203D2022496E746572666163652O5C436861744672616D652O5C436861744672616D654261636B67726F756E64222C0D0A4O206564676546696C65203D2022496E746572666163652O5C436861744672616D652O5C436861744672616D654261636B67726F756E64222C0D0A4O2074696C65203D2066616C73652C0D0A4O2074696C6553697A65203D20302C0D0A4O206564676553697A65203D20312C0D0A4O20696E73657473203D207B206C656674203D20302C207269676874203D20302C20746F70203D20302C20626F2O746F6D203D2030207D2C0D0A2O207D290D0A0D0A2O206261636B64726F703A5365744261636B64726F70426F72646572436F6C6F7228302C20302C2030290D0A2O206261636B64726F703A5365744261636B64726F70436F6C6F7228302C20302C20302C2031290D0A0D0A2O206966206E6F7420737472617461207468656E0D0A4O20737472617461203D20224241434B47524F554E44220D0A2O20656E640D0A2O206261636B64726F703A5365744672616D6553747261746128737472617461290D0A2O206966206672616D653A4765744672616D654C6576656C2829202D2032203E3D2030207468656E0D0A4O206261636B64726F703A5365744672616D654C6576656C286672616D653A4765744672616D654C6576656C2829202D2032290D0A2O20656C73650D0A4O206261636B64726F703A5365744672616D654C6576656C2830290D0A2O20656E640D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E7370656353652O74696E67733A496E697428290D0A2O206C6F63616C20737065634944203D2057522E63616368652E70657273697374656E742E706C617965722E737065635B315D0D0A2O20696620737065634944202O3D206E696C207468656E0D0A4O20435F54696D65722E416674657228312C2066756E6374696F6E28290D0A6O2073656C663A496E697428290D0A4O20656E64290D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O206C6F63616C20636C612O734E616D65203D2057522E6170692E636C612O736573537065637342795370656349445B7370656349445D5B315D0D0A2O206C6F63616C20737065634E616D65203D2057522E6170692E636C612O736573537065637342795370656349445B7370656349445D5B325D0D0A2O206C6F63616C20636C612O73537065634B6579203D207574696C732E552O70657246697273744368617228636C612O734E616D6529202O2E207574696C732E552O70657246697273744368617228737065634E616D65290D0A2O206C6F63616C20636C612O73537065634E616D65203D207574696C732E53706C69744F6E552O70657228636C612O73537065634B6579290D0A0D0A2O2073656C663A5365745469746C6528636C612O73537065634E616D65290D0A2O2073656C663A53657443612O6C6261636B28224F6E436C6F7365222C2066756E6374696F6E28776964676574290D0A4O207769646765743A4869646528290D0A4O2057522E64622E676C6F62616C2E6672616D65732E746F2O676C65732E636F6E666967203D2066616C73650D0A4O2057523A5570646174654672616D657328290D0A2O20656E64290D0A2O2073656C663A5365744C61796F7574282246692O6C22290D0A0D0A2O206C6F63616C207363726F2O6C436F6E7461696E6572203D206163656775693A437265617465282253696D706C6547726F757022290D0A2O207363726F2O6C436F6E7461696E65723A53657446752O6C57696474682874727565290D0A2O207363726F2O6C436F6E7461696E65723A53657446752O6C4865696768742874727565290D0A2O207363726F2O6C436F6E7461696E65723A5365744C61796F7574282246692O6C22290D0A2O2073656C662E7363726F2O6C436F6E7461696E6572203D207363726F2O6C436F6E7461696E65720D0A0D0A2O206C6F63616C207363726F2O6C203D206163656775693A43726561746528225363726F2O6C4672616D6522290D0A2O207363726F2O6C3A5365744C61796F75742822466C6F7722290D0A2O207363726F2O6C436F6E7461696E65723A412O644368696C64287363726F2O6C290D0A2O2057522E6775692E46692O6C4578287363726F2O6C2C2057522E64622E70726F66696C655B7370656349445D5B57522E64622E676C6F62616C2E61706C735B636C612O734E616D655D5B737065634E616D652O5D290D0A2O2073656C662E7363726F2O6C203D207363726F2O6C0D0A0D0A2O2073656C663A412O644368696C64287363726F2O6C436F6E7461696E6572290D0A656E640D0A0D0A66756E6374696F6E2057522E6672616D65732E7370656353652O74696E67733A5265667265736828290D0A2O206C6F63616C20737065634944203D2057522E63616368652E70657273697374656E742E706C617965722E737065635B315D0D0A2O20696620737065634944202O3D206E696C207468656E0D0A4O20435F54696D65722E416674657228312C2066756E6374696F6E28290D0A6O2057522E6672616D65732E7370656353652O74696E67733A5265667265736828290D0A4O20656E64290D0A4O2072657475726E0D0A2O20656E640D0A0D0A2O206C6F63616C20636C612O734E616D65203D2057522E6170692E636C612O736573537065637342795370656349445B7370656349445D5B315D0D0A2O206C6F63616C20737065634E616D65203D2057522E6170692E636C612O736573537065637342795370656349445B7370656349445D5B325D0D0A2O206C6F63616C20636C612O73537065634B6579203D207574696C732E552O70657246697273744368617228636C612O734E616D6529202O2E207574696C732E552O70657246697273744368617228737065634E616D65290D0A2O206C6F63616C20636C612O73537065634E616D65203D207574696C732E53706C69744F6E552O70657228636C612O73537065634B6579290D0A2O2073656C663A5365745469746C6528636C612O73537065634E616D65290D0A2O2069662073656C662E7363726F2O6C436F6E7461696E6572207E3D206E696C207468656E0D0A4O2073656C662E7363726F2O6C436F6E7461696E65723A52656C656173654368696C6472656E28290D0A2O20656E640D0A2O2073656C663A52656C656173654368696C6472656E28290D0A2O200D0A2O206C6F63616C207363726F2O6C436F6E7461696E6572203D206163656775693A437265617465282253696D706C6547726F757022290D0A2O207363726F2O6C436F6E7461696E65723A53657446752O6C57696474682874727565290D0A2O207363726F2O6C436F6E7461696E65723A53657446752O6C4865696768742874727565290D0A2O207363726F2O6C436F6E7461696E65723A5365744C61796F7574282246692O6C22290D0A2O2073656C662E7363726F2O6C436F6E7461696E6572203D207363726F2O6C436F6E7461696E65720D0A0D0A2O206C6F63616C207363726F2O6C203D206163656775693A43726561746528225363726F2O6C4672616D6522290D0A2O207363726F2O6C3A5365744C61796F75742822466C6F7722290D0A2O207363726F2O6C436F6E7461696E65723A412O644368696C64287363726F2O6C290D0A2O2057522E6775692E46692O6C4578287363726F2O6C2C2057522E64622E70726F66696C655B7370656349445D5B57522E64622E676C6F62616C2E61706C735B636C612O734E616D655D5B737065634E616D652O5D290D0A2O2073656C662E7363726F2O6C203D207363726F2O6C0D0A0D0A2O2073656C663A412O644368696C64287363726F2O6C436F6E7461696E6572290D0A656E640D0A00063O00120B3O00013O001201000100024O00093O000200022O000700016O000A5O00012O00043O00017O00",v9(),...);