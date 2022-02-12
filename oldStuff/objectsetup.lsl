default
{
	state_entry()
	{
		llSetLocalRot(llEuler2Rot(<0, 0, 90>));
		llSetPrimitiveParams([PRIM_TYPE, PRIM_TYPE_SPHERE, 0, <0.25, 0.75, 0.0>, 0.0, <0.0, 0.0, 0.0>, <0.0, 1.0, 0.0>]);
		llSetPrimitiveParams([PRIM_TEXTURE, -1, "f66b56f0-7980-71a2-e0f4-d526cab3b4a1", <2.0, 1.0, 0>, <0.0, 0.0, 0.0>, 0]);
		llSetPrimitiveParams([PRIM_FULLBRIGHT, ALL_SIDES, 1]);
		llSetAlpha(0, ALL_SIDES);
		llSetAlpha(1, 1);
	}
}
