function [topograph, lowHighDist] = topoMap(altitude, water)

[m, n] = size(altitude);
topograph = uint8(zeros(m,n,3));

min = 5000;
max = 0;

minInd1 = 0;
minInd2 = 0;
maxInd1 = 0;
maxInd2 = 0;

for i=1:m

   for j=1:n
      
       if(water(i,j) == 1)
          topograph(i,j,3) = 255; 
       elseif(altitude(i,j) > 4500)
          topograph(i,j,2) = 255;
          topograph(i,j,3) = 255;
       elseif(altitude(i,j) > 4000)
           topograph(i,j,1) = 255;
           topograph(i,j,2) = 255;
           topograph(i,j,3) = 255;
       elseif(altitude(i,j) > 3000)
           topograph(i,j,1) = 255;
       elseif(altitude(i,j) > 2000)
           topograph(i,j,1) = 255;
           topograph(i,j,2) = 128;
       elseif(altitude(i,j) > 1000)
           topograph(i,j,1) = 255;
           topograph(i,j,2) = 255;
       elseif(altitude(i,j) > 0)
           topograph(i,j,2) = 255;
       end
       
         %write if for min and max
      if(altitude(i,j) > max && water(i,j) == 0)
          max = altitude(i,j);
          maxInd1 = i;
          maxInd2 = j;
      elseif(altitude(i,j) < min && water(i,j) == 0)
          min = altitude(i,j);
          minInd1 = i;
          minInd2 = j;
      end
      
   end
    
end

  topograph(maxInd1,maxInd2,1) = 255;
  topograph(maxInd1,maxInd2,2) = 0;
  topograph(maxInd1,maxInd2,3) = 255;
  topograph(minInd1,minInd2,1) = 128;
  topograph(minInd1,minInd2,2) = 0;
  topograph(minInd1,minInd2,3) = 255;
  
%find distance in meters
lowHighDist = sqrt((maxInd1-minInd1)^2 + (maxInd2-minInd2)^2) * 10000;

imagesc(topograph)

end
