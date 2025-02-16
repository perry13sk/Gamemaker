path_start( Path1, 2, path_action_restart, true);

var cell_size = 16;

grid = mp_grid_create( 0, 0, room_width / cell_size, room_height / cell_size, cell_size, cell_size);

mp_grid_add_instances( grid, objWall, false);