function adjust_max_speed(base_speed, dir_dif, dist, path, lookahead_steps, current_image_angle) {
    var speed_factor = 1.0; // Start med fuld hastighed
    
    // Se fremad i pathen og få afstanden til næste sving
    var dist_to_next_swing = 0;
    var future_dir_dif = 0;
    if path_get_number(path) > lookahead_steps {
        var next_point_x = path_get_point_x(path, lookahead_steps);
        var next_point_y = path_get_point_y(path, lookahead_steps);
        dist_to_next_swing = point_distance(x, y, next_point_x, next_point_y);
        
        // Beregn den fremtidige vinkel baseret på næste punkt i pathen
        var future_dir = point_direction(x, y, next_point_x, next_point_y);
        future_dir_dif = angle_difference(current_image_angle, future_dir);  // Brug current_image_angle her
    }
    
    // Juster hastigheden afhængigt af afstanden til næste sving
    var brake_distance = 100;  // Afstanden, hvor vi begynder at bremse før næste sving
    var dist_factor = clamp(dist_to_next_swing / brake_distance, 0.2, 1);  // Skalering afhængigt af afstanden
    
    // Hvis vi er tættere på næste sving, begynd at bremse
    if dist_to_next_swing < brake_distance {
        speed_factor = dist_factor; // Jo tættere vi er, jo langsommere vi skal køre, men ikke stop
    }
    
    // Reducer hastigheden yderligere ved store vinkelændringer
    var combined_dir_dif = max(abs(dir_dif), abs(future_dir_dif)); // Brug både aktuel og fremtidig vinkelændring
    if combined_dir_dif > 15 {
        speed_factor *= 0.7; // Reducer hastighed med 30% ved små sving
    }
    if combined_dir_dif > 45 {
        speed_factor *= 0.5; // Kraftigere reduktion ved skarpe sving
    }

    // Hvis vi er tættere på næste vinkel, fortsæt nedbremsning, indtil vi er tættere på den ønskede vinkel
    var target_dir = point_direction(x, y, path_get_point_x(path, 0), path_get_point_y(path, 0)); // Retningen mod næste punkt
    if abs(angle_difference(current_image_angle, target_dir)) > 5 {
        // Forsæt nedbremsning, indtil vi er tættere på den ønskede vinkel
        speed_factor = min(speed_factor, 0.2);  
    }
    
    // Hvis vinkeldifferencen er meget stor (f.eks. 90 grader), så fortsæt med at bremse ned til 0
    if abs(angle_difference(current_image_angle, target_dir)) > 45 {
        speed_factor = 0.1;  // Reducer hastigheden markant ved store sving
    }

    // Når vi er tæt nok på den ønskede vinkel, begynd at accelerere igen
    if abs(angle_difference(current_image_angle, target_dir)) < 5 && speed_factor <= 0.2 {
        speed_factor = 1;  // Start accelerationen igen, når vi er tæt nok på den ønskede retning
    }

    // Returnér den justerede hastighed
    return base_speed * speed_factor;
}