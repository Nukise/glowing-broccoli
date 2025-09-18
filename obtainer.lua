local monitor = peripheral.find("monitor") or error("monitor not found",0)
local modem = peripheral.find("modem") or error ("modem not found",0)
local x,y = monitor.getSize()
local xMiddle = (x/2)
local yMiddle = (y/2)
local window = window.create(monitor, ((x/4)+0), ((y/4)+1), (xMiddle+5), yMiddle)
monitor.clear()

function redrawWindow()
    monitor.setPaletteColor(1,1,2,1)
    monitor.setBackgroundColor(1)
    window.setCursorBlink(false)
    window.setPaletteColor(1,1,1,1)
    window.setPaletteColor(2,255,255,255)
    window.setTextColor(2)
    window.setBackgroundColor(1)
    window.clear()
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
    term.redirect(window)
    print("Network Total Capacity:"..totalCapacity(capacity))
    print("Network Capacity Used:"..stressUsed(amount))
    os.sleep(2)
end