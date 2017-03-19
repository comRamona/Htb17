class Arrow {
  
  String arrowRightRed = "arrowRightRed.png";
  String arrowLeftRed = "arrowLeftRed.png";
  String arrowUpRed = "arrowUpRed.png";
  String arrowDownRed = "arrowDownRed.png";
  
  String arrowRightGreen = "arrowRightGreen.png";
  String arrowLeftGreen = "arrowLeftGreen.png";
  String arrowUpGreen = "arrowUpGreen.png"; 
  String arrowDownGreen = "arrowDownGreen.png";
  
  String arrowRightNeutral = "arrowRightNeutral.png";
  String arrowLeftNeutral = "arrowLeftNeutral.png";
  String arrowUpNeutral = "arrowUpNeutral.png";
  String arrowDownNeutral = "arrowDownNeutral.png";   
  
  float x = 55;
  float y = -60;
  float yspeed = 1;
  
  int status = 0;
  int direction = 0;
  
  public Arrow (int x, int direction){
    this.x = x; 
    this.direction = direction;
  }
  
  void fall(){
    y = y + yspeed;
  }
 
  void setStatus(int status){
    this.status = status; 
  }
  
  int getStatus (){
    return this.status;
  }
  
  int getDirection(){
    return this.direction;
  }
  
  float getY(){
    return this.y;
  }
  
  float getX(){
    return this.x;
  }
  
  void show(){
    String pic = updateArrow();
    PImage pic_move = loadImage(pic);
    imageMode(CENTER);
    image(pic_move,x,y);
  }
  
  String updateArrow(){
    if (status == 0 && direction == 0)
      return "arrowUpNeutral.png";
    if (status == 0 && direction == 1)
      return "arrowDownNeutral.png";
    if (status == 0 && direction == 2)
      return "arrowRightNeutral.png";
    if (status == 0 && direction == 3)
      return "arrowLeftNeutral.png";
      
    if (status == 1 && direction == 0)
      return "arrowUpGreen.png";
    if (status == 1 && direction == 1)
      return "arrowDownGreen.png";
    if (status == 1 && direction == 2)
      return "arrowRightGreen.png";
    if (status == 1 && direction == 3)
      return "arrowLeftGreen.png";
      
    if (status == -1 && direction == 0)
      return "arrowUpRed.png";
    if (status == -1 && direction == 1)
      return "arrowDownRed.png";
    if (status == -1 && direction == 2)
      return "arrowRightRed.png";
    if (status == -1 && direction == 3)
       return "arrowLeftRed.png";
    
    return "arrowUpNeutral.png";
  }
}