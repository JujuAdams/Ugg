// Feather disable all

if (keyboard_check_pressed(ord("R")))
{
    var _result = D3RandomVector();
    
    show_debug_message(_result);
    
    dX = 40*_result.x;
    dY = 40*_result.y;
    dZ = 40*_result.z;
}