# Modelo Celda Fotovoltaica

​	El modelado de un panel fotovoltaico comercial se realiza en estas simulaciones. Es posible variar la temperatura y el nivel de radiación.

​	La corriente del panel solar 

![GitHub Logo](https://i.ibb.co/BLxdz1f/01.jpg)

   La potencia del panel solar 

![](https://i.ibb.co/Kj4c1yC/02.jpg)




##  Archivos [Modelo Panel Fotovoltaico]
1. star.sce
    * attributes.sci
    * photovoltaicCell.sci 


##  Inicio [star.sce]

```scilab
tic
getd .;
Vi=0;
Vf=50; 
G=0.5;   // Nivel de R. de : 500 W/m²
Ta=20;  //  Temperatura ambiente : 20 C
[V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,Ta,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
I(:,1)=Ivtg
W(:,1)=P


G=0.75;
Ta=16;
[V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,Ta,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
I(:,2)=Ivtg
W(:,2)=P

G=1.0;
Ta=26;
[V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,Ta,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
I(:,3)=Ivtg
W(:,3)=P

G=0.8;
Ta=18;
[V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,Ta,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
I(:,4)=Ivtg
W(:,4)=P

G=0.75;
Ta=15;
[V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,Ta,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
I(:,5)=Ivtg
W(:,5)=P

G=0.75;
Ta=12;
[V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,Ta,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
I(:,6)=Ivtg
W(:,6)=P
toc
figure(1)
plot(V,[I(:,1),I(:,2),I(:,3),I(:,4),I(:,5),I(:,6)])
legend('T=20 C 500 W/m²','T=16 C 750 W/m²','T=26 C 1000 W/m²','T=18 C 800 W/m²','T=15 C 750 W/m²','T=12 C 750 W/m²')
xlabel('Tension [V]','fontsize',2)
ylabel('Corriente [A]','fontsize',2)
title('Diferentes Temperaturas [Celda Solar RSM120-6-340M]','fontsize',2)
xgrid

figure(2)
plot(V,[W(:,1),W(:,2),W(:,3),W(:,4),W(:,5),W(:,6)])
legend('T=20 C 500 W/m²','T=16 C 750 W/m²','T=26 C 1000 W/m²','T=18 C 800 W/m²','T=15 C 750 W/m²','T=12 C 750 W/m²')
xlabel('Tension [V]','fontsize',2)
ylabel('Corriente [A]','fontsize',2)
title('Diferentes Temperaturas [Celda Solar RSM120-6-340M] ','fontsize',2)
xgrid


```



