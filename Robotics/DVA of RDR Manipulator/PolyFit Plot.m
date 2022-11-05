plot(time(100:200),q3a(100:200));
hold on
x = time(100:200);
y = 0.4862*x.^3-2.0338*x.^2+2.3841*x-0.7531
plot(x,y);
xlabel("Time (s)");
ylabel("Displacement of Q3 (m)");
title("Displacement of Q3 against time for second half")
legend('Joint Displacement','Polynomial Fit')
hold on

