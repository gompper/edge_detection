function [Original Output] = edge_detect(file)
	
	Original=double(imread(file)); %read image  
	Output = zeros (size(I,1),size(I,2), "uint8"); % speicherplatz für output belegen
  
%%%% Padding %%%%
  Padded = padarray(Original,[1,1],0); % schwarzen Rand der dicke 1 mit dem wert 1 erzeugen
  
  %% Rechts/Links %%
  for i=2:size(Padded,1)-1
    Padded(i,1) = Padded(i,2);
    Padded(i,size(Padded,2)) = Padded(i,size(Padded,2)-1);
  end  
  
  %% Oben/Unten %%
  for i=2:size(Padded,2)-1
    Padded(1,i) = Padded(2,i);
    Padded(size(Padded,1),i) = Padded(size(Padded,1)-1,i);
  end  
  
  %% Ecken %%
  % oben links
  Padded(1,1) = Padded(2,2);
  
  % unten links
  Padded(1,size(Padded,2)) = Padded(2,size(Padded,2)-1);
  % oben rechts
  Padded(size(Padded,1),1) = Padded(size(Padded,1)-1,2);
  
  % unten rechts
  Padded(size(Padded,1),size(Padded,2)) = Padded(size(Padded,1)-1,size(Padded,2)-1);
	%Padded=I;      %copy image  
	mask1=[1, 0, -1;2, 0, -2;1, 0, -1]; 
	mask2=rot90(mask1);
  
	mask1=flipud(mask1);  
	mask1=fliplr(mask1); 
  
	for i=2:size(Padded, 1)-1     # size( ,1)returns the number of columns
		for j=2:size(Padded, 2)-1 # size( ,2) returns the number of rows
	  
			%multiplying mask value with the corresponding image pixel value 
			neighbour_matrix=mask1 .* Padded(i-1:i+1, j-1:j+1);  
			avg_value=sum(neighbour_matrix(:)); 
			Outputx(i-1, j-1)=avg_value; 
		end 
	end 
 
	for i=2:size(Padded, 1)-1     # size( ,1)returns the number of columns
		for j=2:size(Padded, 2)-1 # size( ,2) returns the number of rows
	  
			%multiplying mask value with the corresponding image pixel value 
			neighbour_matrix=mask2 .* Padded(i-1:i+1, j-1:j+1);  
			avg_value=sum(neighbour_matrix(:)); 
			Outputy(i-1, j-1)=avg_value; 
		end 
	end  
  
  for i=1:size(Outputx,1)
    for j=1:size(Outputy,2)
      Output(i,j) = sqrt(Outputx(i,j)^2+Outputy(i,j)^2);
    end
  end   
  
  

	#subplot(1,2,2), imshow(double(Output));
	#title ("Gefiltert");
endfunction

