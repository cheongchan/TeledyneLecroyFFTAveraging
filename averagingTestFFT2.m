load('C:\Users\LeCroyUser\Documents\Jon Thruster Test Code\averagingTestConfig2.mat', 'counter2', 'maxAverageNumber2', 'filename2')
if (counter2 == 1)
    
    L = size(WformIn1,1);
    Fs=1/horPerStep;
    NFFT=2^nextpow2(L);
    
    WformIn1_mean=mean(WformIn1);
    %WformIn2_mean=mean(WformIn2);
    
    WformIn1_FFT=fft(WformIn1-WformIn1_mean,NFFT);
    %WformIn2_FFT=fft(WformIn2-WformIn2_mean,NFFT);
    
    Wform1_PSD=(1/(L*Fs))*abs(WformIn1_FFT(1:NFFT/2+1)).^2;
    %Wform2_PSD=(1/(L*Fs))*abs(WformIn2_FFT(1:NFFT/2+1)).^2;
    
    WformOut = 1/(maxAverageNumber2)*Wform1_PSD;
    %WformOut2 = 1/(maxAverageNumber2)*Wform2_PSD;
    
    Freq_Vec=Fs/2*linspace(0,1,NFFT/2+1);
    save('C:\Users\LeCroyUser\Documents\Jon Thruster Test Code\testfile2.mat','WformOut', 'horPerStep', 'Freq_Vec')
    %increment counter
    counter2 = counter2 + 1;
    save('C:\Users\LeCroyUser\Documents\Jon Thruster Test Code\averagingTestConfig2.mat', 'counter2', 'maxAverageNumber2', 'filename2')
    Time_vec=0;
    
    for i=2:L
        Time_vec(i)=i*horPerStep;
    end
    
    save(strcat('C:\Users\LeCroyUser\Documents\Jon Thruster Test Code\','RawWave',filename2),'Time_vec', 'WformIn1');
    
elseif ((maxAverageNumber2 > counter2) && (counter2 > 1))
    load('C:\Users\LeCroyUser\Documents\Jon Thruster Test Code\testfile2.mat','WformOut', 'horPerStep', 'Freq_Vec')
    L = size(WformIn1,1);
    Fs=1/horPerStep;
    NFFT=2^nextpow2(L);
    
    WformIn1_mean=mean(WformIn1);
    % WformIn2_mean=mean(WformIn2);
    
    WformIn1_FFT=fft(WformIn1-WformIn1_mean,NFFT);
    %WformIn2_FFT=fft(WformIn2-WformIn2_mean,NFFT);
    
    Wform1_PSD=(1/(L*Fs))*abs(WformIn1_FFT(1:NFFT/2+1)).^2;
    %Wform2_PSD=(1/(L*Fs))*abs(WformIn2_FFT(1:NFFT/2+1)).^2;
    
    WformOut = 1/(maxAverageNumber2)*Wform1_PSD + WformOut;
    %WformOut2 = 1/(maxAverageNumber2)*Wform2_PSD + WformOut2;
    
    %Adjust output waveform units and scaling with the following
    %variables.  Uncomment and calculate as needed
    %verUnits='V';horUnits='S';
    %verStart=-0.05;verStop=0.05;horOffset=0;horPerStep=1.0e-10;
    
    %increment counter
    counter2 = counter2 + 1;
    save('C:\Users\LeCroyUser\Documents\Jon Thruster Test Code\averagingTestConfig2.mat', 'counter2', 'maxAverageNumber2', 'filename2')
    save('C:\Users\LeCroyUser\Documents\Jon Thruster Test Code\testfile2.mat', 'WformOut', 'horPerStep', 'Freq_Vec')
elseif (maxAverageNumber2 == counter2)
    load('C:\Users\LeCroyUser\Documents\Jon Thruster Test Code\testfile2.mat','WformOut', 'horPerStep', 'Freq_Vec')
    L = size(WformIn1,1);
    Fs=1/horPerStep;
    NFFT = 2^nextpow2(L);
    
    WformIn1_mean= mean(WformIn1);
    %WformIn2_mean=mean(WformIn2);
    
    WformIn1_FFT=fft(WformIn1-WformIn1_mean,NFFT);
    %WformIn2_FFT=fft(WformIn2-WformIn2_mean,NFFT);
    
    Wform1_PSD=(1/(L*Fs))*abs(WformIn1_FFT(1:NFFT/2+1)).^2;
    %Wform2_PSD=(1/(L*Fs))*abs(WformIn2_FFT(1:NFFT/2+1)).^2;
    
    WformOut = 1/(maxAverageNumber2)*Wform1_PSD + WformOut;
    %WformOut2 = 1/(maxAverageNumber2)*Wform2_PSD + WformOut2;
    
    timestamp = datestr(now,'mmmm dd, yyyy HH:MM:SS.FFF AM');
    %increment counter
    counter2 = counter2 + 1;
    save('C:\Users\LeCroyUser\Documents\Jon Thruster Test Code\averagingTestConfig2.mat', 'counter2', 'maxAverageNumber2','filename2')
    save(strcat('C:\Users\LeCroyUser\Documents\Jon Thruster Test Code\',filename2), 'WformOut', 'horPerStep', 'Freq_Vec', 'timestamp')
    
else
end
