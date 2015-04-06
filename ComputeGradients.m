function [gradMag, gradDir] = ComputeGradients(imIn, edgeFilter)

%Filter w/ to x and y axis
Gx = FilterImage(imIn, edgeFilter, 0, 'same');
Gy = FilterImage(imIn, transpose(edgeFilter), 0, 'same');

%gradient Direction
 gradDir = atan2(-Gy, Gx);
 gradDir = gradDir*(180/pi);


%gradient Magnitude
gradMag = sqrt((abs(Gx).^2)+(abs(Gy).^2));

end