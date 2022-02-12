string myName = "THC prim eyes hud";
string myVersion = "6.0.0";
integer myTalk = -24685;
integer myListen = -24680;

list myPrimSizes = [
    <0.025, 0.025, 0.025>,
    <0.030, 0.030, 0.030>,
    <0.035, 0.035, 0.035>,
    <0.040, 0.040, 0.040>,
    <0.045, 0.045, 0.045>,
    <0.050, 0.050, 0.050>
];
list myMeshSizes = [
    <0.0125, 0.025, 0.025>,
    <0.0150, 0.030, 0.030>,
    <0.0175, 0.035, 0.035>,
    <0.0200, 0.040, 0.040>,
    <0.0225, 0.045, 0.045>,
    <0.0250, 0.050, 0.050>
];

float myLeftEdge;
float mySetTimer;
float myTopEdge;
float myVisibleY;
integer horizontal = 8;
integer myCol;
integer myIndexNum;
integer myPrimTouched;
integer myRow;
integer myScreen;
integer myStartingIndex;
integer screens = 3;
integer vertical = 24;
key myOwner;
key myTexture = "477f6b41-4e01-f6cf-b3a9-8bd564d764b4";
string myObjectName;
vector myButtonSize;
vector myHudSize = <0.5, 0.5, 0.5>;
vector myMeshPosition = <0.01, 0.0, 0.0>;
vector myMeshSize = <0.05, 0.1, 0.1>;
vector myPrimPosition = <0.0, 0.0, 0.0>;
vector myPrimSize = <0.1, 0.1, 0.1>;

list myButtonZeroPos = [
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>,
    <0.0, 0.0, 0.0>
];
list myScreenRots = [
    270.0,
    180.0,
    90.0
];
list myTimes = [
    15.0,
    30.0,
    60.0,
    300.0,
    600.0,
    1800.0,
    3600.0
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
    <0.0, 0.0, 0.0>
];

float myGlow = 0.0;
float myTime = 30;
integer inSync = FALSE;
integer isFullBright = TRUE;
integer isNormal;
integer isPrim;
integer isRandomTexture = TRUE;
integer isRandomTime = TRUE;
integer isSpecular;
integer isTimed = TRUE;
integer myGlowFactor = 0;
integer myNumOfTextures;
integer myShiny; //0-3 off-high
integer myTextureNum = 0;
list myTextureNames;
list myTextureNums;
vector myEyePosition;
vector myEyeSize;

string onOff(integer myState)
{
    string retVal;
    if (myState == TRUE)
    {
        retVal = "on";
    }
    if (myState == FALSE)
    {
        retVal = "off";
    }
    if ((myState != TRUE) && (myState != FALSE))
    {
        retVal = "neither on nor off";
    }
    return retVal;
}

messageOther(integer toSend)
{
    if ((toSend == 0) || (toSend == 1))
    {
        llWhisper(myTalk, (string)myOwner + "|EyePosition|" + (string)myEyePosition);
    }
    if ((toSend == 0) || (toSend == 2))
    {
        llWhisper(myTalk, (string)myOwner +  "|EyeSize|" + (string)myEyeSize);
    }
    if ((toSend == 0) || (toSend == 3))
    {
        llWhisper(myTalk, (string)myOwner + "|RandomTexture|" + (string)isRandomTexture);
    }
    if ((toSend == 0) || (toSend == 4))
    {
        llWhisper(myTalk, (string)myOwner + "|RandomTime|" + (string)isRandomTime);
    }
    if ((toSend == 0) || (toSend == 5))
    {
        llWhisper(myTalk, (string)myOwner + "|Shiny|" + (string)myShiny);
    }
    if ((toSend == 0) || (toSend == 6))
    {
        llWhisper(myTalk, (string)myOwner + "|Timed|" + (string)isTimed);
    }
    if ((toSend == 0) || (toSend == 7))
    {
        llWhisper(myTalk, (string)myOwner + "|Sync|" + (string)inSync);
    }
    if ((toSend == 0) || (toSend == 8))
    {
        llWhisper(myTalk, (string)myOwner + "|FullBright|" + (string)isFullBright);
    }
    if ((toSend == 0) || (toSend == 9) || (toSend == -1))
    {
        llWhisper(myTalk, (string)myOwner + "|Time|" + (string)myTime);
    }
    if ((toSend == 0) || (toSend == 10) || (toSend == -1))
    {
        llWhisper(myTalk, (string)myOwner + "|TextureNum|" + (string)myTextureNum);
    }
    if ((toSend == 0) || (toSend == 11))
    {
        llWhisper(myTalk, (string)myOwner + "|GlowFactor|" + (string)myGlowFactor);
    }
    if ((toSend == 0) || (toSend == 12))
    {
        llWhisper(myTalk, (string)myOwner + "|Glow|" + (string)myGlow);
    }
    if (toSend == 13)
    {
        llOwnerSay("requesting HUDSync");
        llWhisper(myTalk, (string)myOwner + "|HUDSync|please");
    }
    if (toSend == 14)
    {
        llWhisper(myTalk, (string)myOwner + "|Specular|" + (string)isSpecular);
    }
    if (toSend == 15)
    {
        llWhisper(myTalk, (string)myOwner + "|Normal|" + (string)isNormal);
    }
}


