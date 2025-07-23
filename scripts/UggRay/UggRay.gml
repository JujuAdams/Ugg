// Feather disable all

/// Draws a line between two coordinates.
/// 
/// @param x
/// @param y
/// @param z
/// @param dX
/// @param dY
/// @param dZ
/// @param [color]
/// @param [length]
/// @param [thickness]
/// @param [wireframe}

function UggRay(_x, _y, _z, _dX, _dY, _dZ, _color = UGG_DEFAULT_DIFFUSE_COLOR, _length =  UGG_DEFAULT_RAY_LENGTH, _thickness = UGG_LINE_THICKNESS, _wireframe = undefined)
{
    var _viewMatrix = matrix_get(matrix_view);
    var _invViewMatrix = __UggMatrixInvert(_viewMatrix);
    var _camX = _invViewMatrix[12];
    var _camY = _invViewMatrix[13];
    var _camZ = _invViewMatrix[14];
    
    UggLine(_x, _y, _z,   _x + _length*_dX, _y + _length*_dY, _z + _length*_dZ,   _color, _thickness, _wireframe);
}