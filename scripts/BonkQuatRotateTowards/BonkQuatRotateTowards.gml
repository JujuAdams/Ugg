/// @param quaternion
/// @param x
/// @param y
/// @param z
/// @param step

function UggQuatRotateTowards(_quat, _x, _y, _z, _step)
{
    var _angle = UggQuatAngleTo(_quat, _x, _y, _z);
    if (_angle == 0) return UggQuatDuplicate(_quat);
    
    var _t = min(1, _step/_angle);
    return UggQuatSlerp(_quat, [_x, _y, _z, 0], _t);
}