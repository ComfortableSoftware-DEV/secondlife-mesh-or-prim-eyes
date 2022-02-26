// version info
string myName = "THC prim eyes";
string myVersion = "5.0.0-1";


// default values
float defaultPositionMoves = 0.001;
float defaultSizeChange = 0.001;
integer both = FALSE;
integer isRandom = TRUE;
integer isTimed = TRUE;
integer myTime = 10;
key myCurrentTexture = "fce92c78-ae92-9da7-e744-f42f2a8db93c";
vector defaultPosition = <0, 0, 0>;
vector defaultRotation = <0, 0, 0>;
vector defaultSize = <0.012, 0.023, 0.023>;
vector myCurrentPosition = <0, 0, 0>;
vector myCurrentRotation = <0, 0, 0>;
vector myCurrentSize = <0.018, 0.039, 0.039>;


list myCurrentTextureList = [];


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


changeAll()
{
  llSetLinkPrimitiveParams(LINK_THIS, [
      PRIM_SIZE, myCurrentSize,
  ]);
}
