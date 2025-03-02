/// Step Event
if (visible) {
    // Opdater musens position
    var mx = mouse_x;
    var my = mouse_y;
    highlight_index = -1;
    
    // Tjek om musen er over et menu-element
    for (var i = 0; i < array_length(menu_items); i++) {
        var item_y = y + padding + i * item_height;
        if (my > item_y && my < item_y + item_height) {
            highlight_index = i;
            break;
        }
    }
    
    // Luk menuen ved venstreklik uden for
    if (mouse_check_button_pressed(mb_left)) {
        if (highlight_index != -1) {
            execute_order(menu_items[highlight_index]); // Udfør ordren
        }
        visible = false;
    }
    
    // Luk og åbn menuen et nyt sted ved højreklik uden for
    if (mouse_check_button_pressed(mb_right)) {
        if (mx < x || mx > x + menu_width || my < y || my > y + menu_height) {
            x = mx;
            y = my;
            
            // Sørg for, at menuen ikke går uden for skærmen
            if (x + menu_width > room_width) x = room_width - menu_width;
            if (y + menu_height > room_height) y = room_height - menu_height;
        }
    }
}