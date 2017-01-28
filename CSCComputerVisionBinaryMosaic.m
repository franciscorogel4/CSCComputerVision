function splitImage(image)

theImage = imread(image);

%diffBinaryImage = imread('pictures/mario.png');   % Used if desired image is
%diffBinaryImage = imread('pictures/church.png');  % made up of two
                                                   % pictures

grayScaleImage = rgb2gray(theImage);
%grayScaleImage = rgb2gray(diffBinaryImage);


theBinaryImage = im2bw(grayScaleImage, .5) ;


imshow(theImage,'InitialMagnification', 500);
pause(2);

imshow(theBinaryImage,'InitialMagnification', 500);
pause(1);

[height, width, dim] = size(theImage); % Getting the dimension of the image

numRecsAcross = 20; % Needs to be a factor of the dimension of the picture
numRecsDown = 20;

xmin = 1;
ymin = 1;
width = (width/numRecsAcross);
height = (height/numRecsDown);


xmin = uint16(xmin);
ymin = uint16(ymin);
width = uint16(width);
height = uint16(height);

s = 1;

colorChannel = 255 * uint8(theBinaryImage);

for i = 1: numRecsDown
    for j = 1: numRecsAcross
        block = theImage(ymin+(i-1)*height:height*i, xmin+(j-1)*width:width*j, :);
                
        color = uint8(mean(mean(block)));
        
        rr = color(:,:,1);
        gg = color(:,:,2);
        bb = color(:,:,3);
        
        r = ((double(rr))/255) * colorChannel;
        g = ((double(gg))/255) * colorChannel;
        b = ((double(bb))/255) * colorChannel;
        
        rgbImage = cat(3, r, g, b);
    
        allImage(:,:,:,s) = rgbImage;
                
        s = s+1;
    end
end


m = montage(allImage,'Size',[numRecsDown numRecsAcross]); %Putting all the plots together

MyMontage = get(m, 'CData');
imwrite(MyMontage, 'gift.png', 'png');



