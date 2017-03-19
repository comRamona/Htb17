 
import controlP5.*;
import ddf.minim.*; 

AudioPlayer player;
Minim minim;//audio context

ControlP5 cp5;

Arrow arr;
boolean mouseProssed = false;
PImage backgr;      
void setup() {
  size(400,599);
  noStroke();
  backgr = loadImage("rsz_1background.png");
  cp5 = new ControlP5(this);
  
  arr = new Arrow(55);
  
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
  minim = new Minim(this);
  player = minim.loadFile("file.mp3", 2048);
}
boolean isGamePlaying = false;
void mousePressed() {
  if (mouseX>100 && mouseX < 100 + 200 && mouseY > 300 && mouseY < 300 + 70){
      backgr = loadImage("backgroundGetMoving.png");
      cp5.getController("Maybe later").remove();
      cp5.getController("Get moving!").remove();
      isGamePlaying = true;
      player.play();
  } 
  else if (mouseX>100 && mouseX < 100 + 200 && mouseY > 400 && mouseY < 400 + 70){
    exit();
  }
}

void draw() {
  background(backgr);                         // sets background
  if (isGamePlaying){
    arr.fall();
    arr.show();
    tint(255, 127);  // Display at half opacity
    fill(244, 66, 188, 80);
    rect(0, 400, 400, 70);
    stroke(126);
    line(200, 0, 200, 599);
    noStroke();
  }
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}