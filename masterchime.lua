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

inter.open(43)


while true do
    local time = os.time()
    local message = os.pullEvent("modem_message")
    if shouldPlayChime(time) then
        
        print("Time:",time, "sending message")
        inter.transmit(15,43,"Assemble")

    else 
        print("Time:",time)    
        if message then
            print(message)
        end
    end
    os.sleep(0.5)   --must be 0.5; 1 second = 20 ticks
end