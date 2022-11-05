% plot(time(1:100),q1a(1:100));
% hold on
x1 = time(1:100);
x2 = time(101:200);
v1 = -0.0057*x1.^2+0.0354*x1+0.0678
v2 = 1.4586*x2.^2-4.0676*x2+2.3841
a1 = -0.0114*x1+0.0354;
a2 = 2.9172*x2-4.0676;
plot(x1,v1,'b',x2,v2,'b');
xlabel("Time (s)");
ylabel("Velocity of Q3 (rad/s)");
title("Velocity of Q3 against time");
hold on

