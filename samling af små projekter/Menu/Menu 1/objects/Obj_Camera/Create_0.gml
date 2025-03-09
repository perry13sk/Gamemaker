Cam_Width = 640;
Cam_Height = 360;
instance_create_layer( 0, 0, "Ins_Menu", Obj_Menu);


// Opret et kamera
cam = camera_create_view(0, 0, Cam_Width, Cam_Height, 0, noone, -1, -1, (Cam_Width/2), (Cam_Height/2));

// Sæt kameraet som aktivt
view_enabled = true;
view_set_camera(0, cam);

// Definer, hvilket objekt der skal følges
target = Obj_Player; // Skift dette for at følge et andet objekt


// Zoom
zoom = 1; // 1 = normal zoom
zoom_speed = 0.1; // Hvor hurtigt vi zoomer
zoom_min = 0.5; // Maks zoom ind (større tal = mere zoomet ud)
zoom_max = 2; // Maks zoom ud (mindre tal = mere zoomet ind)