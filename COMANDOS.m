% === INICIO Y PAQUETES ===
pkg load control; pkg load symbolic % Cargar paquetes obligatorios
clc; clear; close all               % Limpiar consola, variables y figuras

% === CREACIÓN DE FDT ===
G = tf(num, den)                    % FDT por coeficientes: num/den
s = tf('s'); G = 10 / (s^2 + 4*s + 13) % FDT definiendo variable 's'

% === ANÁLISIS DE POLOS Y CEROS ===
p = pole(G)                         % Calcular polos
z = zero(G)                         % Calcular ceros
damp(G)                             % Tabla: Polos, Zeta (zeta), Wn y Tau (tau)
pzmap(G); grid on                   % Graficar mapa de polos y ceros
[wn_vec, zeta_vec] = damp(G);
wn = wn_vec(1);
cita = zeta_vec(1);                 %Guardar Cita y Wn

% === ÁLGEBRA DE BLOQUES ===
G_s = series(G1, G2)                % Serie: G1 * G2
G_p = parallel(G1, G2)              % Paralelo: G1 + G2
G_lc = feedback(G, H)               % Lazo cerrado (realimentación negativa)
G_pos = feedback(G, H, +1)          % Lazo cerrado (realimentación positiva)

% === RESPUESTA TEMPORAL ===
step(G); grid on                    % Graficar respuesta al escalón
impulse(G); grid on                 % Graficar respuesta al impulso
[y, t] = step(G,x)                  % Guardar vectores de respuesta y tiempo
fin=y(end)
lsim(G, u, t)                       % Simular ante entrada arbitraria u(t)

% === OPERACIONES SIMBÓLICAS ===
syms s K w_n zeta t                 % Declarar variables simbólicas
G_sym = K*w_n^2 / (s^2 + 2*zeta*w_n*s + w_n^2) % Expresión simbólica
simplify(G_sym)                     % Simplificar expresión algebraica
subs(G_sym, {K, w_n}, {1, 5})       % Sustituir símbolos por números
ilaplace(Y_s)                       % Transformada Inversa de Laplace -> y(t)
laplace(y_t)                        % Transformada de Laplace -> Y(s)
limit(s*Y_s, s, 0)                  % Teorema del Valor Final (s -> 0)
limit(s*Y_s, s, inf)                % Teorema del Valor Inicial (s -> inf)
