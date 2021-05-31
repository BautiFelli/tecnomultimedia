PImage img;
PImage img2;

PFont Georgia; 
PFont titulos;
PFont nombres;

String pri;
 
String dirigida;
String musica;
String prot1;
String prot2;
String prot3;
String prot4;
String prot5;
String prot6;

String tit;
String sec1;
String sec2;
String sec3;
String sec4;
String sec5;
String sec6;


String jonah;
String musicos;
String prod;

String dir1;
String dir2;
String asis1;
String asis2;

int w;
int y; 
int q;
int x;
int c;

void setup(){
  size(800,600);
  print(frameCount);

  //declaraciones
 w=600;
 c=600;
  x=600;
  y=600;
  q=1;

 img=loadImage ("img.png");
 img2=loadImage ("fin.jpg");

 prot1= "SUNNY SULJIC";
 prot2="NA-KEL SMITH";
 prot3="OLAN PRENATT";
 prot4="RYDER McLAUGHLIN";
 prot5="GIO GALICIA";
 
 pri="fall.get back up.";
  
 tit="Actores secundarios";
 sec1="KATHERINE WATERSTON";
 sec2="LUCAS HEDGES";
 sec3="ALEXA DEMIE";
 sec4="AMA ELSESSER";
 sec5="JUDAH ESTRELLA BORUNDA";
 sec6="LIANA PERLICH";
 
 prod="ALEX G. SCOTT";
 jonah="JONAH HILL";
 musicos="TRENT REZNOR Y ATTICUS ROSS";
 dirigida="Escrita y dirigida por";
 musica= "Música original";
 
 dir1="Primer asistente de dirección";
 dir2="Segundo asistente de dirección";
 asis1="SCOTT ROBERTSON";
 asis2="ANDREW STAHL";
 
 //fuentes
 titulos=loadFont("Serif.italic-48.vlw");
 Georgia= loadFont("Georgia-48.vlw");
 nombres= loadFont("LucidaBright-48.vlw");
 println(frameCount);

}

void draw(){
  //1ra pantalla
   background(66,153,178);
  frameRate(30);
   
   //nubes
  strokeWeight(60);
  stroke(100+q%150);
  noFill();
  line(80+q,150,190+q,150);
  line(70+q,200,220+q,200);
  
  line(720-q,460,780-q,460);
  line(710-q,500,800-q,500);
  
  line(101+q,320,101+q,320);
  point(160+q,310);
  line(100+q,340,190+q,340);
  
  
  line(700,50,780,50);
  point(720,40);
  point(760,60);
  
  line(40,500,240,500);
  point(70,505);
  point(200,495);
  point(140,485);
  point(150,520);
  
  textAlign(LEFT);
  textFont(Georgia,20);
  text(pri,310,50);
  
  // foto pelicula
  image(img,random(99,101),random(149,151),550,450);
  
//act pantalla 1
 q++;
 
 println(frameCount);
   
 if (frameCount>300&&q>300){           //pantalla 2
 
  background (0);
  textAlign(LEFT);
  textFont(titulos, 30);
  text ("Protagonistas",300,y);
 
  textFont(titulos,20);  //nombres personajes
  text("Stevie",170,y+35);
  text("Ray",170,y+70);
  text("Fuckshit",170,y+105);
  text("Fourth Grade",170,y+140);
  text("Ruben",170,y+175);
  
  textFont(nombres,30);      //nombres reales
  text(prot1,310,y+35);
  text(prot2,310,y+70);
  text(prot3,310,y+105);
  text(prot4,310,y+140);
  text(prot5,310,y+175);
  
  //act pantalla 2
  y=y-2;
  }
  
  
if(y<0||frameCount>700){    //act secun
 
  textFont(titulos,30);     //nombres
  text(tit, 260,w);
  textSize(20);
  text("Dabney",170,w+35);
  text("Ian",170,w+70);
  text("Estee",170,w+105);
  text("Zoe",170,w+140);
  text("Sam",170,w+175);
  text("Teresa",170,w+210);
  
  textFont(nombres,30);
  text(sec1,310,w+35);
  text(sec2,310,w+70);
  text(sec3,310,w+105);
  text(sec4,310,w+140);
  text(sec5,310,w+175);
  text(sec6,310,w+210);
  
  
  
  
  
  
  
  
  //act
  w=w-2;
}
  
if(w<0||frameCount>1000){  //pantalla 4 creditos


  textFont(titulos,30); //titulos
    textAlign(LEFT);
    text (dirigida,260,x);
  text(musica,283,x+105);
  text("Producción",310, x+210);
  
  textFont(nombres,30);   //nombres reales
    text(jonah, 300, x+35);
    text(musicos,150,x+140);
    text(prod, 280,x+245);
  
       //actualizacion 3ra pantalla
    x=x-2;

}

if(x<0){                   //2 creditos
  
  textFont(titulos,30);       //asistentes
  text(dir1,240,c);
  text(dir2,230,c+105);
  
  
textFont(nombres,30); //nombres asist
  text(asis1,260,c+35);
  text(asis2,290,c+140);
  //act
 c=c-2;
  
}
if(c<-140){
  
  image(img2,0,0,width,height);
  textFont(Georgia,40);
  textAlign(CENTER,CENTER);
  text("FIN.",random(399,401),random(299,301));
  
  
  



}}
