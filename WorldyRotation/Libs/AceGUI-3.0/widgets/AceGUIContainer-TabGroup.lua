local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33)if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23()local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24()local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47)local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59)local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...)local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=2) then if (v86<=0) then local v110;local v111;if ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end v77=v77 + 1 ;v85=v73[v77];v83[v85[2]]=v85[3];v77=v77 + 1 ;v85=v73[v77];v111=v85[2];v83[v111]=v83[v111](v83[v111 + 1 ]);v77=v77 + 1 ;v85=v73[v77];v111=v85[2];v78=(v111 + v84) -1 ;for v118=v111,v78 do v110=v79[v118-v111 ];v83[v118]=v110;end v77=v77 + 1 ;v85=v73[v77];v111=v85[2];v83[v111](v13(v83,v111 + 1 ,v78));v77=v77 + 1 ;v85=v73[v77];do return;end elseif (v86>1) then do return;end elseif ((v85[3]=="_ENV") or (v85[3]=="getfenv")) then v83[v85[2]]=v59;else v83[v85[2]]=v59[v85[3]];end elseif (v86<=4) then if (v86>3) then local v124=v85[2];v83[v124]=v83[v124](v83[v124 + 1 ]);else v83[v85[2]]=v85[3];end elseif (v86==5) then local v128=v85[2];v83[v128](v13(v83,v128 + 1 ,v78));else local v129=v85[2];v78=(v129 + v84) -1 ;for v131=v129,v78 do local v132=v79[v131-v129 ];v83[v131]=v132;end end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end v15("LOL!023O00030A3O006C6F6164737472696E670372422O002O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A54616247726F757020436F6E7461696E65720D0A436F6E7461696E6572207468617420757365732074616273206F6E20746F7020746F2073776974636820626574772O656E2067726F7570732E0D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C20547970652C2056657273696F6E203D202254616247726F7570222C2033380D0A6C6F63616C20416365475549203D204C69625374756220616E64204C69625374756228224163654755492D332E30222C2074727565290D0A6966206E6F7420416365475549206F7220284163654755493A47657457696467657456657273696F6E285479706529206F72203029203E3D2056657273696F6E207468656E2072657475726E20656E640D0A0D0A2O2D204C756120415049730D0A6C6F63616C2070616972732C206970616972732C20612O736572742C20747970652C2077697065203D2070616972732C206970616972732C20612O736572742C20747970652C207461626C652E776970650D0A0D0A2O2D20576F5720415049730D0A6C6F63616C20506C6179536F756E64203D20506C6179536F756E640D0A6C6F63616C204372656174654672616D652C205549506172656E74203D204372656174654672616D652C205549506172656E740D0A6C6F63616C205F47203D205F470D0A0D0A2O2D206C6F63616C20757076616C75652073746F726167652075736564206279204275696C64546162730D0A6C6F63616C20776964746873203D207B7D0D0A6C6F63616C20726F2O776964746873203D207B7D0D0A6C6F63616C20726F77656E6473203D207B7D0D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A53752O706F72742066756E6374696F6E730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A0D0A6C6F63616C2066756E6374696F6E2050616E656C54656D706C617465735F546162526573697A65287461622C2070612O64696E672C206162736F6C75746553697A652C206D696E57696474682C206D617857696474682C206162736F6C7574655465787453697A65290D0A096C6F63616C207461624E616D65203D207461623A4765744E616D6528293B0D0A0D0A096C6F63616C2062752O746F6E4D692O646C65203D207461622E4D692O646C65206F72207461622E6D692O646C6554657874757265206F72205F475B7461624E616D652O2E224D692O646C65225D3B0D0A096C6F63616C2062752O746F6E4D692O646C6544697361626C6564203D207461622E4D692O646C6544697361626C6564206F7220287461624E616D6520616E64205F475B7461624E616D652O2E224D692O646C6544697361626C6564225D293B0D0A096C6F63616C206C656674203D207461622E4C656674206F72207461622E6C65667454657874757265206F72205F475B7461624E616D652O2E224C656674225D3B0D0A096C6F63616C2073696465576964746873203D2032202A206C6566743A476574576964746828293B0D0A096C6F63616C2074616254657874203D207461622E54657874206F72205F475B7461623A4765744E616D6528292O2E2254657874225D3B0D0A096C6F63616C20686967686C6967687454657874757265203D207461622E486967686C6967687454657874757265206F7220287461624E616D6520616E64205F475B7461624E616D652O2E22486967686C6967687454657874757265225D293B0D0A0D0A096C6F63616C2077696474682C2074616257696474683B0D0A096C6F63616C207465787457696474683B0D0A0969662028206162736F6C7574655465787453697A652029207468656E0D0A2O09746578745769647468203D206162736F6C7574655465787453697A653B0D0A09656C73650D0A2O09746162546578743A53657457696474682830293B0D0A2O09746578745769647468203D20746162546578743A476574576964746828293B0D0A09656E640D0A092O2D204966207468657265277320616E206162736F6C7574652073697A6520737065636966696564207468656E207573652069740D0A0969662028206162736F6C75746553697A652029207468656E0D0A2O0969662028206162736F6C75746553697A65203C207369646557696474687329207468656E0D0A3O097769647468203D20313B0D0A3O097461625769647468203D20736964655769647468730D0A2O09656C73650D0A3O097769647468203D206162736F6C75746553697A65202D20736964655769647468733B0D0A3O097461625769647468203D206162736F6C75746553697A650D0A2O09656E640D0A2O09746162546578743A5365745769647468287769647468293B0D0A09656C73650D0A2O092O2D204F74686572776973652074727920746F207573652070612O64696E670D0A2O09696620282070612O64696E672029207468656E0D0A3O097769647468203D20746578745769647468202B2070612O64696E673B0D0A2O09656C73650D0A3O097769647468203D20746578745769647468202B2032343B0D0A2O09656E640D0A2O092O2D2049662067726561746572207468616E20746865206D61785769647468207468656E206361702069740D0A2O0969662028206D6178576964746820616E64207769647468203E206D617857696474682029207468656E0D0A3O09696620282070612O64696E672029207468656E0D0A4O097769647468203D206D61785769647468202B2070612O64696E673B0D0A3O09656C73650D0A4O097769647468203D206D61785769647468202B2032343B0D0A3O09656E640D0A3O09746162546578743A5365745769647468287769647468293B0D0A2O09656C73650D0A3O09746162546578743A53657457696474682830293B0D0A2O09656E640D0A2O09696620286D696E576964746820616E64207769647468203C206D696E576964746829207468656E0D0A3O097769647468203D206D696E57696474683B0D0A2O09656E640D0A2O097461625769647468203D207769647468202B20736964655769647468733B0D0A09656E640D0A0D0A09696620282062752O746F6E4D692O646C652029207468656E0D0A2O0962752O746F6E4D692O646C653A5365745769647468287769647468293B0D0A09656E640D0A09696620282062752O746F6E4D692O646C6544697361626C65642029207468656E0D0A2O0962752O746F6E4D692O646C6544697361626C65643A5365745769647468287769647468293B0D0A09656E640D0A0D0A097461623A5365745769647468287461625769647468293B0D0A0D0A096966202820686967686C69676874546578747572652029207468656E0D0A2O09686967686C69676874546578747572653A5365745769647468287461625769647468293B0D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2050616E656C54656D706C617465735F446573656C65637454616228746162290D0A096C6F63616C206E616D65203D207461623A4765744E616D6528293B0D0A0D0A096C6F63616C206C656674203D207461622E4C656674206F72205F475B6E616D652O2E224C656674225D3B0D0A096C6F63616C206D692O646C65203D207461622E4D692O646C65206F72205F475B6E616D652O2E224D692O646C65225D3B0D0A096C6F63616C207269676874203D207461622E5269676874206F72205F475B6E616D652O2E225269676874225D3B0D0A096C6566743A53686F7728293B0D0A096D692O646C653A53686F7728293B0D0A0972696768743A53686F7728293B0D0A092O2D7461623A556E6C6F636B486967686C6967687428293B0D0A097461623A456E61626C6528293B0D0A096C6F63616C2074657874203D207461622E54657874206F72205F475B6E616D652O2E2254657874225D3B0D0A09746578743A536574506F696E74282243454E544552222C207461622C202243454E544552222C20287461622E646573656C65637465645465787458206F722030292C20287461622E646573656C65637465645465787459206F7220322O293B0D0A0D0A096C6F63616C206C65667444697361626C6564203D207461622E4C65667444697361626C6564206F72205F475B6E616D652O2E224C65667444697361626C6564225D3B0D0A096C6F63616C206D692O646C6544697361626C6564203D207461622E4D692O646C6544697361626C6564206F72205F475B6E616D652O2E224D692O646C6544697361626C6564225D3B0D0A096C6F63616C20726967687444697361626C6564203D207461622E526967687444697361626C6564206F72205F475B6E616D652O2E22526967687444697361626C6564225D3B0D0A096C65667444697361626C65643A4869646528293B0D0A096D692O646C6544697361626C65643A4869646528293B0D0A09726967687444697361626C65643A4869646528293B0D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2050616E656C54656D706C617465735F53656C65637454616228746162290D0A096C6F63616C206E616D65203D207461623A4765744E616D6528293B0D0A0D0A096C6F63616C206C656674203D207461622E4C656674206F72205F475B6E616D652O2E224C656674225D3B0D0A096C6F63616C206D692O646C65203D207461622E4D692O646C65206F72205F475B6E616D652O2E224D692O646C65225D3B0D0A096C6F63616C207269676874203D207461622E5269676874206F72205F475B6E616D652O2E225269676874225D3B0D0A096C6566743A4869646528293B0D0A096D692O646C653A4869646528293B0D0A0972696768743A4869646528293B0D0A092O2D7461623A4C6F636B486967686C6967687428293B0D0A097461623A44697361626C6528293B0D0A097461623A53657444697361626C6564466F6E744F626A6563742847616D65466F6E74486967686C69676874536D612O6C293B0D0A096C6F63616C2074657874203D207461622E54657874206F72205F475B6E616D652O2E2254657874225D3B0D0A09746578743A536574506F696E74282243454E544552222C207461622C202243454E544552222C20287461622E73656C65637465645465787458206F722030292C20287461622E73656C65637465645465787459206F72202D332O293B0D0A0D0A096C6F63616C206C65667444697361626C6564203D207461622E4C65667444697361626C6564206F72205F475B6E616D652O2E224C65667444697361626C6564225D3B0D0A096C6F63616C206D692O646C6544697361626C6564203D207461622E4D692O646C6544697361626C6564206F72205F475B6E616D652O2E224D692O646C6544697361626C6564225D3B0D0A096C6F63616C20726967687444697361626C6564203D207461622E526967687444697361626C6564206F72205F475B6E616D652O2E22526967687444697361626C6564225D3B0D0A096C65667444697361626C65643A53686F7728293B0D0A096D692O646C6544697361626C65643A53686F7728293B0D0A09726967687444697361626C65643A53686F7728293B0D0A0D0A0969662047616D65542O6F6C7469703A49734F776E65642874616229207468656E0D0A2O0947616D65542O6F6C7469703A4869646528293B0D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E2050616E656C54656D706C617465735F53657444697361626C6564546162537461746528746162290D0A096C6F63616C206E616D65203D207461623A4765744E616D6528293B0D0A096C6F63616C206C656674203D207461622E4C656674206F72205F475B6E616D652O2E224C656674225D3B0D0A096C6F63616C206D692O646C65203D207461622E4D692O646C65206F72205F475B6E616D652O2E224D692O646C65225D3B0D0A096C6F63616C207269676874203D207461622E5269676874206F72205F475B6E616D652O2E225269676874225D3B0D0A096C6566743A53686F7728293B0D0A096D692O646C653A53686F7728293B0D0A0972696768743A53686F7728293B0D0A092O2D7461623A556E6C6F636B486967686C6967687428293B0D0A097461623A44697361626C6528293B0D0A097461622E74657874203D207461623A4765745465787428293B0D0A092O2D2047726179206F757420746578740D0A097461623A53657444697361626C6564466F6E744F626A6563742847616D65466F6E7444697361626C65536D612O6C293B0D0A096C6F63616C206C65667444697361626C6564203D207461622E4C65667444697361626C6564206F72205F475B6E616D652O2E224C65667444697361626C6564225D3B0D0A096C6F63616C206D692O646C6544697361626C6564203D207461622E4D692O646C6544697361626C6564206F72205F475B6E616D652O2E224D692O646C6544697361626C6564225D3B0D0A096C6F63616C20726967687444697361626C6564203D207461622E526967687444697361626C6564206F72205F475B6E616D652O2E22526967687444697361626C6564225D3B0D0A096C65667444697361626C65643A4869646528293B0D0A096D692O646C6544697361626C65643A4869646528293B0D0A09726967687444697361626C65643A4869646528293B0D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E205570646174655461624C2O6F6B286672616D65290D0A096966206672616D652E64697361626C6564207468656E0D0A2O0950616E656C54656D706C617465735F53657444697361626C65645461625374617465286672616D65290D0A09656C73656966206672616D652E73656C6563746564207468656E0D0A2O0950616E656C54656D706C617465735F53656C656374546162286672616D65290D0A09656C73650D0A2O0950616E656C54656D706C617465735F446573656C656374546162286672616D65290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E205461625F53657454657874286672616D652C2074657874290D0A096672616D653A5F536574546578742874657874290D0A096C6F63616C207769647468203D206672616D652E6F626A2E6672616D652E7769647468206F72206672616D652E6F626A2E6672616D653A47657457696474682829206F7220300D0A0950616E656C54656D706C617465735F546162526573697A65286672616D652C20302C206E696C2C206E696C2C2077696474682C206672616D653A476574466F6E74537472696E6728293A476574537472696E675769647468282O290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E205461625F53657453656C6563746564286672616D652C2073656C6563746564290D0A096672616D652E73656C6563746564203D2073656C65637465640D0A095570646174655461624C2O6F6B286672616D65290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E205461625F53657444697361626C6564286672616D652C2064697361626C6564290D0A096672616D652E64697361626C6564203D2064697361626C65640D0A095570646174655461624C2O6F6B286672616D65290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E204275696C64546162734F6E557064617465286672616D65290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A0973656C663A4275696C645461627328290D0A096672616D653A53657453637269707428224F6E557064617465222C206E696C290D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A536372697074730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2066756E6374696F6E205461625F4F6E436C69636B286672616D65290D0A096966206E6F7420286672616D652E73656C6563746564206F72206672616D652E64697361626C656429207468656E0D0A2O09506C6179536F756E642838343129202O2D20534F554E444B49542E49475F4348415241435445525F494E464F5F5441420D0A2O096672616D652E6F626A3A53656C656374546162286672616D652E76616C7565290D0A09656E640D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E205461625F4F6E456E746572286672616D65290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A0973656C663A4669726528224F6E546162456E746572222C2073656C662E746162735B6672616D652E69645D2E76616C75652C206672616D65290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E205461625F4F6E4C65617665286672616D65290D0A096C6F63616C2073656C66203D206672616D652E6F626A0D0A0973656C663A4669726528224F6E5461624C65617665222C2073656C662E746162735B6672616D652E69645D2E76616C75652C206672616D65290D0A656E640D0A0D0A6C6F63616C2066756E6374696F6E205461625F4F6E53686F77286672616D65290D0A095F475B6672616D653A4765744E616D6528292O2E22486967686C6967687454657874757265225D3A5365745769647468286672616D653A4765745465787457696474682829202B203330290D0A656E640D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A4D6574686F64730D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C206D6574686F6473203D207B0D0A095B224F6E41637175697265225D203D2066756E6374696F6E2873656C66290D0A2O0973656C663A5365745469746C6528290D0A09656E642C0D0A0D0A095B224F6E52656C65617365225D203D2066756E6374696F6E2873656C66290D0A2O0973656C662E737461747573203D206E696C0D0A2O09666F72206B20696E2070616972732873656C662E6C6F63616C7374617475732920646F0D0A3O0973656C662E6C6F63616C7374617475735B6B5D203D206E696C0D0A2O09656E640D0A2O0973656C662E7461626C697374203D206E696C0D0A2O09666F72205F2C2074616220696E2070616972732873656C662E746162732920646F0D0A3O097461623A4869646528290D0A2O09656E640D0A09656E642C0D0A0D0A095B22437265617465546162225D203D2066756E6374696F6E2873656C662C206964290D0A2O096C6F63616C207461626E616D65203D20282241636547554954616247726F75702564546162256422293A666F726D61742873656C662E6E756D2C206964290D0A2O096C6F63616C20746162203D204372656174654672616D65282242752O746F6E222C207461626E616D652C2073656C662E626F72646572290D0A2O097461623A53657453697A65282O31352C203234290D0A2O097461622E646573656C65637465645465787459203D202D330D0A2O097461622E73656C65637465645465787459203D202D320D0A0D0A2O097461622E4C65667444697361626C6564203D207461623A43726561746554657874757265287461626E616D65202O2E20224C65667444697361626C6564222C2022424F5244455222290D0A2O097461622E4C65667444697361626C65643A536574546578747572652822496E746572666163652O5C4F7074696F6E734672616D652O5C55492D4F7074696F6E734672616D652D41637469766554616222290D0A2O097461622E4C65667444697361626C65643A53657453697A652832302C203234290D0A2O097461622E4C65667444697361626C65643A536574506F696E742822424F2O544F4D4C454654222C20302C202D33290D0A2O097461622E4C65667444697361626C65643A536574546578432O6F726428302C20302E31353632352C20302C20312E30290D0A0D0A2O097461622E4D692O646C6544697361626C6564203D207461623A43726561746554657874757265287461626E616D65202O2E20224D692O646C6544697361626C6564222C2022424F5244455222290D0A2O097461622E4D692O646C6544697361626C65643A536574546578747572652822496E746572666163652O5C4F7074696F6E734672616D652O5C55492D4F7074696F6E734672616D652D41637469766554616222290D0A2O097461622E4D692O646C6544697361626C65643A53657453697A65282O382C203234290D0A2O097461622E4D692O646C6544697361626C65643A536574506F696E7428224C454654222C207461622E4C65667444697361626C65642C2022524947485422290D0A2O097461622E4D692O646C6544697361626C65643A536574546578432O6F726428302E31353632352C20302E38343337352C20302C20312E30290D0A0D0A2O097461622E526967687444697361626C6564203D207461623A43726561746554657874757265287461626E616D65202O2E2022526967687444697361626C6564222C2022424F5244455222290D0A2O097461622E526967687444697361626C65643A536574546578747572652822496E746572666163652O5C4F7074696F6E734672616D652O5C55492D4F7074696F6E734672616D652D41637469766554616222290D0A2O097461622E526967687444697361626C65643A53657453697A652832302C203234290D0A2O097461622E526967687444697361626C65643A536574506F696E7428224C454654222C207461622E4D692O646C6544697361626C65642C2022524947485422290D0A2O097461622E526967687444697361626C65643A536574546578432O6F726428302E38343337352C20312E302C20302C20312E30290D0A0D0A2O097461622E4C656674203D207461623A43726561746554657874757265287461626E616D65202O2E20224C656674222C2022424F5244455222290D0A2O097461622E4C6566743A536574546578747572652822496E746572666163652O5C4F7074696F6E734672616D652O5C55492D4F7074696F6E734672616D652D496E41637469766554616222290D0A2O097461622E4C6566743A53657453697A652832302C203234290D0A2O097461622E4C6566743A536574506F696E742822544F504C45465422290D0A2O097461622E4C6566743A536574546578432O6F726428302C20302E31353632352C20302C20312E30290D0A0D0A2O097461622E4D692O646C65203D207461623A43726561746554657874757265287461626E616D65202O2E20224D692O646C65222C2022424F5244455222290D0A2O097461622E4D692O646C653A536574546578747572652822496E746572666163652O5C4F7074696F6E734672616D652O5C55492D4F7074696F6E734672616D652D496E41637469766554616222290D0A2O097461622E4D692O646C653A53657453697A65282O382C203234290D0A2O097461622E4D692O646C653A536574506F696E7428224C454654222C207461622E4C6566742C2022524947485422290D0A2O097461622E4D692O646C653A536574546578432O6F726428302E31353632352C20302E38343337352C20302C20312E30290D0A0D0A2O097461622E5269676874203D207461623A43726561746554657874757265287461626E616D65202O2E20225269676874222C2022424F5244455222290D0A2O097461622E52696768743A536574546578747572652822496E746572666163652O5C4F7074696F6E734672616D652O5C55492D4F7074696F6E734672616D652D496E41637469766554616222290D0A2O097461622E52696768743A53657453697A652832302C203234290D0A2O097461622E52696768743A536574506F696E7428224C454654222C207461622E4D692O646C652C2022524947485422290D0A2O097461622E52696768743A536574546578432O6F726428302E38343337352C20312E302C20302C20312E30290D0A0D0A2O097461622E54657874203D207461623A437265617465466F6E74537472696E67287461626E616D65202O2E20225465787422290D0A2O097461623A536574466F6E74537472696E67287461622E54657874290D0A0D0A2O097461623A5365744E6F726D616C466F6E744F626A6563742847616D65466F6E744E6F726D616C536D612O6C290D0A2O097461623A536574486967686C69676874466F6E744F626A6563742847616D65466F6E74486967686C69676874536D612O6C290D0A2O097461623A53657444697361626C6564466F6E744F626A6563742847616D65466F6E74486967686C69676874536D612O6C290D0A2O097461623A536574486967686C69676874546578747572652822496E746572666163652O5C5061706572446F2O6C496E666F4672616D652O5C55492D4368617261637465722D5461622D486967686C69676874222C2022412O4422290D0A2O097461622E486967686C6967687454657874757265203D207461623A476574486967686C696768745465787475726528290D0A2O097461622E486967686C69676874546578747572653A436C656172412O6C506F696E747328290D0A2O097461622E486967686C69676874546578747572653A536574506F696E7428224C454654222C207461622C20224C454654222C2031302C202D34290D0A2O097461622E486967686C69676874546578747572653A536574506F696E7428225249474854222C207461622C20225249474854222C202D31302C202D34290D0A2O095F475B7461626E616D65202O2E2022486967686C6967687454657874757265225D203D207461622E486967686C69676874546578747572650D0A0D0A2O097461622E6F626A203D2073656C660D0A2O097461622E6964203D2069640D0A0D0A2O097461622E74657874203D207461622E54657874202O2D20636F6D7061740D0A2O097461622E746578743A436C656172412O6C506F696E747328290D0A2O097461622E746578743A536574506F696E7428224C454654222C2031342C202D33290D0A2O097461622E746578743A536574506F696E7428225249474854222C202D31322C202D33290D0A0D0A2O097461623A53657453637269707428224F6E436C69636B222C205461625F4F6E436C69636B290D0A2O097461623A53657453637269707428224F6E456E746572222C205461625F4F6E456E746572290D0A2O097461623A53657453637269707428224F6E4C65617665222C205461625F4F6E4C65617665290D0A2O097461623A53657453637269707428224F6E53686F77222C205461625F4F6E53686F77290D0A0D0A2O097461622E5F53657454657874203D207461622E536574546578740D0A2O097461622E53657454657874203D205461625F536574546578740D0A2O097461622E53657453656C6563746564203D205461625F53657453656C65637465640D0A2O097461622E53657444697361626C6564203D205461625F53657444697361626C65640D0A0D0A2O0972657475726E207461620D0A09656E642C0D0A0D0A095B225365745469746C65225D203D2066756E6374696F6E2873656C662C2074657874290D0A2O0973656C662E7469746C65746578743A536574546578742874657874206F72202O22290D0A2O096966207465787420616E642074657874207E3D202O22207468656E0D0A3O0973656C662E616C69676E6F2O66736574203D2032350D0A2O09656C73650D0A3O0973656C662E616C69676E6F2O66736574203D2031380D0A2O09656E640D0A2O0973656C663A4275696C645461627328290D0A09656E642C0D0A0D0A095B225365745374617475735461626C65225D203D2066756E6374696F6E2873656C662C20737461747573290D0A2O09612O7365727428747970652873746174757329202O3D20227461626C6522290D0A2O0973656C662E737461747573203D207374617475730D0A09656E642C0D0A0D0A095B2253656C656374546162225D203D2066756E6374696F6E2873656C662C2076616C7565290D0A2O096C6F63616C20737461747573203D2073656C662E737461747573206F722073656C662E6C6F63616C7374617475730D0A2O096C6F63616C20666F756E640D0A2O09666F7220692C207620696E206970616972732873656C662E746162732920646F0D0A3O09696620762E76616C7565202O3D2076616C7565207468656E0D0A4O09763A53657453656C65637465642874727565290D0A4O09666F756E64203D20747275650D0A3O09656C73650D0A4O09763A53657453656C65637465642866616C7365290D0A3O09656E640D0A2O09656E640D0A2O097374617475732E73656C6563746564203D2076616C75650D0A2O09696620666F756E64207468656E0D0A3O0973656C663A4669726528224F6E47726F757053656C6563746564222C76616C7565290D0A2O09656E640D0A09656E642C0D0A0D0A095B2253657454616273225D203D2066756E6374696F6E2873656C662C2074616273290D0A2O0973656C662E7461626C697374203D20746162730D0A2O0973656C663A4275696C645461627328290D0A09656E642C0D0A0D0A0D0A095B224275696C6454616273225D203D2066756E6374696F6E2873656C66290D0A2O096C6F63616C206861737469746C65203D202873656C662E7469746C65746578743A47657454657874282920616E642073656C662E7469746C65746578743A476574546578742829207E3D202O22290D0A2O096C6F63616C207461626C697374203D2073656C662E7461626C6973740D0A2O096C6F63616C2074616273203D2073656C662E746162730D0A0D0A2O096966206E6F74207461626C697374207468656E2072657475726E20656E640D0A0D0A2O096C6F63616C207769647468203D2073656C662E6672616D652E7769647468206F722073656C662E6672616D653A47657457696474682829206F7220300D0A0D0A2O097769706528776964746873290D0A2O097769706528726F2O776964746873290D0A2O097769706528726F77656E6473290D0A0D0A2O092O2D506C616365205465787420696E746F207461627320616E642067657420746869657220696E697469616C2077696474680D0A2O09666F7220692C207620696E20697061697273287461626C6973742920646F0D0A3O096C6F63616C20746162203D20746162735B695D0D0A3O096966206E6F7420746162207468656E0D0A4O09746162203D2073656C663A4372656174655461622869290D0A4O09746162735B695D203D207461620D0A3O09656E640D0A0D0A3O097461623A53686F7728290D0A3O097461623A5365745465787428762E74657874290D0A3O097461623A53657444697361626C656428762E64697361626C6564290D0A3O097461622E76616C7565203D20762E76616C75650D0A0D0A3O097769647468735B695D203D207461623A47657457696474682829202D2036202O2D746162732061726520616E63686F72656420313020706978656C732066726F6D207468652072696768742073696465206F66207468652070726576696F7573206F6E6520746F207265647563652073706163696E672C2062757420612O642061206669786564203470782070612O64696E6720666F722074686520746578740D0A2O09656E640D0A0D0A2O09666F722069203D2028237461626C697374292B312C2023746162732C203120646F0D0A3O09746162735B695D3A4869646528290D0A2O09656E640D0A0D0A2O092O2D46697273742070612O732C2066696E6420746865206D696E696D756D206E756D626572206F6620726F7773206E2O6564656420746F20686F6C6420612O6C207461627320616E642074686520696E697469616C20746162206C61796F75740D0A2O096C6F63616C206E756D74616273203D20237461626C6973740D0A2O096C6F63616C206E756D726F7773203D20310D0A2O096C6F63616C20757365647769647468203D20300D0A0D0A2O09666F722069203D20312C20237461626C69737420646F0D0A3O092O2D49662074686973206973206E6F742074686520666972737420746162206F66206120726F7720616E642074686572652069736E277420722O6F6D20666F722069740D0A3O09696620757365647769647468207E3D203020616E6420287769647468202D20757365647769647468202D207769647468735B695D29203C2030207468656E0D0A4O09726F2O7769647468735B6E756D726F77735D203D20757365647769647468202B203130202O2D66697273742074616220696E206561636820726F772074616B657320757020616E20657874726120313070780D0A4O09726F77656E64735B6E756D726F77735D203D2069202D20310D0A4O096E756D726F7773203D206E756D726F7773202B20310D0A4O09757365647769647468203D20300D0A3O09656E640D0A3O09757365647769647468203D20757365647769647468202B207769647468735B695D0D0A2O09656E640D0A2O09726F2O7769647468735B6E756D726F77735D203D20757365647769647468202B203130202O2D66697273742074616220696E206561636820726F772074616B657320757020616E20657874726120313070780D0A2O09726F77656E64735B6E756D726F77735D203D20237461626C6973740D0A0D0A2O092O2D46697820666F722073696E676C652074616273206265696E67206C656674206F6E20746865206C61737420726F772C206D6F76652061207461622066726F6D2074686520726F772061626F766520696620612O706C696361626C650D0A2O096966206E756D726F7773203E2031207468656E0D0A3O092O2D696620746865206C61737420726F7720686173206F6E6C79206F6E65207461620D0A3O09696620726F77656E64735B6E756D726F77732D315D202O3D206E756D746162732D31207468656E0D0A4O092O2D696620746865726520617265206D6F7265207468616E2032207461627320696E2074686520326E64206C61737420726F770D0A4O09696620286E756D726F7773202O3D203220616E6420726F77656E64735B6E756D726F77732D315D203E203229206F722028726F77656E64735B6E756D726F77735D202D20726F77656E64735B6E756D726F77732D315D203E203229207468656E0D0A5O092O2D6D6F76652031207461622066726F6D20746865207365636F6E64206C61737420726F7720746F20746865206C6173742C20696620746865726520697320656E6F7567682073706163650D0A5O0969662028726F2O7769647468735B6E756D726F77735D202B207769647468735B6E756D746162732D315D29203C3D207769647468207468656E0D0A6O09726F77656E64735B6E756D726F77732D315D203D20726F77656E64735B6E756D726F77732D315D202D20310D0A6O09726F2O7769647468735B6E756D726F77735D203D20726F2O7769647468735B6E756D726F77735D202B207769647468735B6E756D746162732D315D0D0A6O09726F2O7769647468735B6E756D726F77732D315D203D20726F2O7769647468735B6E756D726F77732D315D202D207769647468735B6E756D746162732D315D0D0A5O09656E640D0A4O09656E640D0A3O09656E640D0A2O09656E640D0A0D0A2O092O2D616E63686F722074686520726F777320617320646566696E656420616E6420726573697A65207461627320746F2066692O6C20746869657220726F770D0A2O096C6F63616C20737461722O746162203D20310D0A2O09666F7220726F772C20656E6474616220696E2069706169727328726F77656E64732920646F0D0A3O096C6F63616C206669727374203D20747275650D0A3O09666F72207461626E6F203D20737461722O7461622C20656E6474616220646F0D0A4O096C6F63616C20746162203D20746162735B7461626E6F5D0D0A4O097461623A436C656172412O6C506F696E747328290D0A4O096966206669727374207468656E0D0A5O097461623A536574506F696E742822544F504C454654222C2073656C662E6672616D652C2022544F504C454654222C20302C202D286861737469746C6520616E64203134206F722037292D28726F772D31292A323020290D0A5O096669727374203D2066616C73650D0A4O09656C73650D0A5O097461623A536574506F696E7428224C454654222C20746162735B7461626E6F2D315D2C20225249474854222C202D31302C2030290D0A4O09656E640D0A3O09656E640D0A0D0A3O092O2D20657175616C2070612O64696E6720666F7220656163682074616220746F2066692O6C2074686520617661696C61626C652077696474682C0D0A3O092O2D2069662074686520757365642073706163652069732061626F76652037352520616C72656164790D0A3O092O2D2074686520313820706978656C20697320746865207479706963616C207769647468206F662061207363726F2O6C6261722C20736F2077652063616E20686176652061207461622067726F757020696E736964652061207363726F2O6C696E67206672616D652C0D0A3O092O2D20616E64206E6F742068617665207468652074616273206A756D702061726F756E642066752O6E79207768656E20737769746368696E6720626574772O656E20746162732074686174206E2O6564207363726F2O6C696E6720616E642074686F7365207468617420646F6E27740D0A3O096C6F63616C2070612O64696E67203D20300D0A3O096966206E6F7420286E756D726F7773202O3D203120616E6420726F2O7769647468735B315D203C2077696474682A302E3735202D20313829207468656E0D0A4O0970612O64696E67203D20287769647468202D20726F2O7769647468735B726F775D29202F2028656E64746162202D20737461722O7461622B31290D0A3O09656E640D0A0D0A3O09666F722069203D20737461722O7461622C20656E6474616220646F0D0A4O0950616E656C54656D706C617465735F546162526573697A6528746162735B695D2C2070612O64696E67202B20342C206E696C2C206E696C2C2077696474682C20746162735B695D3A476574466F6E74537472696E6728293A476574537472696E675769647468282O290D0A3O09656E640D0A3O09737461722O746162203D20656E64746162202B20310D0A2O09656E640D0A0D0A2O0973656C662E626F726465726F2O66736574203D20286861737469746C6520616E64203137206F72203130292B2O286E756D726F7773292A3230290D0A2O0973656C662E626F726465723A536574506F696E742822544F504C454654222C20312C202D73656C662E626F726465726F2O66736574290D0A09656E642C0D0A0D0A095B224F6E5769647468536574225D203D2066756E6374696F6E2873656C662C207769647468290D0A2O096C6F63616C20636F6E74656E74203D2073656C662E636F6E74656E740D0A2O096C6F63616C20636F6E74656E747769647468203D207769647468202D2036300D0A2O09696620636F6E74656E747769647468203C2030207468656E0D0A3O09636F6E74656E747769647468203D20300D0A2O09656E640D0A2O09636F6E74656E743A536574576964746828636F6E74656E747769647468290D0A2O09636F6E74656E742E7769647468203D20636F6E74656E7477696474680D0A2O0973656C663A4275696C64546162732873656C66290D0A2O0973656C662E6672616D653A53657453637269707428224F6E557064617465222C204275696C64546162734F6E557064617465290D0A09656E642C0D0A0D0A095B224F6E486569676874536574225D203D2066756E6374696F6E2873656C662C20686569676874290D0A2O096C6F63616C20636F6E74656E74203D2073656C662E636F6E74656E740D0A2O096C6F63616C20636F6E74656E74686569676874203D20686569676874202D202873656C662E626F726465726F2O66736574202B203233290D0A2O09696620636F6E74656E74686569676874203C2030207468656E0D0A3O09636F6E74656E74686569676874203D20300D0A2O09656E640D0A2O09636F6E74656E743A53657448656967687428636F6E74656E74686569676874290D0A2O09636F6E74656E742E686569676874203D20636F6E74656E746865696768740D0A09656E642C0D0A0D0A095B224C61796F757446696E6973686564225D203D2066756E6374696F6E2873656C662C2077696474682C20686569676874290D0A2O0969662073656C662E6E6F4175746F486569676874207468656E2072657475726E20656E640D0A2O0973656C663A5365744865696768742O28686569676874206F72203029202B202873656C662E626F726465726F2O66736574202B2032332O290D0A09656E640D0A7D0D0A0D0A2O2D2O5B9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D5O2D0D0A436F6E7374727563746F720D0A9O2D9O2D9O2D9O2D9O2D9O2D9O2D9O2D7O2D2O5D0D0A6C6F63616C2050616E654261636B64726F702O203D207B0D0A09626746696C65203D2022496E746572666163652O5C436861744672616D652O5C436861744672616D654261636B67726F756E64222C0D0A096564676546696C65203D2022496E746572666163652O5C542O6F6C746970732O5C55492D542O6F6C7469702D426F72646572222C0D0A0974696C65203D20747275652C2074696C6553697A65203D2031362C206564676553697A65203D2031362C0D0A09696E73657473203D207B206C656674203D20332C207269676874203D20332C20746F70203D20352C20626F2O746F6D203D2033207D0D0A7D0D0A0D0A6C6F63616C2066756E6374696F6E20436F6E7374727563746F7228290D0A096C6F63616C206E756D203D204163654755493A4765744E6578745769646765744E756D2854797065290D0A096C6F63616C206672616D65203D204372656174654672616D6528224672616D65222C6E696C2C5549506172656E74290D0A096672616D653A53657448656967687428312O30290D0A096672616D653A536574576964746828312O30290D0A096672616D653A5365744672616D65537472617461282246552O4C5343522O454E5F4449414C4F4722290D0A0D0A096C6F63616C207469746C6574657874203D206672616D653A437265617465466F6E74537472696E67286E696C2C224F5645524C4159222C2247616D65466F6E744E6F726D616C22290D0A097469746C65746578743A536574506F696E742822544F504C454654222C2031342C2030290D0A097469746C65746578743A536574506F696E742822544F505249474854222C202D31342C2030290D0A097469746C65746578743A5365744A7573746966794828224C45465422290D0A097469746C65746578743A536574486569676874283138290D0A097469746C65746578743A53657454657874282O22290D0A0D0A096C6F63616C20626F72646572203D204372656174654672616D6528224672616D65222C206E696C2C206672616D652C20224261636B64726F7054656D706C61746522290D0A09626F726465723A536574506F696E742822544F504C454654222C20312C202D3237290D0A09626F726465723A536574506F696E742822424F2O544F4D5249474854222C202D312C2033290D0A09626F726465723A5365744261636B64726F702850616E654261636B64726F70290D0A09626F726465723A5365744261636B64726F70436F6C6F7228302E312C20302E312C20302E312C20302E35290D0A09626F726465723A5365744261636B64726F70426F72646572436F6C6F7228302E342C20302E342C20302E34290D0A0D0A096C6F63616C20636F6E74656E74203D204372656174654672616D6528224672616D65222C206E696C2C20626F72646572290D0A09636F6E74656E743A536574506F696E742822544F504C454654222C2031302C202D37290D0A09636F6E74656E743A536574506F696E742822424F2O544F4D5249474854222C202D31302C2037290D0A0D0A096C6F63616C20776964676574203D207B0D0A2O096E756D9O20203D206E756D2C0D0A2O096672616D658O203D206672616D652C0D0A2O096C6F63616C7374617475732O203D207B7D2C0D0A2O09616C69676E6F2O667365742O203D2031382C0D0A2O097469746C65746578744O203D207469746C65746578742C0D0A2O09626F726465727O203D20626F726465722C0D0A2O09626F726465726F2O66736574203D2032372C0D0A2O09746162739O203D207B7D2C0D0A2O09636F6E74656E746O203D20636F6E74656E742C0D0A2O09747970659O203D20547970650D0A097D0D0A09666F72206D6574686F642C2066756E6320696E207061697273286D6574686F64732920646F0D0A2O097769646765745B6D6574686F645D203D2066756E630D0A09656E640D0A0D0A0972657475726E204163654755493A52656769737465724173436F6E7461696E657228776964676574290D0A656E640D0A0D0A4163654755493A52656769737465725769646765745479706528547970652C20436F6E7374727563746F722C2056657273696F6E290D0A00063O00124O00013O00122O000100028O000200024O00019O003O00016O00017O00",v9(),...);