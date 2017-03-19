 
import controlP5.*;
import ddf.minim.*; 

AudioPlayer player;
Minim minim;//audio context

ControlP5 cp5;

Arrow[] arr = new Arrow[100];
boolean mouseProssed = false;
PImage backgr;      
void setup() {
  size(400,599);
  noStroke();
  backgr = loadImage("rsz_1background.png");
  cp5 = new ControlP5(this);
  
  arr = new Arrow(55, "down");
  arr.setStatus(1);
  
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
     
   for (int i = 0; i < 100; i++){
    arr[i] = new Arrow();  
   }

  minim = new Minim(this);
  player = minim.loadFile("file.mp3", 2048);
}

boolean isGamePlaying = false;
float musicStart = 8500;  //millis
float currTime = 0;

void mousePressed() {
  if (mouseX>100 && mouseX < 100 + 200 && mouseY > 300 && mouseY < 300 + 70){
      backgr = loadImage("backgroundGetMoving.png");
      cp5.getController("Maybe later").remove();
      cp5.getController("Get moving!").remove();
      isGamePlaying = true;
      player.play();
      currTime = millis();
  } 
  else if (mouseX>100 && mouseX < 100 + 200 && mouseY > 400 && mouseY < 400 + 70){
    exit();
  }
}

void draw() {
  updateBackground();
  updateArrows();
}

void updateArrows(){
  if (isGamePlaying){
    float m = millis();
      if (m - 2000 > currTime){
      arr.fall();
      arr.show();    
    }
  }
}

void updateBackground(){
  background(backgr);                         // sets background
  if (isGamePlaying){
    for (int i = 0; i < 100; i++){
      arr[i].fall();
      arr[i].show("Left");
      arr[i].show("Right");
      //delay(1);
    }
  }
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}