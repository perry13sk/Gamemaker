// Bevægelse (WASD eller piletaster)
var move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var move_y = keyboard_check(vk_down) - keyboard_check(vk_up);

if (move_x != 0 || move_y != 0) {
    move_x = sign(move_x);
    move_y = sign(move_y);
    x += move_x * speed;
    y += move_y * speed;
}

// Angreb (tryk på SPACE)
if (keyboard_check_pressed(vk_space) && can_attack) {
    can_attack = false;
    attack_timer = attack_cooldown;
    instance_create_layer(x + 16, y, "Instances", Obj_Attack);
}

// Cooldown-timer for angreb
if (!can_attack) {
    attack_timer -= 1;
    if (attack_timer <= 0) {
        can_attack = true;
    }
}