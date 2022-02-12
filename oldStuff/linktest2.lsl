
sendMessage(string message)
{
    llMessageLinked(LINK_THIS, 0, message, "ask");
}

default
{
    state_entry()
    {
        sendMessage("going");
    }

    link_message(integer senderNum, integer num, string msg, key senderKey)
    {
        if (senderKey == "rtn")
        {
            llOwnerSay("got " + msg);
        }
    }
}
