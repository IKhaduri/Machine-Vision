%A
fn = @(x) (1/sqrt(2*pi)*exp(-x*x/2)*(x*x-1));
%figure('Name','Gaussian second derivative'),fplot(fn,[-8,8]);
%B
k=1;
for c = 1:5
    k=k+0.2;
    gaussK = @(x) (1/(sqrt(2*pi)*k) *exp(-x*x/(2*k*k)));
    KK=1;
    gaussKK = @(x) (1/(sqrt(2*pi)*KK) *exp(-x*x/(2*KK*KK)));
    sxvaoba = @(x) ((gaussK(x) - gaussKK(x))/(k-1));
    figure('Name',strcat('k=',num2str(k))),fplot(sxvaoba,[-8;8]);
    hold on
    fplot(fn,[-8,8]);
    hold off
end