setConfigs()
{
    hideLights(-3);
    integer myCol2Set;
    integer myRow2Set;
    integer sendThisOne;
    if (myScreen == 0)
    {
        if (myGlow == 0)
        {
            myCol2Set = 5;
            myRow2Set = 0;
        }
        if (myGlow == 0.1)
        {
            myCol2Set = 6;
            myRow2Set = 0;
        }
        if (myGlow == 0.2)
        {
            myCol2Set = 7;
            myRow2Set = 0;
        }
        if (myGlow == 0.3)
        {
            myCol2Set = 6;
            myRow2Set = 1;
        }
        if (myGlow == 0.4)
        {
            myCol2Set = 7;
            myRow2Set = 1;
        }
        if (myGlow == 0.5)
        {
            myCol2Set = 6;
            myRow2Set = 2;
        }
        if (myGlow == 0.6)
        {
            myCol2Set = 7;
            myRow2Set = 2;
        }
        if (myGlow == 0.7)
        {
            myCol2Set = 6;
            myRow2Set = 3;
        }
        if (myGlow == 0.8)
        {
            myCol2Set = 7;
            myRow2Set = 3;
        }
        if (myGlow == 0.9)
        {
            myCol2Set = 6;
            myRow2Set = 4;
        }
        if (myGlow == 1.0)
        {
            myCol2Set = 7;
            myRow2Set = 4;
        }
        lightAConfig(myCol2Set, myRow2Set, 3, TRUE, FALSE);
        sendThisOne = FALSE;
        if ((myEyeSize == llList2Vector(myPrimSizes, 0)) || (myEyeSize == llList2Vector(myMeshSizes, 0)))
        {
            sendThisOne = TRUE;
            myCol2Set = 0;
        }
        if ((myEyeSize == llList2Vector(myPrimSizes, 1)) || (myEyeSize == llList2Vector(myMeshSizes, 1)))
        {
            sendThisOne = TRUE;
            myCol2Set = 1;
        }
        if ((myEyeSize == llList2Vector(myPrimSizes, 2)) || (myEyeSize == llList2Vector(myMeshSizes, 2)))
        {
            sendThisOne = TRUE;
            myCol2Set = 2;
        }
        if ((myEyeSize == llList2Vector(myPrimSizes, 3)) || (myEyeSize == llList2Vector(myMeshSizes, 3)))
        {
            sendThisOne = TRUE;
            myCol2Set = 3;
        }
        if ((myEyeSize == llList2Vector(myPrimSizes, 4)) || (myEyeSize == llList2Vector(myMeshSizes, 4)))
        {
            sendThisOne = TRUE;
            myCol2Set = 4;
        }
        if ((myEyeSize == llList2Vector(myPrimSizes, 5)) || (myEyeSize == llList2Vector(myMeshSizes, 5)))
        {
            sendThisOne = TRUE;
            myCol2Set = 5;
        }
        lightAConfig(myCol2Set, 3, 4, sendThisOne, FALSE);
        lightAConfig(myShiny, 4, 5, TRUE, FALSE);
        lightAConfig(4, 4, 6, inSync, FALSE);
        lightAConfig(0, 5, 7, isRandomTime, FALSE);
        lightAConfig(1, 5, 8, isTimed, FALSE);
        lightAConfig(2, 5, 9, isRandomTexture, FALSE);
        if (myTime == 15)
        {
            myCol2Set = 0;
        }
        if (myTime == 30)
        {
            myCol2Set = 1;
        }
        if (myTime == 60)
        {
            myCol2Set = 2;
        }
        if (myTime == 300)
        {
            myCol2Set = 3;
        }
        if (myTime == 600)
        {
            myCol2Set = 4;
        }
        if (myTime == 1800)
        {
            myCol2Set = 5;
        }
        if (myTime == 3600)
        {
            myCol2Set = 6;
        }
        lightAConfig(myCol2Set, 6, 10, TRUE, FALSE);
        lightAConfig(7, 6, 11, isFullBright, FALSE);
        if (myGlowFactor == 0)
        {
            myCol2Set = 5;
            myRow2Set = 2;
        }
        if (myGlowFactor == 1)
        {
            myCol2Set = 5;
            myRow2Set = 4;
        }
        if (myGlowFactor == 2)
        {
            myCol2Set = 6;
            myRow2Set = 5;
        }
        lightAConfig(myCol2Set, myRow2Set, 12, TRUE, FALSE);
        lightAConfig(1, 7, 13, isNormal, FALSE);
        lightAConfig(0, 7, 14, isSpecular, FALSE);
        return;
    }
    if (myScreen == 1)
    {
        integer TI1;
        myCol2Set = 1;
        myRow2Set = 0;
        TI1 = myStartingIndex;
        lightAConfig(9, 6, 2, TRUE, FALSE);
        if (TI1 > 0)
        {
            lightAConfig(0, 0, 3, TRUE, TRUE);
        }
        if ((myNumOfTextures > 60) && (myNumOfTextures > (TI1 + 60)))
        {
            lightAConfig(7, 6, 4, TRUE, TRUE);
        }
        do
        {
            lightAConfig(myCol2Set, myRow2Set, TI1 + 5, TRUE, TRUE);
            llSetLinkPrimitiveParamsFast(TI1 + 5, [
                PRIM_COLOR, ALL_SIDES, <1.0, 1.0, 1.0>, 1.0,
                PRIM_TEXTURE, ALL_SIDES, llList2Key(myTextureNums, TI1), <1.0, 1.0, 0.0>, <0.0, 0.0, 0.0>, 90 * DEG_TO_RAD
            ]);
            TI1++;
        }
        while (((myNumOfTextures < 61) && (TI1 < myNumOfTextures)) || ((myNumOfTextures > 60) && ((TI1 - myStartingIndex) < 60) && (TI1 < myNumOfTextures)));
    }
}

