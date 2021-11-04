
class Juego{
  
  
  PImage publico, escBayern, escUtd, inicio;
  int cant=5000, resBayern=0,resUtd=0, pantallas=0;
  Pelota p;
  Arquero a;
  Papelitos[] pu=new Papelitos[cant];
  PFont fuente;
  boolean fueGol;
  String [] insultos=new String[6];
  String [] textInicio= new String [6];
  
  Juego(){
    //constructor
  p=new Pelota();
  a=new Arquero();
  
  
   escBayern=loadImage("escBayern.png");
    publico= loadImage("Publico.png");
    escUtd=loadImage("united.png");
   fuente=loadFont("AgencyFB-Bold-48.vlw");
   insultos=loadStrings("insultos.txt");
   textInicio=loadStrings("textosinicio.txt");
   inicio=loadImage("inicio.jpg");
  
  
  for(int i=0;i<cant;i++){
   pu[i]= new Papelitos (); 
  }
 
 
 
}

void jugar(){
  
 if(pantallas==0){ //inicio
   imageMode(CENTER);
   image(inicio,400,300);
   boton(350,500,100,50);
   texto(textInicio[5], 24, 255, 350, 515, 100, 50);
   texto(textInicio[0], 72, 255, 50, 30, 700,100); 
   texto(textInicio[1], 24, 255, 270, 120, 250, 50);
   texto(textInicio[2], 24,255,270,170,250,50);
   texto(textInicio[3], 24,255,270,220,250,50);
   texto(textInicio[4], 24,255,270,270,250,100);
   
 }else if(pantallas==1){ //juego
   dibujarJuego();
 }else if(pantallas==3){ //pantalla gano
     background(0,255,0);
     texto("¡GANASTE!",72,0,50, 150, 700,100);
     boton(300,300,200,100);
     texto("VOLVER A JUGAR",42,255,300,310,200,100); 
        
   }else if(pantallas==4){ //perdio
   
     background(255,0,0);
     texto("PERDISTE",72,0,50, 150, 700,100); 
     boton(300,300,200,100);
     texto("VOLVER A JUGAR",42,255,300,310,200,100); 
 }
}

  
  void dibujarJuego(){
     
  
   
     //fondo
     fill (37, 62, 124); 
    rect(0, 0, 800, 280);
    fill(57,176,44);
    rect(0,280,800,320);
    
    //público atrás arco
    imageMode(CENTER);
    image(publico, 400, 140); 
    image(escBayern,300,40);
    image(escUtd,500,40);
    

    //arco
     fill(255);
     noStroke();
     rect(120,80,20,200);
     rect(650,80,20,200);
     rect(120,80,530,20);
      
     //lineas cancha
     stroke(255);
     strokeWeight(2);
     line(0,280,800,280);
     line(70,280,70,420);
     line(70,420,730,420);
     line(730,420,730,280);
    
   
   
  
     
    a.colocar();
    p.dibujar(); 
    p.patear(a);
    contador();
    fueGol=p.getFueGol();
    if(fueGol && resUtd>0){
      for(int i=0; i<pu.length;i++){
    pu[i].dibujarPapelitos();
      }
    }else{
      /*llamar puteadas*/
       if(resBayern>0){
         for(int i=0; i<insultos.length;i++){
         texto(insultos[i], 24, 200, random(800),random(250),70,30);
       
       }
    }}
   }
 
void contador(){
  
  textFont(fuente,70);
  textSize(36);
  text(resBayern + " - " + resUtd,370,55);
  
}
  void actualizarContUtd(){
    resUtd++;
    if(resUtd==10){
    pantallas=3;  
    }
  }
  void actualizarContBay(){
   resBayern++;
   if(resBayern==10){
    pantallas=4; 
   }
  }
  void texto(String tx, int e, int c, float x, float y, float alt, float anch){
    pushStyle();
    textAlign(CENTER);
    textFont(fuente);
    textSize(e);
    fill(c);
    text(tx, x, y, alt, anch);   //alt max width anch max height
    popStyle();
  }
  
  
   void boton(float x, float y, float tamX, float tamY){       
      pushStyle();
      
      fill(0);
      noStroke();
      if (mouseX>x && mouseX<x+tamX && mouseY>y && mouseY<y+tamY){
        fill(180);
         if(mousePressed && pantallas==0){
           
             pantallas=1;
                
               
                }else if(mousePressed && (pantallas==3 || pantallas ==4)){
                     pantallas=0; 
                     reiniciar();
                  }
                }
                rect(x,y,tamX,tamY);
               
                
                popStyle();
              }
              
 void reiniciar(){
   resBayern=0;
   resUtd=0;
 
   
   
 }
}  //end class
