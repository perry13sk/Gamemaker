instance_create_layer(x,y,"instances",Obj_End_Point)
// CMD comandoer

#macro CMD_STOP 0
#macro CMD_MOVE_SLOW 1
#macro CMD_MOVE_FAST 2
#macro CMD_REVERSE 3
#macro CMD_TURNE 4
#macro CMD_REPAIR 5

// variabler
DriverMenu = false;
command = CMD_STOP;
damage = 51;

path_draw = path_add()
path_Move = path_add()

var cell_size = 64;
grid = mp_grid_create(0, 0, room_width div cell_size, room_height div cell_size, cell_size, cell_size);
mp_grid_add_instances(grid, Obj_Block, false);

aa = 1;

