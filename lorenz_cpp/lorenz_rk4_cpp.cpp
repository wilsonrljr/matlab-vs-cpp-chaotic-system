/*
 Article: Confiabilidade numérica na simulação de Sistemas
Caóticos utilizando Matlab e C++

% Article: Confiabilidade numérica na simulação de Sistemas
% Caóticos utilizando Matlab e C++

% Uso: Essa rotina gera os dados do modelo de Lorenz utilizando Runge Kutta de 4 ordem. Ver também: Lplot.m

% Other m-files required: rk4.m, rk5.m, lorenz.m
% Subfunctions: none
% MAT-files required: none
% See also: rk4.m, rk5.m, lorenz.m, Lplot.m
% Authors: Wilson Rocha Lacerda Junior, Maurício Silva Barbosa,
% Samir Angelo Milani Martins e Erivelton Geraldo Nepomuceno.
% Website: http://www.ufsj.edu.br/gcom
% Last revision: Jun 2017

% Please send suggestions for improvement of the above code
% to Wilson Rocha at this email address: wilsonrljr@outlook.com

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

------------- BEGIN CODE --------------*/


# include <cstdlib>
# include <iostream>
# include <fstream>
# include <iomanip>
# include <cmath>
# include <ctime>

using namespace std;

int main ( );
double *lorenz_rhs ( double t, int m, double x[] );
double *r8vec_linspace_new ( int n, double a, double b );
double *rk4vec ( double t0, int n, double u0[], double dt, 
  double *f ( double t, int n, double u[] ) );
void timestamp ( );

//****************************************************************************80

int main ( )

{
  string command_filename = "lorenz_ode_commands.txt";
  ofstream command_unit;
  string data_filename = "lorenz_ode_data.txt";
  ofstream data_unit;
  double dt;
  int i;
  int j;
  int m = 3;
  int n = 6250000;
  double *t;
  double t_final;
  double *x;
  double *xnew;

  timestamp ( );
  cout << "\n";
  cout << "LORENZ_ODE\n";
  cout << "  C++ version\n";
  cout << "  Computa solução das eq de Lorenz.\n";
  cout << "  Arquivo de dados.\n";
//
//  Dados
//
  t_final = 1000.0;
  dt = t_final / ( double ) ( n );
//
//  Guarda as condições iniciais na entrada 0.
//
  t = r8vec_linspace_new ( n + 1, 0.0, t_final );
  x = new double[m*(n+1)];
  x[0+0*m] = 8.0;
  x[0+1*m] = 1.0;
  x[0+2*m] = 1.0;
//
// Calcula a solução em um dado intervalo de tempo.
//
  for ( j = 0; j < n; j++ )
  {
    xnew = rk4vec ( t[j], m, x+j*m, dt, lorenz_rhs );
    for ( i = 0; i < m; i++ )
    {
      x[i+(j+1)*m] = xnew[i];
    }
    delete [] xnew; 
  }
//
//  Cria arquivo de dados para plotar os gráficos.
//
  data_unit.open ( data_filename.c_str ( ) );
  for ( j = 0; j <= n; j = j + 50 )
  {
    data_unit << "  " << setw(14) << t[j]
              << "  " << setw(14) << x[0+j*m]
              << "  " << setw(14) << x[1+j*m]
              << "  " << setw(14) << x[2+j*m] << "\n";
  }
  data_unit.close ( );
  cout << "  Created data file \"" << data_filename << "\".\n";

  cout << "\n";
  cout << "LORENZ_ODE:\n";
  cout << "  Normal end of execution.\n";
  cout << "\n";
  timestamp ( );

  return 0;
}
//****************************************************************************80

double *lorenz_rhs ( double t, int m, double x[] )

{
  double beta = 8/3;
  double *dxdt;
  double rho = 28.0;
  double sigma = 10.0;

  dxdt = new double[m];

  dxdt[0] = sigma * (x[1] - x[0]);
  dxdt[1] = x[0] * (rho - x[2]) - x[1];
  dxdt[2] = x[0] * x[1] - beta * x[2];

  return dxdt;
}
//****************************************************************************80

double *r8vec_linspace_new ( int n, double a_first, double a_last )


{
  double *a;
  int i;

  a = new double[n];

  if ( n == 1 )
  {
    a[0] = ( a_first + a_last ) / 2.0;
  }
  else
  {
    for ( i = 0; i < n; i++ )
    {
      a[i] = ( ( double ) ( n - 1 - i ) * a_first 
             + ( double ) (         i ) * a_last ) 
             / ( double ) ( n - 1     );
    }
  }
  return a;
}
//****************************************************************************80

double *rk4vec ( double t0, int m, double u0[], double dt, 
  double *f ( double t, int m, double u[] ) )

{
  double *f0;
  double *f1;
  double *f2;
  double *f3;
  int i;
  double t1;
  double t2;
  double t3;
  double *u;
  double *u1;
  double *u2;
  double *u3;
//
//  Get four sample values of the derivative.
//
  f0 = f ( t0, m, u0 );

  t1 = t0 + dt / 2.0;
  u1 = new double[m];
  for ( i = 0; i < m; i++ )
  {
    u1[i] = u0[i] + (dt / 2.0) * f0[i];
  }
  f1 = f ( t1, m, u1 );

  t2 = t0 + dt / 2.0;
  u2 = new double[m];
  for ( i = 0; i < m; i++ )
  {
    u2[i] = u0[i] + (dt / 2.0) * f1[i];
  }
  f2 = f ( t2, m, u2 );

  t3 = t0 + dt;
  u3 = new double[m];
  for ( i = 0; i < m; i++ )
  {
     u3[i] = u0[i] + dt * f2[i];
  }
  f3 = f ( t3, m, u3 );
//
//  Solução final.
//
  u = new double[m];
  for ( i = 0; i < m; i++ )
  {
     u[i] = u0[i] + (dt/6) * (f0[i] + 2.0 * f1[i] + 2.0 * f2[i] + f3[i] );
  }
//
//  Limpar a memória.
//
  delete [] f0;
  delete [] f1;
  delete [] f2;
  delete [] f3;
  delete [] u1;
  delete [] u2;
  delete [] u3;

  return u;
}
//****************************************************************************80

void timestamp ( )

{
# define TIME_SIZE 40

  static char time_buffer[TIME_SIZE];
  const struct std::tm *tm_ptr;
  size_t len;
  std::time_t now;

  now = std::time ( NULL );
  tm_ptr = std::localtime ( &now );

  len = std::strftime ( time_buffer, TIME_SIZE, "%d %B %Y %I:%M:%S %p", tm_ptr );

  std::cout << time_buffer << "\n";

  return;
# undef TIME_SIZE
}
