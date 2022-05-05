class Caminante{
  
  float x,y, px, py;
  float ancho;
  float altura;
  color c;
  int estado=0;

 Caminante (color c_) {
  x=random(0,1200);
  y=400;
  altura=random(50,600);
  ancho=random(5,15);
   c=c_;
 }
  
  void dibujar(){
    
    px=(x+mouseX)%mouseX; 
   rectMode(CENTER);
   noStroke();
   fill(c);
   if((dist(mouseX,mouseX,x,x)<px) && (estado==0)){  //el dist hace lo del movimiento que hace la obra.  Los estados los estaba probando
   rect(x,y,ancho,altura); 
   estado=1;
   } else if((x>1200)&& (estado==1)){
     estado=0;
     background(255);
   }
   println(estado);
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
