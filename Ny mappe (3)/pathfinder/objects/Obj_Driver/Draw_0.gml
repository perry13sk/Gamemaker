
mp_grid_draw(grid_Driver)
//draw_self()
draw_path(path_Move,mouse_x,mouse_y,1)





// Tegn køretøjet
draw_sprite_ext(Sprite_Driver, 0, x, y, 1, 1, image_angle, c_white, 1);





draw_circle_color(path_get_point_x(path_Move,0)
				,path_get_point_y(path_Move,0)
				,10,c_red,c_red,0)


draw_text(10, 10, "pungter: " + string(path_get_number(path_Move)));
draw_text(10, 30, "speed: " + string(speed));
//draw_text(10, 50, ": " + string(abs(-angle_difference(image_angle,nextcorner))));