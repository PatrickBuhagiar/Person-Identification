function c = compute_cost(x,y,w)
    [nExamples, ~] = size(x);
    z = 0;
    for k=1:nExamples
        %sigmoid function
       h = p( x(k,:)*w');
       if y(k) == 1
          z = z + log(h); 
       else
          z = z + log(1-h); 
       end
    end
    c = z/(-nExamples);
end