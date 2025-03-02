

if (mouse_check_button_pressed(mb_right)) {
    var menu_instance = instance_create_layer(mouse_x, mouse_y, "Instances", Obj_Ordrer_Menu);
    menu_instance.visible = true;
}




if path_get_number(path_Move) > 0 {
    // Hent første punkt (0) i pathen
    var target_x = path_get_point_x(path_Move, 0);
    var target_y = path_get_point_y(path_Move, 0);
    
    // Beregn retning og afstand
    var dir = point_direction(x, y, target_x, target_y);
    var dist = point_distance(x, y, target_x, target_y);
    
    // Beregn vinkeldifferencen for at dreje imod næste mål
    var dir_dif = angle_difference(image_angle, dir);
    
    // Juster max speed baseret på retning og afstand
    var max_speed = adjust_max_speed(1, dir_dif, dist, path_Move, 1, image_angle);
    
    // Drej imod næste mål
    if abs(dir_dif) > 1 {
        image_angle -= sign(dir_dif);
    }

    // Bevæge sig fremad
    if dist > arrival_threshold {
        direction = image_angle;
        if speed < max_speed {
            speed += 0.01;
            speed = min(speed, max_speed);
        }
        if speed > max_speed {
            speed -= 0.02;
            speed = max(speed, 0);
        }
    } else {
        // Når vi er tæt nok på punktet, fjern det og fortsæt til næste
        path_delete_point(path_Move, 0);  
    }
} else {
    if speed > 0 {
        speed -= 0.02;
    } else {
        speed = 0;
    }
}