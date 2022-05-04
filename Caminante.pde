class Caminante{
  
  float x,y;
  float ancho;
  float altura;
  color c;

  
 Caminante (color c_) {
  x=random(0,1200);
  y=400;
  altura=random(50,600);
  ancho=random(5,15);
   c=c_;
 }
  
  void dibujar(){
   rectMode(CENTER);
   noStroke();
   fill(c);
   rect(x,y,ancho,altura); 
   
 
}
  
 void cambiarAltura(){
    if((mouseY>(y+1))){
     altura= altura-5  ;
    }
  }
  
  void cambiarGrosor(){
   
    if(mouseX>(x+1)){
      ancho=random(-5,5);
    }
  }
  
 /* void mover(){
    float dx, dy;
 
 dx= x+cos(dir);
 dy=y+sin(dir);
 
    if (mousePressed){ 
  x=x+ dx;
  y=y+dy;
  
  }
  }
  */
  void reiniciar(){
 
  }
}