setScreen(integer screen2Set)
{
    llSetLinkPrimitiveParamsFast(LINK_THIS, [
        PRIM_ROT_LOCAL, llEuler2Rot(<0.0, 0.0, llList2Float(myScreenRots, screen2Set)> * DEG_TO_RAD)
    ]);
    myScreen = screen2Set;
    setConfigs();
}

hideLights(integer prim2Hide)
{
    llSetLinkPrimitiveParamsFast(prim2Hide, [
        PRIM_POS_LOCAL, <0, 0, 0>,
        PRIM_COLOR, ALL_SIDES, <1.0, 0.0, 0.0>, 0.2
    ]);
    llSleep(0.5);
}

lightAConfig(integer lightCol, integer lightRow, integer primNum, integer yesNo, integer grayIt)
{
    // primnums #1 main prim #2 regular button press #3 rotateRate #4 moveRate #5 unused #6 mouseDelay #7 lights on/off #8 hover text
    integer tempRow = (lightRow & 7);
    float tempX = (myLeftEdge + (lightCol * myButtonSize.y));
    float tempZ = (myTopEdge - (tempRow * myButtonSize.y));
    vector myLightPos;
    if (myScreen == 0)
    {
        myLightPos = <tempX, myVisibleY, tempZ>;
    }
    if (myScreen == 1)
    {
        myLightPos = <-myVisibleY, tempX, tempZ>;
    }
    vector myTColor;
    float myTAlpha;
    if (grayIt)
    {
        myTColor = <0.8, 0.8, 0.8>;
        myTAlpha = 1.0;
    }
    else
    {
        myTColor = <1.0, 0.0, 0.0>;
        myTAlpha = 0.5;
    }
    if (yesNo)
    {
        llSetLinkPrimitiveParamsFast(primNum, [
            PRIM_POS_LOCAL, myLightPos,
            PRIM_TEXTURE, ALL_SIDES, "645ee328-fc99-7949-2b97-7f4cd68442de", <1.0, 1.0, 0.0>, <0.0, 0.0, 0.0>, 0 * DEG_TO_RAD,
            PRIM_COLOR, ALL_SIDES, myTColor, myTAlpha
        ]);
        if (myScreen == 0)
        {
            primPosns = llListReplaceList(primPosns, [<lightCol, 0, lightRow>], primNum - 3, primNum - 3);
        }
    }
    else
    {
        llSetLinkPrimitiveParamsFast(primNum, [
            PRIM_POS_LOCAL, <0, 0, 0>
        ]);
        primPosns = llListReplaceList(primPosns, [<0.0, 0.0, 0.0>], primNum - 3, primNum - 3);
    }
    if (primNum == 2)
    {
        llSetLinkPrimitiveParamsFast(2, [
            PRIM_COLOR, ALL_SIDES, <1.0, 1.0, 1.0>, 1.0,
            PRIM_TEXTURE, ALL_SIDES, llList2Key(myTextureNums, myTextureNum), <1.0, 1.0, 0.0>, <0.0, 0.0, 0.0>, 90 * DEG_TO_RAD
        ]);
    }
}

