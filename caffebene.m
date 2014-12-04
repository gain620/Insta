function bene_img = caffebene(img)

sepia = 22;
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
Y = (0.299*R + 0.587*G + 0.114*B);

[ih, iw, id] = size(img);
bene_img(:,:,1) = Y + 2*sepia;
bene_img(:,:,2) = Y + sepia;
bene_img(:,:,3) = Y - sepia;

bene = imread('http://cfile205.uf.daum.net/image/1958090F4B5CF7EEA2AB46');
[bh, bw, bd] = size(bene);

point_x = (iw- bw)/2;
point_y = ih*0.85 - bh/2;

bene_img(point_y:point_y+bh-1, point_x:point_x+bw-1, :) = bene;