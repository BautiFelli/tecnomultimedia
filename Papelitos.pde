class Papelitos {

  
  float x, y, tam, vel, ang;
  color c;

  Papelitos() {
   
   x=random(0,800);
   y=random(-50,-100);
   tam=random(5,35);
   c=color(random(0,255),random(0,255),random(0,255));
   vel=random(1,3);
   ang=0;
  }
  
  
  void dibujarPapelitos(){
    fill(c);
    noStroke();
    translate(x,y);
    rotate(ang);
    rect(x,y,tam,5);
    x+=1;
    y+=vel;
    ang=ang-vel;
  
  }
  void reciclar(){
    
    if(y>280){
    x=random(0,800);
    y=random(-50,-100);
   tam=random(5,35);
   c=color(random(0,255),random(0,255),random(0,255));
   ang=0;
    }
    
  }

}
