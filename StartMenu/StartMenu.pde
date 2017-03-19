 
import controlP5.*;

ControlP5 cp5;

Arrow arr;
boolean mouseProssed = false;

void setup() {
  size(400,599);
  noStroke();
  cp5 = new ControlP5(this);
  
  arr = new Arrow();
  
  PFont pfont = createFont("Lucida Bright",10,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,20);
  
  // create a new button with name 'buttonA'
  cp5.addButton("Get moving!")
     .setValue(0)
     .setPosition(100,300)
     .setSize(200,70)
     .setFont(font)
     ;
  
  // and add another 2 buttons
  cp5.addButton("Maybe later")
     .setValue(100)
     .setPosition(100,400)
     .setSize(200,70)
     .setFont(font)
     ;
}

void mousePressed() {
  if (mouseX>100 && mouseX < 100 + 200 && mouseY > 300 && mouseY < 300 + 70){
      String[] args = {"Begin"};
      PlayScreen playScreen = new PlayScreen();
      PApplet.runSketch(args, playScreen);
  } 
  else if (mouseX>100 && mouseX < 100 + 200 && mouseY > 400 && mouseY < 400 + 70){
    exit();
  }
}

void draw() {
  PImage backgr;                                 
  backgr = loadImage("rsz_1background.png");     
  background(backgr);                         // sets background
  arr.fall();
  arr.show("arrowRightRed.png");
}