from microbit import *
import radio
from math import sqrt, atan2, degrees

prev = 1000.0
radio.on()
while True:
    x = accelerometer.get_x()
    y = accelerometer.get_y()
    z = accelerometer.get_z()

    curr = sqrt(x**2 + y**2 + z**2)

  #  if curr-prev > 1000.0:
  #      uart.write("S")
  #      display.show("S");
    if accelerometer.was_gesture("down"):
        # uart.write("D")
        radio.send("RD")
#        display.show("D");
        display.show(Image.ARROW_N)
    if accelerometer.was_gesture("up"):
        # uart.write("U")
        radio.send("RU")
#        display.show("U");
        display.show(Image.ARROW_S)
    if accelerometer.was_gesture("right"):
        # uart.write("R")
        radio.send("RR")
#        display.show("R");
        display.show(Image.ARROW_W)
    if accelerometer.was_gesture("left"):
        # uart.write("L")
        radio.send("RL")
#        display.show("L");
        display.show(Image.ARROW_E)

    prev = curr
    sleep(1)
