# Modelo Panel Solar RSM120-6-340M

​	El modelado de un panel fotovoltaico comercial se realiza en estas simulaciones. Es posible variar la temperatura y el nivel de radiación.

​	La corriente del panel solar a diferentes tipos de temperaturas y radiación. 

<img src="https://i.ibb.co/51w12V3/01-data.jpg" alt="GitHub Logo"  />

   La potencia del panel solar  a diferentes tipos de temperaturas y radiación.

![](https://i.ibb.co/5TfWwsY/02-data.jpg)




##  Archivos [Modelo Panel Fotovoltaico]
1. star.sce
    * attributes.sci
    * photovoltaicCell.sci 


##  Inicio [star.sce]

```scilab
getd .;

Vi=0;
Vf=45;


G=1.0;
Ta=25;
[V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,Ta,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
I(:,1)=Ivtg
W(:,1)=P

G=0.8;
Ta=25;
[V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,Ta,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
I(:,2)=Ivtg
W(:,2)=P

G=0.6;
Ta=25;
[V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,Ta,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
I(:,3)=Ivtg
W(:,3)=P

G=0.4;
Ta=25;
[V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,Ta,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
I(:,4)=Ivtg
W(:,4)=P

G=0.2;
Ta=25;
[V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,Ta,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
I(:,5)=Ivtg
W(:,5)=P

G=0.1;
Ta=25;
[V,Ivtg,P]=photovoltaicCell(Vi,Vf,N,Ta,G,Voc,Isc,k,q,Ns,Np,A,Ki,Eg)  
I(:,6)=Ivtg
W(:,6)=P

//.....Gráfico de Corriente del panel solar a distintos tipos niveles de irradiancia....//
scf(1)
plot(V,[I(:,1),I(:,2),I(:,3),I(:,4),I(:,5),I(:,6)])
legend('T=25 C 1000 W/m²','T=25 C 800 W/m²','T=25 C 600 W/m²','T=25 C 400 W/m²','T=25 C 200 W/m²','T=25 C 100 W/m²')
xlabel('Tension [V]','fontsize',2)
ylabel('Corriente [A]','fontsize',2)
title('Corriente a Diferentes Irrradiancias W/m² [Celda Solar RSM120-6-340M]','fontsize',2)
xgrid
filename='1-Corriente Panel Solar a Diferentes Temperaturas Celda Solar y Niveles de Irradiancia RSM120-6-340M';
xs2pdf(1,filename);
xs2pdf(gcf(),filename);

//.....Gráfico de Potencia en panel solar a distintos tipos niveles de irradiancia....//
scf(2)
plot(V,[W(:,1),W(:,2),W(:,3),W(:,4),W(:,5),W(:,6)])
legend('T=25 C 1000 W/m²','T=25 C 800 W/m²','T=25 C 600 W/m²','T=25 C 400 W/m²','T=25 C 200 W/m²','T=25 C 100 W/m²')
xlabel('Tension [V]','fontsize',2)
ylabel('Potencia [W]','fontsize',2)
title('Potencia a Diferentes Irradiancias W/m² [Celda Solar e Irrandicia RSM120-6-340M] ','fontsize',2)
xgrid
filename='2-Potencia Panel Solar a Diferentes Temperaturas Celda Solar e Irradiancia RSM120-6-340M';
xs2pdf(2,filename);
xs2pdf(gcf(),filename);



```



