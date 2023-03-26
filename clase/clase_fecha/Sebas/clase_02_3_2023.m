% X ~ U[a,b]
a = 1;
b = 2;
m_U = unifrnd(1,2,10);
X = a + (b-a)*m_U;

% hallar persentiles apartir de tabla de frecunecias
% calcular el alpha porsiento de los datos
% identificar la clase conde cae alpha*n
% P_alpha = L + k * (j / n)
% L: Limite inferior de la clase
% k: longitud de la clase
% n: frecuncia absoluta
% j: diferencia entre la frecuncia absoluta acumulada entre la clase n-1 y la clase n

