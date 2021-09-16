PImage [] fotos= new PImage [16];
String [] textoLargo=new String[16];
int nroImg;
int pantalla=0;
PFont font;
PFont font2;
void setup(){
   size(1000,900);
   for (int i=0; i<fotos.length; i++){
 fotos[i]=loadImage("./img/mr"+i+".jpg");
   }
  textoLargo=loadStrings ("/ttt/textos.txt");
  font=loadFont("Constantia-48.vlw");
  font2=loadFont ("MicrosoftNewTaiLue-Bold-14.vlw");
 nroImg=0;
  
}
void draw(){
 
  dibujPantalla(pantalla);

}


void keyPressed(){
  if ( key==32){
    if( pantalla==0 || pantalla==2 || pantalla==3 ||pantalla==4 
  ||pantalla==5 || pantalla==6 || pantalla==7 || pantalla==8 || pantalla==10 
  || pantalla==11 || pantalla==12||pantalla==13||pantalla==14||pantalla==15
  ){
  actualizar(pantalla, 0);
  }
}
}
void mouseClicked(){
 if (pantalla==1 || pantalla==9||pantalla==16||pantalla==17){
 }
  
}
