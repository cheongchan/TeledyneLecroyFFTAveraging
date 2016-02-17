clear all
Averaging = 30;
Test_File='GndBody10VAxial';

counter1 = 1;
maxAverageNumber1 = Averaging;
filename1 = [num2str(Averaging) '-8pump' Test_File 'O1C1.mat'];
save('averagingTestConfig1.mat')

counter2 = 1;
maxAverageNumber2 = Averaging;
filename2 = [num2str(Averaging) '-8pump' Test_File 'O1C2.mat'];
save('averagingTestConfig2.mat')

counter3 = 1;
maxAverageNumber3 = Averaging;
filename3 = [num2str(Averaging) '-8pump' Test_File 'O1C3.mat'];
save('averagingTestConfig3.mat')

counter4 = 1;
maxAverageNumber4 = Averaging;
filename4 = [num2str(Averaging) '-8pump' Test_File 'O1C4.mat'];
save('averagingTestConfig4.mat')

clear all