string myName = "THC prim/mesh eyeball pack AR-1001";
integer isPrim = FALSE;
integer myListen = -24685;
integer myTalk = -24680;

list myEnvironments = [
    0.0,
    42.0,
    84.0,
    126.0,
    168.0,
    210.0,
    256.0
];
list myGlossinesses = [
    0.0,
    42.0,
    84.0,
    126.0,
    168.0,
    210.0,
    256.0
];
list myGlowFactors = [
    0.5,
    0.1,
    0.05
];
list myTextureNums = [
    "fb0746db-09e9-7824-aadc-ff6f35e001e0",
    "aca06668-cb93-3270-08f5-dfee54abb965",
    "53c0f6e4-cae8-5c28-bf8f-3a64fc636ddf",
    "1f16f915-f760-066a-6891-967e01d8f2b2",
    "8c1b56f0-06f2-65a7-ba7b-ccd35818f700",
    "b8dde59b-c8f3-e77e-5269-b2e175adf7cf",
    "c297eb92-c824-1b17-924f-f4f117c93edb",
    "fd7cd008-874a-7f0f-64d4-ff500c13ec04",
    "b694e732-0bf6-63fa-5dfc-8ae7c4f42820"
];

list myNormalsMaps = [
    "fb0746db-09e9-7824-aadc-ff6f35e001e0",
    "aca06668-cb93-3270-08f5-dfee54abb965",
    "53c0f6e4-cae8-5c28-bf8f-3a64fc636ddf",
    "1f16f915-f760-066a-6891-967e01d8f2b2",
    "8c1b56f0-06f2-65a7-ba7b-ccd35818f700",
    "b8dde59b-c8f3-e77e-5269-b2e175adf7cf",
    "c297eb92-c824-1b17-924f-f4f117c93edb",
    "fd7cd008-874a-7f0f-64d4-ff500c13ec04",
    "b694e732-0bf6-63fa-5dfc-8ae7c4f42820"
];

list mySpecularMaps = [
    "fb0746db-09e9-7824-aadc-ff6f35e001e0",
    "aca06668-cb93-3270-08f5-dfee54abb965",
    "53c0f6e4-cae8-5c28-bf8f-3a64fc636ddf",
    "1f16f915-f760-066a-6891-967e01d8f2b2",
    "8c1b56f0-06f2-65a7-ba7b-ccd35818f700",
    "b8dde59b-c8f3-e77e-5269-b2e175adf7cf",
    "c297eb92-c824-1b17-924f-f4f117c93edb",
    "fd7cd008-874a-7f0f-64d4-ff500c13ec04",
    "b694e732-0bf6-63fa-5dfc-8ae7c4f42820"
];
list myTextureNames = [
    "AR-1001_1009",
    "AR-1001_1010",
    "AR-1001_1011",
    "AR-1001_1012",
    "AR-1001_1013",
    "AR-1001_1014",
    "AR-1001_1015",
    "AR-1001_1016",
    "AR-1001_1017"
];

float myTGlowFactor;
integer IAmSlave = FALSE;
integer myAttachPoint;
integer myNumOfTextures;
key myOwner;
key myTNormalsMap;
key myTSpecularMap;
key myTTextureNum;
string myObjectName;
string myVersion = "4.0.0";
vector myMeshPosition = <0.01, 0.0, 0.0>;
vector myMeshSize = <0.005, 0.028, 0.028>;
vector myPrimPosition = <0.0, 0.0, 0.0>;
vector myPrimSize = <0.005, 0.028, 0.028>;

float myGlow = 0.0;
float myTime = 30;
integer inSync = FALSE;
integer isFullBright = TRUE;
integer isNormal = TRUE;
integer isRandomTexture = TRUE;
integer isRandomTime = TRUE;
integer isSpecular = TRUE;
integer isTimed = TRUE;
integer myEnvironmentIndex = 0;
integer myGlossIndex = 0;
integer myGlowFactor = 0;
integer myShiny = 0; //0-3 off-high
integer myTextureNum = 0;
vector myEyePosition;
vector myEyeSize;

messageOther(integer toSend)
{
    if (!IAmSlave)
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
        if (toSend == 0)
        {
            llWhisper(myTalk, (string)myOwner + "|Prim|" + (string)isPrim);
        }
        if (toSend == 0)
        {
            llWhisper(myTalk, (string)myOwner + "|TextureNums|" + llDumpList2String(myTextureNums, "!"));
        }
        if ((toSend == 14) || (toSend == 0))
        {
            llWhisper(myTalk, (string)myOwner + "|Specular|" + (string)isSpecular);
        }
        if ((toSend == 15) || (toSend == 0))
        {
            llWhisper(myTalk, (string)myOwner + "|Normal|" + (string)isNormal);
        }
        if ((toSend == 16) || (toSend == 0))
        {
            llWhisper(myTalk, (string)myOwner + "|EnvironmentIndex|" + (string)myEnvironmentIndex);
        }
        if ((toSend == 17) || (toSend == 0))
        {
            llWhisper(myTalk, (string)myOwner + "|GlossIndex|" + (string)myGlossIndex);
        }
        if (toSend == 0)
        {
            llWhisper(myTalk, (string)myOwner + "|ALLDONE|dumping");
        }
    }
}

