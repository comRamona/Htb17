class Arrow {
  
  float x = 55;
  float y = 0;
  float yspeed = 1;
  
  public Arrow (int x){
    this.x = x; 
  }
  
  void fall(){
    y = y + yspeed;
  }
  
  void show(String pic){
    
    PImage pic_move = loadImage(pic);
    image(pic_move,x,y);
    
  }
  
}