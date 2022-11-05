% plot(time(1:100),q1a(1:100));
% hold on
x1 = time(1:100);
x2 = time(101:200);
v1 = -5.5023*x1.^2+5.5280*x1-0.0539
v2 = -1.5624*x2.^2+4.7596*x2-3.2332
a1 = -11.0046*x1+5.5280;
a2 = -3.1248*x2+4.7596;
plot(x1,a1,'b',x2,a2,'b');;
xlabel("Time (s)");
ylabel("Acceleration of D2 (m/s2)");
title("Acceleration of D2 against time");
hold on

