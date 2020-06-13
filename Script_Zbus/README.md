# Matriz de Impedancia, Zbus

Matriz d de Impedancia es una herramienta importante en el análisis de sistema de potencia. 

### Zbus y Ybus en Análisis de Sistemas de Potencia 

1. La inyección de potencia a una barra es análogo a la inyección de corriente. 

2. Se conoce de circuito que esto puede ser simulado por fuentes de corrientes en un nodo. 

3. La inyección de corrientes ya sea positiva (a la barra) o negativa (fuera de la barra). Salvo la corriente que circula por una rama (y entonces esta es una cantidad de rama), una inyección de corriente es una cantidad nodal.

4. La matriz de admitancias, es una herramienta de análisis de redes que ha sido muy usada, relaciona las inyecciones de corrientes a una barra a los voltajes de barra.

5. La matriz de admitancias de barra relaciona las cantidades nodales.

6. Las ramas que conectan los nodos se representas como líneas

7. Todas las ramas son denotadas ya sea por valores de admitancia Y(i,j) por una rama que la conecta i y j, y Y(i) para los elementos shunt de la barra i.

   

   [Referencia]

   > Libro: Power System Analysis, 3era edición, 
   >
   > Autor: William D.Stevenson,Jr.
   >
   > Pag. 301-304

![Zbus](https://i.ibb.co/xfq3Cxz/Zbus.jpg)

```scilab
clc;
clear;

RX=[
1 0 0 1.25;
1 2 0 0.25;
2 3 0 0.40;
3 0 0 1.25;
2 4 0 0.125;
4 3 0 0.2]


x=RX(:,1)
y=RX(:,2)
z=complex(RX(:,3),RX(:,4))
Zbus=[];
Control=[];
for i=1:length(x)
    cx=x(i);
    cy=y(i);
    xymin=min(cx,cy);
    xymax=max(cx,cy);
    nControl=length(find(Control==xymax))
    mControl = length(find(Control==xymin)); 
    [rows coluxymins]=size(Zbus)
    if (xymin==0 & nControl==0)
        Zbus=[Zbus zeros(rows,1); zeros(1,rows) z(i)];
        Control=[Control xymax];
     elseif mControl>0 & nControl==0
         Zbus =[Zbus Zbus(:,xymin); Zbus(xymin,:) Zbus(xymin,xymin)+z(i)];
           Control =[Control xymax];
     else 
         
         if xymin==0 & nControl>0  
         Zbus=[Zbus Zbus(:,xymax); Zbus(xymax,:) Zbus(xymax,xymax)+z(i)];
         Zbn=zeros(rows,rows);
         for r =1: rows
             for t =1: coluxymins
                 Zbn(r,t)=Zbus(r,t)-(Zbus(r,rows+1)*Zbus(rows+1,t))/(Zbus(rows+1,rows+1));
             end
         end
         Zbus = Zbn
         disp(i)
         elseif (mControl>0 & nControl>0)
         Zbus=[Zbus Zbus(:,xymax)-Zbus(:,xymin); Zbus(xymax,:)-Zbus(xymin,:),z(i)+Zbus(xymin,xymax)+Zbus(xymax,xymax)-2*Zbus(xymax,xymin)]
         Zbn=zeros(rows,rows);
         for r =1:rows
             for t=1:coluxymins
                Zbn(r,t)=Zbus(r,t)-(Zbus(r,rows+1)*Zbus(rows+1,t))/(Zbus(rows+1,rows+1));
             end
         end 
         
         Zbus = Zbn;
         
      end
    end
 end   
disp(abs(Zbus));              
      
```



