I=double(imread('images.jpeg')); %read image  
	Output = zeros (size(I,1),size(I,2), "uint8"); % speicherplatz für output belegen
  
  
  In = padarray(I,[1,1],0); % schwarzen Rand der dicke 1 mit dem wert 1 erzeugen

	%In=I;      %copy image  
	mask1=[1, 0, -1;1, 0, -1;1, 0, -1]; 
	mask2=rot90(mask1);
  
	mask1=flipud(mask1);  
	mask1=fliplr(mask1); 
  
	for i=2:size(In, 1)-1     # size( ,1)returns the number of columns
		for j=2:size(In, 2)-1 # size( ,2) returns the number of rows
	  
			%multiplying mask value with the corresponding image pixel value 
			neighbour_matrix=mask1 .* In(i-1:i+1, j-1:j+1);  
			avg_value=sum(neighbour_matrix(:)); 
			Outputx(i-1, j-1)=avg_value; 
		end 
	end 
 
	for i=2:size(In, 1)-1     # size( ,1)returns the number of columns
		for j=2:size(In, 2)-1 # size( ,2) returns the number of rows
	  
			%multiplying mask value with the corresponding image pixel value 
			neighbour_matrix=mask2 .* In(i-1:i+1, j-1:j+1);  
			avg_value=sum(neighbour_matrix(:)); 
			Outputy(i-1, j-1)=avg_value; 
		end 
	end  
  
  for i=1:size(Outputx,1)
    for j=1:size(Outputy,2)
      Output(i,j) = sqrt(Outputx(i,j)^2+Outputy(i,j)^2);
    end
  end   
  
  
  imshow(double(Output),[50,255]);