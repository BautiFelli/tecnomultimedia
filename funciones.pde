
void textos(String tx, int e, int c, float x, float y, float r, float u){    //textos largos
pushStyle();
textAlign(LEFT);
textFont(font);
textSize(e);
fill(c);
text(tx, x, y, r, u);   //r max width u max height
popStyle();
}
void textos2(String tx,int c, float x, float y, float r, float u){       //textos para continuar
  pushStyle();
  
  textAlign(CENTER);
  textFont(font2);
  fill(c);
  text(tx,x,y,r,u);
 
popStyle();
}

void dibujPantalla (int pantalla){   // FUNCION INFO EN PANTALLAS

estructura();   
 if(pantalla==0){            //1er pantalla
 
    textos(textoLargo[0], 16, color(255),50,700, 900, 200);
continuar();
 }else if(pantalla==1){    //2da pantalla
   nroImg=1;
fill(255);
textos( textoLargo[1], 16, color(255),50,710, 900, 200);
textFont(font2);
textos2("¿Qué decidís hacer? Usá el mouse. Opción A buscás ayuda, opción B te aislás de todos, opción C continuás con el hackeo",255, 50,780,900,100);
  boton (width/3,850,50,0);
  boton (width/3+200,850,50,1);
  boton (width/3+400,850,50,2);
  
}else if(pantalla ==2){           //pantalla 3   opcion a
  nroImg=2;
  textos(textoLargo[2],16, 255, 50,710, 900, 200);
  continuar();
 }else if(pantalla ==3){          //pantalla 4  opcion b
  nroImg=3;
  textos(textoLargo[5],16, 255, 50,710, 900, 200);
  continuar();
}else if(pantalla ==4){           //pantalla 5    opcion c
nroImg=4; 
textos (textoLargo[8],16, 255, 50,710, 900, 200);
continuar();
}else if(pantalla==5){            //pantalla 6  a2
 nroImg=5; 
 textos(textoLargo[3],16, 255, 50,710, 900, 200);
 continuar();
}else if(pantalla==6){           //pantalla 7 a3
 nroImg=6; 
 textos(textoLargo[4],16, 255, 50,710, 900, 200);
 continuar();
}else if(pantalla==7){          //pantalla 8    b2
 nroImg=7; 
  textos(textoLargo[6],16, 255, 50,710, 900, 200); 
  continuar();
}else if (pantalla==8){                       //pantalla 9   b3
nroImg=8;
textos(textoLargo[7],16, 255, 50,710, 900, 200);   
continuar();
}else if (pantalla==9){   //pantalla 10  c2
  nroImg=9;
  textos(textoLargo[9],16, 255, 50,710, 900, 200);
  textos2("Usá el mouse                   A: obedecés a mr robot B: igonorás a mr robot",255, 50,800,170,100);
  boton(width/2-50,830,60,3);
  boton(width/2+50,830,60,4);
}else if (pantalla==10){           //pantalla 11 c 3 a
  nroImg=10;
    textos(textoLargo[11],16, 255, 50,710, 900, 200);
     continuar();
}else if (pantalla==11){           // pantalla 12 c 3 b
  nroImg=11;
  textos(textoLargo[10],16, 255, 50,710, 900, 200);
  continuar();
}else if (pantalla==12){         //pantalla 13 c 3 opcion hacer calculos
 nroImg=12;
 textos(textoLargo[12],16, 255, 50,710, 900, 200);
 boton(width/2-50,830,70,5);     
  boton(width/2+50,830,70,6);
  fill(0);
  text(calc(10,20),width/2-75,833);
  text(calc(10,21),width/2+25,833);
textos("10*0.023+20*5.2", 25, color(255,0,0),80,750,200,200); 
}else if (pantalla==13){            //pantalla 14 destruiste E-corp
  nroImg=13;
  textos(textoLargo[13],50, 255, 50,710, 900, 200);
  continuar();
}else if (pantalla==14){         //pantalla 15 te agarran, terminás en la cárcel
 nroImg=14;
 textos(textoLargo[14],45,255, 50,710, 900, 200);
   continuar();
} else if (pantalla==15){          //pantalla 16 escapando
  nroImg=15;
  textos(textoLargo[15],17,255, 50,710, 900, 200);
  continuar();
} else if(pantalla==16){  //pantalla 17 FIN
background(0);
textos("FIN",60,color(255,0,0),(width/2)-50,height/4,200,200);
boton2((width/2)-100,height/2,200,50,true);
boton2((width/2)-100,(height/2)+100,200,50,false);
}else if (pantalla==17){    //pantalla 18 créditos
 background(0);
 boton2((width/2)-110,(height/2)+200,200,50,true);
 textoCredi("Hecho por Bautista Felli  Legajo 88176/2  Tecnología multimedial 1  UNLP",random(338,342),350);

}      
}



