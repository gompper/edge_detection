
[a b]=edge_detect('horizonal_weiss_balken.png');
[c d]=edge_detect('horizonal_schwarz_weiss.png');
[e f]=edge_detect('horizonal_schwarz_balken.png');
[g h]=edge_detect('diagonal_schwarz_weiss.png');
[i j]=edge_detect('vertikal_schwarz_weiss.png');

figure;
subplot(2,5,1), imshow(double(a));
title ('Original: horizonal\_weiss\_balken.png',"fontsize",25);
subplot(2,5,6), imshow(double(b));
title ('Gefiltert: horizonal\_weiss\_balken.png',"fontsize",25);
subplot(2,5,2), imshow(double(c));
title ('Original: horizonal\_schwarz\_weiss.png',"fontsize",25);
subplot(2,5,7), imshow(double(d));
title ('Gefiltert: horizonal\_schwarz\_weiss.png',"fontsize",25);
subplot(2,5,3), imshow(double(e));
title ('Original: horizonal\_schwarz\_balken.png',"fontsize",25);
subplot(2,5,8), imshow(double(f));
title ('Gefiltert: horizonal\_schwarz\_balken.png',"fontsize",25);
subplot(2,5,4), imshow(double(g));
title ('Original: diagonal\_schwarz\_weiss.png',"fontsize",25);
subplot(2,5,9), imshow(double(h));
title ('Gefiltert: diagonal\_schwarz\_weiss.png',"fontsize",25);
subplot(2,5,5), imshow(double(i));
title ('Original: vertikal\_schwarz\_weiss.png',"fontsize",25);
subplot(2,5,10), imshow(double(j));
title ('Gefiltert: vertikal\_schwarz\_weiss.png',"fontsize",25);