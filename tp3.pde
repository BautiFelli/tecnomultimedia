int e; // tamaño

void setup(){
  frameRate(60);
  size (600,600);
  background(255);
  cursor(HAND);

 e=60;
}
void draw(){
background(0);
println(frameCount);
    float me=map(mouseY,0,width,150,235);   //cambio color stroke
   
if(frameCount>0 && frameCount <=120){   //texto 1ra pantalla
  fill(255,0,0);
  textSize(24);
  text ("Ilusión óptica", 230, 300);
  textSize(18);
  text("cuadrículas",250,320);
}
if (frameCount>120 && frameCount <= 1200){ //interactividad ilusion
  float mi= map(mouseX,0, width,50,400);
 
 
for( int x=-600; x<=30; x++){
  for (int y=-600; y<=30; y++){
    strokeWeight (10);
stroke(me);
    noFill();
      rect(x*e+ mi,y*e,e,e);  //grilla ilsuión
      
    if(keyPressed==true){
    
rect (x*e+mi,y*e, random(e-5,e+5), random(e-2,e+2)); //stroke efecto movimiento

  }
    
        
  }
  
  }
   }    

 


if(frameCount>1200){
  text ("botón reinicio", 245, 250);
    noStroke();
   fill (255,0,0);
    rect(285,285,30,30);//boton reinicio

  


}
}
void mouseClicked(){ //mouse izq se acercan, mouse der se alejan

  if (frameCount>120 && frameCount<1200 && mouseButton==LEFT){
    e++;
  }else if(frameCount>120 && frameCount <1200 && mouseButton==RIGHT){
e--;

  }
}
void mousePressed(){              //reinicio
if(mouseX>285 && mouseX<315 && mouseY>285 && mouseY<315 && frameCount>1200){
  frameCount=0;
e=60;
}
}
