class Papelitos {

  
  float x, y, tam, vel, ang;
  color c;

  Papelitos() {
   
   x=random(0,800);
   y=random(0,100);
   tam=random(5,35);
   c=color(random(0,255),random(0,255),random(0,255));
   vel=random(0.1,0.5);
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
    if(y>600){
     reciclar(); 

    }
  }
  void reciclar(){
    
    if(y>280){
    x=random(0,800);
    y=random(0,100);
   tam=random(5,35);
   c=color(random(0,255),random(0,255),random(0,255));
   ang=0;
    }
    
  }

}
