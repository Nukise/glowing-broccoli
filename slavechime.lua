local speak = peripheral.find("speaker") or error("no speaker found",0)
local router = peripheral.find("speaker") or error("no modem found",0)

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

router.open(15)

while true do
local message = os.pullEvent("modem_message")
    if message = Assemble then 
        playChime()
        print("AVENGERS!!!!!")
        router.transmit(43,0,"ASSEMBLED")
    end