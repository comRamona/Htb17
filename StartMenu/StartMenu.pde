 
import controlP5.*;
import ddf.minim.*; 

AudioPlayer player;
Minim minim;//audio context

ControlP5 cp5;

int totalArrowCount = 20;

Arrow[] arr_left = new Arrow[totalArrowCount];
Arrow[] arr_right = new Arrow[totalArrowCount];
Arrow arr;
boolean mouseProssed = false;
PImage backgr;

boolean isGamePlaying = false;
int musicStartDelay = 900;  //millis
float playTime = 0;
int arrowIntervalDelay = 2000;

void setup() {
  size(400,599);
  noStroke();
  backgr = loadImage("rsz_1background.png");
  cp5 = new ControlP5(this);
  
  arr = new Arrow(270, 0);
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
     
   for (int i = 0; i < totalArrowCount; i++){
    arr_left[i] = new Arrow(55, (int)random(4));  //TODO has to be random, not 0  
    arr_right[i] = new Arrow(270, (int)random(4));  
   }

  minim = new Minim(this);
  player = minim.loadFile("file.mp3", 2048);
}

void mousePressed() {
  if (mouseX>100 && mouseX < 100 + 200 && mouseY > 300 && mouseY < 300 + 70){
      backgr = loadImage("backgroundGetMoving.png");
      cp5.getController("Maybe later").remove();
      cp5.getController("Get moving!").remove();
      isGamePlaying = true;
      player.play();
      playTime = millis();
  } 
  else if (mouseX>100 && mouseX < 100 + 200 && mouseY > 400 && mouseY < 400 + 70){
    exit();
  }
}

void draw() {
  updateBackground();
  updateArrows();
}

int arrowCount = 0;
boolean isArrowsFalling = false;
int prevArrowTime = 0;

void updateArrows(){
  //Are we playing the game?
  if (isGamePlaying){
    int curr = millis();
    //should we start displaying arrows?
    if (isArrowsFalling){
      if (curr - arrowIntervalDelay > prevArrowTime){
        arrowCount = arrowCount < totalArrowCount ? arrowCount+1 : totalArrowCount;
        prevArrowTime = curr;
      }
      
      for (int i = 0; i < arrowCount; i++){
        if (arr_left[i].getY() < 600){
          arr_left[i].fall();
          arr_left[i].show();
          
          if (arr_left[i].getY() > 370 && arr_left[i].getY() < 440){
            if (arr_left[i].getDirection() == motionDirection){
              arr_left[i].setStatus(1);
            }
          } else if (arr_left[i].getY() > 440 && arr_left[i].getStatus() == 0){
            arr_left[i].setStatus(-1);
          }
        }
        
        println (motionDirection);
        if (arr_right[i].getY() < 600){ 
          arr_right[i].fall();
          arr_right[i].show();
          
          if (arr_right[i].getY() > 370 && arr_right[i].getY() < 440){
            if (arr_right[i].getDirection() == motionDirection){
              arr_right[i].setStatus(1);
            }
          } else if (arr_right[i].getY() > 440 && arr_right[i].getStatus() == 0){
              arr_right[i].setStatus(-1);
          } 
          //else if ( motionDirection != -1){
          //   arr_right[i].setStatus(-1); 
          //}
        }
      }
      
    } else if (curr - musicStartDelay > playTime){
      isArrowsFalling = true;
      arrowCount++;
      prevArrowTime = curr;
    }
  }
  motionDirection = -1;
}

void updateBackground(){
  background(backgr);                         // sets background
  if (isGamePlaying){
    tint(255, 127);  // Display at half opacity
    fill(244, 66, 188, 100);
    rect(0, 400, 400, 70);
    stroke(126);
    line(200, 0, 200, 599);
    noStroke();
  }
}

int motionDirection = -1;
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      motionDirection = 0;
      //arr_left[0].setStatus(1);
    } else if (keyCode == DOWN) {
      motionDirection = 1;
      //arr_left[0].setStatus(-1);
    } else if (keyCode == LEFT) {
      motionDirection = 3;
      //arr_left[0].setStatus(0);
    } else if (keyCode == RIGHT) {
      motionDirection = 2;
      //arr_left[0].setStatus(0);
    }
  }
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}