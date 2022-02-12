// version info
string myName = "THC prim eyes MK II";
string myVersion = "1.0.0";

integer isRandom = TRUE;
integer isTimed = TRUE;
integer myTime = 60;
integer both = TRUE;
integer numOfTextures;
integer texNum = 0;
key owner;
integer isMine;
integer myAttached = 0;
integer myChan = -29856;
integer ti1;
string ts1;
vector myPosition = <0.01, 0.0, 0.0>;
vector mySize = <0.060, 0.060, 0.060>;

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
    string texName = llGetInventoryName(INVENTORY_TEXTURE, texNum);
    numOfTextures = llGetInventoryNumber(INVENTORY_TEXTURE) - 1;
    llSetPrimitiveParams([
        PRIM_SIZE, mySize,
        PRIM_TEXTURE, ALL_SIDES, texName, <PI, PI / 2, 0>, <0.0, 0.2, 0.0>,90 * DEG_TO_RAD,
        PRIM_ROTATION, llEuler2Rot(<0.0, 0.0, 116.0> * DEG_TO_RAD)
    ]);
    //llOwnerSay(myName + " set and good to go");
}

init()
{
    integer myAttachedPoint = llGetAttached();
    myAttached = 1;
    if ((myAttachedPoint != 15) && (myAttachedPoint != 16))
    {
        myAttached = 0;
        llOwnerSay("I only work correctly when attached to an eyeball.");
    }
    llListen(myChan, "", NULL_KEY, "");
    checkValues();
    if (isTimed)
    {
        llSetTimerEvent(myTime);
    }
    else
    {
        llSetTimerEvent(0);
    }
    setUp();
}