setPrimParams()
{
        llSetLinkPrimitiveParamsFast(LINK_THIS,[
            PRIM_SIZE, myEyeSize,
            PRIM_FULLBRIGHT, ALL_SIDES, isFullBright,
            PRIM_GLOW, ALL_SIDES, myTGlowFactor,
            PRIM_BUMP_SHINY, ALL_SIDES, myShiny, PRIM_BUMP_NONE,
            PRIM_POSITION, myEyePosition,
            PRIM_TEXTURE, ALL_SIDES, myTTextureNum, <PI, PI / 2, 0>, <0.0, 0.2, 0.0>, 90.0 * DEG_TO_RAD,
            PRIM_NORMAL, ALL_SIDES, myTNormalsMap, <PI, PI / 2, 0>, <0.0, 0.2, 0.0>, 90.0 * DEG_TO_RAD,
            PRIM_SPECULAR, ALL_SIDES, myTSpecularMap, <PI, PI / 2, 0>, <0.0, 0.2, 0.0>, 90.0 * DEG_TO_RAD, <1.0, 1.0, 1.0>, 128, 128,
            PRIM_ROTATION, llEuler2Rot(<0.0, 0.0, 114.59> * DEG_TO_RAD)
        ]);
}

setMeshParams()
{
        llSetLinkPrimitiveParamsFast(LINK_THIS, [
            PRIM_SIZE, myEyeSize,
            PRIM_FULLBRIGHT, ALL_SIDES, isFullBright,
            PRIM_GLOW, ALL_SIDES, myTGlowFactor,
            PRIM_BUMP_SHINY, ALL_SIDES, myShiny, PRIM_BUMP_NONE,
            PRIM_POSITION, myEyePosition,
            PRIM_TEXTURE, ALL_SIDES, myTTextureNum, <1, 1, 0>, <0.0, 0.0, 0.0>, 0 * DEG_TO_RAD,
            PRIM_NORMAL, ALL_SIDES, myTNormalsMap, <1, 1, 0>, <0.0, 0.0, 0.0>, 0.0 * DEG_TO_RAD,
            PRIM_SPECULAR, ALL_SIDES, myTSpecularMap, <1, 1, 0>, <0.0, 0.0, 0.0>, 0.0 * DEG_TO_RAD, <1.0, 1.0, 1.0>, 128, 128,
            PRIM_ROTATION, llEuler2Rot(<0.0, 0.0, 0.0> * DEG_TO_RAD)
        ]);
}

setMyParams()
{
    myTGlowFactor = myGlow * llList2Float(myGlowFactors, myGlowFactor);
    myTTextureNum = llList2Key(myTextureNums, myTextureNum);
    if (isSpecular)
    {
        myTSpecularMap = llList2Key(mySpecularMaps,myTextureNum);
    }
    else
    {
        myTSpecularMap = NULL_KEY;
    }
    if (isNormal)
    {
        myTNormalsMap = llList2Key(myNormalsMaps,myTextureNum);
    }
    else
    {
        myTNormalsMap = NULL_KEY;
    }
    if (isPrim)
    {
        setPrimParams();
    }
    else
    {
        setMeshParams();
    }
    if ((!IAmSlave) && (inSync))
    {
        messageOther(-1);
    }
}

myInit()
{
    if ((myAttachPoint < 15) && (myAttachPoint > 16))
    {
        llOwnerSay("I am designed to be attached to eyeballs, some of my features will malfunction or not function until I am attached to an eyeball");
        myEyePosition == llGetPos();
    }
    else
    {
        if (isPrim)
        {
            myEyePosition = myPrimPosition;
            myEyeSize = myPrimSize;
        }
        else
        {
            myEyePosition = myMeshPosition;
            myEyeSize = myMeshSize;
        }
    }
}

