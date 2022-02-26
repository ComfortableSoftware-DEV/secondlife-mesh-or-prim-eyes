// version info
string myName = "THC prim eyes";
string myVersion = "5.0.0-1";


float ratio = 21.088607;
integer both = FALSE;
integer isRandom = TRUE;
integer isTimed = TRUE;
integer notecardLineNum = 0;
key dataReqKey;


float myDefaultTextureRotation = 0;
float myDefaultSize = 0.05332;
integer myDefaultTextureNum = 0;
integer myDefaultTime = 5;
key myDefaultTexture = "fce92c78-ae92-9da7-e744-f42f2a8db93c";
vector myDefaultPosition = <0.009, 0.0016, 0>;
vector myDefaultRotation = <0, 0, 0>;
vector myDefaultSize = <0.01450, 0.029, 0.029>;
vector myDefaultTextureOffset = <0, 0, 0>;
vector myDefaultTextureRepeats = <1, 1, 0>;


float myCurrentTextureRotation = myDefaultTextureRotation;
integer myCurrentTextureNum = myDefaultTextureNum;
integer myCurrentTime = myDefaultTime;
key myCurrentTexture = myDefaultTexture;
vector myCurrentPosition = myDefaultPosition;
vector myCurrentRotation = myDefaultRotation;
vector myCurrentSize;
vector myCurrentTextureOffset = myDefaultTextureOffset;
vector myCurrentTextureRepeats = myDefaultTextureRepeats;


list myCurrentTextureList = [
    "c59038ce-481f-6479-be6f-ad85a23d540e",
    "BOM"
];


// main dialogs
list dialogMain = ["more", "help", "done", "texture", "rotation", "un/join", "size", "position", "reset", "status", "materials", "timer"];
list dialogMore = ["main", "help", "done", "presets", "loadCard", "allRandom", "", "", "", "", "", ""];
list dialogPosition = ["main", "help", "done", "vert", "horiz", "depth", "zero", "presets", "default", "", "", ""];
list dialogPositionAdjust = ["back", "help", "done", "pos+1", "pos-1", "pos+5", "pos-5", "pos+10", "pos-10", "pos+100", "pos-100", "default"];
list dialogRotation = ["main", "help", "done", "clock", "upDown", "leftRight", "", "", "", "", "", ""];
list dialogRotationAdjust = ["back", "help", "done", "rot+1", "rot-1", "rot+5", "rot-5", "rot+10", "rot-10", "rot+100", "rot-100", "default"];
list dialogSize =  ["main", "help", "done", "height", "width", "depth", "default", "presets", "", "", "", ""];
list dialogSizeAdjust = ["back", "help", "done", "size+1", "size-1", "size+5", "size-5", "size+10", "size-10", "size+100", "size-100", "default"];
list dialogTimer = ["main", "help", "done", "timerOn", "timerOff", "randomOn", "randomOff", "presets", "adjust", "randomShort", "randomLong", "default"];
list dialogTimerAdjust = ["back", "help", "done", "sec+10", "sec-10", "sec+1", "sec-1", "min+1", "min-1", "sec+30", "sec-30", ""];


setAll()
{
  llOwnerSay("Setting ALL the things");
  myCurrentSize.y = myCurrentSize.z = myDefaultSize.z;
  myCurrentSize.x = myDefaultSize.z / ratio;

  if (myCurrentTexture == "BOM")
  {
    llSetPrimitiveParams([
        PRIM_TEXTURE, ALL_SIDES, IMG_USE_BAKED_EYES, <1, 1, 0>, <0, 0, 0>, myCurrentTextureRotation * DEG_TO_RAD ,
        PRIM_ROTATION, llEuler2Rot(myCurrentRotation * DEG_TO_RAD),
        PRIM_POSITION, myCurrentPosition,
        PRIM_SIZE, myCurrentSize
    ]);
  }

  else
  {
    llSetPrimitiveParams([
        PRIM_TEXTURE, ALL_SIDES, myCurrentTexture, myCurrentTextureRepeats, myCurrentTextureOffset, myCurrentTextureRotation * DEG_TO_RAD,
        PRIM_ROTATION, llEuler2Rot(myCurrentRotation * DEG_TO_RAD),
        PRIM_POSITION, myCurrentPosition,
        PRIM_SIZE, myCurrentSize
    ]);
  }
}


doALine(string variable, string value)
{
  llOwnerSay("A line Would be done");
}


setTextureOnly()
{
  llOwnerSay("setting the texture");
  myCurrentTexture = llList2Key(myCurrentTextureList, myCurrentTextureNum);
  if (myCurrentTexture == "BOM")
  {
    llSetPrimitiveParams([
        PRIM_TEXTURE, ALL_SIDES, IMG_USE_BAKED_EYES, <1, 1, 0>, <0, 0, 0>, myCurrentTextureRotation
    ]);
  }

  else
  {
    llSetPrimitiveParams([
        PRIM_TEXTURE, ALL_SIDES, myCurrentTexture, myCurrentTextureRepeats, myCurrentTextureOffset, myCurrentTextureRotation
    ]);
  }

}


default
{

  state_entry()
  {
    llSetTimerEvent(myCurrentTime);
    setAll();
  }

  on_rez(integer startParam)
  {
//    llSetTimerEvent(myCurrentTime);
//    setAll();
  }

  changed(integer changes)
  {
    if (changes && CHANGED_OWNER)
    {
      llResetScript();
    }
//    else if (changes && CHANGED_INVENTORY)
//    {
//      dataReqKey = llGetNotecardLine("config.note", notecardLineNum);
//    }
  }

  timer()
  {
    llOwnerSay("Timer triggered");
    myCurrentTextureNum++;
    if (myCurrentTextureNum > llGetListLength(myCurrentTextureList) )
    {
        myCurrentTextureNum = 0;
    }
    setTextureOnly();
    // llSetTimerEvent(myCurrentTime);
  }

}
