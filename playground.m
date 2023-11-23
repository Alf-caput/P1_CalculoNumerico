syms x(t) t
d1x = diff(x, t, 1);
ode = d1x == x + t
cond = x(0) == 1
xsol = dsolve(ode, cond)

a = 0;
b = 2;
n = 10;
i = 3;

h = (b-a)/n;

d2x = diff(d1x, t, 1);
d2xsol = subs(d2x, x, xsol);

f_target = abs(d2xsol); % f_target = |x''| siendo x la solución real
d1f_target = diff(f_target, t, 1);
f_target_candidatos = double(solve(d1f_target == 0));

t_anterior = h*(i-1);
t_siguiente = h*i;

f_target_anterior = double(subs(f_target, t, t_anterior));
f_target_siguiente = double(subs(f_target, t, t_siguiente));

f_target_extremos = double(subs(xsol, t, [t_anterior, t_siguiente]));
f_target = [f_target_candidatos, f_target_extremos];

error_local_euler_paso_i = 1/2 * max(f_target) * h^2
% f = @(t, x) log(t^2).*x;
% 
% num_pasos = [10, 25, 50, 100];
% x_ini = 1;
% t_ini = 1;
% t_fin = 2;
% 
% hold on
% for i=1:length(num_pasos)
%     [x, t] = euler_mejorado(f, x_ini, t_ini, t_fin, num_pasos(i)); 
%     plot(t, x, DisplayName=sprintf("$x_{%d}$", num_pasos(i)))
% end
% grid on
% legend(Interpreter='latex')
% hold off
% 
% function [x, t] = euler_mejorado(f, x0, a, b, n)
%     h = (b-a)/n;
%     x = zeros(1, n+1);
%     x(1) = x0;
%     t = a:h:b;
%     for i=1:n
%         k1 = f(t(i), x(i));
%         k2 = f(t(i)+h, x(i)+h*k1);
%         x(i+1) = x(i)+h/2*(k1+k2);
%     end
% end