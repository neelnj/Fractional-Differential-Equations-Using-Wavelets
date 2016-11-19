function fracdiffsolve(level)
set(0,'RecursionLimit',1000);
f=@(x)(-power(x,2));
psi = @(x)(0 <= x < 0.5) - (0.5 <= x < 1); %wavelet function
psijk = @(x,j,k) power(2,(j/2))*psi((power(2,j)* x) - k);
phi = @(x)(0 <= x < 1); %scaling function
phijk = @(x,j,k) power(2,(j/2))*phi((power(2,j)*x)- k);
n=@(x,j,k)(f(x).*psijk(x,j,k));
l=@(x)(f(x).*phijk(x,0,0));
c0=integral(@(x)l(x),0,1);
s = @(x)(c0 * phijk(x, 0, 0));
for i=1:6
    for j=
    k=i-(2^j);
    j=fix(log2(k));
    m=@(x)psijk(x,j,k);
end
for j=0:level
    for k=0:power(2,j)-1
        if(j==0&&k==0)
             sum=@(x)(c0*psijk(x,j,k));
             s=@(x)(s(x)+sum(x));
             continue;
        end
        djk=integral(@(x)n(x,j,k),0,1);
        s=@(x)(s(x)+sum(x));
    end
end
fplot(s,[0,1],'r');hold on;
fplot(f,[0,1]);
end