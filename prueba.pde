import fisica.*;

// Contexto fisico
FWorld mundo;

// Objetos fisicos
FCircle myCircle;
FMouseJoint cadena;
FBox estruc[]=  new FBox[16];
FPoly techitos[]=  new FPoly[3];
float x=30;
float y=480;
boolean live = true;
int estado=0;

int timer = 60;



Enemigo lobo;
PImage fondo;
Paleta paleta;



int p[][] = { {500, 370}, {697, 370}, {590, 350}, {530, 330}, {670, 330}, {590, 250}, {380, 400}, {800, 400}, {590, 220},
  {365, 220}, {820, 220}, {600, 200}, {540, 200}, {660, 200}, {500, 200}, {700, 200}};

void setup() {
  size(1280, 720);

  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges(255);
  fondo = loadImage ("img/fondo.jpg");
  fondo.resize(1280, 720);
  paleta = new Paleta("img/tierra.jpg");
  
  
  myCircle = new FCircle(x);
  myCircle.setPosition(x, y);
  myCircle.setRestitution(0.8);
  myCircle.setBullet(false);
  myCircle.setGrabbable(false);
  myCircle.setForce(0.2,0.2);
  myCircle.setName("circulo");
  mundo.add(myCircle);

  for (int i=0; i<estruc.length; i++) {

    int X = p[i][0], Y = p[i][1];

    if (i==0) {
      estruc[i] = new FBox(25, 60);
      estruc[i].setFill(176, 137, 104);
      mundo.add(estruc[i]);
    } else if (i==1) {
      estruc[i] = new FBox(25, 60);
      estruc[i].setFill(176, 137, 104);
      mundo.add(estruc[i]);
    } else if (i==2) {
      estruc[i] = new FBox(300, 10);
      estruc[i].setFill(156, 102, 68);
      mundo.add(estruc[i]);
    } else if (i==3) {
      estruc[i] = new FBox(40, 40);
      estruc[i].setFill(221, 184, 146);
      mundo.add(estruc[i]);
    } else if (i==4) {
      estruc[i] = new FBox(40, 40);
      estruc[i].setFill(221, 184, 146);
      mundo.add(estruc[i]);
    } else if (i==5) {
      estruc[i] = new FBox(300, 10);
      estruc[i].setFill(156, 102, 68);
      mundo.add(estruc[i]);
    } else if (i==6) {
      estruc[i] = new FBox(60, 180);
      estruc[i].setFill(127, 85, 57);
      mundo.add(estruc[i]);
    } else if (i==7) {
      estruc[i] = new FBox(60, 180);
      estruc[i].setFill(127, 85, 57);
      mundo.add(estruc[i]);
    } else if (i==8) {
      estruc[i] = new FBox(400, 50);
      estruc[i].setFill(127, 85, 57);
      mundo.add(estruc[i]);
    } else if (i==9) {
      estruc[i] = new FBox(20, 80);
      estruc[i].setFill(156, 102, 68);
      mundo.add(estruc[i]);
    } else if (i==10) {
      estruc[i] = new FBox(20, 80);
      estruc[i].setFill(156, 102, 68);
      mundo.add(estruc[i]);
    } else if (i==11) {
      estruc[i] = new FBox(70, 40);
      estruc[i].setFill(221, 184, 146);
      mundo.add(estruc[i]);
    } else if (i==12) {
      estruc[i] = new FBox(20, 80);
      estruc[i].setFill(156, 102, 68);
      mundo.add(estruc[i]);
    } else if (i==13) {
      estruc[i] = new FBox(20, 80);
      estruc[i].setFill(156, 102, 68);
      mundo.add(estruc[i]);
    } else if (i==14) {
      estruc[i] = new FBox(20, 30);
      estruc[i].setFill(176, 137, 104);
      mundo.add(estruc[i]);
    } else if (i==15) {
      estruc[i] = new FBox(20, 30);
      estruc[i].setFill(176, 137, 104);
      mundo.add(estruc[i]);
    }

    estruc[i].setName("rec"+i);
    estruc[i].setGrabbable(false);
    estruc[i].setNoStroke();
    estruc[i].setDensity(0.7);
    estruc[i].setForce(15,15); 
    estruc[i].setPosition(X, Y);
  }

  colorMode(RGB);

  FPoly base = new FPoly();
  base.setFill(paleta.darUnColor());
  base.vertex(0, 500);
  base.vertex(60, 500);
  base.vertex(160, 580);
  base.vertex(250, 570);
  base.vertex(310, 580);
  base.vertex(360, 505);
  base.vertex(410, 505);
  base.vertex(450, 505);
  base.vertex(505, 505);
  base.vertex(560, 505);
  base.vertex(600, 505);
  base.vertex(710, 505);
  base.vertex(770, 505);
  base.vertex(880, 505);
  base.vertex(900, 550);
  base.vertex(920, 700);
  base.vertex(970, 650);
  base.vertex(1050, 680);
  base.vertex(1280, 580 );
  base.vertex(1280, 720);
  base.vertex(0, 720);
  base.setStatic(true);
  base.setGrabbable(false);
  base.setNoStroke();
  mundo.add(base);
  
  lobo=new Enemigo();
  
  cadena= new FMouseJoint (myCircle, x,y);
    cadena.setNoStroke();
    cadena.setFrequency(0.5);
  mundo.add(cadena);

}


void draw() {
  background(fondo);
  mundo.step();
  
  if (live == false && timer > 0)
  {
    if (frameCount % 8 == 0) timer -- ;
  } else if (live == false && timer ==  0)
  {
    myCircle.setStatic(true);
    myCircle.setPosition(30, 480);
    timer = 60;
    live = true;
  }
  lobo.colocar();
  mundo.add(lobo);
  mundo.draw();
  
}


void mousePressed() {
  if (live)
  {
    myCircle.setStatic(false);
    myCircle.setBullet(true);
    cadena.setTarget(mouseX,mouseY);
     
  }
}

void contactStarted (FContact contacto) {

  FBody cuerpo1 = contacto.getBody1();
  FBody cuerpo2 = contacto.getBody2();

  String nombre1= conseguirNombre(cuerpo1);
  String nombre2= conseguirNombre(cuerpo2);

  for (int i=0; i<estruc.length; i++) {

    if (contacto.contains("rec"+i, "circulo")) {
    //  dividirEstruc(FBox[i])cuerpo1;
      println("hubo contacto"+i);
       live = false;
           
    }
  }
}
