% Cargar la señal desde Simulink
datos = out.SoCSC.signals.values;

% Calcular valores clave
min_val = min(datos)    % Valor mínimo
max_val = max(datos)     % Valor máximo
mean_val = mean(datos)   % Media
std_dev = std(datos)     % Desviación estándar

% Rango límite (mínimo - máximo)
rango_limite = [min_val, max_val]

% Rango de uso típico (percentil 10-90)
rango_uso_tipico = [prctile(datos, 10), prctile(datos, 90)]

% Rango normal (media ± 2 desviaciones estándar)
rango_normal = [mean_val - 2*std_dev, mean_val + 2*std_dev]

