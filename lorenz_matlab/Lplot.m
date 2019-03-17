%{
Article: Confiabilidade numérica na simulação de Sistemas
Caóticos utilizando Matlab e C++

Uso: %arquivo para plotar a evolução do errro relativo das pseudo-órbitas 

Other m-files required: rk4.m, rk5.m, lorenz.m, executar.m
Subfunctions: none
See also: rk4.m, rk5.m, lorenz.m, Lplot.m
Authors: Wilson Rocha Lacerda Junior, Maurício Silva Barbosa,
Samir Angelo Milani Martins e Erivelton Geraldo Nepomuceno.
Website: http://www.ufsj.edu.br/gcom
Last revision: Jun 2017

Please send suggestions for improvement of the above code
to Wilson Rocha at this email address: wilsonrljr@outlook.com

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

------------- BEGIN CODE --------------
%}

clear all; 
clc; 
close all;


% carregar os arquivos das duas pseudo-órbitas
x = load('leqdot_0.008');
y = load('loridot_0.008');

%x = load('lnet1.txt');
%y = load('lnet2.txt');
%x = x(:, 2);
%y = y(:, 2);

% define a tolerância máxima
er = 0.0001;
for k = 1:length(x)
    %evolução do erro relativo como proposto no artigo    
    erm(k) = (abs(x(k)-y(k)))/(abs(x(k)+y(k)));
end

maxm = min(find(erm>er));
teste = ones(length(erm), 1)*er;
i = length(x);

figure(1)
clf
plot(x, '-k')
hold on
plot(y, '--k')
xlabel('n')
ylabel('G(X_n), H(X_n)')

figure(2)
semilogy(1: i, erm(1: i), 'o-k')
hold on
semilogy(1: i, teste(1: i))

% x = load('lnet1.txt');
% y = load('lnet2.txt');
% x = x(:, 2);
% y = y(:, 2);
% er = 0.0001;

ylabel('log_{10}(\epsilon_{\alpha,n})')
xlabel('n')