sendOther(string msg)
{
    if (both | (msg == "both on") | (msg == "both off"))
    {
        llWhisper(myChan, (string)owner + "|" + msg);
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
    if (mySize.x < 0.03)
    {
        mySize.x = 0.03;
    }
    if (mySize.y < 0.03)
    {
        mySize.y = 0.03;
    }
    if (mySize.z < 0.03)
    {
        mySize.z = 0.03;
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

doOne(string msg)
{
    if (msg == "random on")
    {
        isRandom = TRUE;
    }
    if (msg == "random off")
    {
        isRandom = FALSE;
    }
    if (msg == "30sec")
    {
        myTime = 30;
    }
    if (msg == "1min")
    {
        myTime = 60;
    }
    if (msg == "5min")
    {
        myTime = 300;
    }
    if (msg == "10min")
    {
        myTime = 600;
    }
    if (msg == "15min")
    {
        myTime = 900;
    }
    if (msg == "30min")
    {
        myTime = 1800;
    }
    if (msg == "1hr")
    {
        myTime = 3600;
    }
    if (msg == "timer on")
    {
        isTimed = TRUE;
    }
    if (msg == "timer off")
    {
        isTimed = FALSE;
    }
    if (msg == "-1")
    {
        if (mode == 1)
        {
            texNum = texNum - 1;
            if (texNum < 0)
            {
                texNum = numOfTextures - 1;
            }
        }
        if (mode == 2)
        {
            mySize.z = mySize.z - 0.001;
        }
        if (mode == 3)
        {
            mySize.y = mySize.y - 0.001;
        }
        if (mode == 4)
        {
            mySize.x = mySize.x - 0.001;
        }
        if (mode == 7)
        {
            myPosition.z = myPosition.z - 0.001;
        }
        if (mode == 8)
        {
            myPosition.y = myPosition.y - 0.001;
        }
        if (mode == 9)
        {
            myPosition.x = myPosition.x - 0.001;
        }
    }
    if (msg == "+1")
    {
        if (mode == 1)
        {
            texNum = texNum + 1;
            if (texNum >= numOfTextures)
            {
                texNum = 0;
            }
        }
        if (mode == 2)
        {
            mySize.z = mySize.z + 0.001;
        }
        if (mode == 3)
        {
            mySize.y = mySize.y + 0.001;
        }
        if (mode == 4)
        {
            mySize.x = mySize.x + 0.001;
        }
        if (mode == 7)
        {
            myPosition.z = myPosition.z + 0.001;
        }
        if (mode == 8)
        {
            myPosition.y = myPosition.y + 0.001;
        }
        if (mode == 9)
        {
            myPosition.x = myPosition.x + 0.001;
        }
    }
    if (msg == "-10")
    {
        if (mode == 1)
        {
            texNum = texNum - 10;
            if (texNum < 0)
            {
                texNum = numOfTextures - 1;
            }
        }
        if (mode == 2)
        {
            mySize.z = mySize.z - 0.01;
        }
        if (mode == 3)
        {
            mySize.y = mySize.y - 0.01;
        }
        if (mode == 4)
        {
            mySize.x = mySize.x - 0.01;
        }
        if (mode == 7)
        {
            myPosition.z = myPosition.z - 0.01;
        }
        if (mode == 8)
        {
            myPosition.y = myPosition.y - 0.01;
        }
        if (mode == 9)
        {
            myPosition.x = myPosition.x - 0.01;
        }
    }
    if (msg == "+10")
    {
        if (mode == 1)
        {
            texNum = texNum + 10;
            if (texNum >= numOfTextures)
            {
                texNum = 0;
            }
        }
        if (mode == 2)
        {
            mySize.z = mySize.z + 0.01;
        }
        if (mode == 3)
        {
            mySize.y = mySize.y + 0.01;
        }
        if (mode == 4)
        {
            mySize.x = mySize.x + 0.01;
        }
        if (mode == 7)
        {
            myPosition.z = myPosition.z + 0.01;
        }
        if (mode == 8)
        {
            myPosition.y = myPosition.y + 0.01;
        }
        if (mode == 9)
        {
            myPosition.x = myPosition.x + 0.01;
        }
    }
}    checkValues();

addSize(string input)
{
    list myInput = llCSV2List(input);
    dialog_sizeNames += ["sz-" + llList2String(myInput, 0)];
    vector tempSize;
    tempSize.x = llList2Float(myInput, 1);
    tempSize.y = llList2Float(myInput, 2);
    tempSize.z = llList2Float(myInput, 3);
    mySizes += [tempSize];
}

addPosition(string input)
{
    list myInput = llCSV2List(input);
    dialog_positionNames += ["pz-" + llList2String(myInput, 0)];
    vector tempPosition;
    tempPosition.x = llList2Float(myInput, 1);
    tempPosition.y = llList2Float(myInput, 2);
    tempPosition.z = llList2Float(myInput, 3);
    myPositions += [tempPosition];
}

doSettings(string setting, string value)
{
    setting = llToUpper(setting);
    value = llToUpper(value);
    integer iValue = (integer)value;
    float fValue = (float)value;
    if (setting == "SETTINGS")
    {
        if (value == "DONE")
        {
            checkValues();
        }
    }
    if (setting == "ADDSIZE")
    {
        addSize(value);
    }
    if (setting == "ADDPOSITION")
    {
        addPosition(value);
    }
    if (setting == "SETRANDOM")
    {
        isRandom = iValue;
    }
    if (setting == "SETTIMED")
    {
        isTimed = iValue;
    }
    if (setting == "SETTTIME")
    {
        llSetTimerEvent(iValue);
    }
    if (setting == "SETTIME")
    {
        myTime = iValue;
    }
    if (setting == "SETTEXNUM")
    {
        texNum = iValue;
    }
    if (setting == "SETHEIGHT")
    {
        mySize.z = fValue;
    }
    if (setting == "SETWIDTH")
    {
        mySize.y = fValue;
    }
    if (setting == "SETDEPTH")
    {
        mySize.x = fValue;
    }
    if (setting == "SETINOUT")
    {
        myPosition.x = fValue;
    }
    if (setting == "SETHORIZ")
    {
        myPosition.y = fValue;
    }
    if (setting == "SETVERT")
    {
        myPosition.z = fValue;
    }
    if (setting == "SETBOTH")
    {
        both = iValue;
    }
}

default
{

    state_entry()
    {
        init();
        setUp();
    }

    on_rez(integer num)
    {
        init();
        setUp();
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
            if (both)
            {
                sendOther("settexnum|" + (string)texNum);
                sendOther("setttime|" + (string)myTTime);
            }
            setUp();
        }
    }
}
