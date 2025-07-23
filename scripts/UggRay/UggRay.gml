// Feather disable all

/// Draws a line between two coordinates.
/// 
/// @param x
/// @param y
/// @param z
/// @param dX
/// @param dY
/// @param dZ
/// @param [length]
/// @param [color]
/// @param [thickness]
/// @param [wireframe}

function UggRay(_x, _y, _z, _dX, _dY, _dZ, _length = UGG_DEFAULT_RAY_LENGTH, _color = UGG_DEFAULT_DIFFUSE_COLOR, _thickness = UGG_LINE_THICKNESS, _wireframe = undefined)
{
    UggLine(_x, _y, _z,   _x + _length*_dX, _y + _length*_dY, _z + _length*_dZ,   _color, _thickness, _wireframe);
}