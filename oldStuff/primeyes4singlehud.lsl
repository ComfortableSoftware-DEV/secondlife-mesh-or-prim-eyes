// version info
string myName = "THC eyes hud single";
string myVersion = "1.0.0";

key myHudTexture = "23d1662c-adfe-2b90-a0a8-18e8538e9b2a";
vector myLightSize;
vector myButtonSize = <0.05, 0.05, 0.05>;
vector myHudSize = <0.1, 0.4, 0.4>;
vector myEyeSize = <0.1, 0.1, 0.1>;
vector myPosition = <0.0, 0.0, 0.0>;
list mySizes = [
    <0.025, 0.025, 0.025>,
    <0.030, 0.030, 0.030>,
    <0.035, 0.035, 0.035>,
    <0.040, 0.040, 0.040>,
    <0.045, 0.045, 0.045>,
    <0.050, 0.050, 0.050>
];
list primPosns = [
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>
];
integer maxPrim = 6; // 4/6 for single & 8/10 for multi texture
integer myShiny = 0;
integer myAttachPoint;
integer isFullBright = TRUE;
integer myChannelOut = -246801;
integer myChannelIn = -246805;
integer myIndexNum;
integer myPrimTouched;
integer myCol;
integer myRow;
integer horizontal = 8;
integer vertical = 24;

float myVisibleY;
float myLeftEdge;
float myTopEdge;
float myGlow = 0.0;
float myIrisGlow = 0.0;

