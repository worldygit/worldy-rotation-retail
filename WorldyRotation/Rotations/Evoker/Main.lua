local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=5) then if (v86<=2) then if (v86<=0) then local v111=v85[2];v83[v111]=v83[v111](v83[v111 + 1 ]);elseif (v86>1) then v83[v85[2]]=v85[3];else local v116=v85[2];v78=(v116 + v84) -1 ;for v129=v116,v78 do local v130=v79[v129-v116 ];v83[v129]=v130;end end elseif (v86<=3) then do return;end elseif (v86==4) then local v117=v85[2];v83[v117]=v83[v117](v83[v117 + 1 ]);else local v119=v85[2];v83[v119](v13(v83,v119 + 1 ,v78));end elseif (v86<=8) then if (v86<=6) then do return;end elseif (v86==7) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end else local v120=v85[2];v78=(v120 + v84) -1 ;for v132=v120,v78 do local v133=v79[v132-v120 ];v83[v132]=v133;end end elseif (v86<=9) then if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86>10) then v83[v85[2]]=v85[3];else local v126=v85[2];v83[v126](v13(v83,v126 + 1 ,v78));end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E67032B222O006C6F63616C20617069203D2057522E6170690D0A6C6F63616C207574696C73203D2057522E7574696C730D0A0D0A6C6F63616C207370652O6C203D206170692E7370652O6C0D0A6C6F63616C206D756C74695370652O6C203D206170692E6D756C74695370652O6C0D0A6C6F63616C206974656D203D206170692E6974656D0D0A6C6F63616C206D6163726F203D206170692E6D6163726F0D0A6C6F63616C204D657267655461626C6542794B6579203D207574696C732E4D657267655461626C6542794B65790D0A0D0A2O2D207370652O6C0D0A6966206E6F74207370652O6C2E65766F6B6572207468656E0D0A2O207370652O6C2E65766F6B6572203D207B7D0D0A656E640D0A7370652O6C2E65766F6B65722E636F2O6D6F6E73203D207B0D0A2O202O2D2072616369616C730D0A2O207461696C5377697065203D207370652O6C28333638393730292C0D0A2O2077696E6742752O666574203D207370652O6C28333537323134292C0D0A2O202O2D206162696C69746965730D0A2O20616E6369656E74466C616D65203D207370652O6C2833363O3930292C0D0A2O20617A757265537472696B65203D207370652O6C28333632393639292C0D0A2O20626C6173744675726E616365203D207370652O6C2833372O353130292C0D0A2O20626C652O73696E676F6674686542726F6E7A65203D207370652O6C28333634333432292C0D0A2O20636175746572697A696E67466C616D65203D207370652O6C28333734323531292C0D0A2O20642O6570427265617468203D207370652O6C28333537323130292C0D0A2O20646973696E74656772617465203D207370652O6C283335362O3935292C0D0A2O20656D6572616C64426C6F2O736F6D203D207370652O6C28332O35393133292C0D0A2O20652O73656E6365412O74756E656D656E74203D207370652O6C28333735372O32292C0D0A2O20657870756E6765203D207370652O6C2833362O353835292C0D0A2O2066697265427265617468203D206D756C74695370652O6C283335373230382C2033382O322O36292C202O2D207769746820616E6420776974686F757420666F6E74206F66206D616769630D0A2O20686F766572203D207370652O6C28333538323637292C0D0A2O206C616E64736C696465203D207370652O6C28333538333835292C0D0A2O206C656170696E67466C616D6573203D207370652O6C2833362O393339292C0D0A2O206C6976696E67466C616D65203D207370652O6C28333631343639292C0D0A2O206E61747572616C697A65203D207370652O6C28333630383233292C0D0A2O206F6273696469616E5363616C6573203D207370652O6C28333633393136292C0D0A2O2072657475726E5F203D207370652O6C283336312O3237292C0D0A2O20736361726C657441646170746174696F6E203D207370652O6C28333732343639292C0D0A2O20736F757263656F664D61676963203D207370652O6C28333639343539292C0D0A2O207469705468655363616C6573203D207370652O6C283337302O3533292C0D0A2O20756E726176656C203D207370652O6C28333638343332292C0D0A2O2076657264616E74456D6272616365203D207370652O6C283336302O3935292C0D0A2O202O2D2062752O66732F646562752O66730D0A2O20616E6369656E74466C616D6542752O66203D207370652O6C2833372O353833292C0D0A2O20626C652O73696E676F6674686542726F6E7A6542752O66203D207370652O6C28333831373438292C0D0A2O2066697265427265617468446562752O66203D207370652O6C28333537323039292C0D0A2O20686F76657242752O66203D207370652O6C28333538323637292C0D0A2O206C656170696E67466C616D657342752O66203D207370652O6C28333730393031292C0D0A2O20736361726C657441646170746174696F6E42752O66203D207370652O6C28333732343730292C0D0A2O20736F757263656F664D6167696342752O66203D207370652O6C28333639343539292C0D0A2O202O2D207574696C6974790D0A2O207175652O6C203D207370652O6C283335312O3338292C0D0A2O202O2D206F746865720D0A2O20702O6F6C203D207370652O6C284O393130290D0A7D0D0A0D0A7370652O6C2E65766F6B65722E6175676D656E746174696F6E203D204D657267655461626C6542794B6579287370652O6C2E65766F6B65722E636F2O6D6F6E732C207B0D0A2O202O2D20412O74756E656D656E74730D0A2O20626C61636B412O74756E656D656E74203D207370652O6C28343033323634292C0D0A2O2062726F6E7A65412O74756E656D656E74203D207370652O6C28343033323635292C0D0A2O202O2D2054616C656E74730D0A2O20626C6973746572696E675363616C6573203D207370652O6C28333630383237292C0D0A2O206272656174686F66456F6E73203D207370652O6C28343033363331292C0D0A2O20647265616D6F66537072696E67203D207370652O6C28343134393639292C0D0A2O2065626F6E4D69676874203D207370652O6C28333935313532292C0D0A2O206572757074696F6E203D207370652O6C28333935313630292C0D0A2O20666F6E746F664D61676963203D207370652O6C28343038303833292C0D0A2O20696E746572776F76656E54687265616473203D207370652O6C28343132373133292C0D0A2O20707265736369656E6365203D207370652O6C28343039332O31292C0D0A2O20707570696C6F66416C657873747261737A61203D207370652O6C28343037383134292C0D0A2O2074696D65536B6970203D207370652O6C28343034392O37292C0D0A2O20757068656176616C203D207370652O6C28343038303932292C0D0A2O202O2D2042752O66730D0A2O20626C61636B412O74756E656D656E7442752O66203D207370652O6C28343033323634292C0D0A2O20626C6973746572696E675363616C657342752O66203D207370652O6C28333630383237292C0D0A2O2062726F6E7A65412O74756E656D656E7442752O66203D207370652O6C28343033323635292C0D0A2O2065626F6E4D696768744F7468657242752O66203D207370652O6C28333935313532292C0D0A2O2065626F6E4D6967687453656C6642752O66203D207370652O6C28333935323936292C0D0A2O20652O73656E6365427572737442752O66203D207370652O6C2833392O323638292C0D0A2O202O2D20446562752O66730D0A2O2074656D706F72616C576F756E64446562752O66203D207370652O6C28343039353630292C0D0A7D290D0A0D0A7370652O6C2E65766F6B65722E6465766173746174696F6E203D204D657267655461626C6542794B6579287370652O6C2E65766F6B65722E636F2O6D6F6E732C207B0D0A2O202O2D2074616C656E74730D0A2O20616E696D6F73697479203D207370652O6C28333735373937292C0D0A2O20617263616E655669676F72203D207370652O6C28333836333432292C0D0A2O206275726E6F7574203D207370652O6C28333735383031292C0D0A2O20636174616C797A65203D207370652O6C28333836323833292C0D0A2O2063617573616C697479203D207370652O6C283337353O37292C0D0A2O2063686172676564426C617374203D207370652O6C28333730342O35292C0D0A2O20647261676F6E72616765203D207370652O6C28333735303837292C0D0A2O20656E67756C66696E67426C617A65203D207370652O6C28333730383337292C0D0A2O20652O73656E6365412O74756E656D656E74203D207370652O6C28333735372O32292C0D0A2O20657465726E6974795375726765203D206D756C74695370652O6C283335393037332C20333832342O31292C202O2D207769746820616E6420776974686F757420666F6E74206F66206D616769630D0A2O20657465726E697479735370616E203D207370652O6C28333735373537292C0D0A2O206576656E74486F72697A6F6E203D207370652O6C28343O313634292C0D0A2O20657665726275726E696E67466C616D65203D207370652O6C28333730383139292C0D0A2O206579656F66496E66696E697479203D207370652O6C28333639333735292C0D0A2O20662O6564746865466C616D6573203D207370652O6C28333639383436292C0D0A2O206669726573746F726D203D207370652O6C2833362O383437292C0D0A2O20666F6E746F664D61676963203D207370652O6C28333735373833292C0D0A2O20692O6D696E656E744465737472756374696F6E203D207370652O6C28333730373831292C0D0A2O2070797265203D207370652O6C28333537322O31292C0D0A2O20726167696E67496E6665726E6F203D207370652O6C28343035363539292C0D0A2O2072756279456D62657273203D207370652O6C28333635393337292C0D0A2O207363696E74692O6C6174696F6E203D207370652O6C28333730383231292C0D0A2O207368612O746572696E6753746172203D207370652O6C28333730343532292C0D0A2O20736E617066697265203D207370652O6C28333730373833292C0D0A2O20747972612O6E79203D207370652O6C283337363O38292C0D0A2O20756E726176656C203D207370652O6C28333638343332292C0D0A2O20766F6C6174696C697479203D207370652O6C28333639303839292C0D0A2O202O2D2062752O66730D0A2O20626C617A696E6753686172647342752O66203D207370652O6C28343039383438292C0D0A2O206275726E6F757442752O66203D207370652O6C28333735383032292C0D0A2O2063686172676564426C61737442752O66203D207370652O6C28333730343534292C0D0A2O20652O73656E6365427572737442752O66203D207370652O6C28333539363138292C0D0A2O20656D6572616C645472616E636542752O66203D207370652O6C28343234312O35292C202O2D20543331203270630D0A2O20652O73656E6365427572737442752O66203D207370652O6C28333539363138292C0D0A2O2069726964657363656E6365426C756542752O66203D206D756C74695370652O6C28333836332O392C20332O39333730292C0D0A2O2069726964657363656E636552656442752O66203D207370652O6C28333836333533292C0D0A2O206C696D69746C652O73506F74656E7469616C42752O66203D207370652O6C2833392O343032292C0D0A2O20706F7765725377652O6C42752O66203D207370652O6C28333736383530292C0D0A2O20736E61706669726542752O66203D207370652O6C28333730383138292C0D0A2O202O2D20646562752O66730D0A2O206C6976696E67466C616D65446562752O66203D207370652O6C28333631352O30292C0D0A7D290D0A0D0A7370652O6C2E65766F6B65722E707265736572766174696F6E203D204D657267655461626C6542794B6579287370652O6C2E65766F6B65722E636F2O6D6F6E732C207B0D0A2O202O2D207370652O6C730D0A2O20647265616D427265617468203D206D756C74695370652O6C28332O353933362C20333832363134292C0D0A2O20647265616D466C69676874203D207370652O6C28333539383136292C0D0A2O206563686F203D207370652O6C28333634333433292C0D0A2O206D612O7352657475726E203D207370652O6C2833362O313738292C0D0A2O20737069726974626C2O6F6D203D206D756C74695370652O6C283336372O32362C20333832373331292C0D0A2O20737461736973203D207370652O6C28333730353337292C0D0A2O2073746173697352656163746976617465203D207370652O6C28333730353634292C0D0A2O2074656D706F72616C416E6F6D616C79203D207370652O6C28333733383631292C0D0A2O2074696D6544696C6174696F6E203D207370652O6C28333537313730292C0D0A2O20726576657273696F6E203D206D756C74695370652O6C28332O36312O352C20333637333634292C0D0A2O20726577696E64203D207370652O6C28333633353334292C0D0A2O202O2D2062752O660D0A2O20652O73656E6365427572737442752O66203D207370652O6C28333639322O39292C0D0A2O2073746173697342752O66203D207370652O6C28333730353632292C0D0A7D290D0A0D0A2O2D206974656D730D0A6966206E6F74206974656D2E65766F6B6572207468656E0D0A2O206974656D2E65766F6B6572203D207B7D0D0A656E640D0A6974656D2E65766F6B65722E636F2O6D6F6E73203D207B0D0A2O2069726964616C203D206974656D283230383332312C207B31367D292C0D0A7D0D0A0D0A6974656D2E65766F6B65722E6175676D656E746174696F6E203D204D657267655461626C6542794B6579286974656D2E65766F6B65722E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E65766F6B65722E6465766173746174696F6E203D204D657267655461626C6542794B6579286974656D2E65766F6B65722E636F2O6D6F6E732C207B0D0A7D290D0A0D0A6974656D2E65766F6B65722E707265736572766174696F6E203D204D657267655461626C6542794B6579286974656D2E65766F6B65722E636F2O6D6F6E732C207B0D0A7D290D0A0D0A2O2D206D6163726F730D0A6966206E6F74206D6163726F2E65766F6B6572207468656E0D0A2O206D6163726F2E65766F6B6572203D207B7D3B0D0A656E640D0A6D6163726F2E65766F6B65722E636F2O6D6F6E73203D207B0D0A2O202O2D207370652O6C730D0A2O20617A757265537472696B654D6F7573656F766572203D206D6163726F2822617A757265537472696B654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E617A757265537472696B653A4E616D65282O292C0D0A2O20642O6570427265617468437572736F72203D206D6163726F2822642O6570427265617468437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E642O65704272656174683A4E616D65282O292C0D0A2O20636175746572697A696E67466C616D65466F637573203D206D6163726F2822636175746572697A696E67466C616D65466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E636175746572697A696E67466C616D653A4E616D65282O292C0D0A2O20636175746572697A696E67466C616D654D6F7573656F766572203D206D6163726F2822636175746572697A696E67466C616D654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E636175746572697A696E67466C616D653A4E616D65282O292C0D0A2O20656D6572616C64426C6F2O736F6D466F637573203D206D6163726F2822656D6572616C64426C6F2O736F6D466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E656D6572616C64426C6F2O736F6D3A4E616D65282O292C0D0A2O20657870756E6765466F637573203D206D6163726F2822657870756E6765466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E657870756E67653A4E616D65282O292C0D0A2O20657870756E67654D6F7573656F766572203D206D6163726F2822657870756E67654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E657870756E67653A4E616D65282O292C0D0A2O20666972654272656174684D6163726F203D206D6163726F282266697265427265617468222C20222F636173742022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E666972654272656174683A4E616D65282O292C0D0A2O206C616E64736C696465437572736F72203D206D6163726F28226C616E64736C696465437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E6C616E64736C6964653A4E616D65282O292C0D0A2O206C6976696E67466C616D65466F637573203D206D6163726F28226C6976696E67466C616D65466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E6C6976696E67466C616D653A4E616D65282O292C0D0A2O206C6976696E67466C616D654D6F7573656F766572203D206D6163726F28226C6976696E67466C616D654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E6C6976696E67466C616D653A4E616D65282O292C0D0A2O206E61747572616C697A65466F637573203D206D6163726F28226E61747572616C697A65466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E6E61747572616C697A653A4E616D65282O292C0D0A2O206E61747572616C697A654D6F7573656F766572203D206D6163726F28226E61747572616C697A654D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E6E61747572616C697A653A4E616D65282O292C0D0A2O2072657475726E4D6F7573656F766572203D206D6163726F282272657475726E4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E72657475726E5F3A4E616D65282O292C0D0A2O207175652O6C4D6F7573656F766572203D206D6163726F28227175652O6C4D6F7573656F766572222C20222F63617374205B406D6F7573656F7665725D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E7175652O6C3A4E616D65282O292C0D0A2O2076657264616E74456D6272616365466F637573203D206D6163726F282276657264616E74456D6272616365466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E76657264616E74456D62726163653A4E616D65282O292C0D0A2O202O2D206974656D730D0A2O2069726964616C203D206D6163726F282269726964616C222C20222F757365206974656D3A32303833323122292C0D0A7D0D0A0D0A6D6163726F2E65766F6B65722E6175676D656E746174696F6E203D204D657267655461626C6542794B6579286D6163726F2E65766F6B65722E636F2O6D6F6E732C207B0D0A2O20626C6973746572696E675363616C6573466F637573203D206D6163726F2822626C6973746572696E675363616C6573466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E6175676D656E746174696F6E2E626C6973746572696E675363616C65733A4E616D65282O292C0D0A2O206272656174686F66456F6E73437572736F72203D206D6163726F28226272656174686F66456F6E73437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E65766F6B65722E6175676D656E746174696F6E2E6272656174686F66456F6E733A4E616D65282O292C0D0A2O20707265736369656E6365466F637573203D206D6163726F2822707265736369656E6365466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E6175676D656E746174696F6E2E707265736369656E63653A4E616D65282O292C0D0A2O20736F757263656F664D61676963466F637573203D206D6163726F2822736F757263656F664D61676963466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E6175676D656E746174696F6E2E736F757263656F664D616769633A4E616D65282O292C0D0A2O20757068656176616C4D6163726F203D206D6163726F2822757068656176616C4D6163726F222C20222F636173742022202O2E207370652O6C2E65766F6B65722E6175676D656E746174696F6E2E757068656176616C3A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E65766F6B65722E6465766173746174696F6E203D204D657267655461626C6542794B6579286D6163726F2E65766F6B65722E636F2O6D6F6E732C207B0D0A2O202O2D207370652O6C730D0A2O20657465726E69747953757267654D6163726F203D206D6163726F2822657465726E6974795375726765222C20222F636173742022202O2E207370652O6C2E65766F6B65722E6465766173746174696F6E2E657465726E69747953757267653A4E616D65282O292C0D0A7D290D0A0D0A6D6163726F2E65766F6B65722E707265736572766174696F6E203D204D657267655461626C6542794B6579286D6163726F2E65766F6B65722E636F2O6D6F6E732C207B0D0A2O202O2D207370652O6C730D0A2O20647265616D4272656174684D6163726F203D206D6163726F2822647265616D427265617468222C20222F636173742022202O2E207370652O6C2E65766F6B65722E707265736572766174696F6E2E647265616D4272656174683A4E616D65282O292C0D0A2O20647265616D466C69676874437572736F72203D206D6163726F2822647265616D466C69676874437572736F72222C20222F63617374205B40637572736F725D2022202O2E207370652O6C2E65766F6B65722E707265736572766174696F6E2E647265616D466C696768743A4E616D65282O292C0D0A2O206563686F466F637573203D206D6163726F28226563686F466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E707265736572766174696F6E2E6563686F3A4E616D65282O292C0D0A2O20737069726974626C2O6F6D466F637573203D206D6163726F2822737069726974626C2O6F6D466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E707265736572766174696F6E2E737069726974626C2O6F6D3A4E616D65282O292C0D0A2O2074696D6544696C6174696F6E466F637573203D206D6163726F282274696D6544696C6174696F6E466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E707265736572766174696F6E2E74696D6544696C6174696F6E3A4E616D65282O292C0D0A2O207469705468655363616C6573447265616D427265617468203D206D6163726F28227469705468655363616C6573447265616D427265617468222C20222F636173742022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E7469705468655363616C65733A4E616D652829202O2E20225C6E2F636173742022202O2E207370652O6C2E65766F6B65722E707265736572766174696F6E2E647265616D4272656174683A4E616D65282O292C0D0A2O207469705468655363616C6573537069726974626C2O6F6D203D206D6163726F28227469705468655363616C6573537069726974626C2O6F6D222C20222F636173742022202O2E207370652O6C2E65766F6B65722E636F2O6D6F6E732E7469705468655363616C65733A4E616D652829202O2E20225C6E2F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E707265736572766174696F6E2E737069726974626C2O6F6D3A4E616D65282O292C0D0A2O20726576657273696F6E466F637573203D206D6163726F2822726576657273696F6E466F637573222C20222F63617374205B40666F6375735D2022202O2E207370652O6C2E65766F6B65722E707265736572766174696F6E2E726576657273696F6E3A4E616D65282O292C0D0A7D290D0A00063O0012073O00013O00120B000100024O00043O000200022O000800016O00055O00012O00033O00017O00",v9(),...);