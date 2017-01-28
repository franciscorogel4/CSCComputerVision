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





        %RedChannel = 255 * uint8(theBinaryImage);
        %BlueChannel = 255 * uint8(theBinaryImage);
        %GreenChannel = 255 *  zeros(size(theBinaryImage), 'uint8'); % pink Everywhere.
        %GreenChannel = 255 * uint8(theBinaryImage);
        
        %RedChannel = 255 *  ones(size(theBinaryImage), 'uint8'); 
        %GreenChannel = 255 *  ones(size(theBinaryImage), 'uint8'); 
        %BlueChannel = 255 *  ones(size(theBinaryImage), 'uint8');










% block1a = theImage(ymin:height, xmin:width, :);
%
% subplot(numRecsDown,numRecsAcross,1)
% imshow(block1a);
%
% block1a = theImage((ymin+height):(height+height), xmin:width, :);
%
% subplot(numRecsDown,numRecsAcross,7)
% imshow(block1a);
%
%
% block3a = theImage((ymin+height+height):(height+height+height), xmin:width, :);
%
% subplot(numRecsDown,numRecsAcross,13)
% imshow(block3a);
%
%
% block4a = theImage((ymin+height+height+height):(height+height+height+height), xmin:width, :);
%
% subplot(numRecsDown,numRecsAcross,19)
% imshow(block4a);
%
% block5a = theImage((ymin+height+height+height+height):(height+height+height+height+height), xmin:width, :);
%
% subplot(numRecsDown,numRecsAcross,25)
% imshow(block5a);
%
% block6a = theImage((ymin+height+height+height+height+height):(height+height+height+height+height+height), xmin:width, :);
%
% subplot(numRecsDown,numRecsAcross,31)
% imshow(block6a);
%
% %******************************************************************************************************************************
%
% block1a = theImage(ymin:height, (xmin+width):(width+width), :);
%
% subplot(numRecsDown,numRecsAcross,2)
% imshow(block1a);
%
%
% block2a = theImage((ymin+height):(height+height), (xmin+width):(width+width), :);
%
% subplot(numRecsDown,numRecsAcross,8)
% imshow(block2a);
%
%
% block3a = theImage((ymin+height+height):(height+height+height), (xmin+width):(width+width), :);
%
% subplot(numRecsDown,numRecsAcross,14)
% imshow(block3a);
%
%
% block4a = theImage((ymin+height+height+height):(height+height+height+height), (xmin+width):(width+width), :);
%
% subplot(numRecsDown,numRecsAcross,20)
% imshow(block4a);
%
% block5a = theImage((ymin+height+height+height+height):(height+height+height+height+height), (xmin+width):(width+width), :);
%
% subplot(numRecsDown,numRecsAcross,26)
% imshow(block5a);
%
% block6a = theImage((ymin+height+height+height+height+height):(height+height+height+height+height+height), (xmin+width):(width+width), :);
%
% subplot(numRecsDown,numRecsAcross,32)
% imshow(block6a);
%
%
%
% %******************************************************************************************************************************
%
% block1a = theImage(ymin:height, (xmin+width+width):(width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,3)
% imshow(block1a);
%
%
% block2a = theImage((ymin+height):(height+height), (xmin+width+width):(width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,9)
% imshow(block2a);
%
%
% block3a = theImage((ymin+height+height):(height+height+height), (xmin+width+width):(width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,15)
% imshow(block3a);
%
%
% block4a = theImage((ymin+height+height+height):(height+height+height+height), (xmin+width+width):(width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,21)
% imshow(block4a);
%
% block5a = theImage((ymin+height+height+height+height):(height+height+height+height+height), (xmin+width+width):(width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,27)
% imshow(block5a);
%
% block6a = theImage((ymin+height+height+height+height+height):(height+height+height+height+height+height), (xmin+width+width):(width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,33)
% imshow(block6a);
%
%
% %******************************************************************************************************************************
%
% block1a = theImage(ymin:height, (xmin+width+width+width):(width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,4)
% imshow(block1a);
%
%
% block2a = theImage((ymin+height):(height+height), (xmin+width+width+width):(width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,10)
% imshow(block2a);
%
%
% block3a = theImage((ymin+height+height):(height+height+height), (xmin+width+width+width):(width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,16)
% imshow(block3a);
%
%
% block4a = theImage((ymin+height+height+height):(height+height+height+height), (xmin+width+width+width):(width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,22)
% imshow(block4a);
%
% block5a = theImage((ymin+height+height+height+height):(height+height+height+height+height), (xmin+width+width+width):(width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,28)
% imshow(block5a);
%
% block6a = theImage((ymin+height+height+height+height+height):(height+height+height+height+height+height), (xmin+width+width+width):(width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,34)
% imshow(block6a);
%
%
%
% %******************************************************************************************************************************
%
% block1a = theImage(ymin:height, (xmin+width+width+width+width):(width+width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,5)
% imshow(block1a);
%
%
% block2a = theImage((ymin+height):(height+height), (xmin+width+width+width+width):(width+width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,11)
% imshow(block2a);
%
%
% block3a = theImage((ymin+height+height):(height+height+height), (xmin+width+width+width+width):(width+width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,17)
% imshow(block3a);
%
%
% block4a = theImage((ymin+height+height+height):(height+height+height+height), (xmin+width+width+width+width):(width+width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,23)
% imshow(block4a);
%
% block5a = theImage((ymin+height+height+height+height):(height+height+height+height+height), (xmin+width+width+width+width):(width+width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,29)
% imshow(block5a);
%
% block6a = theImage((ymin+height+height+height+height+height):(height+height+height+height+height+height), (xmin+width+width+width+width):(width+width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,35)
% imshow(block6a);
%
%
%
% %******************************************************************************************************************************
%
% block1a = theImage(ymin:height, (xmin+width+width+width+width+width):(width+width+width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,6); imshow(block1a);
%
%
% block2a = theImage((ymin+height):(height+height), (xmin+width+width+width+width+width):(width+width+width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,12); imshow(block2a);
%
%
% block3a = theImage((ymin+height+height):(height+height+height), (xmin+width+width+width+width+width):(width+width+width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,18); imshow(block3a);
%
%
% block4a = theImage((ymin+height+height+height):(height+height+height+height), (xmin+width+width+width+width+width):(width+width+width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,24); imshow(block4a);
%
% block5a = theImage((ymin+height+height+height+height):(height+height+height+height+height), (xmin+width+width+width+width+width):(width+width+width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,30); imshow(block5a);
%
% block6a = theImage((ymin+height+height+height+height+height):(height+height+height+height+height+height), (xmin+width+width+width+width+width):(width+width+width+width+width+width), :);
%
% subplot(numRecsDown,numRecsAcross,36); imshow(block6a);

