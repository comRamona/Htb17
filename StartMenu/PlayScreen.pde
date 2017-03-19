public class PlayScreen extends PApplet {

  public void settings() {
    size(400,599);
  }
  public void draw() {
    PImage backgr;    
    backgr = loadImage("rsz_1background.png");     
    background(backgr);                         // sets background
  }
}