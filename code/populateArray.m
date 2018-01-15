function [ zv1 ] = populateArray( vec,value )
    zv1 = zeros(size(vec));
    s1 = size(zv1);   
    zv1(1:s1(1),1:s1(2))=value;
end