setEdges()
{
    myLeftEdge = -(myHudSize.x / 2) + (myButtonSize.x / 2);
    myTopEdge = (myHudSize.z / 2) - (myButtonSize.z / 2);
    myVisibleY = -((myHudSize.y / 2) - 0.01);
}

setup()
{
    myButtonSize = <myHudSize.x / horizontal, myHudSize.y / horizontal, myHudSize.z / (vertical / screens)>;
    myStartingIndex = 0;
    myScreen = 0;
    setEdges();
    llSetLinkPrimitiveParamsFast(LINK_THIS,[
        PRIM_TEXTURE, ALL_SIDES, "8ad667c8-9d98-bd00-dc3c-aaf95ff81042", <1.0, 1.0, 0.0>, <0.0, 0.0, 0.0>, 0 * DEG_TO_RAD,
        PRIM_TEXTURE, 1, myTexture, <1.0, 0.33333, 0.0>, <0.0, 0.33333, 0.0>, 0 * DEG_TO_RAD,
        PRIM_TEXTURE, 2, myTexture, <1.0, 0.33333, 0.0>, <0.0, 0.0, 0.0>, 0 * DEG_TO_RAD,
        PRIM_TEXTURE, 3, myTexture, <1.0, 0.33333, 0.0>, <0.0, -0.33333, 0.0>, 0 * DEG_TO_RAD,
        PRIM_ROT_LOCAL, llEuler2Rot(<0.0, 0.0, 270.0> * DEG_TO_RAD),
        PRIM_SIZE, myHudSize
    ]);
    llSetLinkPrimitiveParamsFast(LINK_ALL_CHILDREN, [
        PRIM_TEXTURE, ALL_SIDES, "645ee328-fc99-7949-2b97-7f4cd68442de", <1.0, 1.0, 0.0>, <0.0, 0.0, 0.0>, 0 * DEG_TO_RAD,
        PRIM_COLOR, ALL_SIDES, <1.0, 0.0, 0.0>, 1.0,
        PRIM_SIZE, myButtonSize,
        PRIM_POSITION, <0, 0, 0>
    ]);
    llSetLinkPrimitiveParamsFast(2, [
        PRIM_TEXTURE, ALL_SIDES, "922b704a-48c2-91db-21d4-915094bb03f8", <1.0, 1.0, 0.0>, <0.0, 0.0, 0.0>, 0 * DEG_TO_RAD,
        PRIM_COLOR, ALL_SIDES, <1.0, 1.0, 1.0>, 1.0,
        PRIM_SIZE, myButtonSize * 2,
        PRIM_POSITION, <0, 0, 0>
    ]);
}

