%{
Article: Confiabilidade numérica na simulação de Sistemas
Caóticos utilizando Matlab e C++

Uso: simula o mapa logístico. Para plotar os graficos, utilize a rotina Lplot.m 

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

clear
clc

x(1) = 0.8;
y(1) = 0.8;
m = 4;
for k = 1:1:1000
    x(k+1) = m*x(k)*(1-x(k));
    y(k+1) = m*y(k) - m*y(k)*y(k);
end
plot(x)
hold on
plot(y, 'k')
