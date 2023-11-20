f = @(t, x) log(t^2).*x;

num_pasos = [10, 25, 50, 100];
x_ini = 1;
t_ini = 1;
t_fin = 2;

% [x, t] = euler_mejorado(f, x_ini, t_ini, t_fin, 3); 

hold on
for i=1:length(num_pasos)
    [x, t] = euler_mejorado(f, x_ini, t_ini, t_fin, num_pasos(i)); 
    plot(t, x, DisplayName=sprintf("$x_{%d}$", num_pasos(i)))
end
grid on
legend(Interpreter='latex')
hold off

function [x, t] = euler_mejorado(f, x0, a, b, n)
    h = (b-a)/n;
    x = x0;
    t = a:h:b;
    for i=1:n
        k1 = f(t(i), x(i));
        k2 = f(t(i)+h, x(i)+h*k1);
        x(i+1) = x(i)+h/2*(k1+k2);
    end
end