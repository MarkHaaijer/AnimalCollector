/// @description draw_back(background,x,y,alpha)
/// @param background
/// @param x
/// @param y
/// @param alpha

back = argument0
width = background_get_width(back)
xx = argument1
yy = argument2
a = argument3
amount = ceil(__view_get( e__VW.WView, 0 ) / width)
left = -1
right = amount + 1

for (i = left; i < right; i += 1)
    draw_background_ext(back, __view_get( e__VW.XView, 0 ) + -(xx % width) + (width * i), yy, 1, 1, 0, c_white, a)
