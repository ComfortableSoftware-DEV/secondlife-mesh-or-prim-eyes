
integer allTextures;
integer myNumOfTextures;

list validTextures = [
-1
];

list myTextures = [ // uuid, name
  "330cca01-74fb-d103-3636-61b1ca9f0674", // ar1000    00
  "489c70f9-5c22-ca94-8f5d-a543ecbf8020", // ar1001    01
  "70418541-eec2-c8e1-c200-f03182c574cb", // ar1002    02
  "28787bed-dc1c-100e-0ac0-a70bf8d1ff2d", // ar1003    03
  "508ba6be-da26-d4ca-a2da-8e0243b92cc1", // ar1004    04
  "a3749881-54e9-9870-4637-1fc452175af8", // ar1005    05
  "7aa4d551-f0f7-9f79-dabd-c15106d12702", // ar1006    06
  "e5f5c93a-c133-2b87-9fd2-99c98dc6c32a", // ar1007    07
  "e0b5fd36-ca88-e492-7f1a-4eca2e4876cc", // ar1008    08
  "fb0746db-09e9-7824-aadc-ff6f35e001e0", // ar1009    09
  "aca06668-cb93-3270-08f5-dfee54abb965", // ar1010    10
  "53c0f6e4-cae8-5c28-bf8f-3a64fc636ddf", // ar1011    11
  "1f16f915-f760-066a-6891-967e01d8f2b2", // ar1012    12
  "8c1b56f0-06f2-65a7-ba7b-ccd35818f700", // ar1013    13
  "b8dde59b-c8f3-e77e-5269-b2e175adf7cf", // ar1014    14
  "c297eb92-c824-1b17-924f-f4f117c93edb", // ar1015    15
  "fd7cd008-874a-7f0f-64d4-ff500c13ec04", // ar1016    16
  "b694e732-0bf6-63fa-5dfc-8ae7c4f42820", // ar1017    17
  "15421a00-53a6-1154-e933-445048cde166", // art1000   18
  "179535e0-1d87-a432-b270-ecc993dc8203", // art1001   19
  "b3f7c19e-e6ae-d462-a420-9bfd68857d73", // art1002   20
  "ee9ef749-97c4-7185-4a84-0e0b6abd6ee0", // art1003   21
  "d31a2b4a-dbae-5cca-b82e-d779399f72ab", // art1004   22
  "8dc66df3-fc49-04b2-dbf4-eaf9b0ce8652", // art1005   23
  "fc756372-2893-5010-31a5-a8c6f4c47ab9", // art1006   24
  "320b962c-f00c-9eae-88d5-d69a96101548", // art1007   25
  "7b498d1d-4d59-1d93-18b3-2439fc0bcd8e", // art1008   26
  "92b158e0-109e-224d-51c3-d935a5fac926", // art1009   27
  "06af4ed1-42da-57dc-3bde-4fa81175584f", // art1010   28
  "34006274-6269-6424-884f-aed004894f6c", // art1011   29
  "89241b8f-5dd6-7f72-d9cb-680c99f421b5", // art1012   30
  "bfe89579-e289-f281-19de-5e12a3509cd2", // art1013   31
  "376be63d-d960-b066-f23f-a6de104292be", // art1014   32
  "88ac28d4-ee27-8474-ffed-41b39178bd29", // art1015   33
  "5637d1c1-5d81-248c-5346-79b8311dad9c", // art1016   34
  "ceef5ef0-4080-3180-d191-5b722f5f3769", // art1017   35
  "1137dc94-f362-640a-4567-da3f8267217a", // art1018   36
  "9cf6fca2-5643-d896-e9cf-1101b4061c48", // art1019   37
  "15ba6390-1258-66d3-f649-86a8c1e12db6", // art1020   38
  "4519052e-7133-ae71-0baa-152ae5270b56", // art1021   39
  "c4458ac1-2aae-84ac-c62a-4bc89914a1ca", // art1022   40
  "2638341e-c735-3761-7d10-ca54fd36966f", // art1023   41
  "d293f260-bcd6-7bba-0a3f-7c1945627ef9", // art1024   42
  "fad30757-f362-b9e2-b078-f548e637a046", // wild1000   43
  "464dc084-0740-8d36-ece1-5b996b41f928", // wild1001   44
  "d8bf8a8a-9f93-568f-b754-a7e304284f5f", // wild1002   45
  "e8599863-713b-f344-9cda-acc1dedaffed", // wild1003   46
  "6f39f24f-e3d5-4dd3-2629-cb6bb23bb401", // wild1004   47
  "9c27fa6d-56ea-cda4-1914-9464b4a79f9c", // wild1005   48
  "751f6530-f44b-2e53-3111-5e90c4cf7c1b", // wild1006   49
  "7d54138d-74ec-74e2-7198-dc55896eade5", // wild1007   50
  "c992e483-3317-672c-b68f-cfcacea31075", // wild1008   51
  "e8c8397d-def3-eb5e-55cd-b522a12f3c67", // wild1009   52
  "c6511573-e255-fd8c-2c9d-d1e87a6b13ae", // wild1010   53
  "6026e9ab-2ba9-6a14-0dfe-d1ba4d6f32ea", // wild1011   54
  "a9db37bd-93bf-5a38-f1e1-62b346085ae4", // wild1012   55
  "ea47e3f4-d8c4-6433-a5ff-cb5616424ec7", // wild1013   56
  "e0905eab-6578-552c-6ba1-4a2b1b3e43b8", // wild1014   57
  "1298b262-aed0-8e3e-47e6-fef18b323a99", // wild1015   58
  "500f2c91-252a-7171-f8fa-989c54cba235", // wild1016   59
  "fa564180-784d-e372-ac16-1f726c3695dc", // wild1017   60
  "e7d4b3df-243b-8364-7ec8-97656a542115", // wild1018   61
  "404f5b29-c023-44a8-b423-440d5b4b9e73", // wild1019   62
  "a2358b1b-035c-65f8-6170-5a29ded407df", // wild1020   63
  "6ee44b21-10fb-3448-23e5-808f2520e892", // wild1021   64
  "61ac412a-24ae-029f-f36d-2937c112259d", // wild1022   65
  "c89fe484-01cc-09d8-5587-f94ff6f4e443", // wild1023   66
  "83840c4d-9ca6-f4bd-4c80-df704ab646bc", // wild1024   67
  "466dde65-e421-39ec-6b08-fbfda0e26279", // wild1025   68
  "69231e9e-2b4b-2d90-e7bb-43fbd55e1d2c", // wild1026   69
  "61422f24-68f4-ad47-452c-c62fb2f6957c", // wild1027   70
  "0159a129-93e0-8875-aaf4-05edcbd79486", // anime1000-01 71
  "0a48a0d3-4ecb-a990-c508-be5ddc8077a6" // anime1000-02 72
];


