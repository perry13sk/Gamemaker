/// Draw Event
if (visible) {
    draw_set_color(c_gray);
    draw_rectangle(x, y, x + menu_width, y + menu_height, false);
    
    for (var i = 0; i < array_length(menu_items); i++) {
        var item_y = y + padding + i * item_height;
        
        if (i == highlight_index) {
            draw_set_color(c_white);
            draw_rectangle(x + padding, item_y, x + menu_width - padding, item_y + item_height, false);
        }
        
        draw_set_color(c_black);
        draw_text(x + padding, item_y, menu_items[i]);
    }
}

/// Function: execute_order
function execute_order(order) {
    show_message("Udfører: " + order);
}
