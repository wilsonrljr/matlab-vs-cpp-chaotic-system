%{
Article: Confiabilidade numérica na simulação de Sistemas
Caóticos utilizando Matlab e C++

Uso: executa o método de Runge Kutta de quarta ordem

Other m-files required: none
Subfunctions: none
MAT-files required: none
See also: rk4.m, lorenz.m, Lplot.m, executar.m
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

function yout = rk4(fun, dt, t0, y0)

f1 = fun(t0, y0);
f2 = fun(t0 + dt/2, y0 + (dt/2)*f1);
f3 = fun(t0 + dt/2, y0 + (dt/2)*f2);
f4 = fun(t0 + dt, y0 + dt*f3);

yout = y0 + (dt/6)*(f1 + 2*f2 + 2*f3 + f4);
