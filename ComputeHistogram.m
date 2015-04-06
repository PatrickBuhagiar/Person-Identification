function [imOut] = ComputeHistogram(imIn, groupSize, valueRange, noOfBins)
    [x, y] = size(imIn);
      
    %% Find cell start and end indexes
    XcellsLimits = round(groupSize(1):groupSize(1):x);
    YcellsLimits = round(groupSize(2):groupSize(2):y);
    XcellStarts = round(1:groupSize(1):x);
    YcellStarts = round(1:groupSize(2):y);
    
    %add additional values which did not fit in cells
    if (XcellsLimits(end) ~= x),
        XcellsLimits(end+1) = x;
    end
    if (YcellsLimits(end) ~= y),
        YcellsLimits(end+1) = y;
    end
    
    %% Initialization    
    binEdges = linspace(valueRange(1), valueRange(2), noOfBins + 1); %create bins
    imOut = zeros(length(XcellsLimits), length(YcellsLimits), noOfBins); %Output
    
    %%% Calculate histogram for each cell
    for i=1:length(XcellsLimits),
       for j=1:length(YcellsLimits),
           %extract cell
           cell = imIn(XcellStarts(i):1:XcellsLimits(i), YcellStarts(j):1:YcellsLimits(j)); 
           
           %Calculate Histogram for cell
           for k=1:noOfBins,
               if k == noOfBins %because the last bin includes the last value in the range aswell
                imOut(i,j,k) = numel(imIn((cell(:,:) >= binEdges(k)) & (cell(:,:) <= binEdges(k+1))));
               else    
                imOut(i,j,k) = numel(imIn((cell(:,:) >= binEdges(k)) & (cell(:,:) < binEdges(k+1))));                                
               end
           end
       end
    end
end