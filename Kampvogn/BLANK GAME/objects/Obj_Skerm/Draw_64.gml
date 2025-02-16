var DriverIcon = device_mouse_x_to_gui(0) > (Screen_whidth-(sprite_get_width(Sprite_Driver))) && 
				device_mouse_x_to_gui(0) < (Screen_whidth) &&
				device_mouse_y_to_gui(0) > 0 &&
				device_mouse_y_to_gui(0) < (sprite_get_height(Sprite_Driver));
if DriverIcon = true {DriverAlpha = 1} else {DriverAlpha = 0.5}

draw_sprite_ext(Sprite_Driver,0,(Screen_whidth-(sprite_get_width(Sprite_Driver))),0,1,1,0,c_white,DriverAlpha)
