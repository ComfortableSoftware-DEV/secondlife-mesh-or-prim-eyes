string myName = "THC prim/mesh eyeball pack AR-1001";
integer isPrim = FALSE;
integer myListen = -24685;
integer myTalk = -24680;
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

integer IAmSlave = FALSE;
integer myAttachPoint;
integer myNumOfTextures;
key myOwner;
string myObjectName;
string myVersion = "4.0.0";
vector myMeshPosition = <0.01, 0.0, 0.0>;
vector myMeshSize = <0.05, 0.1, 0.1>;
vector myPrimPosition = <0.0, 0.0, 0.0>;
vector myPrimSize = <0.1, 0.1, 0.1>;

vector myEyePosition;
vector myEyeSize;
integer isRandomTexture = TRUE;
integer isRandomTime = TRUE;
integer myShiny = 0; //0-3 off-high
integer isTimed = TRUE;
integer inSync = FALSE;
integer isFullBright = TRUE;
float myTime = 30;
integer myTextureNum = 0;
float myGlow = 0.0;

messageOther(integer toSend)
{
    if (myAttachPoint == 15)
    {// 0 = all -1 = time and texture
        if ((toSend == 0) || (toSend == 1))
        {
            llSay(myTalk, (string)myOwner + "|EyePosition|" + (string)myEyePosition);
        }
        if ((toSend == 0) || (toSend == 2))
        {
            llSay(myTalk, (string)myOwner +  "|EyeSize|" + (string)myEyeSize);
        }
        if ((toSend == 0) || (toSend == 3))
        {
            llSay(myTalk, (string)myOwner + "|RandomTexture|" + (string)isRandomTexture);
        }
        if ((toSend == 0) || (toSend == 4))
        {
            llSay(myTalk, (string)myOwner + "|RandomTime|" + (string)isRandomTime);
        }
        if ((toSend == 0) || (toSend == 5))
        {
            llSay(myTalk, (string)myOwner + "|Shiny|" + (string)myShiny);
        }
        if ((toSend == 0) || (toSend == 6))
        {
            llSay(myTalk, (string)myOwner + "|Timed|" + (string)isTimed);
        }
        if ((toSend == 0) || (toSend == 7))
        {
            llSay(myTalk, (string)myOwner + "|Sync|" + (string)inSync);
        }
        if ((toSend == 0) || (toSend == 8))
        {
            llSay(myTalk, (string)myOwner + "|FullBright|" + (string)isFullBright);
        }
        if ((toSend == 0) || (toSend == 9) || (toSend == -1))
        {
            llSay(myTalk, (string)myOwner + "|Time|" + (string)myTime);
        }
        if ((toSend == 0) || (toSend == 10) || (toSend == -1))
        {
            llSay(myTalk, (string)myOwner + "|TextureNum|" + (string)myTextureNum);
        }
        if ((toSend == 0) || (toSend == 12))
        {
            llSay(myTalk, (string)myOwner + "|Glow|" + (string)myGlow);
        }
        if (toSend == 0)
        {
            llSay(myTalk, (string)myOwner + "|TextureNums|" + llDumpList2String(myTextureNums, "!"));
        }
        if (toSend == 0)
        {
            llSay(myTalk, (string)myOwner + "|ALLDONE|dumping");
        }
    }
}

string get_list_entry_type_info(integer inputInteger)
{
    if (inputInteger == TYPE_INTEGER)
        return "integer";

    else if (inputInteger == TYPE_FLOAT)
        return "float";

    else if (inputInteger == TYPE_STRING)
        return "string";

    else if (inputInteger == TYPE_KEY)
        return "key";

    else if (inputInteger == TYPE_VECTOR)
        return "vector";

    else if (inputInteger == TYPE_ROTATION)
        return "rotation";

//  else
        return "<!-- invalid type --!>";
}

