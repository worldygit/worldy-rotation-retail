local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110=v85[2];v83[v110]=v83[v110](v83[v110 + 1 ]);elseif (v86==1) then local v113;local v114;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v83[v114]=v83[v114](v83[v114 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v78=(v114 + v84) -1 ;for v125=v114,v78 do v113=v79[v125-v114 ];v83[v125]=v113;end v77=v77 + 1 ;v85=v73[v77];v114=v85[2];v83[v114](v13(v83,v114 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end else do return;end end elseif (v86<=4) then if (v86==3) then v83[v85[2]]=v85[3];elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86==5) then local v122=v85[2];v78=(v122 + v84) -1 ;for v128=v122,v78 do local v129=v79[v128-v122 ];v83[v128]=v129;end else local v123=v85[2];v83[v123](v13(v83,v123 + 1 ,v78));end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E670347332O003O2D20416365436F6E66696752656769737472792D332E302068616E646C65732063656E7472616C20726567697374726174696F6E206F66206F7074696F6E73207461626C657320696E2075736520627920612O646F6E7320616E64206D6F64756C65732E2O5C0D0A2O2D204F7074696F6E73207461626C65732063616E206265207265676973746572656420617320726177207461626C65732C204F522061732066756E6374696F6E207265667320746861742072657475726E2061207461626C652E2O5C0D0A2O2D20537563682066756E6374696F6E732072656365697665207468722O6520617267756D656E74733A2022756954797065222C202275694E616D65222C2022612O704E616D65222E202O5C0D0A2O2D202A2056616C6964202O2A756954797065732O2A3A2022636D64222C202264726F70646F776E222C20226469616C6F67222E205468697320697320766572696669656420627920746865206C6962726172792061742063612O6C2074696D652E202O5C0D0A2O2D202A20546865202O2A75694E616D652O2A206669656C6420697320657870656374656420746F20636F6E7461696E207468652066752O6C206E616D65206F66207468652063612O6C696E6720612O646F6E2C20696E636C7564696E672076657273696F6E2C20652E672E2022462O6F4261722D312E30222E205468697320697320766572696669656420627920746865206C6962726172792061742063612O6C2074696D652E2O5C0D0A2O2D202A20546865202O2A612O704E616D652O2A206669656C6420697320746865206F7074696F6E73207461626C65206E616D6520617320676976656E20617420726567697374726174696F6E2074696D65202O5C0D0A2O2D0D0A2O2D203A497465726174654F7074696F6E735461626C657328292028616E64203A4765744F7074696F6E735461626C652829206966206F6E6C7920676976656E206F6E6520617267756D656E74292072657475726E20612066756E6374696F6E207265666572656E63652074686174207468652072657175657374696E6720636F6E6669672068616E646C696E6720612O646F6E206D7573742063612O6C20776974682076616C69642022756954797065222C202275694E616D65222E0D0A2O2D2040636C612O732066696C650D0A2O2D20406E616D6520416365436F6E66696752656769737472792D332E300D0A2O2D204072656C65617365202449643A20416365436F6E66696752656769737472792D332E302E6C756120313239362032302O322D2O312D30342031383A35303A31305A206E65766361697269656C20240D0A6C6F63616C2043612O6C6261636B48616E646C6572203D204C696253747562282243612O6C6261636B48616E646C65722D312E3022290D0A0D0A6C6F63616C204D414A4F522C204D494E4F52203D2022416365436F6E66696752656769737472792D332E30222C2032310D0A6C6F63616C20416365436F6E6669675265676973747279203D204C6962537475623A4E65774C696272617279284D414A4F522C204D494E4F52290D0A0D0A6966206E6F7420416365436F6E6669675265676973747279207468656E2072657475726E20656E640D0A0D0A416365436F6E66696752656769737472792E7461626C6573203D20416365436F6E66696752656769737472792E7461626C6573206F72207B7D0D0A0D0A6966206E6F7420416365436F6E66696752656769737472792E63612O6C6261636B73207468656E0D0A09416365436F6E66696752656769737472792E63612O6C6261636B73203D2043612O6C6261636B48616E646C65723A4E657728416365436F6E6669675265676973747279290D0A656E640D0A0D0A2O2D204C756120415049730D0A6C6F63616C2074696E736572742C2074636F6E636174203D207461626C652E696E736572742C207461626C652E636F6E6361740D0A6C6F63616C2073747266696E642C207374726D61746368203D20737472696E672E66696E642C20737472696E672E6D617463680D0A6C6F63616C20747970652C20746F737472696E672C2073656C6563742C207061697273203D20747970652C20746F737472696E672C2073656C6563742C2070616972730D0A6C6F63616C20652O726F722C20612O73657274203D20652O726F722C20612O736572740D0A0D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D8O2D0D0A2O2D2056616C69646174696E67206F7074696F6E73207461626C6520636F6E73697374656E63793A0D0A0D0A0D0A416365436F6E66696752656769737472792E76616C696461746564203D207B0D0A092O2D206C697374206F66206F7074696F6E73207461626C65206E616D65732072616E207468726F756768203A56616C69646174654F7074696F6E735461626C65206175746F6D61746963612O6C792E0D0A092O2D20434C4541524544204F4E20505552504F53452C2073696E6365206E657765722076657273696F6E73206D61792068617665206E657765722076616C696461746F72730D0A09636D64203D207B7D2C0D0A0964726F70646F776E203D207B7D2C0D0A096469616C6F67203D207B7D2C0D0A7D0D0A0D0A0D0A0D0A6C6F63616C2066756E6374696F6E20652O72286D73672C20652O726C766C2C203O2E290D0A096C6F63616C2074203D207B7D0D0A09666F7220693D73656C656374282223222C3O2E292C312C2D3120646F0D0A2O0974696E7365727428742C202873656C65637428692C203O2E3O290D0A09656E640D0A09652O726F72284D414A4F522O2E223A56616C69646174654F7074696F6E735461626C6528293A20222O2E74636F6E63617428742C222E22292O2E6D73672C20652O726C766C2B32290D0A656E640D0A0D0A0D0A6C6F63616C20692O737472696E673D7B5B22737472696E67225D3D747275652C205F3D22737472696E67227D0D0A6C6F63616C20692O737472696E6766756E633D7B5B22737472696E67225D3D747275652C5B2266756E6374696F6E225D3D747275652C205F3D22737472696E67206F722066756E63726566227D0D0A6C6F63616C2069737461626C653D7B5B227461626C65225D3D747275652C3O205F3D227461626C65227D0D0A6C6F63616C2069736D6574686F647461626C653D7B5B227461626C65225D3D747275652C5B22737472696E67225D3D747275652C5B2266756E6374696F6E225D3D747275652C3O205F3D226D6574686F646E616D652C2066756E63726566206F72207461626C65227D0D0A6C6F63616C206F7074737472696E673D7B5B226E696C225D3D747275652C5B22737472696E67225D3D747275652C205F3D22737472696E67227D0D0A6C6F63616C206F7074737472696E6766756E633D7B5B226E696C225D3D747275652C5B22737472696E67225D3D747275652C5B2266756E6374696F6E225D3D747275652C205F3D22737472696E67206F722066756E63726566227D0D0A6C6F63616C206F7074737472696E676E756D62657266756E633D7B5B226E696C225D3D747275652C5B22737472696E67225D3D747275652C5B226E756D626572225D3D747275652C5B2266756E6374696F6E225D3D747275652C205F3D22737472696E672C206E756D626572206F722066756E63726566227D0D0A6C6F63616C206F70746E756D6265723D7B5B226E696C225D3D747275652C5B226E756D626572225D3D747275652C205F3D226E756D626572227D0D0A6C6F63616C206F70746D6574686F6466616C73653D7B5B226E696C225D3D747275652C5B22737472696E67225D3D747275652C5B2266756E6374696F6E225D3D747275652C5B22622O6F6C65616E225D3D7B5B66616C73655D3D747275657D2C2O205F3D226D6574686F646E616D652C2066756E63726566206F722066616C7365227D0D0A6C6F63616C206F70746D6574686F646E756D6265723D7B5B226E696C225D3D747275652C5B22737472696E67225D3D747275652C5B2266756E6374696F6E225D3D747275652C5B226E756D626572225D3D747275652C2O205F3D226D6574686F646E616D652C2066756E63726566206F72206E756D626572227D0D0A6C6F63616C206F70746D6574686F647461626C653D7B5B226E696C225D3D747275652C5B22737472696E67225D3D747275652C5B2266756E6374696F6E225D3D747275652C5B227461626C65225D3D747275652C2O205F3D226D6574686F646E616D652C2066756E63726566206F72207461626C65227D0D0A6C6F63616C206F70746D6574686F64622O6F6C3D7B5B226E696C225D3D747275652C5B22737472696E67225D3D747275652C5B2266756E6374696F6E225D3D747275652C5B22622O6F6C65616E225D3D747275652C2O205F3D226D6574686F646E616D652C2066756E63726566206F7220622O6F6C65616E227D0D0A6C6F63616C206F702O7461626C653D7B5B226E696C225D3D747275652C5B227461626C65225D3D747275652C2O205F3D227461626C65227D0D0A6C6F63616C206F7074622O6F6C3D7B5B226E696C225D3D747275652C5B22622O6F6C65616E225D3D747275652C2O205F3D22622O6F6C65616E227D0D0A6C6F63616C206F7074622O6F6C6E756D6265723D7B5B226E696C225D3D747275652C5B22622O6F6C65616E225D3D747275652C5B226E756D626572225D3D747275652C2O205F3D22622O6F6C65616E206F72206E756D626572227D0D0A6C6F63616C206F7074737472696E676E756D6265723D7B5B226E696C225D3D747275652C5B22737472696E67225D3D747275652C5B226E756D626572225D3D747275652C205F3D22737472696E67206F72206E756D626572227D0D0A0D0A6C6F63616C20626173656B6579733D7B0D0A09747970653D692O737472696E672C0D0A096E616D653D692O737472696E6766756E632C0D0A09646573633D6F7074737472696E6766756E632C0D0A09646573635374796C653D6F7074737472696E672C0D0A096F726465723D6F70746D6574686F646E756D6265722C0D0A0976616C69646174653D6F70746D6574686F6466616C73652C0D0A09636F6E6669726D3D6F70746D6574686F64622O6F6C2C0D0A09636F6E6669726D546578743D6F7074737472696E672C0D0A0964697361626C65643D6F70746D6574686F64622O6F6C2C0D0A0968692O64656E3D6F70746D6574686F64622O6F6C2C0D0A2O0967756948692O64656E3D6F70746D6574686F64622O6F6C2C0D0A2O096469616C6F6748692O64656E3D6F70746D6574686F64622O6F6C2C0D0A2O0964726F70646F776E48692O64656E3D6F70746D6574686F64622O6F6C2C0D0A09636D6448692O64656E3D6F70746D6574686F64622O6F6C2C0D0A09742O6F6C74697048797065726C696E6B3D6F7074737472696E6766756E632C0D0A0969636F6E3D6F7074737472696E676E756D62657266756E632C0D0A0969636F6E432O6F7264733D6F70746D6574686F647461626C652C0D0A0968616E646C65723D6F702O7461626C652C0D0A096765743D6F70746D6574686F6466616C73652C0D0A097365743D6F70746D6574686F6466616C73652C0D0A0966756E633D6F70746D6574686F6466616C73652C0D0A096172673D7B5B222A225D3D747275657D2C0D0A0977696474683D6F7074737472696E676E756D6265722C0D0A7D0D0A0D0A6C6F63616C2074797065646B6579733D7B0D0A096865616465723D7B0D0A2O09636F6E74726F6C3D6F7074737472696E672C0D0A2O096469616C6F67436F6E74726F6C3D6F7074737472696E672C0D0A2O0964726F70646F776E436F6E74726F6C3D6F7074737472696E672C0D0A097D2C0D0A096465736372697074696F6E3D7B0D0A2O09696D6167653D6F7074737472696E676E756D62657266756E632C0D0A2O09696D616765432O6F7264733D6F70746D6574686F647461626C652C0D0A2O09696D6167654865696768743D6F70746E756D6265722C0D0A2O09696D61676557696474683D6F70746E756D6265722C0D0A2O09666F6E7453697A653D6F7074737472696E6766756E632C0D0A2O09636F6E74726F6C3D6F7074737472696E672C0D0A2O096469616C6F67436F6E74726F6C3D6F7074737472696E672C0D0A2O0964726F70646F776E436F6E74726F6C3D6F7074737472696E672C0D0A097D2C0D0A0967726F75703D7B0D0A2O09617267733D69737461626C652C0D0A2O09706C7567696E733D6F702O7461626C652C0D0A2O09696E6C696E653D6F7074622O6F6C2C0D0A3O09636D64496E6C696E653D6F7074622O6F6C2C0D0A3O09677569496E6C696E653D6F7074622O6F6C2C0D0A3O0964726F70646F776E496E6C696E653D6F7074622O6F6C2C0D0A3O096469616C6F67496E6C696E653D6F7074622O6F6C2C0D0A2O096368696C6447726F7570733D6F7074737472696E672C0D0A097D2C0D0A09657865637574653D7B0D0A2O09696D6167653D6F7074737472696E676E756D62657266756E632C0D0A2O09696D616765432O6F7264733D6F70746D6574686F647461626C652C0D0A2O09696D6167654865696768743D6F70746E756D6265722C0D0A2O09696D61676557696474683D6F70746E756D6265722C0D0A2O09636F6E74726F6C3D6F7074737472696E672C0D0A2O096469616C6F67436F6E74726F6C3D6F7074737472696E672C0D0A2O0964726F70646F776E436F6E74726F6C3D6F7074737472696E672C0D0A097D2C0D0A09696E7075743D7B0D0A2O0970612O7465726E3D6F7074737472696E672C0D0A2O0975736167653D6F7074737472696E672C0D0A2O09636F6E74726F6C3D6F7074737472696E672C0D0A2O096469616C6F67436F6E74726F6C3D6F7074737472696E672C0D0A2O0964726F70646F776E436F6E74726F6C3D6F7074737472696E672C0D0A2O096D756C74696C696E653D6F7074622O6F6C6E756D6265722C0D0A097D2C0D0A09746F2O676C653D7B0D0A2O0974726973746174653D6F7074622O6F6C2C0D0A2O09696D6167653D6F7074737472696E676E756D62657266756E632C0D0A2O09696D616765432O6F7264733D6F70746D6574686F647461626C652C0D0A2O09636F6E74726F6C3D6F7074737472696E672C0D0A2O096469616C6F67436F6E74726F6C3D6F7074737472696E672C0D0A2O0964726F70646F776E436F6E74726F6C3D6F7074737472696E672C0D0A097D2C0D0A0974726973746174653D7B0D0A097D2C0D0A0972616E67653D7B0D0A2O096D696E3D6F70746E756D6265722C0D0A2O09736F66744D696E3D6F70746E756D6265722C0D0A2O096D61783D6F70746E756D6265722C0D0A2O09736F66744D61783D6F70746E756D6265722C0D0A2O09737465703D6F70746E756D6265722C0D0A2O09626967537465703D6F70746E756D6265722C0D0A2O09697350657263656E743D6F7074622O6F6C2C0D0A2O09636F6E74726F6C3D6F7074737472696E672C0D0A2O096469616C6F67436F6E74726F6C3D6F7074737472696E672C0D0A2O0964726F70646F776E436F6E74726F6C3D6F7074737472696E672C0D0A097D2C0D0A0973656C6563743D7B0D0A2O0976616C7565733D69736D6574686F647461626C652C0D0A2O09736F7274696E673D6F70746D6574686F647461626C652C0D0A2O097374796C653D7B0D0A3O095B226E696C225D3D747275652C0D0A3O095B22737472696E67225D3D7B64726F70646F776E3D747275652C726164696F3D747275657D2C0D0A3O095F3D22737472696E673A202764726F70646F776E27206F722027726164696F27220D0A2O097D2C0D0A2O09636F6E74726F6C3D6F7074737472696E672C0D0A2O096469616C6F67436F6E74726F6C3D6F7074737472696E672C0D0A2O0964726F70646F776E436F6E74726F6C3D6F7074737472696E672C0D0A2O096974656D436F6E74726F6C3D6F7074737472696E672C0D0A097D2C0D0A096D756C746973656C6563743D7B0D0A2O0976616C7565733D69736D6574686F647461626C652C0D0A2O097374796C653D6F7074737472696E672C0D0A2O0974726973746174653D6F7074622O6F6C2C0D0A2O09636F6E74726F6C3D6F7074737472696E672C0D0A2O096469616C6F67436F6E74726F6C3D6F7074737472696E672C0D0A2O0964726F70646F776E436F6E74726F6C3D6F7074737472696E672C0D0A097D2C0D0A09636F6C6F723D7B0D0A2O09686173416C7068613D6F70746D6574686F64622O6F6C2C0D0A2O09636F6E74726F6C3D6F7074737472696E672C0D0A2O096469616C6F67436F6E74726F6C3D6F7074737472696E672C0D0A2O0964726F70646F776E436F6E74726F6C3D6F7074737472696E672C0D0A097D2C0D0A096B657962696E64696E673D7B0D0A2O09636F6E74726F6C3D6F7074737472696E672C0D0A2O096469616C6F67436F6E74726F6C3D6F7074737472696E672C0D0A2O0964726F70646F776E436F6E74726F6C3D6F7074737472696E672C0D0A097D2C0D0A7D0D0A0D0A6C6F63616C2066756E6374696F6E2076616C69646174654B6579286B2C652O726C766C2C3O2E290D0A09652O726C766C3D28652O726C766C206F722030292B310D0A0969662074797065286B297E3D22737472696E6722207468656E0D0A2O09652O7228225B222O2E746F737472696E67286B292O2E225D202D206B6579206973206E6F74206120737472696E67222C20652O726C766C2C3O2E290D0A09656E640D0A0969662073747266696E64286B2C20225B25635C3132375D2229207468656E0D0A2O09652O7228225B222O2E746F737472696E67286B292O2E225D202D206B6579206E616D6520636F6E7461696E656420636F6E74726F6C2063686172616374657273222C20652O726C766C2C3O2E290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2076616C696461746556616C28762C206F6B74797065732C20652O726C766C2C3O2E290D0A09652O726C766C3D28652O726C766C206F722030292B310D0A096C6F63616C2069736F6B3D6F6B74797065735B747970652876295D206F72206F6B74797065735B222A225D0D0A0D0A096966206E6F742069736F6B207468656E0D0A2O09652O7228223A206578706563746564206120222O2E6F6B74797065732E5F2O2E222C20676F742027222O2E746F737472696E672876292O2E2227222C20652O726C766C2C3O2E290D0A09656E640D0A09696620747970652869736F6B292O3D227461626C6522207468656E2O092O2D2069736F6B207761732061207461626C6520636F6E7461696E696E672073706563696669632076616C75657320746F2062652074657374656420666F72210D0A2O096966206E6F742069736F6B5B765D207468656E0D0A3O09652O7228223A20646964206E6F742065787065637420222O2E747970652876292O2E222076616C75652027222O2E746F737472696E672876292O2E2227222C20652O726C766C2C3O2E290D0A2O09656E640D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2076616C6964617465286F7074696F6E732C652O726C766C2C3O2E290D0A09652O726C766C3D28652O726C766C206F722030292B310D0A092O2D20626173696320636F6E73697374656E63790D0A0969662074797065286F7074696F6E73297E3D227461626C6522207468656E0D0A2O09652O7228223A2065787065637465642061207461626C652C20676F74206120222O2E74797065286F7074696F6E73292C20652O726C766C2C3O2E290D0A09656E640D0A0969662074797065286F7074696F6E732E74797065297E3D22737472696E6722207468656E0D0A2O09652O7228222E747970653A206578706563746564206120737472696E672C20676F74206120222O2E74797065286F7074696F6E732E74797065292C20652O726C766C2C3O2E290D0A09656E640D0A0D0A092O2D20676574207479706520616E64202774797065646B65797327206D656D6265720D0A096C6F63616C20746B203D2074797065646B6579735B6F7074696F6E732E747970655D0D0A096966206E6F7420746B207468656E0D0A2O09652O7228222E747970653A20756E6B6E6F776E20747970652027222O2E6F7074696F6E732E747970652O2E2227222C20652O726C766C2C3O2E290D0A09656E640D0A0D0A092O2D206D616B652073757265207468617420612O6C206F7074696F6E735B5D20617265206B6E6F776E20706172616D65746572730D0A09666F72206B2C7620696E207061697273286F7074696F6E732920646F0D0A2O096966206E6F742028746B5B6B5D206F7220626173656B6579735B6B5D29207468656E0D0A3O09652O7228223A20756E6B6E6F776E20706172616D65746572222C20652O726C766C2C746F737472696E67286B292C3O2E290D0A2O09656E640D0A09656E640D0A0D0A092O2D20766572696679207468617420726571756972656420706172616D73206172652074686572652C20616E6420746861742065766572797468696E672069732074686520726967687420747970650D0A09666F72206B2C6F6B747970657320696E20706169727328626173656B6579732920646F0D0A2O0976616C696461746556616C286F7074696F6E735B6B5D2C206F6B74797065732C20652O726C766C2C6B2C3O2E290D0A09656E640D0A09666F72206B2C6F6B747970657320696E20706169727328746B2920646F0D0A2O0976616C696461746556616C286F7074696F6E735B6B5D2C206F6B74797065732C20652O726C766C2C6B2C3O2E290D0A09656E640D0A0D0A092O2D206578747261206C6F67696320666F722067726F7570730D0A096966206F7074696F6E732E747970652O3D2267726F757022207468656E0D0A2O09666F72206B2C7620696E207061697273286F7074696F6E732E617267732920646F0D0A3O0976616C69646174654B6579286B2C652O726C766C2C2261726773222C3O2E290D0A3O0976616C696461746528762C20652O726C766C2C6B2C2261726773222C3O2E290D0A2O09656E640D0A2O096966206F7074696F6E732E706C7567696E73207468656E0D0A3O09666F7220706C75676E616D652C706C7567696E20696E207061697273286F7074696F6E732E706C7567696E732920646F0D0A4O096966207479706528706C7567696E297E3D227461626C6522207468656E0D0A5O09652O7228223A2065787065637465642061207461626C652C20676F742027222O2E746F737472696E6728706C7567696E292O2E2227222C20652O726C766C2C746F737472696E6728706C75676E616D65292C22706C7567696E73222C3O2E290D0A4O09656E640D0A4O09666F72206B2C7620696E20706169727328706C7567696E2920646F0D0A5O0976616C69646174654B6579286B2C652O726C766C2C746F737472696E6728706C75676E616D65292C22706C7567696E73222C3O2E290D0A5O0976616C696461746528762C20652O726C766C2C6B2C746F737472696E6728706C75676E616D65292C22706C7567696E73222C3O2E290D0A4O09656E640D0A3O09656E640D0A2O09656E640D0A09656E640D0A656E640D0A0D0A0D0A3O2D2056616C6964617465732062617369632073747275637475726520616E6420696E74656772697479206F6620616E206F7074696F6E73207461626C65202O5C0D0A2O2D20446F6573204E4F54207665726966792074686174206765742F736574206574632061637475612O6C792065786973742C2073696E636520746865792063616E20626520646566696E656420617420616E792064657074680D0A2O2D2040706172616D206F7074696F6E7320546865207461626C6520746F2062652076616C6964617465640D0A2O2D2040706172616D206E616D6520546865206E616D65206F6620746865207461626C6520746F2062652076616C696461746564202873686F776E20696E20616E7920652O726F72206D652O73616765290D0A2O2D2040706172616D20652O726C766C20286F7074696F6E616C206E756D6265722920652O726F72206C6576656C206F2O667365742C2064656661756C74203020283D652O726F727320706F696E7420746F207468652066756E6374696F6E2063612O6C696E67203A56616C69646174654F7074696F6E735461626C65290D0A66756E6374696F6E20416365436F6E66696752656769737472793A56616C69646174654F7074696F6E735461626C65286F7074696F6E732C6E616D652C652O726C766C290D0A09652O726C766C3D28652O726C766C206F722030292B310D0A096E616D65203D206E616D65206F7220224F7074696F6E737461626C65220D0A096966206E6F74206F7074696F6E732E6E616D65207468656E0D0A2O096F7074696F6E732E6E616D653D6E616D65092O2D20626974206F662061206861636B2C2074686520722O6F74206C6576656C20646F65736E2774207265612O6C79206E2O65642061202E6E616D65203A2D2F0D0A09656E640D0A0976616C6964617465286F7074696F6E732C652O726C766C2C6E616D65290D0A656E640D0A0D0A3O2D20466972657320612022436F6E6669675461626C654368616E6765222063612O6C6261636B20666F722074686F7365206C697374656E696E6720696E206F6E2069742C20612O6C6F77696E6720636F6E666967204755497320746F20726566726573682E0D0A2O2D20596F752073686F756C642063612O6C20746869732066756E6374696F6E20696620796F7572206F7074696F6E73207461626C65206368616E6765642066726F6D20616E79206F757473696465206576656E742C206C696B6520612067616D65206576656E740D0A2O2D206F7220612074696D65722E0D0A2O2D2040706172616D20612O704E616D652054686520612O706C69636174696F6E206E616D6520617320676976656E20746F20603A52656769737465724F7074696F6E735461626C652829600D0A66756E6374696F6E20416365436F6E66696752656769737472793A4E6F746966794368616E676528612O704E616D65290D0A096966206E6F7420416365436F6E66696752656769737472792E7461626C65735B612O704E616D655D207468656E2072657475726E20656E640D0A09416365436F6E66696752656769737472792E63612O6C6261636B733A466972652822436F6E6669675461626C654368616E6765222C20612O704E616D65290D0A656E640D0A0D0A2O2D209O2D9O2D9O2D9O2D9O2D9O2D9O2D4O2D0D0A2O2D205265676973746572696E6720616E642072657472656976696E67206F7074696F6E73207461626C65733A0D0A0D0A0D0A2O2D2076616C696461746547652O746572417267733A2068656C7065722066756E6374696F6E20666F72203A4765744F7074696F6E735461626C6520286F722C207261746865722C207468652067652O7465722066756E6374696F6E732072657475726E6564206279206974290D0A0D0A6C6F63616C2066756E6374696F6E2076616C696461746547652O74657241726773287569547970652C2075694E616D652C20652O726C766C290D0A09652O726C766C3D28652O726C766C206F722030292B320D0A096966207569547970657E3D22636D642220616E64207569547970657E3D2264726F70646F776E2220616E64207569547970657E3D226469616C6F6722207468656E0D0A2O09652O726F72284D414A4F522O2E223A2052657175657374696E67206F7074696F6E73207461626C653A202775695479706527202D20696E76616C696420636F6E66696775726174696F6E20554920747970652C2065787065637465642027636D64272C202764726F70646F776E27206F7220276469616C6F6727222C20652O726C766C290D0A09656E640D0A096966206E6F74207374726D617463682875694E616D652C20225B412D5A612D7A5D252D5B302D395D2229207468656E092O2D20457870656374696E6720652E672E20224D794C69622D312E32220D0A2O09652O726F72284D414A4F522O2E223A2052657175657374696E67206F7074696F6E73207461626C653A202775694E616D6527202D206261646C7920666F726D612O746564206F72206D692O73696E672076657273696F6E206E756D6265722E20457870656374656420652E672E20274D794C69622D312E3227222C20652O726C766C290D0A09656E640D0A656E640D0A0D0A3O2D20526567697374657220616E206F7074696F6E73207461626C6520776974682074686520636F6E6669672072656769737472792E0D0A2O2D2040706172616D20612O704E616D652054686520612O706C69636174696F6E206E616D6520617320676976656E20746F20603A52656769737465724F7074696F6E735461626C652829600D0A2O2D2040706172616D206F7074696F6E7320546865206F7074696F6E73207461626C652C204F5220612066756E6374696F6E207265666572656E636520746861742067656E657261746573206974206F6E2064656D616E642E202O5C0D0A2O2D20532O652074686520746F70206F6620746865207061676520666F7220696E666F206F6E20617267756D656E74732070612O73656420746F20737563682066756E6374696F6E732E0D0A2O2D2040706172616D20736B697056616C69646174696F6E20536B6970206F7074696F6E73207461626C652076616C69646174696F6E20287072696D6172696C792075736566756C20666F722065787472656D656C792068756765206F7074696F6E732C20776974682061206E6F7469636561626C6520736C6F77646F776E290D0A66756E6374696F6E20416365436F6E66696752656769737472793A52656769737465724F7074696F6E735461626C6528612O704E616D652C206F7074696F6E732C20736B697056616C69646174696F6E290D0A0969662074797065286F7074696F6E73292O3D227461626C6522207468656E0D0A2O096966206F7074696F6E732E747970657E3D2267726F757022207468656E092O2D20717569636B2073616E69747920636865636B65720D0A3O09652O726F72284D414A4F522O2E223A2052656769737465724F7074696F6E735461626C6528612O704E616D652C206F7074696F6E73293A20276F7074696F6E7327202D206D692O73696E6720747970653D2767726F757027206D656D62657220696E20722O6F742067726F7570222C2032290D0A2O09656E640D0A2O09416365436F6E66696752656769737472792E7461626C65735B612O704E616D655D203D2066756E6374696F6E287569547970652C2075694E616D652C20652O726C766C290D0A3O09652O726C766C3D28652O726C766C206F722030292B310D0A3O0976616C696461746547652O74657241726773287569547970652C2075694E616D652C20652O726C766C290D0A3O096966206E6F7420416365436F6E66696752656769737472792E76616C6964617465645B7569547970655D5B612O704E616D655D20616E64206E6F7420736B697056616C69646174696F6E207468656E0D0A4O09416365436F6E66696752656769737472793A56616C69646174654F7074696F6E735461626C65286F7074696F6E732C20612O704E616D652C20652O726C766C29092O2D2075706772616461626C650D0A4O09416365436F6E66696752656769737472792E76616C6964617465645B7569547970655D5B612O704E616D655D203D20747275650D0A3O09656E640D0A3O0972657475726E206F7074696F6E730D0A2O09656E640D0A09656C736569662074797065286F7074696F6E73292O3D2266756E6374696F6E22207468656E0D0A2O09416365436F6E66696752656769737472792E7461626C65735B612O704E616D655D203D2066756E6374696F6E287569547970652C2075694E616D652C20652O726C766C290D0A3O09652O726C766C3D28652O726C766C206F722030292B310D0A3O0976616C696461746547652O74657241726773287569547970652C2075694E616D652C20652O726C766C290D0A3O096C6F63616C20746162203D20612O73657274286F7074696F6E73287569547970652C2075694E616D652C20612O704E616D652O290D0A3O096966206E6F7420416365436F6E66696752656769737472792E76616C6964617465645B7569547970655D5B612O704E616D655D20616E64206E6F7420736B697056616C69646174696F6E207468656E0D0A4O09416365436F6E66696752656769737472793A56616C69646174654F7074696F6E735461626C65287461622C20612O704E616D652C20652O726C766C29092O2D2075706772616461626C650D0A4O09416365436F6E66696752656769737472792E76616C6964617465645B7569547970655D5B612O704E616D655D203D20747275650D0A3O09656E640D0A3O0972657475726E207461620D0A2O09656E640D0A09656C73650D0A2O09652O726F72284D414A4F522O2E223A2052656769737465724F7074696F6E735461626C6528612O704E616D652C206F7074696F6E73293A20276F7074696F6E7327202D206578706563746564207461626C65206F722066756E6374696F6E207265666572656E6365222C2032290D0A09656E640D0A656E640D0A0D0A3O2D2052657475726E7320616E206974657261746F72206F66205B22612O704E616D65225D3D66756E637265662070616972730D0A66756E6374696F6E20416365436F6E66696752656769737472793A497465726174654F7074696F6E735461626C657328290D0A0972657475726E20706169727328416365436F6E66696752656769737472792E7461626C6573290D0A656E640D0A0D0A0D0A0D0A0D0A3O2D2051756572792074686520726567697374727920666F722061207370656369666963206F7074696F6E73207461626C652E0D0A2O2D204966206F6E6C7920612O704E616D6520697320676976656E2C20612066756E6374696F6E2069732072657475726E656420776869636820796F750D0A2O2D2063616E2063612O6C207769746820287569547970652C75694E616D652920746F2067657420746865207461626C652E2O5C0D0A2O2D204966207569547970652675694E616D652061726520676976656E2C20746865207461626C652069732072657475726E65642E0D0A2O2D2040706172616D20612O704E616D652054686520612O706C69636174696F6E206E616D6520617320676976656E20746F20603A52656769737465724F7074696F6E735461626C652829600D0A2O2D2040706172616D20756954797065205468652074797065206F6620554920746F2067657420746865207461626C6520666F722C206F6E65206F662022636D64222C202264726F70646F776E222C20226469616C6F67220D0A2O2D2040706172616D2075694E616D6520546865206E616D65206F6620746865206C6962726172792F612O646F6E207175657279696E6720666F7220746865207461626C652C20652E672E20224D794C69622D312E30220D0A66756E6374696F6E20416365436F6E66696752656769737472793A4765744F7074696F6E735461626C6528612O704E616D652C207569547970652C2075694E616D65290D0A096C6F63616C2066203D20416365436F6E66696752656769737472792E7461626C65735B612O704E616D655D0D0A096966206E6F742066207468656E0D0A2O0972657475726E206E696C0D0A09656E640D0A0D0A09696620756954797065207468656E0D0A2O0972657475726E2066287569547970652C75694E616D652C3129092O2D2067657420746865207461626C6520666F722075730D0A09656C73650D0A2O0972657475726E2066092O2D2072657475726E207468652066756E6374696F6E0D0A09656E640D0A656E640D0A00063O0012013O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);