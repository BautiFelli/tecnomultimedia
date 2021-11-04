class Pelota {

  float x, y, ang, vel, arcox=020, arcoy=0, ancho=800, alto=281, endX, endY, pct = 0.00;
  PImage pelota;
  int estado=0;
  boolean fueGol;
  //constructor
  Pelota() {
    x=width/2;
    y=500;  
    ang=0;
    vel=1;
    pelota=loadImage("pelota.png");

  }

  //metodos
  void dibujar() {


    //pelota
    pushMatrix();
    imageMode(CENTER);
    translate(x, y);
    rotate(radians(ang));
    image(pelota, 0, 0);
    popMatrix();
  }

  void patear(Arquero a) {
    if ((mouseX>arcox && mouseX<arcox+ancho && mouseY>arcoy && mouseY<arcoy+alto)  && (pct < 1)) {
      
      click(); 
      if (estado==1) {
        ang=lerp(y, endY, 0.005);
        endX = mouseX;
        endY = mouseY;
        x = lerp(x, endX, 0.1);
        y = lerp(y, endY, 0.1);
      } else if (estado==2) {
        colision(a);
        reiniciar();
      }

    }
   
  }
  void click() {
    if (mousePressed) {
      estado=1;
      println(estado);
    } else if (dist(x, y, endX, endY)<=10) {
      estado=2;
    }
  }
  void reiniciar() {
    x=width/2;
    y=500;  
    ang=0;
    vel=1;
  }
  void colision(Arquero a) {
    float _getX= a.getX();
    float d_neuer=dist(x,endX,_getX,_getX);
    
      if(x>140 && x<650 && y<280 && y>100){
        if(d_neuer<55){
          noGol();
        }else
        gol();
    } else { if (endX < 800 && y < 280) {
       noGol(); 
    }
    }
    
    
    //if (dist(x, y, _getX, _getY)<=5) {
      
    //}
  }
  void gol(){
    j.actualizarContUtd();
    fueGol=true;
      
  }
 void noGol(){
   j.actualizarContBay();
   fueGol=false;
 }
 
 boolean getFueGol(){
   return fueGol;
 }
 
}
