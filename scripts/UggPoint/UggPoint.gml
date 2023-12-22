/// @param x
/// @param y
/// @param z
/// @param [color]

function UggDebugDrawPoint(_x, _y, _z, _color = UGG_DEFAULT_DIFFUSE_COLOR)
{
    return UggDebugDrawSphere(_x, _y, _z, UGG_POINT_RADIUS, _color);
}