function x2 = getApproxMiddle( x1,t1,t2,x3,t3 )
    x2 = (x3-x1)/(t3-t1)*(t2-t1)+x1;
end

