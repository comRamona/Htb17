from microbit import *
import radio

radio.on()
while True:
    value = radio.receive()
    if value is not None:
        uart.write(str(value))
