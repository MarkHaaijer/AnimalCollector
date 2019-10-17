/// @description  draw_sprite_outline(x, y, item, index, xscale, rotation, outlineColor)
/// @param  x
/// @param  y
/// @param  item
/// @param  index
/// @param  xscale
/// @param  rotation
/// @param  outlineColor

xx = argument0 // THIS SCRIPT IS NO LONGER NEEDED THANKS TO SHADER
yy = argument1
item = argument2
itemindex = argument3
xscale = argument4
rotation = argument5
ocolor = argument6

draw_set_color(ocolor)
draw_sprite_ext(item, itemindex, xx - 1, yy, xscale, 1, rotation, ocolor, 1)
draw_sprite_ext(item, itemindex, xx + 1, yy, xscale, 1, rotation, ocolor, 1)
draw_sprite_ext(item, itemindex, xx, yy - 1, xscale, 1, rotation, ocolor, 1)
draw_sprite_ext(item, itemindex, xx, yy + 1, xscale, 1, rotation, ocolor, 1)