setup()
{
    myAttachPoint = llGetAttached();
    if ((myAttachPoint < 15) && (myAttachPoint > 16))
    {
        llOwnerSay("I am designed to be attached to eyeballs, some of my features will malfunction or not function until I am attached to an eyeball");
        myEyePosition == llGetPos();
    }
    if (myAttachPoint == 16)
    {
        IAmSlave = TRUE;
    }
    else
    {
        IAmSlave = FALSE;
    }
    vector TMySize;
    if (myAttachPoint)
    {
        TMySize = myEyeSize;
    }
    else
    {
        TMySize = myEyeSize * 50;
    }
    myNumOfTextures = llGetListLength(myTextureNums) - 1;
    //if (isTimed)
    //{
        //if (isRandomTexture)
        //{
            //myTextureNum = (integer)llFrand(myNumOfTextures + 0.1);
        //}
        //else
        //{
            //myTextureNum = myTextureNum + 1;
            //if (myTextureNum > myNumOfTextures)
            //{
                //myTextureNum = 0;
            //}
        //}
    //}
    if (isTimed)
    {
        float TTime;
        if (isRandomTime)
        {
            TTime = llFrand(myTime) + 10;
        }
        else
        {
            TTime = myTime;
        }
        if (((inSync) && (!IAmSlave)) || (!inSync))
        {
            llSetTimerEvent(TTime);
        }
        else
        {
            llSetTimerEvent(0);
        }
    }
    else
    {
        llSetTimerEvent(0);
    }
    setMyParams();
}

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

doMessage(string msg, string value)
{
    if (msg == "EyePosition")
    {
        if (IAmSlave)
        {
            vector tVec1 = (vector)value;
            tVec1.y = tVec1.y * -1;
            myEyePosition = tVec1;
        }
        else
        {
            myEyePosition = (vector)value;
        }
        messageOther(1);
    }
    if (msg == "EyeSize")
    {
        myEyeSize = (vector)value;
        messageOther(2);
    }
    if (msg == "RandomTexture")
    {
        isRandomTexture = (integer)value;
        messageOther(3);
    }
    if (msg == "RandomTime")
    {
        isRandomTime = (integer)value;
        messageOther(4);
    }
    if (msg == "Shiny")
    {
        myShiny = (integer)value;
        messageOther(5);
    }
    if (msg == "Timed")
    {
        isTimed = (integer)value;
        messageOther(6);
    }
    if (msg == "Sync")
    {
        inSync = (integer)value;
        messageOther(7);
    }
    if (msg == "FullBright")
    {
        isFullBright = (integer)value;
        messageOther(8);
    }
    if (msg == "Time")
    {
        myTime = (float)value;
        messageOther(9);
    }
    if (msg == "TextureNum")
    {
        myTextureNum = (integer)value;
        if (myTextureNum > myNumOfTextures)
        {
            myTextureNum = 0;
        }
        messageOther(10);
    }
    if (msg == "GlowFactor")
    {
        myGlowFactor = (integer)value;
        messageOther(11);
    }
    if (msg == "Glow")
    {
        myGlow = (float)value;
        messageOther(12);
    }
    if ((msg == "HUDSync") && (IAmSlave == FALSE))
    {
        messageOther(0);
    }
    if (msg == "Normal")
    {
        isNormal = (integer)value;
    }
    if (msg == "Specular")
    {
        isSpecular = (integer)value;
    }
    if (msg == "EnvironmentIndex")
    {
        myEnvironmentIndex = (integer)value;
    }
    if (msg == "GlossIndex")
    {
        myGlossIndex = (integer)value;
    }
}

onRez()
{
    myOwner = llGetOwner();
    myObjectName =llGetObjectName();
    setup();
    string myFullName;
    if (myAttachPoint == 16)
    {
        IAmSlave = TRUE;
        llListen(myTalk, "", NULL_KEY, "");
        myFullName = myName + " RIGHT/slave";
    }
    else
    {
        IAmSlave = FALSE;
        llListen(myListen, "", NULL_KEY, "");
        myFullName = myName + " LEFT/master";
    }
    llOwnerSay(myFullName + " is ready, if this is your first time wearing me you will need to use the hud I came with to make some basic settings");
    llOwnerSay("you will also want to use the hud if you need/want to change my position, or modes");
}

default
{

    on_rez(integer num)
    {
        onRez();
    }

    state_entry()
    {
        myInit();
        onRez();
    }

    changed(integer change)
    {
        if (change & CHANGED_OWNER)
        {
            llResetScript();
        }
    }

    listen(integer inChannel, string inName, key inKey, string inMessage)
    {
        list myMessage = llParseStringKeepNulls(inMessage, ["|"], []);
        key messageOwner = llList2Key(myMessage, 0);
        if ((messageOwner == myOwner) && (inName != myObjectName))
        {
            doMessage(llList2String(myMessage, 1), llList2String(myMessage, 2));
            setup();
        }
    }

    timer()
    {
        if (isRandomTexture)
        {
            myTextureNum = (integer)llFrand(myNumOfTextures);
        }
        else
        {
            myTextureNum++;
            if (myTextureNum > myNumOfTextures)
            {
                myTextureNum = 0;
            }
        }
        setup();
    }
}
