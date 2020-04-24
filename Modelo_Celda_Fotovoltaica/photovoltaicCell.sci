function [V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,T,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
  h=(Vf-Vi)/N;
  Tref=273+25;
  Tc=273+T;
  Irs=Isc/(exp(q*Voc/(Ns*k*A*Tc))-1);
  Is=Irs*(Tc/Tref)^3*exp(q*Eg*(1/Tref-1/Tc)/(k*A));
  Iph=(Isc+Ki*(Tc-Tref))*G;
for i = 1:N  //Seccion Modificable para matriz
     
      V(i+1)=Vi+i*h;
      Ivtg(i+1)=Np*Iph-Np*Is*(exp(q*V(i+1)/(Ns*k*Tc*A))-1);
      
      if (Ivtg(i+1)<0) then 
          Ivtg(i+1)=0;
      end
      
      P(i+1)=V(i+1)*Ivtg(i+1);
     
    disp([i,V(i+1),Ivtg(i+1)])
end 
endfunction