void actualizar(int estado, int opcion){  //funcion para actualizar
println(estado);
 if (estado ==0 ){        // inicio
 pantalla=1;
 }else if (estado==1){      // seg pant
   if(opcion==0){         //pantalla opcion A
     pantalla=2;  
     
   }else   if(opcion==1){      //pantalla opcion B
   pantalla=3;
   
 }else   if(opcion==2){   //pantalla opcion c    
   pantalla=4;
   }
 }else if(estado==2){      //opcion a 2
  pantalla=5;
 }else if (estado==3){   //opcion b continua
  pantalla=7; 
 } else if(estado==5){      //opcion a 3
 pantalla=6;
 }else if (estado==7){     //opcion b2
 pantalla=8;
 }else if (estado==4){     //pantalla reaparece mr robot
  pantalla=9; 
 }else if(estado==9){ 
 if(opcion==3){         //opcion a en C
   pantalla=10;
 }else if(opcion==4){    //opcion b en C
   pantalla=11;
 }
 }else if(estado==10){
  pantalla=12;
 }else if(estado==11){
   pantalla=15;
 }else if (estado==12){   //hack
    if (opcion==5){    //acertás
 pantalla=13;
    }else if(opcion==6){   //le errás
        pantalla=14;
      }
   }else if(estado==15){  //te corre la yuta
   pantalla=14;
   }else if (estado==6 || estado==8||estado==13||estado==14){   //Fin pantalla
    pantalla=16; 
   }else if(estado==16){     //Créditos
    if(opcion==7){
      pantalla=17;
    }
}
}   



void boton(float x, float y, float diam, int ID){
  fill(255);
  if(dist(mouseX,mouseY,x,y)<diam/2){
    fill(150);
  
    
    if (mousePressed){
   
      if(ID==0 && pantalla ==1){    //opcion 1     pantalla 1
       actualizar(pantalla,0);  
      }else if(ID==1 && pantalla==1){       //opcion 2  pantalla 1
          actualizar(pantalla,1);
      }else if(ID==2 && pantalla==1){       //opcion 3   pantalla 1
          actualizar(pantalla,2);
      }else if(ID==3 && pantalla==9){
        actualizar(pantalla,3);
      }else if (ID==4 && pantalla==9){
        actualizar(pantalla,4);
      }else if (ID==5 && pantalla==12){
       actualizar(pantalla,5);
      }else if (ID==6 && pantalla==12){
       actualizar(pantalla,6); 
      }
      fill(255,0,0);
    }  
    }
         
    circle (x,y,diam);
   if(ID==0){
     textos("A",20,0,x-5,y-7,20,20);
   }else if(ID==1){
          textos("B",20,0,x-5,y-7,20,20);
       }else if(ID==2){
       textos("C",20,0,x-5,y-7,20,20);
       }else if (ID==3){
         textos("A",20,0,x-5,y-7,20,20);
       }else if (ID==4){
          textos("B",20,0,x-5,y-7,20,20);
       }
}
void estructura(){
  pushStyle();
   background(0);   //estructura imagen-texto para las pantallas
     fotos[nroImg].resize(1000,700);
   image (fotos [nroImg],0 , 0);
    
}
void continuar(){     //para que no quede tan extensa la linea
textos2("Click en barra espaciadora para continuar",255,250,860,500,100); 
}
float calc(float x, float y){           //calculo para el "hack"
  float ee=x*0.023+y*5.2;
  return ee;
  }
void boton2(float x, float y, float tamX, float tamY, boolean ID){        //rect reinicio
if(pantalla==16||pantalla==17){
  fill(255);
  strokeWeight(5);
  stroke(255,0,0);
  if (mouseX>x && mouseX<x+tamX && mouseY>y && mouseY<y+tamY){
    fill(180);
     if(mousePressed){
       if(ID){
         reinicio(true);
}else{
actualizar(pantalla,7);   //pantalla créditos
}
 
}
}
rect(x,y,tamX,tamY);
if(ID==true){
textos2("Reiniciar", 0,x,y+20,200,200);
}else if(ID==false){
textos2("Créditos", 0,x,y+20,200,200);  
}
}
}
void reinicio(boolean q){   //reinicio
  if(q==true){
  pantalla=0;
  nroImg=0;
  noStroke();
  }  
}

void textoCredi(String tx,float x,float y){      //texto creditos
 pushStyle();
 textAlign(CENTER,BOTTOM);
  textSize(25);
  fill(255,0,0);
  text(tx,x,y,305,200);
  popStyle();
}
