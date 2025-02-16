damage_state = Obj_Hull.damage;

// Hvis vi ikke allerede har en "final_angle", sæt den til den nuværende vinkel
if (!variable_global_exists("final_angle")) {
    global.final_angle = Obj_Driver.image_angle;
}

// FIND NÆSTE PUNKT
var next_x = path_get_x(path_Move, path_position + 0.01);
var next_y = path_get_y(path_Move, path_position + 0.01);

// BEREGN ØNSKET VINKEL
var target_angle = point_direction(x, y, next_x, next_y);

// JUSTER ROTATION
var rotation_done = adjust_rotation(target_angle, Obj_Driver);

// BEREGN AFSTANDE
var distance_to_next = point_distance(x, y, next_x, next_y);
var distance_to_end = point_distance(x, y, path_get_x(path_Move, 1), path_get_y(path_Move, 1));

// GEM DEN SENESTE GYLDIGE VINKEL (kun når vi faktisk bevæger os!)
if (rotation_done && distance_to_next > 5) {
    global.final_angle = Obj_Driver.image_angle;
}

// BEVÆG SIG FREMAD
if (rotation_done) {
    if (distance_to_next > 5) {
        x += lengthdir_x(path_speed, Obj_Driver.image_angle);
        y += lengthdir_y(path_speed, Obj_Driver.image_angle);
    } else {
        path_position += 0.01;
    }
}

// BREMSE OG STOP
if (distance_to_end < 32) { path_speed = max(path_speed - 0.1, 0.5); } // Bremser gradvist
if (distance_to_end < 5) { 
    path_speed = 0; 
    path_position = 1; // Sikrer, at vi ikke går videre

    // LÅS VINKLEN
    Obj_Driver.image_angle = global.final_angle;
}

/// OPRET EN NY PATH VED MOUSE CLICK
if (command == CMD_MOVE_SLOW) {
    if (mouse_check_button_pressed(mb_left)) {
        // Slet gammelt slutpunkt, hvis det eksisterer
        if (instance_exists(Obj_End_Point)) {
            instance_destroy(Obj_End_Point);
        }

        var new_end = instance_create_layer(mouse_x, mouse_y, "instances", Obj_End_Point);

        if (mp_grid_path(grid, path_Move, Obj_Hull.x, Obj_Hull.y, new_end.x, new_end.y, 1)) {
            if (path_exists(path_Move)) {
                path_position = 0; // Nulstil path-position
                path_speed = 4; // Genstart normal hastighed
                path_start(path_Move, path_speed, path_action_stop, false);
            }
        }
    }
}

if (command == CMD_MOVE_FAST) {
   // speed = 4;
}

if (command == CMD_REVERSE) {
   // speed = -2;
}

if (command == CMD_TURNE) {
   // direction += 5;
}

if (command == CMD_REPAIR) {
    damage -= 1; // Reparerer køretøjet langsomt
    if (damage <= 0) {
        command = CMD_STOP; // Stop reparation, når køretøjet er intakt
    }
}