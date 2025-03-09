// Hent musens position i GUI-laget
var mx = window_mouse_get_x();
var my = window_mouse_get_y();

// Tjek om musen er over Gunner-kassen
var hover_Gunner = (mx >= 10 && mx <= 210 && my >= 10 && my <= 70);

// Tjek om musen er over Driver-kassen
var hover_Driver = (mx >= display_get_gui_width() - 210 && mx <= display_get_gui_width() - 10 
                  && my >= 10 && my <= 70);

// Højreklik for at åbne menuen
if (mouse_check_button_pressed(mb_right)) {
    if (hover_Driver) {
        menu_active = true;
        menu_type = "Driver";
        menu_x = mx;
        menu_y = my;
    }
    else if (hover_Gunner) {
        menu_active = true;
        menu_type = "Gunner";
        menu_x = mx;
        menu_y = my;
    }
    else {
        menu_active = false; // Luk menu, hvis vi højreklikker uden for kasserne
    }
}