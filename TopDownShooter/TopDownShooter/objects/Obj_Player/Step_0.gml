// Skrevet i Step Event for Obj_Player
var move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var MoveSpeed = 4; // Fast hastighed

// Normaliserer bevægelsen
if (move_x != 0 || move_y != 0) {
    var len = point_distance(0, 0, move_x, move_y);
    move_x /= len;
    move_y /= len;
}

// Forsøger at bevæge spilleren i X-retningen
if (!place_meeting(x + move_x * MoveSpeed, y, Obj_Block)) {
    x += move_x * MoveSpeed;
}

// Forsøger at bevæge spilleren i Y-retningen
if (!place_meeting(x, y + move_y * MoveSpeed, Obj_Block)) {
    y += move_y * MoveSpeed;
}