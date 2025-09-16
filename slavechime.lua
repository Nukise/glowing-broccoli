local speak = peripheral.find("speaker") or error("no speaker found",0)
local router = peripheral.find("modem") or error("no modem found",0)

function playChime()
    speak.playNote("chime", 3,10)
    os.sleep(1)
    speak.playNote("chime", 3,6)
    os.sleep(1)
    speak.playNote("chime", 3,8)
    os.sleep(1)
    speak.playNote("chime", 3,1)
    os.sleep(1)
    speak.playNote("chime", 3,1)
    os.sleep(1)
    speak.playNote("chime", 3,8)
    os.sleep(1)
    speak.playNote("chime", 3,10)
    os.sleep(1)
    speak.playNote("chime", 3,6)
    os.sleep(1)
end
print("start")
router.open(15)

while true do
    print("waiting for cap")
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")       
    if message == "Avengers!!!" then 
        print("ASSEMBLE!!!!!")
        router.transmit(43,0,"ASSEMBLE!!!!!")
        playChime()
    else
        print("nothing")
    end
    print("type:",event, "side:",side, "channel:",channel, "reply to channel:",replyChannel,"distance:",distance)
end