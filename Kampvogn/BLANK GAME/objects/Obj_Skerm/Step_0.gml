if keyboard_check_pressed(vk_escape){game_end()};

// Kameraets position skal følge spilleren
var cam_x = x - (Screen_whidth/2);  // Juster så spilleren er centreret
var cam_y = y - (Screen_height/2);  

// Sæt kameraets position
camera_set_view_pos(camera, cam_x, cam_y);

