import processing.serial.*;

// The serial port:
Serial myPort;       
String serialName = "/dev/cu.usbmodemFD122";
//String serialName = "/dev/cu.usbmodemFA132";
//String serialName = "/dev/ttyACM0";

void setup() {
  size(400, 599);  // Size must be the first statement
  frameRate(30);
  myPort = new Serial(this, serialName, 115200);
}

String motion = "";
color bg = color(255, 204, 0);

void draw() {
  background(bg);   // Clear the screen with a black background
  
  while (myPort.available() > 0) {
    motion = myPort.readString();
  }
  
  println(motion + '\n');
  switch (motion){
    case "U":
      fill(204, 102, 0);
      rect(170, 400, 60, 60);    
    break;
    case "D":
      fill(102);
      rect(170, 200, 60, 60);
    break;
    case "R":
      fill(100, 0, 34);
      rect(280, 300, 60, 60);
    break;
    case "L":
      fill(0, 102, 12);
      rect(60, 300, 60, 60); 
    break;
    case "M":
      bg = color((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
      motion = "";
    break;

  }
    
}