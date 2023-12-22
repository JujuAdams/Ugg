/// @param quaternion
/// @param x
/// @param y
/// @param z

function UggQuatAngleTo(_quat, _x, _y, _z)
{
    return 2*darccos(abs(clamp(UggQuatDot(_quat, [_x, _y, _z, 0]), -1, 1)));
}