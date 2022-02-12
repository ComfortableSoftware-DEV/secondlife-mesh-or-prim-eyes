// version info
string myName = "THC prim eyes";
string myVersion = "6.0.0";

// main dialogs
list dialog_main = ["texture", "timer", "help", "both on", "both off", "size", "position", "more", "done"];
list dialog_more = ["size presets", "pos presets", "sync eyes", "main", "reset", "status", "done"];

// timer dialogs
list dialog_timer = ["random on", "random off", "30sec", "1min", "5min", "10min", "15min", "30min", "1hr", "timer off", "timer on", "main"];

// common size/position/texture number dialog
list dialog_z = ["-1", "done", "+1", "-10", "main", "+10", "help"];

// size
list mySizes = [
<0.0,0.0,0.0>,
<0.0,0.0,0.0>,
    <0.01, 0.024, 0.024>,
    <0.01, 0.026, 0.026>,
    <0.01, 0.028, 0.028>,
    <0.01, 0.030, 0.030>,
    <0.01, 0.032, 0.032>,
    <0.01, 0.034, 0.034>,
    <0.01, 0.036, 0.036>,
    <0.01, 0.038, 0.038>,
    <0.01, 0.040, 0.040>,
    <0.01, 0.042, 0.042>,
    <0.01, 0.044, 0.044>,
    <0.01, 0.046, 0.046>,
    <0.01, 0.048, 0.048>
];

list dialog_sizeNames = [
"done",
"main",
    "sz-24",
    "sz-26",
    "sz-28",
    "sz-30",
    "sz-32",
    "sz-34",
    "sz-36",
    "sz-38",
    "sz-40",
    "sz-42",
    "sz-44",
    "sz-46",
    "sz-48"
];
list dialog_size = ["height", "width", "depth", "all", "main", "done"];
vector mySize = <0.01, 0.028, 0.028>; // x=depth y=width z=height

// position for left eye, y will auto correct for right eye in init
list myPositions =[
<0.0, 0.0, 0.0>,
<0.0, 0.0, 0.0>,
    <0.0130,0.000,0.000>,
    <0.001,-0.008,0.000>,
    <0.002,0.050,0.000>,
    <-0.003,0.000,0.000>,
    <0.020,0.000,0.000>
];
list dialog_positionNames = [
"done",
"main",
    "pz-default",
    "pz-001,-008,0",
    "pz-002,05,0",
    "pz--003,0,0",
    "pz-02,0,0"
];
list dialog_position = ["vert", "horiz", "inout", "main", "done"];
vector myPosition = <0.013, 0.0, 0.0>; // x=inout y=horizontal z=vertical

integer isRandom = TRUE;
integer isTimed = TRUE;
integer myTime = 30;
integer both = FALSE;

// texture variables
integer numOfTextures;
integer texNum = 0;

// internal variables
key myTexture;
key owner;
key myNormals = "a5b27156-c30f-79b9-3358-dbbb13d48a15";
integer myEnvironment = 90;
integer isMine;
integer myAttached = 0;
integer myChan;
integer otherChan;
integer mode;
integer ti1;
string ts1; // 0=main 1=texture 2=height 3=width 4=depth 5=position 6=size 7=vertical 8=horizontal 9=inout 10=timer 11=more 12=sizepresets 13=positionpresets

sayStatus()
{
    llOwnerSay(myName + " " + "THC Prim eyes status");
    llOwnerSay(myName + " " + myVersion + " ready on channel " + (string)myChan);
    llOwnerSay(myName + " " + (string)llGetFreeMemory() + " bytes avail");
    llOwnerSay(myName + " " + " I have " + (string)numOfTextures + " textures to display");
    llOwnerSay(myName + " " + "position:" + (string)myPosition);
    llOwnerSay(myName + " " + "Size:" + (string)mySize);
    if (both)
    {
        ts1 = "BOTH eyes";
    }
    else
    {
        ts1 = "ONLY THIS EYE";
    }
    llOwnerSay(myName + " " + ts1 + " will be affected");
    if (isTimed)
    {
        ts1 = "ON";
    }
    else
    {
        ts1 = "OFF";
    }
    llOwnerSay(myName + " " + "timer is " + ts1);
    llOwnerSay(myName + " " + "time interval:" + (string)myTime);
    if (isRandom)
    {
        ts1 = "ON";
    }
    else
    {
        ts1 = "OFF";
    }
    llOwnerSay(myName + " " + "random is " + ts1);
}

