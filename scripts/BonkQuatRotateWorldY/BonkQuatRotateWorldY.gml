function UggQuatRotateWorldY(_quat, _angle)
{
    return UggQuatMultiply(_quat, [0, 0.5*dsin(_angle), 0, dcos(0.5*_angle)]);
}