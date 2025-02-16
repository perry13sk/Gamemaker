// Draw Event in Obj_Hull
draw_set_color(c_white)
if (command == CMD_MOVE_SLOW) 
{
mp_grid_path(grid,path_draw,x,y,mouse_x,mouse_y,1)
if (path_exists(path_draw)) {
    draw_path(path_draw, 0, 0, true);
}}

draw_self()

/*
draw_text(10, 510, ": " + string(aa) + " :");
draw_text(10, 530, ": " + string(bb) + " :");
draw_text(10, 550, ": " + string(image_angle) + " :");
draw_text(10, 570, ": " + string(cc) + " :");




