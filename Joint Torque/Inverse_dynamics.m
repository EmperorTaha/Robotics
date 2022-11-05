clc;
clear all;
format short
M1=.05;M2=.05;
L1=1;L2=1;
   
 q1o=0;q2o=0;
q=q1o;d=0;a=0;alpha=0; %for i=1;
T01=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
q=q2o;d=0;a=L1;alpha=0;  %fori=2;
T12=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
q=0;d=0;a=L2;alpha=0; % for i=3;
T23=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
T02=T01*T12;
T03=T01*T12*T23;

axis([-2 3 -2 3]);

Ax1 = [T01(1,4),T02(1,4)];
Ay1 = [T01(2,4),T02(2,4)];
Ax2 = [T02(1,4),T03(1,4)];
Ay2 = [T02(2,4),T03(2,4)];
Ax3 = [-.1,.1];
Ay3=  [0,0];

  p1  = line(Ax1,Ay1,'LineWidth',[3],'Color','k');
  p2  = line(Ax2,Ay2,'LineWidth',[3],'Color','M');
  p3  = line(Ax3,Ay3,'LineWidth',[9],'Color','R');
  drawnow

% pause()
n=1;
g=9.80;
  for t=0:.01:1
q1=pi/6*t+pi/4*t^2;
q2=pi/5*t+t*pi/8*t^2;
 dq1=pi/6+2*pi/4*t;
 ddq1=2*pi/4;
 dq2=pi/5+2*pi/8*t;
 ddq2=2*pi/8;
q=q1;d=0;a=0;alpha=0; %for i=1;
T01=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
q=q2;d=0;a=L1;alpha=0;  %fori=2;
T12=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
q=0;d=0;a=L2;alpha=0; % for i=3;
T23=[cos(q) -sin(q) 0 a;sin(q)*cos(alpha) cos(q)*cos(alpha) -sin(alpha) -sin(alpha)*d;sin(q)*sin(alpha) cos(q)*sin(alpha) cos(alpha) cos(alpha)*d;0 0 0 1];
T02=T01*T12;
T03=T01*T12*T23;
Ax1 = [T01(1,4),T02(1,4)];
  Ay1 = [T01(2,4),T02(2,4)];
  Ax2 = [T02(1,4),T03(1,4)];
  Ay2 = [T02(2,4),T03(2,4)];
  Ax3 = [-.1,.1];
  Ay3=  [0,0];
 
  set(p1,'X', Ax1, 'Y',Ay1)
  set(p2,'X', Ax2, 'Y',Ay2)
  set(p3,'X', Ax3, 'Y',Ay3)
 
M=[2/3*L1^2*M1+L1*L2*M2*cos(q2)+L1^2*M2+2/3*L2^2*M2 2/3*L2^2*M2+1/2*L1*L2*M2*cos(q2);2/3*L2^2*M2+1/2*L1*L2*M2*cos(q2) 2/3*L2^2*M2];
V=[-1/2*M2*L1*L2*sin(q2)*dq2^2-M2*L1*L2*sin(q2)*dq1*dq2;1/2*M2*L1*L2*sin(q2)*dq1^2];
G=[1/2*M2*L2*g*cos(q1+q2)+(1/2*M1+M2)*L1*g*cos(q1);1/2*M2*L2*g*cos(q1+q2)];
T=M*[ddq1;ddq2]+V+G;

  A1(n,1)=t;%Time of traj.
  A2(n,1)=T(1,1);%T at joint 1
  A3(n,1)=T(2,1); %T at joint 2

  drawnow
  pause(.03)
  n=n+1;
  end
hold on
figure
plot(A1(:,1),A2(:,1),'r')
hold on
plot(A1(:,1),A3(:,1),'k')
xlabel('Time (s)');
ylabel('Torque (Nm)');
legend('Torque of joint 1','Torque of joint 2','AutoUpdate','off')