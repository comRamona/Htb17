from microbit import *
import radio
from math import sqrt, atan2, degrees

# Blinking effect on display
blinker = Image("90909:"
                "09090:"
                "90909:"
                "09090:"
                "90909")
blinker_counter = 0
blink_timer = 70 # 200 changes state about every ~1sec, DECREASE to make it fas

prev = 1000.0
radio.on()
while True:
    x = accelerometer.get_x()
    y = accelerometer.get_y()
    z = accelerometer.get_z()

    # Blinking effect on display
    display.show(blinker)
    blinker_counter = blinker_counter + 1
    if(blinker_counter % blink_timer == 0):
        blinker = blinker.invert()
    print(blinker_counter)

    curr = sqrt(x**2 + y**2 + z**2)

    if curr-prev > 800.0:
        radio.send("S")
    prev = curr
    sleep(1)
