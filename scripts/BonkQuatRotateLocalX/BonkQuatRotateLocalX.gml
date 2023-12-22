function UggQuatRotateLocalX(_quat, _angle)
{
    return UggQuatMultiply([0.5*dsin(_angle), 0, 0, dcos(0.5*_angle)], _quat);
}