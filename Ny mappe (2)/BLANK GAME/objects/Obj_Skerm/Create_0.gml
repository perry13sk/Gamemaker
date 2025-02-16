#macro Screen_whidth 1920
#macro Screen_height 1080
DriverAlpha = 0.5;


// Opret et nyt kamera, der følger spilleren
camera = camera_create_view(0, 0, Screen_whidth, Screen_height, 0, Obj_Hull, -1, -1,(Screen_whidth/2),(Screen_height/2));
view_enabled = true; 
view_set_camera(0, camera);