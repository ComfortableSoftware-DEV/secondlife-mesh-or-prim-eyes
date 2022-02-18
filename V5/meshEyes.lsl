// version info
string myName = "THC prim eyes";
string myVersion = "5.0.0-1";


// default values
float defaultPositionMoves = 0.001;
float defaultSizeChange = 0.001;
vector defaultSize = <0.018, 0.039, 0.039>;


// main dialogs
list dialogMain = ["more", "help", "done", "texture", "rotation", "un/join", "size", "position", "reset", "status", "materials", "timer"];
list dialogMore = ["main", "help", "done", "presets", "loadCard", "allRandom", "", "", "", "", "", ""]
list dialogPosition = ["main", "help", "done", "vert", "horiz", "depth", "zero", "presets", "default", "", "", ""];
list dialogPositionAdjust = ["back", "help", "done", "pos+1", "pos-1", "pos+5", "pos-5", "pos+10", "pos-10", "pos+100", "pos-100", "default"]
list dialogRotation = ["main", "help", "done", "clock", "upDown", "leftRight", "", "", "", "", "", ""]
list dialogRotationAdjust = ["back", "help", "done", "rot+1", "rot-1", "rot+5", "rot-5", "rot+10", "rot-10", "rot+100", "rot-100", "default"]
list dialogSize =  ["main", "help", "done", "height", "width", "depth", "default", "presets", "", "", "", ""];
list dialogSizeAdjust = ["back", "help", "done", "size+1", "size-1", "size+5", "size-5", "size+10", "size-10", "size+100", "size-100", "default"]
list dialogTimer = ["main", "help", "done", "timerOn", "timerOff", "randomOn", "randomOff", "presets", "adjust", "randomShort", "randomLong", "default"];
list dialogTimerAdjust = ["back", "help", "done", "sec+10", "sec-10", "sec+1", "sec-1", "min+1", "min-1", "sec+30", "sec-30", ""]


vector myPosition = <0.001, -0.0, -0.0>; // x=inout y=horizontal z=vertical
vector mySize

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

default
{

  state_entry()
  {
    llOwnerSay("Add the HUD for these eyes or local chat to ");
  }
}
