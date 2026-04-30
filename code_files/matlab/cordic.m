data = load('fft_output.txt');

real_part = data(:,1);
imag_part = data(:,2);

fft_complex = real_part + 1j*imag_part;

magnitude = abs(fft_complex);

stem(magnitude);
title('FFT Magnitude (CORDIC-based)');
xlabel('Frequency Bin');
ylabel('Amplitude');
grid on;