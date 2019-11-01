#a=[1,1,1,0,0,0;1,1,1,0,0,0;1,1,1,0,0,0;1,1,1,0,0,0;1,1,1,0,0,0;1,1,1,0,0,0;];
#b=[-1,0,1;-2,0,2;-1,0,1];
#c=conv2(a,b);

Output = zeros (size(I,1),size(I,2), "uint8");
I=double(imread('horizonal_weiss_balken.png')); %read image  
figure;

subplot(1,2,1), imshow(double(I));
title ("Original");
#I_2=double(I);
In=I;      %copy image  
mask=[1, 0, -1;1, 0, -1;1, 0, -1]; 
  
%Rotate image by 180 degree first flip up to down then left to right 
mask=flipud(mask);  
mask=fliplr(mask); 
for i=2:size(I, 1)-1     # size( ,1)returns the number of columns
    for j=2:size(I, 2)-1 # size( ,2) returns the number of rows
  
        %multiplying mask value with the corresponding image pixel value 
        neighbour_matrix=mask.*I(i-1:i+1, j-1:j+1);  
        avg_value=sum(neighbour_matrix(:)); 
        Output(i, j)=avg_value; 
    end 
end 

subplot(1,2,2), imshow(double(Output));
title ("Gefiltert"); 
 
