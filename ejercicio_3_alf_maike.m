% Tercera pregunta.
% Generaliza el código de la segunda pregunta para crear una función del tipo 
% function cuyos inputs sean la función anónima $f$, los extremos del intervalo 
% $[a,b]$ y el número de pasos deseado $n$. Y sus outputs sean una lista de la 
% partición del intervalo y otra de sus respectivas aproximaciones por el método 
% de Euler mejorado junto a su gráfica.
% Solución tercera pregunta:
% *Código:*

%prueba
f = @(t, x) log(t^2).*x;

num_pasos = [10, 25, 50, 100];
x_ini = 1;
t_ini = 1;
t_fin = 2;
n=5;

%plot_euler_mejorado(f, x_ini, t_ini, t_fin, n);




function plot_euler_mejorado(f, x_ini, t_ini, t_fin, n)
    [x, t] = euler_mejorado(f, x_ini, t_ini, t_fin, n); 
    plot(t, x, 'DisplayName', sprintf("$x_1$"), 'LineWidth', 1.5)
    grid on
    legend('Interpreter', 'latex')
   
end

function [x, t] = euler_mejorado(f, x0, a, b, n)
    h = (b - a) / n;
    x = x0;
    t = a:h:b;
    for i = 1:n
        k1 = f(t(i), x(i));
        k2 = f(t(i) + h, x(i) + h * k1);
        x(i + 1) = x(i) + h / 2 * (k1 + k2);
    end
end