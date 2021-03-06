% super script essigsäure
%
%
%%
spcE = spcO(:, 650:750);
wn = 200:1:2000;
wnE = wn(650:750);
[bldata,wts,baseline,vweights] = wlsbaseline(spcE,4);
plot(wnE, bldata', '-', 'color', 'r');
[y_hat, cm] = savgol(bldata,9,2,0);
wnEint = min(wnE):0.1:max(wnE);
ySpline = spline(wnE,y_hat,wnEint);
hold on;
plot(wnEint, ySpline, 'color', 'b');
hold off;
peak1 = ySpline(:,200:600)';
peak2 = ySpline(:,600:1000)';
figure();
wnP1 = wnEint(200:600);
plot(wnP1, peak1);
figure();
wnP2 = wnEint(600:1000);
plot(wnP2, peak2);
%%
[maxP1, maxInd1] = max(max(peak1));
[maxP2, maxInd2] = max(max(peak2));
[maxP1, indP1] = max(peak1(:,maxInd1));
[maxP2, indP2] = max(peak2(:,maxInd2));
indP1D = wnP1(indP1);
indP2D = wnP2(indP2);

% get heights
heights1 = peak1(indP1,:);
heights2 = peak2(indP2,:);

% round to be able to get right position
maxPeak1 = round(maxPeak1 * 10) / 10;
maxPeak2 = round(maxPeak2 * 10) /10;

% plot line through heights
hold on
plot([indP2D indP2D], [0 maxP2]);
hold off