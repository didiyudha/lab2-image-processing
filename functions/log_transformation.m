function [IOutput] = log_transformation(I,c)
    a = double(I)/255;
    IOutput = c*log(1 + (a));
end