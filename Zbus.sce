/*
---------------------------------------------------------------------------------
------------------------GENERADOR DE Zbus----------------------------------------
---------------------------------------------------------------------------------
--Codigo fuente en Scilab para obtener Zbus de una red cerrada o abierda---------
--
*/
clc;
clear;

/*
RX=[
1 0 0 0.003075;
1 2 1 0.06;
1 3 2 0.06;
1 4 0 0.06;
2 5 3 2.00;
2 0 1 0.4933;
3 0 0 0.4933;
4 0 0 0.4933]
*/
format("v",5)


RX=[0 1 0 1.25;
1 2 0 0.25;
2 3 0 0.40;
0 3 0 1.25;
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
 
for i=1:max(size(Zbus))
    for j=1:max(size(Zbus))
            Zang(i,j)=atan(imag(Zbus(i,j))/real(Zbus(i,j)))*(180/%pi)   
    end
end          
disp("[1]:::::::[Zbus]:::::::")
disp((Zbus));
disp("[2]::::::[AbsZbus]:::::::")
disp(abs(Zbus));
disp("[3]:::::::[Zbus Angulos]:::::::")
disp((Zang));
disp("[4]::::::[Ybus]:::::::")
disp(inv(Zbus));
disp("[5]::::::[AbsYbus]:::::::")
disp(abs(inv(Zbus)));          
                 
