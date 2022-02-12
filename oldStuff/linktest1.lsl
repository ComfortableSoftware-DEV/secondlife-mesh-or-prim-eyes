
sendMessage(string message)
{
    llMessageLinked(LINK_THIS, 0, message, "rtn");
}

default
{
    state_entry()
    {
        sendMessage("gone");
    }

    link_message(integer senderNum, integer num, string msg, key senderKey)
    {
        if (senderKey == "ask")
        {
            llOwnerSay("asked " + msg);
        }
    }
}
