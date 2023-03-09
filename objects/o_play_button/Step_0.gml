/// @description Creating action events for button

if(mouse_check_button_pressed(mb_left))		
{
	
	
	if (position_meeting(mouse_x, mouse_y, id))
	{
	 image_index = 1;
	//take you to home room (starts game)
	//OR if i decide to create a "load save / new game" system, take it to that menu
	}
}

if (mouse_check_button_released(mb_left))
{
   if (position_meeting(mouse_x, mouse_y, id))		///if mouse is clicked within collision box of button id
	{
	 image_index = 0;
	
	}
}