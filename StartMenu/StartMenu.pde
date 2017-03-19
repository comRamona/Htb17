 
import controlP5.*;

ControlP5 cp5;

Arrow[] arr = new Arrow[100];
boolean mouseProssed = false;
PImage backgr;      
void setup() {
  size(400,599);
  noStroke();
  backgr = loadImage("rsz_1background.png");
  cp5 = new ControlP5(this);
  
 // arr = new Arrow(55);
  
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
}
boolean isGamePlaying = false;
void mousePressed() {
  if (mouseX>100 && mouseX < 100 + 200 && mouseY > 300 && mouseY < 300 + 70){
      //String[] args = {"Begin"};
      //PlayScreen playScreen = new PlayScreen();
      //PApplet.runSketch(args, playScreen);
      backgr = loadImage("backgroundGetMoving.png");
      cp5.getController("Maybe later").remove();
      cp5.getController("Get moving!").remove();
      isGamePlaying = true;
  } 
  else if (mouseX>100 && mouseX < 100 + 200 && mouseY > 400 && mouseY < 400 + 70){
    exit();
  }
}

void draw() {
  background(backgr);                         // sets background
  if (isGamePlaying){
    
    tint(255, 127);  // Display at half opacity
    fill(244, 66, 188, 100);
    rect(0, 400, 400, 70);
    stroke(126);
    line(200, 0, 200, 599);
    noStroke();
    
    for (int i = 0; i < 100; i++){
    arr[i].fall();
    arr[i].show("Left");
    arr[i].show("Right");
    //delay(1);
    
    }
  }
  

}