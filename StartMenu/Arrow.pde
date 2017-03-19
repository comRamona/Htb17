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
  
  float xR = 55;
  float xL = 345;
  float y = 0;
  float yspeed = 10;
  
  /*public Arrow (int x){
    this.x = x; 
  }*/
  
  void fall(){
    y = y + yspeed;
  }
  
  void show(String pos){
    
    if (pos=="Left"){
      float imageRandom = random(4);
      if (imageRandom == 0){
        PImage pic_move = loadImage(arrowRightNeutral);
        image(pic_move,xL,y);
      }
      else if (imageRandom == 1){
        PImage pic_move = loadImage(arrowLeftNeutral);
        image(pic_move,xL,y);
      }
      else if (imageRandom == 2){
        PImage pic_move = loadImage(arrowUpNeutral);
        image(pic_move,xL,y);
      }  
      else {
        PImage pic_move = loadImage(arrowDownNeutral);
        image(pic_move,xL,y);
      }
    }
    else {
      float imageRandom = random(4);
      if (imageRandom == 0){
        PImage pic_move = loadImage(arrowRightNeutral);
        image(pic_move,xR,y);
      }
      else if (imageRandom == 1){
        PImage pic_move = loadImage(arrowLeftNeutral);
        image(pic_move,xR,y);
      }
      else if (imageRandom == 2){
        PImage pic_move = loadImage(arrowUpNeutral);
        image(pic_move,xR,y);
      }  
      else {
        PImage pic_move = loadImage(arrowDownNeutral);
        image(pic_move,xR,y);
      }
    }
    
  }
  
}