messageOther(integer toSend, integer myOther)
{
    if ((toSend == 0) || (toSend == 1))
    {
        llWhisper(myOther, (string)myEyeSize + "|Size");
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
    if (toSend == -1)
    {
        llWhisper(myOther, "|Spew");
    }
}

hideLights(integer prim2Hide)
{
    llSetLinkPrimitiveParams(prim2Hide, [
        PRIM_POS_LOCAL, <0, 0, 0>
    ]);
    llSleep(0.5);
}

initMe()
{
    hideLights(-3);
    llListen(myChannelIn, "", llGetOwner(), "");
    myLeftEdge = -(myHudSize.x / 2) + (myHudSize.y / 2);
    myTopEdge = (myHudSize.z / 2) - (myHudSize.y / 2);
    myLightSize = <myHudSize.y, 0.0001, myHudSize.y>;
    myVisibleY = -(myHudSize.y - 0.01);
}

setup()
{
    llSetPrimitiveParams([
        PRIM_TEXTURE, 4, myHudTexture, <1.0, 0.333333, 0.0>, <0.0, 0.333333, 0.0>, 0 * DEG_TO_RAD,
        PRIM_SIZE, myHudSize
    ]);
    llSetLinkPrimitiveParamsFast(-3, [
        PRIM_SIZE, myButtonSize,
        PRIM_TEXTURE, ALL_SIDES, "922b704a-48c2-91db-21d4-915094bb03f8", <1.0, 1.0, 0.0>, <0.0, 0.0, 0.0>, 0 * DEG_TO_RAD,
        PRIM_COLOR, ALL_SIDES, <1.0, 1.0, 1.0>, 1.0,
        PRIM_ROT_LOCAL, llEuler2Rot(<0.0, 0.0, 0.0>)
    ]);
    myAttachPoint = llGetAttached();
    if ((myAttachPoint < 31) || (myAttachPoint > 38))
    {
        llOwnerSay("I am designed to be attached to a HUD position, I can't work attached here");
    }
    messageOther(-1, myChannelOut);
}

doMessage(string msg, string id)
{
    if (id == "FullBright")
    {
        isFullBright = (integer)msg;
        return;
    }
    if (id == "Size");
    {
        myEyeSize = (vector)msg;
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
}

indicatorTouched()
{
    vector myTPrimPosn = llList2Vector(primPosns, myPrimTouched - 2);
    if ((myPrimTouched >= 3) && (myPrimTouched <= maxPrim))
    {
        myCol = (integer)myTPrimPosn.x;
        myRow = (integer)myTPrimPosn.z;
    }
}

lightAConfig(integer lightCol, integer lightRow, integer primNum, integer yesNo)
{
    // primnums #2 glow, #3 preset sizes, #4 shine, #5 full bright
    integer tempRow = (lightRow & 7);
    float tempX = (myLeftEdge + (lightCol * myHudSize.y));
    float tempZ = (myTopEdge - (tempRow * myHudSize.y));
    vector myLightPos = <tempX, myVisibleY, tempZ>;
    if (yesNo)
    {
        llSetLinkPrimitiveParamsFast(primNum, [
            PRIM_POS_LOCAL, myLightPos
        ]);
        primPosns = llListReplaceList(primPosns, [<lightCol, 0, lightRow>], primNum - 2, primNum - 2);
    }
    else
    {
        llSetLinkPrimitiveParams(primNum, [
            PRIM_POS_LOCAL, <0, 0, 0>
        ]);
        primPosns = llListReplaceList(primPosns, [<0.0, 0.0, 0.0>], primNum - 2, primNum - 2);
    }
}

IWasCleanTouched()
{
    if (myIndexNum == 0)
    {
        // all sizes +0.001
        myEyeSize += <0.001, 0.001, 0.001>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 1)
    {
        // x/depth +0.001
        myEyeSize += <0.001, 0.0, 0.0>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 2)
    {
        // z/height +0.001
        myEyeSize += <0.0, 0.0, 0.001>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 3)
    {
        // position up +.001 z
        myPosition += <0.0, 0.0, 0.001>;
        messageOther(2, myChannelOut);
        return;
    }
    if (myIndexNum == 4)
    {
        // position +x 0.001
        myPosition += <0.001, 0.0, 0.0>;
        messageOther(2, myChannelOut);
        return;
    }
    if (myIndexNum == 8)
    {
        // width +0.001 y
        myEyeSize += <0.0, 0.001, 0.0>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 9)
    {
        // default size
        myEyeSize = <0.1, 0.1, 0.1>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 10)
    {
        // width -0.001 y
        myEyeSize -= <0.0, 0.001, 0.0>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 11)
    {
        // position +y
        myPosition += <0.0, 0.0, 0.0>;
        messageOther(2, myChannelOut);
        return;
    }
    if (myIndexNum == 12)
    {
        // default position
        myPosition = <0.0, 0.0, 0.0>;
        messageOther(2, myChannelOut);
        return;
    }
    if (myIndexNum == 13)
    {
        // position -y
        myPosition -= <0.0, 0.001, 0.0>;
        messageOther(2, myChannelOut);
        return;
    }
    if (myIndexNum == 16)
    {
        // all sizes -0.001
        myEyeSize -= <0.001, 0.001, 0.001>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 17)
    {
        // size -x
        myEyeSize -= <0.001, 0.0, 0.0>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 18)
    {
        // size -z
        myEyeSize -= <0.0, 0.0, 0.001>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 19)
    {
        // position -z
        myPosition -= <0.0, 0.0, 0.001>;
        messageOther(2, myChannelOut);
        return;
    }
    if (myIndexNum == 20)
    {
        // position -x
        myPosition -= <0.001, 0.0, 0.0>;
        messageOther(2, myChannelOut);
        return;
    }
    if (myIndexNum == 24)
    {
        // size = 0.025
        myEyeSize = <0.025, 0.025, 0.025>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 25)
    {
        // size = 0.30
        myEyeSize = <0.030, 0.030, 0.030>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 26)
    {
        // size = 0.035
        myEyeSize = <0.035, 0.035, 0.035>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 27)
    {
        // size = 0.040
        myEyeSize = <0.04, 0.04, 0.04>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 28)
    {
        // size = 0.045
        myEyeSize = <0.045, 0.045, 0.045>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 29)
    {
        // size = 0.05
        myEyeSize = <0.05, 0.05, 0.05>;
        messageOther(1, myChannelOut);
        return;
    }
    if (myIndexNum == 5)
    {
        // glow off/0
        myGlow = 0.0;
        messageOther(5, myChannelOut);
        return;
    }
    if (myIndexNum == 6)
    {
        // glow .1
        myGlow = 0.1;
        messageOther(5, myChannelOut);
        return;
    }
    if (myIndexNum == 7)
    {
        // glow 0.2
        myGlow = 0.2;
        messageOther(5, myChannelOut);
        return;
    }
    if (myIndexNum == 14)
    {
        // glow 0.3
        myGlow = 0.3;
        messageOther(5, myChannelOut);
        return;
    }
    if (myIndexNum == 15)
    {
        // glow 0.4
        myGlow = 0.4;
        messageOther(5, myChannelOut);
        return;
    }
    if (myIndexNum == 22)
    {
        // glow 0.5
        myGlow = 0.5;
        messageOther(5, myChannelOut);
        return;
    }
    if (myIndexNum == 23)
    {
        // glow 0.6
        myGlow = 0.6;
        messageOther(5, myChannelOut);
        return;
    }
    if (myIndexNum == 30)
    {
        // glow 0.7
        myGlow = 0.7;
        messageOther(5, myChannelOut);
        return;
    }
    if (myIndexNum == 31)
    {
        // glow 0.8
        myGlow = 0.8;
        messageOther(5, myChannelOut);
        return;
    }
    if (myIndexNum == 38)
    {
        // glow 0.9
        myGlow = 0.9;
        messageOther(5, myChannelOut);
        return;
    }
    if (myIndexNum == 39)
    {
        // glow 1.0
        myGlow = 1.0;
        messageOther(5, myChannelOut);
        return;
    }
    if (myIndexNum == 32)
    {
        // shiny 0
        myShiny = 0;
        messageOther(3, myChannelOut);
        return;
    }
    if (myIndexNum == 33)
    {
        // shiny 1
        myShiny = 1;
        messageOther(3, myChannelOut);
        return;
    }
    if (myIndexNum == 34)
    {
        // shiny 2
        myShiny = 2;
        messageOther(3, myChannelOut);
        return;
    }
    if (myIndexNum == 35)
    {
        // shiny 3
        myShiny = 3;
        messageOther(3, myChannelOut);
        return;
    }
    if (myIndexNum == 55)
    {
        // full bright toggle
        isFullBright = ! isFullBright;
        messageOther(4, myChannelOut);
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
    }

    touch_start(integer num)
    {
        vector TV1 = llDetectedTouchUV(0);
        if (TV1 == TOUCH_INVALID_TEXCOORD)
        {
            llSay(0, "The universe is broken, reboot universe and try again");
            llOwnerSay("I was touchd in a way that is not possible, on a texture other than the one on my faces");
            return;
        }
        float TF1 = TV1.x;
        float TF2 = 1.0-TV1.y;
        myRow = (integer)(TF2 / (1.0 / (float)vertical));
        myCol = (integer)(TF1 / (1.0 / (float)horizontal));
        myIndexNum = myRow * horizontal + myCol;
        myPrimTouched = llDetectedLinkNumber(0);
        if (myPrimTouched == 1)
        {
            IWasCleanTouched();
        }
        else
        {
            indicatorTouched();
            myIndexNum = myRow * horizontal + myCol;
            IWasCleanTouched();
        }
    }

}
