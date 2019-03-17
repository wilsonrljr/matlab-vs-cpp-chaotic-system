%{
Article: Confiabilidade numérica na simulação de Sistemas
Caóticos utilizando Matlab e C++

Uso: executa o método de Runge Kutta de quinta ordem

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

function yout = rk5(fun, dt, t0, y0)

f1 = fun(t0, y0);
    f2 = fun(t0 + 0.25*dt, y0 + 0.25*dt*f1);
    f3 = fun((t0 + 0.25*dt), (y0 + 0.125*dt*f1 + 0.125*dt*f2));
    f4 = fun((t0 + 0.5*dt), (y0 - 0.5*f2*dt + f3*dt));
	f5 = fun((t0 + 0.75*dt), (y0 + 0.1875*f1*dt + 0.5625*f4*dt));
	f6 = fun((t0 + dt), (y0 - (3/7)*f1*dt + (2/7)*f2*dt + (12/7)*f3*dt - (12/7)*f4*dt + (8/7)*f5*dt));

  yout = y0 + (1/90)*(7*f1 + 32*f3 + 12*f4 + 32*f5 + 7*f6)*dt;

