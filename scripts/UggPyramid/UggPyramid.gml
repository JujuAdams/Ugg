/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param z1
/// @param z2
/// @param [color]

function UggPyramid(_x1, _y1, _x2, _y2, _z1, _z2, _color = UGG_DEFAULT_DIFFUSE_COLOR) 
{
    //TODO - Optimise
    
    var _cx = 0.5*(_x1 + _x2);
    var _cy = 0.5*(_y1 + _y2);
    
    UggTriangle(_x1, _y1, _z1,   _x2, _y1, _z1,   _cx, _cy, _z2,   _color);
    UggTriangle(_x2, _y1, _z1,   _x2, _y2, _z1,   _cx, _cy, _z2,   _color);
    UggTriangle(_x2, _y2, _z1,   _x1, _y2, _z1,   _cx, _cy, _z2,   _color);
    UggTriangle(_x1, _y2, _z1,   _x1, _y1, _z1,   _cx, _cy, _z2,   _color);
    
    UggQuad(_x1, _y1, _z1,   _x1, _y2, _z1,   _x2, _y1, _z1,   _color);
}