askFor(string myType, integer myNum)
{
    llMessageLinked(LINK_THIS, myNum, "", "ask" + myType);
}

setUp()
{
    vector TMySize;
    if (myAttached)
    {
        llSetPos(myPosition);
        TMySize = mySize;
    }
    else
    {
        TMySize = mySize * 50;
    }
    //llOwnerSay(myName + " texnum " + (string)texNum);
    //llOwnerSay(myName + " tmysize " + (string)TMySize);
    askFor("Texture", texNum);
    llSetPrimitiveParams([
        PRIM_SIZE, TMySize,
        PRIM_TEXTURE, ALL_SIDES, myTexture, <1.0, 1.0, 1.0>, <0.0, 0.2, 0.0>, (90 * DEG_TO_RAD),
        PRIM_NORMAL,  ALL_SIDES, myNormals, <1.0, 1.0, 1.0>, <0.0, 0.0, 0.0>, 0,
        PRIM_SPECULAR, ALL_SIDES, myTexture, <1.0, 1.0, 1.0>, <0.0, 0.2, 0.0>, (90 * DEG_TO_RAD), <1.0, 1.0, 1.0>, 255, myEnvironment,
        PRIM_ROTATION, llEuler2Rot(<0.0, 0.0, 0.0> * DEG_TO_RAD)
    ]);
    //llOwnerSay(myName + " set and good to go");
}

init()
{
    mode = 0;
    otherChan = 10;
    owner = llGetOwner();
    myChan = llGetAttached();
    askFor("NumOfTextures", 0);
    if ((myChan != 15) && (myChan != 16))
    {
        myAttached = 0;
        myChan = 1;
        llOwnerSay("I only work correctly when attached to an eyeball.");
    }
    else if (myChan == 15)
    {
        mySize.y = (0 - mySize.y);
        myAttached = 1;
        otherChan = 16;
        myTime += 15;
    }
    else if (myChan == 16)
    {
        myAttached = 1;
        otherChan = 15;
    }
    llListen(myChan, "", NULL_KEY, "");
    checkValues();
    if (isTimed)
    {
        llSetTimerEvent(myTime + 15);
    }
    else
    {
        llSetTimerEvent(0);
    }
    sayStatus();
    setUp();
}

sendOther(string msg)
{
    if (both | (msg == "both on") | (msg == "both off"))
    {
        if ((myChan == 15) | (myChan == 1))
        {
            llWhisper(otherChan, (string)owner + "|" + msg);
        }
    }
}

doDialog()
{
    if (isMine)
    {
        string msg;
        list menu;
        if (mode == 0)
        {
            msg = "Main";
            menu = dialog_main;
        }
        if (mode == 1)
        {
            msg = "Texture";
            menu = dialog_z;
        }
        if (mode == 2)
        {
            msg = "Height";
            menu = dialog_z;
        }
        if (mode == 3)
        {
            msg = "Width";
            menu = dialog_z;
        }
        if (mode == 4)
        {
            msg = "Depth";
            menu = dialog_z;
        }
        if (mode == 14)
        {
            msg = "All sizes";
            menu = dialog_z;
        }
        if (mode == 5)
        {
            msg = "Position";
            menu = dialog_position;
        }
        if (mode == 6)
        {
            msg = "Size";
            menu = dialog_size;
        }
        if (mode == 7)
        {
            msg = "Vertical";
            menu = dialog_z;
        }
        if (mode == 8)
        {
            msg = "Horizontal";
            menu = dialog_z;
        }
        if (mode == 9)
        {
            msg = "inout";
            menu = dialog_z;
        }
        if (mode == 10)
        {
            msg = "Timer";
            menu = dialog_timer;
        }
        if (mode == 11)
        {
            msg = "More";
            menu = dialog_more;
        }
        if (mode == 12)
        {
            msg = "Size Presets";
            menu = dialog_sizeNames;
        }
        if (mode == 13)
        {
            msg = "Pos Presets";
            menu = dialog_positionNames;
        }
        sayStatus();
        string msgString = "Please select your " + msg + " option for ";
        if (both)
        {
            msgString += "BOTH eyes";
        }
        else
        {
            msgString += "ONLY THIS eye";
        }
        llDialog(owner, msgString, menu, myChan);
    }
}

