class Arrow {
  
  float x = 55;
  float y = 0;
  float yspeed = 1;
  
  int status = 0;
  String direction = "down";
  
  public Arrow (int x, String direction){
    this.x = x; 
    this.direction = direction;
  }
  
  void fall(){
    y = y + yspeed;
  }
  
  void show(){
    String pic = updateArrow();
    PImage pic_move = loadImage(pic);
    image(pic_move,x,y);
  }
  
  String updateArrow(){
    if (status == 0 && direction == "up")
      return "arrowUpNeutral.png";
    if (status == 0 && direction == "down")
      return "arrowDownNeutral.png";
    if (status == 0 && direction == "right")
      return "arrowRightNeutral.png";
    if (status == 0 && direction == "left")
      return "arrowLeftNeutral.png";
      
    if (status == 1 && direction == "up")
      return "arrowUpGreen.png";
    if (status == 1 && direction == "down")
      return "arrowDownGreen.png";
    if (status == 1 && direction == "right")
      return "arrowRightGreen.png";
    if (status == 1 && direction == "left")
      return "arrowLeftGreen.png";
      
    if (status == -1 && direction == "up")
      return "arrowUpRed.png";
    if (status == -1 && direction == "down")
      return "arrowDownRed.png";
    if (status == -1 && direction == "right")
      return "arrowRightRed.png";
    if (status == -1 && direction == "left")
       return "arrowLeftRed.png";
    
    return "arrowUpNeutral.png";
  }
}