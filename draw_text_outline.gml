/// @description  draw_text_outline(x, y, text, textColor, outlineColor)
/// @param x
/// @param  y
/// @param  text
/// @param  textColor
/// @param  outlineColor
 
var xx = argument0
var yy = argument1
var text = argument2
var tcolor = argument3
var ocolor = argument4
 
draw_set_color(ocolor)
draw_text(xx - 1, yy, string_hash_to_newline(text))
draw_text(xx + 1, yy, string_hash_to_newline(text))
draw_text(xx, yy - 1, string_hash_to_newline(text))
draw_text(xx, yy + 1, string_hash_to_newline(text))
 
draw_set_color(tcolor)
draw_text(xx, yy, string_hash_to_newline(text))
