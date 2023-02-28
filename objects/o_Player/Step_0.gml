 /// @description 




//get player inputs: true or false aka 1 or 0... can be used in math equations
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

run_left = keyboard_check(ord("A")) && vk_shift;
run_right = keyboard_check(ord("D")) && vk_shift;

//calculate movement:
var _move = key_right - key_left;	//if left AND right held, no movement (1 - 1 = 0)
var run_move = run_left - run_right; 
hsp = _move * walksp;
vsp = vsp + grv; 





if (place_meeting(x, y+1, oWall)) && (key_jump) //asking if key jump press is true
{
	vsp = -jumpsp;
}

//Horizontal Collision:
if(place_meeting(x+hsp, y, oWall))  //if player hitbox overlaps with oWall, returns true
{   
	
	while (!place_meeting(x+sign(hsp), y, oWall))
	{
		x = x + sign(hsp);	
	}
	
	hsp = 0;
}
x = x + hsp;


//Vertical Collision
if(place_meeting(x, y + vsp, oWall))  //if player hitbox overlaps with oWall, returns true
{   
	
	while (!place_meeting(x, y+sign(vsp), oWall))
	{
		y = y + sign(vsp);	
	}
	
	vsp = 0;
}
y = y + vsp;

//Animation:

if (!place_meeting(x, y+1, oWall))		//while jumping in the air
{
	//sprite_index = spr_player_jump;
	//image_speed = 0;
	if (vsp > 0)	//if falling down
	{
		
		sprite_index = spr_player_jump_down;
	}
	else			//if jumping upwards
	{ 
		sprite_index = spr_player_jump_up;
	}	
}

else				//while not jumping
{
	if (hsp == 0)		//while not walking
	{
		//image_speed = 1;
		sprite_index = spr_player_idle;
	}
	else		//while walking
	{
		//image_speed = 1;
		sprite_index = spr_player_walk;	
	}
}

if (hsp != 0)
{
	image_xscale = sign(hsp);		//scales image horizontally based on right or left movement
}
 