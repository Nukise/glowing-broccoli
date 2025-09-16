--ECDFFDEC ;20t between noteblocks
local noonFloor = 12.000
local noonCeiling = 12.010
local nightFloor = 18.500
local nightCeiling = 18.510
local morningFloor =  6.000
local morningCeiling = 6.010
local speak = peripheral.find("speaker") or error("no speaker found",0)

function shouldPlayChime(time) 
    return 
    (time >= noonFloor and time < noonCeiling) or 
    (time >= nightFloor and time < nightCeiling) or 
    (time >= morningFloor and time < morningCeiling)
end

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
while true do
    local time = os.time()
    if shouldPlayChime(time) then
        
        print("Time:",time, "playing chime")
        -- rs.setOutput("back", true)
        -- os.sleep(.5)
        -- rs.setOutput("back", false)
        playChime()
    else 
        print("Time:",time)
    end
    os.sleep(0.5)   --must be 0.5; 1 second = 20 ticks
end
    
