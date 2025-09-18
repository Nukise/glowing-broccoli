local modem = peripheral.find("modem")
local meter = peripheral.wrap("left")
term.clear()
term.setCursorPos(1,1)
print("hello i am sending stressometer information on channels 37 & 92")
while true do
    modem.transmit(37,0,meter.getStressCapacity())
    os.sleep(.1)
    modem.transmit(92,0,meter.getStress())
    os.sleep(.1)
end