function y = RungeKutta(a,b,f,n,y0)

dt = (b - a)/n;
f = inline(f, 't', 'y');
t = a + dt*[0:n];
y = zeros(size(t));
y(1) = y0;
for j = [1:n];
f1 = f(t(j),y(j));
f2 = f((t(j)+dt/2), y(j) + (dt/2)*f1);
f3 = f((t(j)+dt/2), y(j) + (dt/2)*f2);
f4 = f((t(j)+dt), y(j) + dt*f3);

y(j+1) = y(j)+(dt/6)*(f1+2*f2+2*f3+f4);
end

figure
plot(t,y,'color','r');