myReturn(string myType, string myValue)
{
  if (myType != "")
  {
    //llOwnerSay("myreturn " + myType + " " + myValue);
    llMessageLinked(LINK_THIS, 0, myValue, "rtn" + myType);
    myType = "";
  }
}

setUp()
{
  if (llList2Integer(validTextures, 0) == -1)
  {
    myNumOfTextures = llGetListLength(myTextures) - 1;
    allTextures = TRUE;
  }
  else
  {
    myNumOfTextures = llGetListLength(validTextures) - 1;
    allTextures = FALSE;
  }
}

default
{
  state_entry()
  {
    setUp();
  }

  on_rez(integer num)
  {
    setUp();
  }

  changed(integer change)
  {
    if (change & CHANGED_OWNER)
    {
      llResetScript();
    }
  }

  link_message(integer senderNum, integer num, string msg, key senderKey)
  {
    string myType = llGetSubString(senderKey, 0, 2);
    if (myType == "ask")
    {
      //llOwnerSay("being asked for " + (string)num + " " + msg + " " + (string)senderKey);
      string myCommand = llGetSubString(senderKey, 3, -1);
      senderKey = "";
      if (myCommand == "Texture")
      {
        if (allTextures == TRUE)
        {
          myReturn("Texture", llList2String(myTextures, num));
        }
        else
        {
          myReturn("Texture", llList2String(myTextures, llList2Integer(validTextures, num)));
        }
      }
      if (myCommand == "NumOfTextures")
      {
        myReturn("NumOfTextures", (string)myNumOfTextures);
      }
    }
    return;
  }

}
