% Alexandre Leon 504-941-684
% EE131A project case A
hold off
hold on
subplot(2,1,1);

M = 1000000;
sigma1 = 1;

t = [-20:0.05:20];
P = zeros(1,size(t,2));

%Setp 1
randn('seed',2000);
N = randn(1,M);
histogram(N);
title('Histogram of Gaussian Noise RV');
xlabel('Value');
ylabel('proportion');

for u = 1:801
SNR = -20 +(u-1)*0.05;

S = sigma1* 10^(SNR/20);
%S = 1;


%Setp 2
rand('seed',2001);
S1 = rand(1,M);

S2 = S1 >= 0;

SS = S.*(2*S2 - 1);

%Setp 3

X = SS + N;

%Setp 4

XX = X .*S2;
%Setp 5

X1 =( XX <= 0);

%Setp 6

M1 = sum(S2);
X11 = sum(X1);

P(1,u) = X11/M1;

end

subplot(2,1,2);

semilogy(t,P)
title('P(e) vs SNR for Gaussian Noise');
xlabel('SNR (dB)');
ylabel('P(e) (log10)');

done = 1