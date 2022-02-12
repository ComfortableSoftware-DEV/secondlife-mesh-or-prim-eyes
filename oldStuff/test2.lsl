default
{
    state_entry()
    {
        llListen(-10, "", "", "");

    }

    listen(integer channel, string name, key id, string msg)
    {
        llOwnerSay("id " + (string)id + " msg " + msg);
        string command = llGetSubString(msg, 0, 7);
        llOwnerSay("command " + command);
        if (command == "texture=")
        {
            string texName = llGetSubString(msg, 8, llStringLength(msg) - 1);
            llOwnerSay("texname " + texName);
            llSetPrimitiveParams([
                PRIM_SIZE, <0.01850, 0.031, 0.031>,
                PRIM_TEXTURE, ALL_SIDES, texName, <1, 1, 0>, <0.0, 0.0, 0.0>,0 * DEG_TO_RAD
            ]);
        }

    }

}
