function [ res ] = frictionApprox( val ,a,b )
       res = sign(val)*a+b*val;
end

