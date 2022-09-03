class Enemigo{
  
  
 float x=600; float y=370;
  PImage lobo;
  
  Enemigo() {
    lobo = loadImage("img/lobito.png");
    
    
    
    
    
    
  }
  
  void colocar() {
    pushMatrix();
    imageMode(CENTER);
    image(lobo,x,y);
    

  
  }

}
