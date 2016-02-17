% load('testfile.mat')
% y1 = WformOut;
% y2 = WformOut2;


close all
load('30-8pumpGndBodyGndAxialO1C1.mat')
y1 = WformOut;
f = Freq_Vec;

x = (1:size(WformOut,1));
figure
plot(f/1000,y1)
%axis([0 1e6 0 10])

load('30-8pumpGndBodyGndAxialO1C2.mat')
y2 = WformOut;
f = Freq_Vec;

x = (1:size(WformOut,1));
figure
plot(f/1000,y2)
%axis([0 1e6 0 10])

load('30-8pumpGndBodyGndAxialO1C3.mat')
y3 = WformOut;
f = Freq_Vec;

x = (1:size(WformOut,1));
figure
plot(f/1000,y3)
%axis([0 1e6 0 10])

load('30-8pumpGndBodyGndAxialO1C4.mat')
y4 = WformOut;
f = Freq_Vec;
figure
x = (1:size(WformOut,1));
plot(f/1000,y4)
%axis([0 1e6 0 10])