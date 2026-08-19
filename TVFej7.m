pkg load control

G1=tf(5,[1 2]);% Defino funcion de transferencia
dcgain(G1)
figure; step(G1); grid % genera automáticamente la respuesta al escalón unitario y Agrega líneas de retícula

G2=zpk([],[-2 -3],1);% se define poniendo los ceros, polos y ganancia k
dcgain(G2)
figure; step(G2); grid

G3=tf(2,[1 2]);
dcgain(G3)
figure; step(G3); grid

G4=5*tf([1 1], [1 1 2]);
dcgain(G4)
figure; step(G4); grid

G5=zpk([-2], [-3 -4], 5);
dcgain(G5)
figure; step(G5);

G6=tf(5,[1 0]);
dcgain(G6)
figure; step(G6); grid

G7=zpk([-2], [0 -4], 12);
dcgain(G7)
figure; step(G7); grid

G8=tf([1 0], [1 40]);
dcgain(G8)
figure; step(G8); grid
