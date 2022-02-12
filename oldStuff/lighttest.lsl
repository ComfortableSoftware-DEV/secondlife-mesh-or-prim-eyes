float myLeftEdge;
float myTopEdge;
float myVisibleY;
integer horizontal = 8;
integer screens = 3;
integer myCol;
integer myIndexNum;
integer myRow;
integer myScreen = 0;
integer myTextureNum = 0;
integer vertical = 24;
vector myButtonSize;
vector myHudSize = <0.5, 0.5, 0.5>;

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
    <0.0, 0.0, 0.0>
];

lightAConfig(integer lightCol, integer lightRow, integer primNum, integer yesNo, integer grayIt)
{
    // primnums #1 main prim #2 regular button press #3 rotateRate #4 moveRate #5 unused #6 mouseDelay #7 lights on/off #8 hover text
    llOwnerSay("light " + (string)lightCol + " " + (string)lightRow + " " + (string)primNum);
    integer tempRow = (lightRow & 7);
    float tempX = (myLeftEdge + (lightCol * myButtonSize.y));
    float tempZ = (myTopEdge - (tempRow * myButtonSize.y));
    llOwnerSay("myScreen " + (string)myScreen);
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
        myTAlpha = 0.6;
    }
    if (yesNo)
    {
        llSetLinkPrimitiveParamsFast(primNum, [
            PRIM_POS_LOCAL, myLightPos,
            PRIM_COLOR, ALL_SIDES, myTColor, myTAlpha
        ]);
        if (myScreen == 0)
        {
            primPosns = llListReplaceList(primPosns, [<lightCol, 0, lightRow>], primNum - 3, primNum - 3);
        }
    }
    else
    {
        llSetLinkPrimitiveParams(primNum, [
            PRIM_POS_LOCAL, <0, 0, 0>
        ]);
        primPosns = llListReplaceList(primPosns, [<0.0, 0.0, 0.0>], primNum - 3, primNum - 3);
    }
    if (primNum == 2)
    {
        llSetLinkPrimitiveParams(2, [
            PRIM_COLOR, ALL_SIDES, <1.0, 1.0, 1.0>, 1.0,
            PRIM_TEXTURE, ALL_SIDES, llList2Key(myTextureNums, myTextureNum), <1.0, 1.0, 0.0>, <0.0, 0.0, 0.0>, 90 * DEG_TO_RAD
        ]);
    }
    //llOwnerSay("primnum " + (string)primNum + " the prim positions are " + (string)primPosns);
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
    myScreen = 0;
    setEdges();
    llSetLinkPrimitiveParamsFast(LINK_ALL_CHILDREN, [
        PRIM_TEXTURE, ALL_SIDES, "8cbefd13-6177-6abf-ef19-2221eceb3ec7", <1.0, 1.0, 0.0>, <0.0, 0.0, 0.0>, 0 * DEG_TO_RAD,
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

hideLights(integer prim2Hide)
{
    llSetLinkPrimitiveParams(prim2Hide, [
        PRIM_POS_LOCAL, <0, 0, 0>,
        PRIM_COLOR, ALL_SIDES, <1.0, 0.0, 0.0>, 0.2
    ]);
    llSleep(0.5);
}

default
{
    state_entry()
    {
        setup();
        hideLights(-3);
        llSleep(5);
        llOwnerSay("hudsize " + (string)myHudSize + " buttonSize " + (string)myButtonSize + " topedge " + (string)myTopEdge + " leftedge " + (string)myLeftEdge);
        lightAConfig(0, 0, 3, TRUE, FALSE);
        lightAConfig(1, 1, 4, TRUE, FALSE);
        lightAConfig(2, 2, 5, TRUE, FALSE);
        lightAConfig(3, 3, 6, TRUE, FALSE);
        lightAConfig(4, 4, 7, TRUE, FALSE);
        lightAConfig(5, 5, 8, TRUE, FALSE);
        lightAConfig(6, 6, 9, TRUE, FALSE);
        lightAConfig(7, 7, 10, TRUE, FALSE);
    }

}
