function [w] = compute_weights(x, y, w0, i, e)
    [nExamples, nFeatures] = size(x);
    w = w0;
    prev_c = 0;
    
    for j=1:i
       z = zeros(nFeatures, 1);
       for k=1:nExamples
          %z is the gradient descent. on each iteration, we iteratively
          %trim the vector
          z = z + (p(x(k,:)*w') - y(k)) * x(k,:)';  
       end
       
       
       % compute new weights
       w = w - e*(z');
       %cost function
       c = compute_cost(x,y,w);
       
       if j~=0 && abs(c - prev_c)/c <=0.0001
           break;
       end
      prev_c = c;
       j
    end
end