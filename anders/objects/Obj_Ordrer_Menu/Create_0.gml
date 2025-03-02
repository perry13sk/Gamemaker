/// Create Event
menu_items = ["Kør frem", "Drej venstre", "Drej højre", "Stop"];
menu_width = 0;
menu_height = 0;
padding = 10;
item_height = 20;
highlight_index = -1;
visible = false;

// Beregn menuens bredde ud fra den længste tekst
var max_text_width = 0;
for (var i = 0; i < array_length(menu_items); i++) {
    var text_width = string_width(menu_items[i]);
    if (text_width > max_text_width) max_text_width = text_width;
}
menu_width = max_text_width + padding * 2;
menu_height = item_height * array_length(menu_items) + padding * 2;