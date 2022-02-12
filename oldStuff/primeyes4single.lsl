// version info
string myName = "THC prim eyes single arteyes-1009";
string myVersion = "4.0.0";
key myTexture = "92b158e0-109e-224d-51c3-d935a5fac926";
integer isPrim = TRUE;

vector mySize = <0.1, 0.1, 0.1>; // #1
vector myPosition = <0.0, 0.0, 0.0>; // #2
integer myShiny; //0-3 off-high // #3
integer isFullBright = TRUE; // #4
float myGlow = 0.0; // #5

key myOwner;
integer myLinkNumber;
integer myAttachPoint;
integer myChannelOut = -246805;
integer myChannelIn = -246801;

messageOther(integer toSend, integer myOther)
{
    if (toSend != 0)
    {
        return;
    }
    if (myAttachPoint == 15)
    {// 0 = all
        if ((toSend == 0) || (toSend == 1))
        {
            llWhisper(myOther, (string)mySize + "|Size");
        }
        if ((toSend == 0) || (toSend == 2))
        {
            llWhisper(myOther, (string)myPosition + "|Position");
        }
        if ((toSend == 0) || (toSend == 3))
        {
            llWhisper(myOther, (string)myShiny + "|Shiny");
        }
        if ((toSend == 0) || (toSend == 4))
        {
            llWhisper(myOther, (string)isFullBright + "|FullBright");
        }
        if ((toSend == 0) || (toSend == 5))
        {
            llWhisper(myOther, (string)myGlow + "|Glow");
        }
    }
}

initMe()
{
    myAttachPoint = llGetAttached();
    myLinkNumber = llGetLinkNumber();
    if ((myAttachPoint >= 15) && (myAttachPoint <= 16))
    {
        llListen(myChannelIn, "", "", "");
    }
    myOwner = llGetOwner();
}

setup()
{
    if ((myAttachPoint < 15) || (myAttachPoint > 16))
    {
        llOwnerSay("I am designed to be attached to eyeballs, I can't work attached here.");
    }
    vector TMySize;
    if (myAttachPoint)
    {
        TMySize = mySize;
    }
    else
    {
        TMySize = mySize * 50;
    }
    if (isPrim)
    {
        llSetPrimitiveParams([
            PRIM_SIZE, TMySize,
            PRIM_TEXTURE, ALL_SIDES, myTexture, <PI, PI / 2, 0>, <0.0, 0.2, 0.0>,90 * DEG_TO_RAD,
            PRIM_FULLBRIGHT, ALL_SIDES, isFullBright,
            PRIM_GLOW, ALL_SIDES, myGlow,
            PRIM_BUMP_SHINY, ALL_SIDES, myShiny, 0,
            PRIM_POSITION, myPosition,
            PRIM_ROTATION, llEuler2Rot(<0.0, 0.0, 114.59> * DEG_TO_RAD)
        ]);
    }
    else
    {
        llSetPrimitiveParams([
            PRIM_SIZE, TMySize,
            PRIM_TEXTURE, ALL_SIDES, myTexture, <1, 1, 0>, <0.0, 0.0, 0.0>,0 * DEG_TO_RAD,
            PRIM_FULLBRIGHT, ALL_SIDES, isFullBright,
            PRIM_GLOW, ALL_SIDES, myGlow,
            PRIM_BUMP_SHINY, ALL_SIDES, myShiny, 0,
            PRIM_POSITION, myPosition,
            PRIM_ROTATION, llEuler2Rot(<0.0, 0.0, 0.0> * DEG_TO_RAD)
        ]);
    }
}

doMessage(string msg, string id)
{
    if (id == "FullBright")
    {
        isFullBright = (integer)msg;
        return;
    }
    if (id == "Position")
    {
        myPosition = (vector)msg;
        return;
    }
    if (id == "Glow")
    {
        myGlow = (float)msg;
        return;
    }
    if (id == "Shiny")
    {
        myShiny = (integer)msg;
        return;
    }
    if (id == "Spew")
    {
        if (myAttachPoint == 15)
        {
            messageOther(0, myChannelOut);
        }
        return;
    }
    if (id == "Size");
    {
        mySize = (vector)msg;
        return;
    }
}

default
{

    state_entry()
    {
        initMe();
        setup();
    }

    on_rez(integer num)
    {
        initMe();
        setup();
    }

    changed(integer change)
    {
        if (change & CHANGED_OWNER)
        {
            llResetScript();
        }
    }

    listen(integer channel, string name, key id, string msg)
    {
        list TL1 = llParseString2List(msg, ["|"], []);
        doMessage(llList2String(TL1,0), llList2String(TL1, 1));
        setup();
        return;
    }
}