debugList(list inList)
{
    integer index = ~llGetListLength(inList);
    while (++index)
    {
        integer type = llGetListEntryType(inList, index);
        string entry2string = llList2String(inList, index);
        llOwnerSay("'" + entry2string + "' has the list-entry-type: '" + get_list_entry_type_info(type) + "'");
    }
}

setPrimParams()
{
        key texKey = llList2Key(myTextureNums, myTextureNum);
        list tList = [
            PRIM_SIZE, myEyeSize,
            PRIM_FULLBRIGHT, ALL_SIDES, isFullBright,
            PRIM_GLOW, ALL_SIDES, myGlow,
            PRIM_BUMP_SHINY, ALL_SIDES, myShiny, PRIM_BUMP_NONE,
            PRIM_POSITION, myEyePosition,
            PRIM_TEXTURE, ALL_SIDES, texKey, <PI, PI / 2, 0>, <0.0, 0.2, 0.0>, 90.0 * DEG_TO_RAD,
            PRIM_ROTATION, llEuler2Rot(<0.0, 0.0, 114.59> * DEG_TO_RAD)
        ];
        // debugList(tList);
        llSetLinkPrimitiveParamsFast(LINK_THIS, tList);
}

setMeshParams()
{
        key texKey = llList2Key(myTextureNums, myTextureNum);
        list tList = [
            PRIM_SIZE, myEyeSize,
            PRIM_FULLBRIGHT, ALL_SIDES, isFullBright,
            PRIM_GLOW, ALL_SIDES, myGlow,
            PRIM_BUMP_SHINY, ALL_SIDES, myShiny, PRIM_BUMP_NONE,
            PRIM_POSITION, myEyePosition,
            PRIM_TEXTURE, ALL_SIDES, texKey, <1, 1, 0>, <0.0, 0.0, 0.0>, 0 * DEG_TO_RAD
        ];
        // debugList(tList);
        llSetLinkPrimitiveParamsFast(LINK_THIS, tList);
}

setMyParams()
{
    if (isPrim)
    {
        setPrimParams();
    }
    else
    {
        setMeshParams();
    }
    if ((! IAmSlave) || (inSync))
    {
        messageOther(-1);
    }
}

setup()
{
    myAttachPoint = llGetAttached();
    if ((myAttachPoint < 15) && (myAttachPoint > 16))
    {
        llOwnerSay("I am designed to be attached to eyeballs, some of my features will malfunction or not function now");
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
    if (isTimed)
    {
        if (isRandomTexture)
        {
            myTextureNum = (integer)llFrand(myNumOfTextures + 0.1);
        }
        else
        {
            myTextureNum = myTextureNum + 1;
            if (myTextureNum > myNumOfTextures)
            {
                myTextureNum = myTextureNum % myNumOfTextures;
            }
        }
    }
    setMyParams();
    if (isTimed)
    {
        float TTime;
        if (isRandomTime)
        {
            TTime = llFrand(myTime - 15) + 15;
        }
        else
        {
            TTime = myTime;
        }
        llSetTimerEvent(TTime);
    }
    else
    {
        llSetTimerEvent(0);
    }
    if ((inSync) & (!IAmSlave))
    {
        messageOther(-1);
    }
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
        if (myTextureNum > myNumOfTextures)
        {
            myTextureNum % myNumOfTextures;
        }
    }
    if (msg == "Glow")
    {
        myGlow = (float)value;
    }
    if ((msg == "HUDSync") && (IAmSlave == FALSE))
    {
        messageOther(0);
    }
}

onRez()
{
    myOwner = llGetOwner();
    myObjectName =llGetObjectName();
    setup();
    string myFullName;
    llListen(myListen, "", NULL_KEY, "");
    if (myAttachPoint == 16)
    {
        IAmSlave = TRUE;
        myFullName = myName + " RIGHT/slave";
    }
    else
    {
        IAmSlave = FALSE;
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
        setMyParams();
    }
}
