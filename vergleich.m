pkg load image;

[a b]=edge_detect('horizonal_weiss_balken.png');
[c d]=edge_detect('horizonal_schwarz_weiss.png');
[e f]=edge_detect('horizonal_schwarz_balken.png');
[g h]=edge_detect('diagonal_schwarz_weiss.png');
[i j]=edge_detect('vertikal_schwarz_weiss.png');

figure(2);
subplot(2,5,1), imshow(double(a));
title ('Original 1',"fontsize",25);
subplot(2,5,6), imshow(double(b));
title ('Gefiltert 1',"fontsize",25);
subplot(2,5,2), imshow(double(c));
title ('Original 2',"fontsize",25);
subplot(2,5,7), imshow(double(d));
title ('Gefiltert 2',"fontsize",25);
subplot(2,5,3), imshow(double(e));
title ('Original 3',"fontsize",25);
subplot(2,5,8), imshow(double(f));
title ('Gefiltert 3',"fontsize",25);
subplot(2,5,4), imshow(double(g));
title ('Original 4',"fontsize",25);
subplot(2,5,9), imshow(double(h));
title ('Gefiltert 4',"fontsize",25);
subplot(2,5,5), imshow(double(i));
title ('Original 5',"fontsize",25);
subplot(2,5,10), imshow(double(j));
title ('Gefiltert 5',"fontsize",25);
print("-S1700,800", "plot.png");

