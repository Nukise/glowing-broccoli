local monitor = peripheral.find("monitor") or error("monitor not found",0)
local modem = peripheral.find("modem") or error ("modem not found",0)
term.redirect(monitor)

function pos(...) return term.setCursorPos(...) end
function cls(...) return term.clear() end
function tCol(...) return term.setTextColor(...) end
function bCol(...) return term.setBackgroundColor(...) end
function box(...) return paintutils.drawFilledBox(...) end
function line(...) return paintutils.drawLine(...) end

function redrawWindow()
    x,y = monitor.getSize()
    cls()
    pos(1,1)
    box(1,1,x,y,colors.white)
    box(((x/4)-1),3,(x/1.25),8,colors.lightGray)
    line(((x/4)-1),4,(x/1.25),4,colors.lightGray)
    line((x/4),6,(x/1.25),6,colors.lightGray)
    --line(1,1,3,1,colors.red) 
    --line(1,2,3,2,colors.black) 
    --line(1,3,3,3,colors.black) 
    --line(1,4,3,4,colors.green) 
    --line(1,5,3,5,colors.green) 
    term.setCursorBlink(true)
end


function totalCapacity(capacity)
    modem.open(37)
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == 37
        capacity = message
        return
        capacity
end


function stressUsed(amount)
    modem.open(92)
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == 92
        amount = message
        return
        amount
end


while true do
    redrawWindow()
    pos((x/4),4)
    print("Network Capacity Used")
    pos((x/2.5),5)
    print(stressUsed(amount),"su")
    pos((x/4),6)
    print("Network Total Capacity")
    pos((x/2.5),7)
    print(totalCapacity(capacity), "su")
    os.sleep(10)
end


