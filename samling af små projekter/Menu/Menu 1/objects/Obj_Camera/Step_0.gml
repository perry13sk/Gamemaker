if (instance_exists(target)) {
    // Opdater kameraets størrelse ved zoom
    var cam_width = Cam_Width * zoom;
    var cam_height = Cam_Height * zoom;
    camera_set_view_size(cam, cam_width, cam_height);

    // Beregn centreret kamera-position
    var cam_x = target.x - (cam_width / 2);
    var cam_y = target.y - (cam_height / 2);

    // Begræns kameraet inden for rummets grænser
    cam_x = clamp(cam_x, 0, room_width - cam_width);
    cam_y = clamp(cam_y, 0, room_height - cam_height);

    camera_set_view_pos(cam, cam_x, cam_y);
}

// Justér zoom med scroll
if (mouse_wheel_up()) {
    zoom = max(zoom - zoom_speed, zoom_min);
} 
if (mouse_wheel_down()) {
    zoom = min(zoom + zoom_speed, zoom_max);
}