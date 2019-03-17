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
function dy = lorenz(t,y,sigma,beta,rho)

dy = [
    sigma*(y(2) - y(1));
    y(1)*(rho - y(3)) - y(2);
    y(1)*y(2) - beta*y(3);
    ];

% uncomment the line below to apply the alternative interval extension
%function dy = lorenz(t,y,sigma,beta,rho)
%
%dy = [
%sigma*y(2)-sigma*y(1);
%y(1)*rho-y(1)*y(3)-y(2);
%y(1)*y(2)-beta*y(3);
%];
