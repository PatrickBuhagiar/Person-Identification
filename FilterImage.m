function imOut = FilterImage(imIn, kernel, boundFill, outputSize)
    %obtain dimensions
    [x,y,z] = size(imIn);
    [a,b] = size(kernel);

    %matrix to column conversion
    k = kernel(:);

    %padding and output image initialisation 
    if(strcmp(outputSize, 'valid'))
        imOut = zeros(x-(a-1), y-(b-1), z);
    elseif(strcmp(outputSize, 'full'))    
        imIn = padarray((imIn), [a-1,b-1], boundFill);
        imOut = zeros(x+a-1, y+b-1, z);
    elseif(strcmp(outputSize, 'same'))
        imIn = padarray((imIn), ([a-1,b-1])./2, boundFill);
        imOut = zeros([x,y,z]);
    end

    %obtain output dimension
    [X,Y,Z] = size(imOut);
    
    %Convolution on each dimension layer
    for n=1:z,
        f = im2col(imIn(:,:,n), [a b], 'sliding');
        H = repmat(k, 1, length(f));
        g = sum(f .* H);
        
        %reconstruct matrix
        imOut(:,:,n) = reshape(g, [X,Y]);
    end
end