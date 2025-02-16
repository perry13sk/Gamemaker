
// Opret et grid med celler på 64x64 pixels

 DriverGrid = 64;

grid_width = DriverGrid;
grid_height = DriverGrid;

new_gotoX = Obj_Driver.x;
new_gotoY = Obj_Driver.y;

move_speed = 1;
arrival_threshold = 5;


// Opret mp_grid baseret på rummets størrelse
grid_Driver = mp_grid_create(0, 0, room_width div grid_width, room_height div grid_height, grid_width, grid_height);

// Fyld grid'et med vægdata (marker celler med Obj_Blok som "blokkeret")
mp_grid_add_instances(grid_Driver, Obj_Blok, 1);  // Rettet objektnavn

// Opret path objekt
path_Move = path_add();