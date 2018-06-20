clear all
close all
clc

load('data1.mat')
load('data2.mat')




%% data1
figure, plot(data1(1,:),data1(2,:), 'mo');
y = [data1(2,:)]';
% K = 20;
% X = [];
X= [ones(1,length(data1(1,:)));data1(1,:)]';
beta_prim = inv(X'*X)*X'*y;
for i=1:length(y)
    y_prosta(i)=beta_prim(1) + beta_prim(2)*data1(1,i);
end
hold on
plot(data1(1,:),y_prosta,'g');


%% data2
figure, plot(data2(1,:),data2(2,:), 'mo');
y = [data2(2,:)]';
% K = 20;
% X = [];
X= [ones(1,length(data2(1,:)));data2(1,:)]';
beta_prim = inv(X'*X)*X'*y;
for i=1:length(y)
    y_prosta(i)=beta_prim(1) + beta_prim(2)*data2(1,i);

end
hold on
plot(data2(1,:),y_prosta,'g');

%% RANSAC
M = floor(rand*length(y));
tau = 10;
kappa = 0.5;

figure, plot(data2(1,M),data2(2,M), 'mo');
y = [data2(2,M)]';
% K = 20;
% X = [];
X= [ones(1,length(data2(1,M)));data2(1,M)]';
beta_prim = inv(X'*X)*X'*y;
for i=1:length(y)
    y_prosta(i)=beta_prim(1) + beta_prim(2)*data2(1,i);

end
hold on
plot(data2(1,M),y_prosta,'g');
