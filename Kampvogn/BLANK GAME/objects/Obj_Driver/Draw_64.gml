
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if Obj_Skerm.DriverAlpha = 1 and device_mouse_check_button_pressed(0,mb_right) { DriverMenu = true }

// Hvis menuen er synlig, tegn valgmuligheder
if (DriverMenu) {
    var menu_x =  (Screen_whidth-(sprite_get_width(Sprite_Driver))) + 20;
    var menu_y = 70;
    var btn_width = 100;
    var btn_height = 30;
    var btn_gap = 5;
    
    // Dynamisk liste af mulige kommandoer
    var commands = [];
    
 // Tjek for skadestatus
switch (damage_state) {
    case DAMAGE_NONE:
        // Ingen skade
        array_push(commands, CMD_STOP);
        array_push(commands, CMD_MOVE_SLOW);
        array_push(commands, CMD_MOVE_FAST);
        array_push(commands, CMD_REVERSE);
        array_push(commands, CMD_TURNE);
        break;
        
    case DAMAGE_LIGHT:
        // Let skade - køretøjet er stadig fuldt funktionelt
        array_push(commands, CMD_STOP);
        array_push(commands, CMD_MOVE_SLOW);
        array_push(commands, CMD_MOVE_FAST);
        array_push(commands, CMD_REVERSE);
        array_push(commands, CMD_TURNE);
        array_push(commands, CMD_REPAIR);  // Repair muligt, men ikke nødvendigt endnu
        break;
        
    case DAMAGE_MEDIUM:
        // Medium skade - køretøjet kører langsommere
        array_push(commands, CMD_STOP);
        array_push(commands, CMD_MOVE_SLOW);
        array_push(commands, CMD_REVERSE);
        array_push(commands, CMD_TURNE);
        array_push(commands, CMD_REPAIR);  // Repair muligt for at undgå yderligere skade
        break;
        
    case DAMAGE_HEAVY:
        // Alvorlig skade - køretøjet er immobiliseret
        array_push(commands, CMD_REPAIR);  // Repair er den eneste mulighed
        break;
        
    case DAMAGE_DESTROYED:
        // Ødelagt - køretøjet er ude af spillet
        // Ingen kommandoer kan vælges, måske fjern objektet fra spillet her
        break;
}
    
    // Tegn knapper
    for (var i = 0; i < array_length(commands); i++) {
        var btn_y = menu_y + (btn_height + btn_gap) * i;
        var cmd = commands[i];
        var label = "";

        // Navngiv kommandoer
        switch (cmd) {
            case CMD_STOP: label = "Stop"; break;
            case CMD_MOVE_SLOW: label = "Move Slow"; break;
            case CMD_MOVE_FAST: label = "Move Fast"; break;
            case CMD_REVERSE: label = "Reverse"; break;
            case CMD_TURNE: label = "Turn"; break;
            case CMD_REPAIR: label = "Repair"; break;
        }

        // Tegn knappen
        if (point_in_rectangle(mx, my, menu_x, btn_y, menu_x + btn_width, btn_y + btn_height)) {
            draw_set_color(c_gray);
            if (mouse_check_button_pressed(mb_left)) {
                with (Obj_Driver) command = cmd;
                DriverMenu = false;
            }
        } else {
            draw_set_color(c_black);
        }

        draw_rectangle(menu_x, btn_y, menu_x + btn_width, btn_y + btn_height, false);
        draw_set_color(c_white);
        draw_text(menu_x + 10, btn_y + 10, label);
    }
}