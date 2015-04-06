function [featureVector] = ContrastNormalize(imIn, blockSize, overlap)
%% Initialization
[x, y, z] = size(imIn);
featureVector = [];

%% obtain blockEdges
XBlockLimits = round(blockSize(1):blockSize(1)-overlap(1):x);
YBlockLimits = round(blockSize(2):blockSize(2)-overlap(2):y);
XBlockStarts = round(1:blockSize(1) - overlap(1):x);
YBlockStarts = round(1:blockSize(2) - overlap(2):y);
    
%% loop through layers
for k=1:z, %iterate Layers
    %Compute Patches   
    for i=1:length(XBlockLimits),
       for j=1:length(YBlockLimits),
           %extract cell
           block = imIn(XBlockStarts(i):1:XBlockLimits(i),YBlockStarts(j):1:YBlockLimits(j), k); 
           val = (sqrt(sum(sum(block.^2))));
           %handle NaN
           if val == 0,
              val =1; 
           end
           normalised = (block./val)';
           featureVector = [featureVector normalised(:)'];
           
       end
    end
end     
end