class Escenario {
  String Texto, Aviso;
  int Timer;
  PImage Fondo;
  boolean Strict;

  Escenario(String mensaje, boolean strict) {
    this.Texto = mensaje;
    this.Fondo = loadImage("./assets/titu_instruc.jpg");
    this.Strict = strict;
  }

  void MostrarEscenario(FPoly base) {
    int w = !this.Strict ? 0 : width;
    int h = !this.Strict ? 0 : height;
    pushMatrix();
    image(this.Fondo,0,0,w,h);
    base.setNoStroke();
    base.setNoFill();
    textAlign(CENTER, CENTER);
    textSize(50);
    text(this.Texto, width/2, height/2);
    popMatrix();
  }
}
