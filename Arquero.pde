class Arquero{
  
  
  float x = 400.0, y = 190.0, direccion = 1, velocidad = 20;
  PImage neuer;
  
  Arquero() {
    neuer = loadImage("neuer.png");
    
    
    
    
    
    
  }
  
  void colocar() {
    pushMatrix();
    imageMode(CENTER);
    image(neuer,x,y);
    x += velocidad * direccion;
    if ( (x > 605) || (x < 176.5) ) {
      direccion = -direccion;
      
      
    }
    popMatrix();
    
    
    
  }
  
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