sendAll()
{
    sendOther("setrandom|" + (string)isRandom);
    sendOther("settimed|" + (string)isTimed);
    sendOther("settime|" + (string)myTime);
    sendOther("settexnum|" + (string)texNum);
    sendOther("setheight|" + (string)mySize.z);
    sendOther("setwidth|" + (string)mySize.y);
    sendOther("setdepth|" + (string)mySize.x);
    sendOther("setinout|" + (string)myPosition.x);
    sendOther("sethoriz|" + (string)myPosition.y);
    sendOther("setvert|" + (string)myPosition.z);
    sendOther("setboth|" + (string)both);
    sendOther("settings|done");
}

checkValues()
{
    if (mySize.x < 0.01)
    {
        mySize.x = 0.01;
    }
    if (mySize.y < 0.024)
    {
        mySize.y = 0.024;
    }
    if (mySize.z < 0.024)
    {
        mySize.z = 0.024;
    }
    if (myTime < 30)
    {
        myTime = 30;
    }
    if (myTime > 3600)
    {
        myTime = 3600;
    }
    setUp();
}

integer checkPresets(string lookfor)
{
    ts1 = llGetSubString(lookfor, 0, 2);
    if ((ts1 != "sz-") & (ts1 != "pz-"))
    {
        return FALSE;
    }
    if (ts1 == "sz-")
    {
        ti1 = llListFindList(dialog_sizeNames, [lookfor]);
        if (ti1 < 0)
        {
            ti1 = 0;
        }
        mySize = llList2Vector(mySizes, ti1);
    }
    else
    {
        ti1 = llListFindList(dialog_positionNames, [lookfor]);
        if (ti1 < 0)
        {
            ti1 = 0;
        }
        myPosition = llList2Vector(myPositions, ti1);
        if (myChan == 15)
        {
            myPosition.y = (0 - myPosition.y);
        }
        llOwnerSay("new position is " + (string)myPosition + " *************************************");
    }
    setUp();
    return TRUE;
}

default
{

    state_entry()
    {
        init();
    }

    on_rez(integer num)
    {
        init();
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
        if (id == owner)
        {
            isMine = TRUE;
            sendOther(msg);
            doOne(msg);
        }
        else
        {
            list myCommand = llParseString2List(msg, ["|"], []);
            if (llList2Key(myCommand, 0) == owner)
            {
                isMine = FALSE;
                if (llGetListLength(myCommand) == 2)
                {
                    doOne(llList2String(myCommand, 1));
                }
                else
                {
                    integer Tboth = both;
                    doSettings(llList2String(myCommand, 1), llList2String(myCommand, 2));
                    if ((Tboth != both))
                    {
                        sendAll();
                    }
                    setUp();
                }
            }
        }
    }

    timer()
    {
        if (! both)
        {
            integer myTTime;
            if (isTimed)
            {
                if (isRandom)
                {
                    texNum = (integer)llFrand(numOfTextures);
                    //llOwnerSay(" timer set");
                    myTTime = llFloor(llFrand(myTime)) + (myTime / 2);
                    llSetTimerEvent(myTTime);
                }
                else
                {
                    texNum = texNum + 1;
                    //llOwnerSay(" timer set");
                    llSetTimerEvent(myTime);
                }
                if (texNum > numOfTextures)
                {
                    texNum = 0;
                }
            }
        }
        else
        {
            sendOther("settexnum|" + (string)texNum);
            sendOther("setttime|" + (string)myTTime);
        }
        setUp();
    }

    link_message(integer senderNum, integer num, string msg, key senderKey)
    {
        string myType = llGetSubString(senderKey, 0, 2);
        if (myType == "rtn")
        {
            //llOwnerSay("returned " + (string)num + " " + msg + " " + (string)senderKey);
            string myCommand = llGetSubString(senderKey, 3, -1);
            if (myCommand == "Texture")
            {
                myTexture = (key)msg;
            }
            if (myCommand == "NumOfTextures")
            {
                numOfTextures = (integer)msg;
            }
        }
    }

}
