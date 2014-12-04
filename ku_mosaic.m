function mosaic_img = ku_mosaic(img, power)

if (nargin == 1)
    power = 1;
end

[x y d] = size(img);
mosaic_img = zeros(x, y, d);

h_cutter = int32(x*0.1/power);
w_cutter = int32(y*0.1/power);

height = int32(linspace(1, x, h_cutter));
width = int32(linspace(1, y, w_cutter));

[hr, hc] = size(height);
[wr, wc] = size(width);

for ix = 1:hc-1
    arg1 = height(ix);
    arg2 = height(ix+1);
    for iy = 1:wc-1
        m_value = mean(mean(img(arg1:arg2, width(iy):width(iy+1), :)));
        mosaic_img(arg1:arg2, width(iy):width(iy+1), 1) = m_value(1);
        mosaic_img(arg1:arg2, width(iy):width(iy+1), 2) = m_value(2);
        mosaic_img(arg1:arg2, width(iy):width(iy+1), 3) = m_value(3);
    end
end

mosaic_img = uint8(mosaic_img);