import fisica.*;
import java.util.Iterator;
import processing.sound.*;
import spout.*;

Spout spout;

Mundo mundo;
Estructura estructura;
Base base;
Proyectil proyectil;
Particulas particulas_gen;
Enemigo enemigo;
SoundFile s_wood, s_perder, s_lobohurt, s_disparo, s_derrumbe;

int [][]posiciones_estructuras = new int[16][5];
int [][]posiciones_base = new int[31][2];
int estado, manual_timer;
ArrayList<Estructura> estructuras = new ArrayList<Estructura>();
boolean debug;
PImage i_instrucciones;
boolean disparo=false;
int tiempoBala=5;


int PUERTO_OSC = 12345;

Receptor receptor;
Administrador admin;


void setup()
{
  fullScreen(P2D);
  Fisica.init(this);
  thread("SetupPosicionEstructas");
  thread("SetupBase");

  mundo = new Mundo();
  base = new Base(posiciones_base);
  proyectil = new Proyectil(30, 520, 25, 1);
  enemigo = new Enemigo(600, 370, 10);
  debug = false;
  estado = -1;
  manual_timer = 5;
  spout = new Spout(this);
  spout.createSender("Spout Processing");

  s_wood = new SoundFile (this, "./sounds/Wood.mp3");
  s_perder = new SoundFile(this, "./sounds/wolf.mp3");
  s_lobohurt = new SoundFile (this, "./sounds/lobohurt.mp3");
  s_disparo = new SoundFile (this, "./sounds/disparo.mp3");
  s_derrumbe = new SoundFile (this, "./sounds/derrumbe.mp3");

  i_instrucciones = loadImage("./assets/titu_instruc.jpg");

  ResetEstructuras();

  base.setStrokeWeight(8);
  base.setStroke(127, 85, 57);
  base.setFill(181, 131, 141);
  mundo.Add(base);
  mundo.Add(proyectil.GetHitbox());
  mundo.Add(enemigo.GetHitbox());

  setupOSC(PUERTO_OSC);

  receptor = new Receptor();
}

void draw()
{
  mundo.ConfigurationGeneral();
  mundo.step();
  mundo.draw();

  switch(estado)
  {
  case -1:
    if (manual_timer != 0)
    {
      image(i_instrucciones, 0, 0, width, height);
      manual_timer = frameCount % 60 == 0 ? manual_timer - 1 : manual_timer;
    } else
    {
      estado ++;
    }
    break;
  case 0:
    base.setStrokeWeight(8);
    base.setStroke(127, 85, 57);
    base.setFill(181, 131, 141);
    receptor.actualizar(mensajes);


    // Eventos de entrada y salida
    for (Blob b : receptor.blobs) {


      //if (b.entro) {
      if (frameCount%60==0) {
        //println("--> entro blob: " + b.id);
        if (tiempoBala==0) {
          float x= map(b.centroidX, 0, 1, 0, width);
          float y= map(b.centroidY, 0, 1, 0, height);
          disparo(x, y);
          /*  println(tiempoBala);
           println("centroidX", x);
           println("centroidY", y);*/
        } else {
          tiempoBala--;
        }
      }

      // }
      if (b.salio) {

        // println("<-- salio blob: " + b.id);
      }
      spout.sendTexture();
    }
    proyectil.Dibujar();
    enemigo.Dibujar();
    // Objeto iterador
    Iterator<Estructura> iterador = estructuras.iterator();
    while (iterador.hasNext())
    {
      Estructura actual = iterador.next();
      if (!actual.GetDestruido())
      {
        actual.Dibujar();
        text("v"+actual.GetDuracion(), actual.GetHitbox().getX(), actual.GetHitbox().getY());
      } else
      {
        iterador.remove();
      }
    }
    if (proyectil.GetDestruido() || proyectil.Enaire) proyectil.StartTimer();
    textMode(CORNER);
    textSize(24);
    text("Proyectiles: "+mundo.GetProyectiles(), 100, 100);
    break;
  case 1:
    pushMatrix();
    base.setNoStroke();
    rectMode(CENTER);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("PERDISTE", width/2, height/2-120);
    //rect(width/2, height/2, 100, 100);
    textSize(40);
    text("Volver a jugar", width/2, height/2);
    popMatrix();
    break;
  case 2:
    pushMatrix();
    rectMode(CENTER);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("¡GANASTE!", width/2, height/2-120);
    //rect(width/2, height/2, 100, 100);
    textSize(50);
    text("Volver a jugar", width/2, height/2);
    popMatrix();
    break;
  }
}