list ParseString2List(string src, list separators, list spacers, integer ParseStringKeepNulls)
{
    // borrowed from the SL wiki and used as is
    integer i = ~(separators != []);
    integer r = (spacers != []);
    spacers += separators;
    list out = "" + (separators = []);
    string p;
    integer offset;
    while((i = -~i) < r)
        if(!~llListFindList(out, (list)(p = llList2String(spacers, i))))
            if(~(offset = llSubStringIndex(src, p)))
            {
                separators += ((offset + 0xFFF00000) << 11) | (i + 0x400);
                out += p;
            }
    out = [];
    offset = 0xFFF00000;
    while(separators != [])//Can't use just "while(separators)" because of JIRA:SVC-689
    {
        if(offset <= (i = ( (r = llList2Integer(separators = llListSort(separators, 1, TRUE), 0) ) >> 11) ) )
        {
            if(offset ^ i || ParseStringKeepNulls)
                out += llDeleteSubString(src, i - offset, -1);
            src = llDeleteSubString(src, 0, ~(offset - (i += llStringLength(p = llList2String(spacers, (r & 0x7FF) - 0x400)))));
            if(r & 0x400)
                out += p;
            offset = i;
        }
        separators = llDeleteSubList(separators, 0, 0);
        if(~(i = llSubStringIndex(src, p)))
            separators += ((i + offset) << 11) | (r & 0x7FF);
    }
    if(src != "" || ParseStringKeepNulls)
        out += src;
    return out;
}

getTextureNums(string strIn)
{
    myTextureNums = ParseString2List(strIn, ["!"], [], FALSE);
    myNumOfTextures = llGetListLength(myTextureNums);
}

doMessage(string msg, string value)
{
    if (msg == "EyePosition")
    {
        myEyePosition = (vector)value;
    }
    if (msg == "EyeSize")
    {
        myEyeSize = (vector)value;
    }
    if (msg == "RandomTexture")
    {
        isRandomTexture = (integer)value;
    }
    if (msg == "RandomTime")
    {
        isRandomTime = (integer)value;
    }
    if (msg == "Shiny")
    {
        myShiny = (integer)value;
    }
    if (msg == "Timed")
    {
        isTimed = (integer)value;
    }
    if (msg == "Sync")
    {
        inSync = (integer)value;
    }
    if (msg == "FullBright")
    {
        isFullBright = (integer)value;
    }
    if (msg == "Time")
    {
        myTime = (float)value;
    }
    if (msg == "TextureNum")
    {
        myTextureNum = (integer)value;
    }
    if (msg == "Bright")
    {
        isFullBright = (integer)value;
    }
    if (msg == "GlowFactor")
    {
        myGlowFactor = (integer)value;
    }
    if (msg == "Glow")
    {
        myGlow = (float)value;
    }
    if (msg == "Prim")
    {
        isPrim == (integer)value;
    }
    if (msg == "TextureNums")
    {
        getTextureNums(value);
    }
    if (msg == "Normal")
    {
        isNormal = (integer)value;
    }
    if (msg == "Specular")
    {
        isSpecular = (integer)value;
    }
    if (msg == "ALLDONE")
    {
        llOwnerSay("all done gathering settings, play with your eyes now, and enjoy!!");
        setConfigs();
    }

}

onRez()
{
    myOwner = llGetOwner();
    myObjectName = llGetObjectName();
    setup();
    llListen(myListen, "", NULL_KEY, "");
    hideLights(LINK_ALL_CHILDREN);
    llOwnerSay(myName + " " + myVersion + " starting setup... please wait...");
    messageOther(13);
    llOwnerSay("waiting for left eye to tell me current settings");
}

previousScreenFull()
{
    if (myStartingIndex == 0)
    {
        return;
    }
    myStartingIndex = myStartingIndex - 61;
    if (myStartingIndex < 0)
    {
        myStartingIndex = 0;
    };
}

nextScreenFull()
{
    if ((myStartingIndex + 61) > myNumOfTextures)
    {
        return;
    }
    myStartingIndex = myStartingIndex + 61;
}

