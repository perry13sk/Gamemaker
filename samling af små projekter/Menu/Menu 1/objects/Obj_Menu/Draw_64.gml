
// Hent musens position i GUI-laget
var mx = window_mouse_get_x();
var my = window_mouse_get_y();

// Tjek om musen er over Health-kassen
var hover_Gunner = (mx >= 10 && mx <= 210 && my >= 10 && my <= 70);

// Tjek om musen er over Ammo-kassen
var hover_Driver = (mx >= display_get_gui_width() - 210 && mx <= display_get_gui_width() - 10 
                  && my >= 10 && my <= 70);

// Tegn Gunner-kasse
draw_set_color(hover_Gunner ? c_gray : c_dkgray);
draw_set_alpha(hover_Gunner ? 1 : 0.5);
draw_rectangle(10, 10, 200, 60, false);
draw_set_color(hover_Gunner ? c_white : c_ltgray);
draw_rectangle(10, 10, 200, 60, true);
draw_text(20, 20, " Gunner ");

draw_set_alpha(1);


// Tegn Driver-kasse
draw_set_color(hover_Driver ? c_gray : c_dkgray);
draw_set_alpha(hover_Driver ? 1 : 0.5);
draw_rectangle(display_get_gui_width() - 210, 10, display_get_gui_width() - 10, 60, false);
draw_set_color(hover_Driver ? c_white : c_ltgray);
draw_rectangle(display_get_gui_width() - 210, 10, display_get_gui_width() - 10, 60, true);
draw_text(display_get_gui_width() - 200, 20, " Driver " );

draw_set_alpha(1);

// order menu

// Tegn menuen, hvis aktiv
if (menu_active) {
    var menu_width = 120;
    var menu_height = 80;
    
    // Bestem muligheder baseret på menu_type
    var options = [];
    if (menu_type == "Driver") {
        options = ["Stop", "Move", "Turn"];
    } else if (menu_type == "Gunner") {
        options = ["Ceasefire", "Open Fire", "Search Area"];
    }

    // Tegn baggrund
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);
    
    draw_set_color(c_white);
    draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, true);
    
    // Tegn menu tekst
    for (var i = 0; i < array_length(options); i++) {
        draw_text(menu_x + 10, menu_y + 10 + (i * 20), options[i]);
    }
}