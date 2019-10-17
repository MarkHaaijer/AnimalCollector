/// @description add_item(item,colour,stack,food)
/// @param item
/// @param colour
/// @param stack
/// @param food
for (i = 0; i < global.maxItems; ++i)
{
    if argument2 == 0
    {
        if (global.inventory[i] == -1) // if slot "i" is empty AKA a free spot
        {
            global.inventory[i] = argument0
            global.colour[i] = argument1
            global.stack[i] = argument2
            global.xpos[i] = choose(-1,0,1)
            global.ypos[i] = choose(-1,0,1)
            global.xscale[i] = choose(-1,1)
            global.food[i] = argument3
            return 1
        }
    }
    else if (argument0 == global.inventory[i] && global.stack[i] < 99) // if same stackable item exists in inv that's smaller than 99
    {
        {
            global.stack[i] += 1
            return 1   
        }
    }
}
// if you got stackable item that still hasn't found partner, do the usual thing
if (argument2 > 0)
for (i = 0; i < global.maxItems; ++i)
{
    if (global.inventory[i] == -1) // if slot "i" is empty
    {
        global.inventory[i] = argument0
        global.colour[i] = argument1
        global.stack[i] = argument2
        global.xpos[i] = choose(-1,0,1)
        global.ypos[i] = choose(-1,0,1)
        global.xscale[i] = choose(-1,1)
        //global.food[i] = -1 // animals are not stackable so
        return 1
    }
}

return 0