IWasCleanTouched()
{
    llOwnerSay("my index is " + (string)myIndexNum);
    if (myIndexNum == 0)
    {
        myEyeSize = myEyeSize + <0.01, 0.01, 0.01>;
        messageOther(2);
        return;
    }
    if (myIndexNum == 1)
    {
        myEyeSize = myEyeSize + <0.01, 0.0, 0.0>;
        messageOther(2);
        return;
    }
    if (myIndexNum == 2)
    {
        myEyeSize = myEyeSize + <0.0, 0.0, 0.01>;
        messageOther(2);
        return;
    }
    if (myIndexNum == 3)
    {
        myEyePosition = myEyePosition + <0.0, 0.0, 0.001>;
        messageOther(1);
        return;
    }
    if (myIndexNum == 4)
    {
        myEyePosition = myEyePosition + <0.001, 0.0, 0.0>;
        messageOther(1);
        return;
    }
    if (myIndexNum == 5)
    {
        myGlow = 0;
        messageOther(12);
        return;
    }
    if (myIndexNum == 6)
    {
        myGlow = 0.1;
        messageOther(12);
        return;
    }
    if (myIndexNum == 7)
    {
        myGlow = 0.2;
        messageOther(12);
        return;
    }
    if (myIndexNum == 8)
    {
        myEyeSize = myEyeSize + <0.0, 0.01, 0.0>;
        messageOther(2);
        return;
    }
    if (myIndexNum == 9)
    {
        if (isPrim)
        {
            myEyeSize = myPrimSize;
        }
        else
        {
            myEyeSize = myMeshSize;
        }
        messageOther(2);
        return;
    }
    if (myIndexNum == 10)
    {
        myEyeSize = myEyeSize - <0.0, 0.01, 0.0>;
        messageOther(2);
        return;
    }
    if (myIndexNum == 11)
    {
        myEyePosition = myEyePosition + <0.0, 0.001, 0.0>;
        messageOther(1);
        return;
    }
    if (myIndexNum == 12)
    {
        if (isPrim)
        {
            myEyePosition = myPrimPosition;
        }
        else
        {
            myEyePosition = myMeshPosition;
        }
        messageOther(1);
        return;
    }
    if (myIndexNum == 13)
    {
        myEyePosition = myEyePosition - <0.0, 0.001, 0.0>;
        messageOther(1);
        return;
    }
    if (myIndexNum == 14)
    {
        myGlow = 0.3;
        messageOther(12);
        return;
    }
    if (myIndexNum == 15)
    {
        myGlow = 0.4;
        messageOther(12);
        return;
    }
    if (myIndexNum == 16)
    {
        myEyeSize = myEyeSize - <0.01, 0.01, 0.01>;
        messageOther(2);
        return;
    }
    if (myIndexNum == 17)
    {
        myEyeSize = myEyeSize - <0.01, 0.0, 0.0>;
        messageOther(2);
        return;
    }
    if (myIndexNum == 18)
    {
        myEyeSize = myEyeSize - <0.0, 0.0, 0.01>;
        messageOther(2);
        return;
    }
    if (myIndexNum == 19)
    {
        myEyePosition = myEyePosition - <0.0, 0.0, 0.001>;
        messageOther(1);
        return;
    }
    if (myIndexNum == 20)
    {
        myEyePosition = myEyePosition - <0.001, 0.0, 0.0>;
        messageOther(1);
        return;
    }
    if (myIndexNum == 21)
    {
        myGlowFactor = 0;
        messageOther(11);
        return;
    }
    if (myIndexNum == 22)
    {
        myGlow = 0.5;
        messageOther(12);
        return;
    }
    if (myIndexNum == 23)
    {
        myGlow = 0.6;
        messageOther(12);
        return;
    }
    if ((myIndexNum > 23) && (myIndexNum < 30))
    {
        if (isPrim)
        {
            myEyeSize = llList2Vector(myPrimSizes, (myIndexNum - 24));
        }
        else
        {
            myEyeSize = llList2Vector(myMeshSizes, (myIndexNum - 24));
        }
        messageOther(2);
        return;
    }
    if (myIndexNum == 30)
    {
        myGlow = 0.7;
        messageOther(12);
        return;
    }
    if (myIndexNum == 31)
    {
        myGlow = 0.8;
        messageOther(12);
        return;
    }
    if ((myIndexNum > 31) && (myIndexNum < 36))
    {
        myShiny = myIndexNum - 32;
        messageOther(5);
        return;
    }
    if (myIndexNum == 36)
    {
        inSync = ! inSync;
        messageOther(7);
        return;
    }
    if (myIndexNum == 37)
    {
        myGlowFactor = 1;
        messageOther(11);
        return;
    }
    if (myIndexNum == 38)
    {
        myGlow = 0.9;
        messageOther(12);
        return;
    }
    if (myIndexNum == 39)
    {
        myGlow = 1.0;
        messageOther(12);
        return;
    }
    if (myIndexNum == 40)
    {
        isRandomTime = ! isRandomTime;
        messageOther(4);
        return;
    }
    if (myIndexNum == 41)
    {
        isTimed = ! isTimed;
        messageOther(6);
        return;
    }
    if (myIndexNum == 42)
    {
        isRandomTexture = !isRandomTexture;
        messageOther(3);
        return;
    }
    if (myIndexNum == 43)
    {
        myTextureNum--;
        if (myTextureNum < 0)
        {
            myTextureNum = myNumOfTextures;
        }
        messageOther(10);
        return;
    }
    if (myIndexNum == 44)
    {
        myTextureNum++;
        if (myTextureNum > myNumOfTextures)
        {
            myTextureNum = 0;
        }
        messageOther(10);
        return;
    }
    if (myIndexNum == 45)
    {
        setScreen(1);
        return;
    }
    if (myIndexNum == 46)
    {
        myGlowFactor = 2;
        messageOther(11);
        return;
    }
    if (myIndexNum == 47)
    {
        messageOther(13);
        return;
    }
    if ((myIndexNum > 47) && (myIndexNum < 55))
    {
        myTime = llList2Float(myTimes, (myIndexNum - 48));
        messageOther(9);
        return;
    }
    if (myIndexNum == 55)
    {
        isFullBright = !isFullBright;
        llOwnerSay("full bright being set to " + onOff(isFullBright));
        messageOther(8);
        return;
    }
    if (myIndexNum == 56)
    {
        isSpecular = ! isSpecular;
        messageOther(14);
        return;
    }
    if (myIndexNum == 57)
    {
        isNormal = ! isNormal;
        messageOther(15);
        return;
    }
    if ((myIndexNum > 57) && (myIndexNum < 64))
    {
        return;
    }
    if (myIndexNum == 64)
    {
        previousScreenFull();
        return;
    }
    if ((myIndexNum > 64) && (myIndexNum < 126))
    {
        myTextureNum = (myIndexNum - 65);
        messageOther(10);
        return;
    }
    if (myIndexNum == 126)
    {
        nextScreenFull();
        return;
    }
    if (myIndexNum == 127)
    {
        setScreen(0);
        return;
    }
    if (myIndexNum > 127)
    {
        return;
    }
}

