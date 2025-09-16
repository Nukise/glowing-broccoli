--ECDFFDEC ;20t between noteblocks
local noonFloor = 12.000
local noonCeiling = 12.010
local nightFloor = 18.500
local nightCeiling = 18.510
local morningFloor =  6.000
local morningCeiling = 6.010
local inter = peripheral.find("modem") or error("moden not found",0)

function shouldPlayChime(time) 
    return 
    (time >= noonFloor and time < noonCeiling) or 
    (time >= nightFloor and time < nightCeiling) or 
    (time >= morningFloor and time < morningCeiling)
end

while true do
    local time = os.time()
    if shouldPlayChime(time) then 
        print("Time:",time, "Avengers!!!")
        inter.transmit(15,43,"Avengers!!!")
        local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
        if message == "ASSEMBLE!!!!!" then
            print(message)
        end
    else 
        print("Time:",time)   
    end
    os.sleep(0.5)   --must be 0.5; 1 second = 20 ticks
end