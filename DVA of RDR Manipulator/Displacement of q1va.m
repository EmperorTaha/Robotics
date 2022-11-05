% plot(time(1:100),q1a(1:100));
% hold on
x1 = time(1:100);
x2 = time(101:200);
v1 = 0.0057*x1.^2+0.0354*x1-0.028
v2 = -1.5159*x2.^2+4.2712*x2-2.5556
a1 = 0.0114*x1+0.0354;
a2 = -3.0318*x2+4.2712;
plot(x1,v1,'b',x2,v2,'b');;
xlabel("Time (s)");
ylabel("Velocity of Q1 (rad/s)");
title("Velocity of Q1 against time")
hold on

