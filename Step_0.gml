CollisionsAndGravity()

if !controller_connected() // controller checking
{
	upbutton = keyboard_check(ord("W")) // all of these only return 0 or 1
	downbutton = keyboard_check(ord("S"))
	leftbutton = keyboard_check(ord("A"))
	rightbutton = keyboard_check(ord("D"))
	jumpbutton = keyboard_check(vk_space)
	runbutton = keyboard_check_pressed(vk_shift) // the pressed ones don't always work the same depending on where you call them
	pickupbutton = mouse_check_button_pressed(mb_right)
	letdownbutton = mouse_check_button_pressed(mb_left)
	startbutton = keyboard_check_pressed(vk_escape)
}
else
{
	upbutton = round(abs(min(gamepad_axis_value(0, gp_axislv),0)))
	downbutton = round(max(gamepad_axis_value(0, gp_axislv),0))
	leftbutton = round(abs(min(gamepad_axis_value(0, gp_axislh),0))) // will return -1 or 0 AKA 1 or 0 because abs and nothing inbetween because round
	rightbutton = round(max(gamepad_axis_value(0, gp_axislh),0)) // will return 0 or 1
	jumpbutton = gamepad_button_check(0, gp_face1)
	runbutton = gamepad_button_check_pressed(0, gp_face2)
	pickupbutton = gamepad_button_check_pressed(0, gp_face4)
	letdownbutton = gamepad_button_check_pressed(0, gp_face3)
	startbutton = gamepad_button_check_pressed(0, gp_start)
}

if gamepad_button_check_pressed(0, gp_select) // TEMPORARY
{
    if window_get_fullscreen()
        window_set_fullscreen(0)
    else
        window_set_fullscreen(1)
}

if gamepad_button_check_pressed(0, gp_start) // TEMPORARY
{
    add_item(5, c_white, 50, -1)
    add_item(2, c_white, 20, -1)
    add_item(3, c_white, 0, -1)
    add_item(4, c_white, 20, -1)
    add_item(7, c_white, 1, -1)
    add_item(9, c_white, 15, -1)
}

if !thrown && rm != "cave"
{
	if runbutton // toggle running
		running = !running // is 1 or 0
		
	// walking and running
	if !gamepad_button_check(0,gp_shoulderlb)
		hsp = (walkspeed * (rightbutton - leftbutton)) + (running * (rightbutton - leftbutton)) // example if right button is active but left isn't you get 1 - 0 if left is active but right isn't you get 0 - 1 AND THEN PLUS RUNNING (could * runninspeed if it were different from 1)
	else
		hsp = 0
		
	if jumpbutton && !place_meeting(x,y-10,obj_Solid) && vsp >= 0 // Jumping
    {
        if airborne == 0
        {
            vsp = -jumpheight
            audio_play_sound(Chan_Jump,0,0)
        }
        else
        if find_equipped_wings() 
        if totaljumps > 0 && instance_nearest(x,y,obj_Wings).flap == 0
        {
            obj_Wings.flap = 1
            vsp = -jumpheight + 1
            audio_play_sound(Flap,0,0)
            totaljumps -= 1
        }
    }

    if airborne == 0 // flapping wings
    {
        if find_equipped_wings()
            totaljumps = 0 + instance_nearest(x,y,obj_Wings).jumps
        else
            totaljumps = 0
    }
    else
    {
        if !find_equipped_wings()
            totaljumps = 0
    }
}

if thrown
{
	if jumpbutton && find_equipped_wings()
	{		
		if totaljumps > 0 && instance_nearest(x,y,obj_Wings).flap == 0
		{
		    obj_Wings.flap = 1
		    vsp = -jumpheight + 1
		    audio_play_sound(Flap,0,0)
		    totaljumps -= 1
		}
	}
}

if rm = "cave"
{
	hsp = 0
	vsp = 0
}

if thrown == 2
{
	if airborne
		grav = 0.5
	else
		grav = 30
}
else
	grav = 1