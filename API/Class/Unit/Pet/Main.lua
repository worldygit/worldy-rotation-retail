return(function(...)local S={"\053\108\115\103\057\105\069\119\057\109\067\048\097\114\071\119\072\066\097\087\057\109\067\048\114\065\048\098\053\121\118\083\053\110\067\066\053\100\090\071\097\114\071\119\057\109\067\048\116\086\072\087\089\109\065\118\110\100\113\120\057\121\101\098\097\122\067\090\047\110\043\115\097\122\072\087\089\109\065\087\081\108\072\071\114\065\102\118\110\100\113\120\057\121\101\098\097\076\090\084\054\108\072\071\065\105\118\071\089\109\080\090\097\114\071\119\112\109\118\065\080\109\107\067\057\070\107\048\047\100\054\118\110\119\071\117\080\086\072\087\057\070\107\048\053\121\099\119\081\108\072\071\079\088\090\084\065\105\118\071\089\109\080\090\117\110\088\118\110\073\043\119\081\100\072\071\047\109\051\087\097\076\090\084\054\108\072\071\065\105\118\071\089\109\080\090\117\110\088\118\110\100\072\087\080\043\071\117","\053\108\115\083\080\122\118\071\081\100\090\087\080\069\061\061";"\047\105\056\069\057\105\118\055";"\106\066\101\051\072\103\047\102\054\088\071\056\089\100\107\099\047\070\088\061","\109\066\115\086\057\069\061\061","\109\066\115\048\053\100\107\090\077\043\061\061","\109\066\115\098\080\105\099\061"}for T,K in ipairs({{1;7};{1;5};{6;7}})do while K[1]<K[2]do S[K[1]],S[K[2]],K[1],K[2]=S[K[2]],S[K[1]],K[1]+1,K[2]-1 end end local function T(T)return S[T+27355]end do local T=string.char local K={P=25,o=15,["\055"]=43,I=34,j=19;S=33;["\057"]=24;t=11,U=58;["\049"]=42,B=53,c=56,h=62,["\051"]=9,Y=26;R=59,z=7,p=18;["\047"]=29,e=5,K=45,["\054"]=20;J=60,Q=28,D=63;b=44;F=55;G=52,A=16;["\050"]=12,N=50;["\048"]=41,s=61,m=23,k=17,L=4,y=54;w=32;q=49,X=36,T=51;n=2,x=47,u=10,C=1;i=22;H=21;Z=37,v=13;l=6,["\052"]=31,["\053"]=27,V=39;W=46,E=48;M=30;a=8;g=35;r=3,d=38;O=14;["\043"]=0;f=40;["\056"]=57}local h=table.concat local z=S local e=math.floor local Q=table.insert local p=string.sub local G=type local w=string.len for S=1,#z,1 do local H=z[S]if G(H)=="\115\116\114\105\110\103"then local G=w(H)local b={}local x=1 local f=0 local q=0 while x<=G do local S=p(H,x,x)local h=K[S]if h then f=f+h*64^(3-q)q=q+1 if q==4 then q=0 local S=e(f/65536)local K=e((f%65536)/256)local h=f%256 Q(b,T(S,K,h))f=0 end elseif S=="\061"then Q(b,T(e(f/65536)))if x>=G or p(H,x+1,x+1)~="\061"then Q(b,T(e((f%65536)/256)))end break end x=x+1 end z[S]=h(b)end end end return(function(S,h,z,e,Q,p,G,f,d,q,w,x,H,K,b,C)b,H,q,x,K,w,d,C,f=function()x=1+x H[x]=1 return x end,{},function(S)local T,K=1,S[1]while K do H[K],T=H[K]-1,1+T if 0==H[K]then H[K],w[K]=nil,nil end K=S[T]end end,0,function(K,z,e,Q)local G,H,w while K do H=T(-27349)G=T(-27348)w=z K=S[G]G=K(H)K=G(h(w))K=S[T(-27353)]G={}end K=#Q return h(G)end,{},function(S)H[S]=H[S]-1 if 0==H[S]then H[S],w[S]=nil,nil end end,function(S,T)local h=f(T)local z=function(...)return K(S,{...},T,h)end return z end,function(S)for T=1,#S,1 do H[S[T]]=H[S[T]]+1 end if z then local K=z(true)local h=Q(K)h[T(-27351)],h[T(-27352)],h[T(-27350)]=S,q,function()return-2812850 end return K else return e({},{[T(-27352)]=q,[T(-27351)]=S,[T(-27350)]=function()return-2812850 end})end end return(C(1855815,{}))(h(G))end)(getfenv and getfenv()or _ENV,unpack or table[T(-27354)],newproxy,setmetatable,getmetatable,select,{...})end)(...)