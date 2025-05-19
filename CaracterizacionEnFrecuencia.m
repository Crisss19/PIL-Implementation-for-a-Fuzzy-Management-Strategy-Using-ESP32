clc; clear; close all;

% Obtener el modelo en espacio de estados
[A,B,C,D] = linmod('Challenge2024_R2020b');
System = ss(A,B,C,D);

% Diagrama de Bode
figure;
bode(System);
grid on;
title('Diagrama de Bode');

% Obtener función de transferencia
[b,a] = ss2tf(A,B,C,D);
TF = tf(b,a);
disp('Función de transferencia:');
disp(TF);

% Cálculo de polos y ceros
poles = eig(A);
zeros_tf = zero(TF);

% Mapa de polos y ceros
figure;
pzmap(System);
grid on;
title('Mapa de Polos y Ceros');

% Mostrar polos y ceros en pantalla
digits(20);
disp('Polos del sistema:');
disp(vpa(poles));
disp('Ceros de la función de transferencia:');
disp(vpa(zeros_tf));

% Cálculo de la ganancia estática
K = dcgain(TF);
disp(['Ganancia estática: ', num2str(K)]);

% Cálculo del ancho de banda
[mag, phase, w] = bode(System);
mag_db = 20*log10(squeeze(mag)); % Convertir magnitud a dB
idx = find(mag_db <= -3, 1, 'first'); % Frecuencia de -3 dB
if ~isempty(idx)
    BW = w(idx); % Ancho de banda en rad/s
    disp(['Ancho de banda: ', num2str(BW), ' rad/s']);
else
    disp('No se pudo determinar el ancho de banda.');
end

% Cálculo del margen de ganancia y margen de fase
[GM, PM, Wcg, Wcp] = margin(TF);
disp(['Margen de ganancia: ', num2str(20*log10(GM)), ' dB']);
disp(['Margen de fase: ', num2str(PM), ' grados']);
disp(['Frecuencia de cruce de ganancia: ', num2str(Wcg), ' rad/s']);
disp(['Frecuencia de cruce de fase: ', num2str(Wcp), ' rad/s']);

% Graficar respuesta en frecuencia con márgenes
figure;
margin(TF);
grid on;
title('Márgenes de estabilidad');

