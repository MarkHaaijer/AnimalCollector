delete_mole_stuff()
randomize()
moleCreated = 0
exitCreated = 0

maxboulders = obj_DEBUG.streak + 4
if maxboulders > 10
    maxboulders = 10

if maxboulders - 10 == 0
    minboulders = 5 + (obj_DEBUG.streak - 6)
else
    minboulders = 5
    
if minboulders > 10
    minboulders = 10

boulderamount = minboulders + round(random(maxboulders - minboulders))
    
maxcoal = obj_DEBUG.streak
if maxcoal > 4
    maxcoal = 4

while moleCreated != 1 // make sure to create a mole
{
    for(i = 16; i <= 96; i+= 16)
    {        
        for(j = 16; j <= 96; j+= 16)
        {
            if moleCreated != 1
            {
                moleCreated = round(random(36))
                 
                if moleCreated == 1
                {
                    instance_create(j,i,obj_Mole)
                    if i > 24
                    instance_create(j,i-16,obj_Dirt)
                }
                    
                    // if there in the end is still empty space above mole
            }
        }
    }
}

for(i = 16; i <= 96; i+= 16) // create dirt
{        
    for(j = 16; j <= 96; j+= 16)
    {
        if place_empty(j,i)
        {                       
            dirtchance = round(random(2))
            
            if dirtchance < 2
                instance_create(j,i,obj_Dirt)
        }
    }
}

while instance_number(obj_Boulder) < boulderamount
{
    for(i = 16; i <= 96; i+= 16) // create boulders
    {        
        for(j = 16; j <= 96; j+= 16)
        {
            if !place_meeting(j,i,obj_Mole) && !place_meeting(j,i,obj_Boulder) && !place_meeting(j,i+16,obj_Mole) // don't spawn ontop of mole
            {                       
                dirtchance = round(random(36)) // 10
                
                if dirtchance == 1 && instance_number(obj_Boulder) < boulderamount
                    if !(obj_Mole.y == 16 && place_meeting(j,i-16,obj_Mole)) // dont spawn below mole if he's at top
                        if !(obj_Mole.y == 16 && obj_Mole.x == 96 && place_meeting(j+16,i,obj_Mole)) // dont spawn left of mole if he's at right top
                            if !(obj_Mole.y == 16 && obj_Mole.x == 16 && place_meeting(j-16,i,obj_Mole)) // dont spawn right of mole if he's at left top
                                instance_create(j,i,obj_Boulder)
            }
        }
    }
}

while instance_number(obj_Coal) < maxcoal
{
    for(i = 16; i <= 96; i+= 16) // create coal
    {        
        for(j = 16; j <= 96; j+= 16)
        {
            if !place_meeting(j,i,obj_Mole) && !place_meeting(j,i+32,obj_Mole) && !place_meeting(j,i,obj_Boulder)
            {                       
                dirtchance = round(random(36))
                
                if dirtchance == 0 && instance_number(obj_Coal) < 4 && instance_number(obj_Coal) < maxcoal
                    instance_create(j,i,obj_Coal)
            }
        }
    }
}


while exitCreated != 1
{
    for(j = 16; j <= 96; j+= 16) // create exit horizontal
    {        
        if exitCreated != 1
        {
            exitCreated = round(random(15))
            
            if exitCreated == 1
                instance_create(j,0,obj_Exit)
        }
    }
    
    for(i = 16; i <= 64; i+= 16) // create exit vertical
    {       
        if exitCreated != 1
        { 
            exitCreated = round(random(15))
            
            if exitCreated == 1            
                instance_create(0,i,obj_Exit)
        }
        
        if exitCreated != 1
        {        
            exitCreated = round(random(15))
            
            if exitCreated == 1           
                instance_create(112,i,obj_Exit)
        }
    }
}
