// Følg efter spilleren
if (instance_exists(Obj_Player)) {
    var dir = point_direction(x, y, Obj_Player.x, Obj_Player.y);
    x += lengthdir_x(speed, dir);
    y += lengthdir_y(speed, dir);
}

// Hvis fjenden dør
if (hp <= 0) {
    instance_destroy();
}