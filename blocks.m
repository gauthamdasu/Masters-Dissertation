dico = imread('re.jpg');
% For demo purposes, let's resize it to be 64 by 64;
dico = imresize(dico, [64 64]);
% Get the dimensions of the image.  numberOfColorBands should be = 3.
[rows columns numberOfColorBands] = size(dico)
ca = mat2cell(dico,4*ones(1,size(rgbImage,1)/4),4*ones(1,size(rgbImage,2)/4),3);
%ca = mat2cell(dico,[128 128],[132 124]);
plotIndex = 1;
for c = 1 : size(ca, 2)
	for r = 1 : size(ca, 1)
		fprintf('c=%d, r=%d\n', c, r);
		subplot(16,16,plotIndex);
		imshow(ca{r,c},[]);
		plotIndex = plotIndex + 1
	end
end
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
figure ,imshow(dico,[]);