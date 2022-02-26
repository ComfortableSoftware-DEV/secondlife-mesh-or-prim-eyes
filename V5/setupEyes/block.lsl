

default
{

  state_entry()
  {
    llSetLinkPrimitiveParams(1, [
        PRIM_ROTATION, llEuler2Rot(<0, 0, 0> * DEG_TO_RAD),
        PRIM_POSITION, <0, 0, 0>
    ]);
    llSetLinkPrimitiveParams(2, [
        PRIM_ROTATION, llEuler2Rot(<0, 0, 0> * DEG_TO_RAD),
        PRIM_POSITION, <0, 0, 0>
    ]);
  }
}
