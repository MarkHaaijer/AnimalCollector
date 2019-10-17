thrown = 1

if !controller_connected() // without controller
{
	angle = point_direction(obj_Player.x,obj_Player.y,mouse_x,mouse_y)*pi/180
	
	if (mouse_x != obj_Player.x || mouse_y != obj_Player.y) && ((mouse_x >= obj_Player.x && mouse_x >= obj_Player.x + round(cos(angle)*17)) || (mouse_x <= obj_Player.x && mouse_x <= obj_Player.x + round(cos(angle)*17))) && ((mouse_y >= obj_Player.y && mouse_y >= obj_Player.y - round(sin(angle)*19)) || (mouse_y <= obj_Player.y && mouse_y <= obj_Player.y - round(sin(angle)*19)))
	{
		hsp = round(cos(angle)*10)
		vsp = -round(sin(angle)*10)
	}
	else
	{
		hsp = round((mouse_x - obj_Player.x)/17*10)
		vsp = round((mouse_y - obj_Player.y)/19*10)
	}
}
else // with controller
{
    hsp = obj_Player.hsp + round(gamepad_axis_value(0, gp_axislh)*10) // axislh is between -1, 0 and 1
    vsp = round(gamepad_axis_value(0, gp_axislv)*10)
}

x = obj_Player.x
y = obj_Player.y - 3
global.holding = 2
depth = -3