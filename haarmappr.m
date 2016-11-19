function haarmappr(~)
a=1/sqrt(100);
for i=1:100
    H(1,i)=a;
end
for k=1:99
    p=fix(log2(k));
    q=k-2^p+1;
    t1=100/2^p;
    sup=fix(q*t1);
    mid=fix(sup-t1/2);
    inf=fix(sup-t1);
    t2=2^(p/2)*a;
    for j=1:inf
        H(k+1,j)=0;
    end
    for j=inf+1:mid
        H(k+1,j)=t2;
    end
    for j=mid+1:sup
        H(k+1,j)=-t2;
    end
    for j=sup+1:100
        H(k+1,j)=0;
    end
end

    for l=1:100
        for j=1:100
            a=@(t)(H(l,j)*t);
            int=integral(a,0,1);
            G(l,j)=int;
        end
    end    
    for i=1:100
        for j=1:100
            I(i,j)=H(i,j)*G(i,j);
        end
    end
for k=3:6
    v=k-2;
    a=power(2,k);
    for i=1:100
        J(i,v)=0;
        for j=1:a
            J(i,v)=J(i,v)+I(i,j);
        end
    end
end
for k=1:4
    for i=1:100
        a=@(t)(t-J(i,k)).^(2);
        a=integral(a,0,1);
        a=power(a,0.5);
        K(i,k)=a;
    end
end
for k=1:4
    max=K(1,k);
    for i=2:100
        if(max<K(i,k))
        max=K(i,k);
        end
    end
    
    disp(max);
end           
end