indicatorTouched()
{
    if ((myPrimTouched > 2) && (myPrimTouched < 15) && (myScreen == 0))
    {
        vector myTPrimPosn = llList2Vector(primPosns, (myPrimTouched - 3));
        myCol = (integer)myTPrimPosn.x;
        myRow = (integer)myTPrimPosn.z;
        return;
    }
    if (myScreen == 1)
    {
        if (myPrimTouched != 2)
        {
            myIndexNum = myPrimTouched + 62;
            myCol = 8;
            myRow = 8;
        }
        else
        {
            myIndexNum = 63;
            myCol = 0;
            myRow = 7;
        }
        return;
    }
}

default
{

    state_entry()
    {
        onRez();
    }

    on_rez(integer num)
    {
        onRez();
    }

    changed(integer change)
    {
        if (change & CHANGED_OWNER)
        {
            llResetScript();
        }
    }

    listen(integer channel, string name, key id, string inMessage)
    {
        list myMessage = llParseStringKeepNulls(inMessage, ["|"], []);
        key messageOwner = llList2Key(myMessage, 0);
        if (messageOwner == myOwner)
        {
            doMessage(llList2String(myMessage, 1), llList2String(myMessage, 2));
        }
    }

    touch_start(integer num)
    {
        vector TV1 = llDetectedTouchUV(0);
        if (TV1 == TOUCH_INVALID_TEXCOORD)
        {
            llOwnerSay("The universe is broken, reboot universe and try again");
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
        setConfigs();
    }

}
