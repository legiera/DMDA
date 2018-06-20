%%lab RANSAC 17.01.2018
%problemy
% metoda niezbiezn - prametry xle dobrane, albo K zwiekszamy to moze pomoc
%losowanie punktow do modelu - nie wszystkie tak samo, okno gaussa i
%prawdopodobienstwa dla losowania 
%liczenie odleglosci miedzy punktem, a prosta, w ktorej osi x czy y, ma to
%znaczenie
%dane syntetyczne i dane EMG - czestotliwosc -150Hz. 
%ginput - szczyty w kolejnych punktach 
%dopasowanie prostych do faz wolnych. 
clear all

load data1.mat;
load data2.mat;

%OLS 
y = [data1(2,:)]';
M=floor((rand*length(y)));
tau=10;
K=0.2;
A=data1(2,:);
%figure, plot(data1(1,:),data1(2,:), 'mo');

%figure, plot(data2(1,:),data2(2,:), 'mo');

X= [ones(1,length(data1(1,:)));data1(1,:)]';
    
beta_prim = inv(X'*X)*X'*y;

for i=1:length(y)
    prosta(i)=beta_prim(1) + beta_prim(2)*data2(1,i);

end

%RANSAC

iter=100;


for i=1:iter
    
    M1=floor((rand*length(y)));
    M2=floor((rand*length(y)));
    M=[M1, M2]
    
    X1=[1;data1(1,M1)];
    X2=[1;data1(1,M2)];
    X=[X1, X2];
  
end





