void disparo(float x_, float y_)
{


  /*   if ( proyectil.Enaire == false) {
   //cadena.setTarget(mouseX, mouseY);
   
   float d = dist(x_, height, proyectil.GetHitbox().getX(), height);
   float p = map(d, 0, width, 0, 5000);
   float y = map(y_, height, 0, 0, -1800);
   proyectil.GetHitbox().addImpulse(p, y);
   mundo.SetProyectiles(mundo.GetProyectiles()-1);
   s_disparo.play();
   proyectil.Enaire = true;
   
   println(x_, y_);
   }
   */
  if ( proyectil.Enaire == false) {
    //cadena.setTarget(mouseX, mouseY);

    float d = dist(x_, height, proyectil.GetHitbox().getX(), height);
    float p = map(d, 0, width, 0, 2500);
    float y = map(y_, height, 0, 0, -1800);
    proyectil.GetHitbox().addImpulse(p, y);
    mundo.SetProyectiles(mundo.GetProyectiles()-1);
    s_disparo.play();
    proyectil.Enaire = true;

    // println(x_, y_);
  }
}

void mousePressed() {
  switch(estado)
  {
  case 1:
    mundo.SetProyectiles(3);
    mundo.Remove(enemigo.GetHitbox());
    mundo.Add(enemigo.GetHitbox());
    ResetEstructuras();
    estado = 0;
    break;
  case 2:
    mundo.SetProyectiles(3);
    mundo.Remove(enemigo.GetHitbox());
    mundo.Add(enemigo.GetHitbox());
    ResetEstructuras();
    estado = 0;
    proyectil.GetHitbox().setPosition(proyectil.startX, proyectil.startY);
    break;
  }
}

/*void keyPressed()
 {
 ResetEstructuras();
 }*/

void contactStarted(FContact contacto)
{
  // Enemigo y proyectil
  if (contacto.contains(proyectil.GetHitbox(), enemigo.GetHitbox()) && estado == 0)
  {
    println(proyectil.GetHitbox().getVelocityX());
    if (mundo.GetProyectiles() - 1 > 0) {
      mundo.SetProyectiles(mundo.GetProyectiles() - 1);
    } else {
      //mundo.Remove(base);
      s_lobohurt.play();
      base.setNoStroke();
      base.setNoFill();
      mundo.Remove(enemigo.GetHitbox());
      estado = 2;
    }
  }

  // Estructura y proyectil
  for (Estructura e : estructuras)
  {
    FBody ehbox = e.GetHitbox();
    FBody phbox = proyectil.GetHitbox();

    if (contacto.contains(ehbox, phbox))
    {
      //Valores limites para daño minimo,maximo y velocidad minima, maxima
      int lmi =8, lma = 10, dmi = 2, dma = 2;
      s_derrumbe.play();
      s_derrumbe.amp(0.2);
      // Valores absolutos para x e y
      float absx = abs(phbox.getVelocityX());
      float absy = abs(phbox.getVelocityY());

      // Valores de daño mapeados en base a la velocidad del proyectil
      int dañox = int(map(absx, lmi, lma, dmi, dma));
      int dañoy = int(map(absy, lmi, lma, dmi, dma));

      proyectil.SetDestruido(true);

      if (e.GetDuracion() - dañox <= 0 || e.GetDuracion() - dañoy <= 0)
      {
        //  proyectil.GetHitbox().addImpulse(e.GetHitbox().getX()-30, e.GetHitbox().getY(), 0, 0);
        e.RemoverHitbox();
        
      } else
      {
        if (absx > 1000 )
        {
          e.SetDuracion(e.GetDuracion() - dañox);
        } else if (absy > 1000)
        {
          e.SetDuracion(e.GetDuracion() - dañoy);
        }
      }
    }
  }
}
