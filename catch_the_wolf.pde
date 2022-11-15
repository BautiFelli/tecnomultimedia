import fisica.*;
import spout.*;
import java.util.Iterator;
import processing.sound.*;

FWorld Mundo;
Principal principal;
Spout spout;
SoundFile s_wood, s_perder, s_lobohurt, s_disparo, s_derrumbe;



void setup() {
  size(1080, 1060, P2D);
  Fisica.init(this);
  spout = new Spout(this);
  spout.createSender("Spout Processing");

  Mundo = new FWorld();
  principal = new Principal(Mundo);

  Mundo.setEdges();

  s_wood = new SoundFile (this, "./sounds/Wood.mp3");
  s_perder = new SoundFile(this, "./sounds/wolf.mp3");
  s_lobohurt = new SoundFile (this, "./sounds/lobohurt.mp3");
  s_disparo = new SoundFile (this, "./sounds/disparo.mp3");
  s_derrumbe = new SoundFile (this, "./sounds/derrumbe.mp3");
  
  s_wood.loop();
}

void draw() {
  principal.DibujaFondo();

  Mundo.step();
  Mundo.draw();

  principal.LogicaPrincipal(Mundo);
  principal.DibujarPrincipal();

  spout.sendTexture();
}


void contactStarted(FContact contacto) {
  principal.LogicaColisiones(contacto, Mundo);
}
