UggAxes();

if (mouse_check_button_pressed(mb_right))
{
    line = D3FrustrumLine(matrix_get(matrix_view), matrix_get(matrix_projection));
}

UggLine(line.x1, line.y1, line.z1, line.x2, line.y2, line.z2);