function F = fmatrix (m,alpha)
zi=@(k,alpha)(power(k+1,alpha+1)-2*power(k,alpha+1)+power(k-1,alpha+1));
for i=1:m
    l=1;
    for j=1:m
        if(i>j)
            F(i,j)=0;
        end
        if(i==j)
            F(i,j)=1;
        end
        if(i<j)
            F(i,j)=zi(l,alpha);
            l=l+1;
        end
            
    end
end
for i=1:m
    for j=1:m
        F(i,j)=power(power(m,alpha)*gamma(alpha+2),-1)*F(i,j);
    end
end
end


