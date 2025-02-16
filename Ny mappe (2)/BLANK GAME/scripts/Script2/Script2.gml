function adjust_rotation(target_angle, obj_driver) {
    // Beregn forskellen i vinkel mellem den nuværende og ønskede vinkel
    var angle_diff = angle_difference(obj_driver.image_angle, target_angle);

    // Hvis forskellen er stor (f.eks. mere end 0.1 grader), drej langsomt mod den ønskede vinkel
    if (abs(angle_diff) > 0.1) {
        var turn_speed = 1; // Sæt rotationshastigheden
        obj_driver.image_angle -= sign(angle_diff) * min(abs(angle_diff), turn_speed); // Drej langsomt
        return false; // Rotation pågår
    }
    
    // Hvis forskellen er lille nok, stop rotationen og sæt den præcist til målvinklen
    obj_driver.image_angle = target_angle;
    
    // Tjek for præcist 0 grader (hvis det er målet)
    if (obj_driver.image_angle == 360) {
        obj_driver.image_angle = 0;
    }

    return true; // Rotation færdig
}