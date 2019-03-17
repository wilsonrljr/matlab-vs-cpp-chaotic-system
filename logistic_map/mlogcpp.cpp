/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* Article: Confiabilidade numérica na simulação de Sistemas
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

------------- BEGIN CODE -------------- */
 

/*  MAPA LOGISTICO */

#include <stdio.h>
#include <stdlib.h>

FILE *fp;

static char nome[]="mlog1.txt";


int main(void)
{
int k;
float n, mi;
double x;

    fp = fopen(nome,"w");
    // definindo os valores iniciais de mi, x e n
    mi = 4.0;   
    x = 0.8; 
    n = 1.0;
    for(k=1; k <= 200; k++)
    {
        n = n + 1.0;
        x = mi*x*(1.0 - x);
       // x = mi*x-mi*x*x;
        fprintf(fp, "%.1f \t %lf\n", n, x);
    }
    fclose(fp);

    return 0;
}
