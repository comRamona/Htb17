class Arrow {
  
  float x = 150;
  float y = 0;
  float yspeed = 1;
  
  
  void fall(){
    y = y + yspeed;
  }
  
  void show(String pic){
    
    PImage pic_move = loadImage(pic);
    image(pic_move,x,y);
    
  }
  
}