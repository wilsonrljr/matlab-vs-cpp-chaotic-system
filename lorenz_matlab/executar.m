%{
Article: Confiabilidade numérica na simulação de Sistemas
Caóticos utilizando Matlab e C++

Uso: Essa rotina gera os dados do modelo de Lorenz. Ver também: Lplot.m

Other m-files required: rk4.m, rk5.m, lorenz.m
Subfunctions: none
MAT-files required: none
See also: rk4.m, rk5.m, lorenz.m, Lplot.m
Authors: Wilson Rocha Lacerda Junior, Maurício Silva Barbosa,
Samir Angelo Milani Martins e Erivelton Geraldo Nepomuceno.
Website: http://www.ufsj.edu.br/gcom
Last revision: Jun 2017

Please send suggestions for improvement of the above code
to Wilson Rocha at this email address: wilsonrljr@outlook.com

------------- BEGIN CODE --------------

References: 
----------- 

@article{junior2017confiabilidade,
  title={Confiabilidade num{\'e}rica na simula{\c{c}}ao de Sistemas Ca{\'o}ticos utilizando Matlab e C+},
  author={Junior, Wilson Rocha Lacerda and Barbosa, Maur{\i}cio Silva and Nepomuceno, Erivelton Geraldo and Martins, Samir Angelo Milani},
  journal={Revista de Engenharias da Faculdade Salesiana},
  number={6},
  pages={2--9},
  year={2017}
}
%}

tic
for g = 0.008 %define passo de integração

% Parametros do modelo de Lorenz
sigma = 10;
beta = 8/3;
rho = 28;

% Condições iniciais
y0 = [8; 1; 1];

dt = g; %step size
int = [0 : dt : 1000]; 

Y(:, 1) = y0;
yin = y0;

%solução utilizando rk4
%defina qual extensão matemática será utilizada no arquivo lorenz.m
for i = 1:length(int)
    tempo = i*dt;
    
    %para utilizar o rk5, altere a linha a seguir para "yout=rk5(..."
    yout = rk4(@(t, y)lorenz(t, y, sigma, beta, rho), dt, tempo, yin);
    Y = [Y yout];
    yin = yout;
end
%plot3(Y(1, :), Y(2, :), Y(3, :), 'b')

%salvar os dados para o plot 
data = Y(1, :); 
BaseName = 'loridot_';
FileName = [BaseName, num2str(g)];
save(FileName, 'data', '-ascii') % for variable X
clear; 
close all; 
clc;
end
toc

