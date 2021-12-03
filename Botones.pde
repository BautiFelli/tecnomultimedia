class Botoncito {
  int x, y, ancho, alto;

  Botoncito(int px, int py, int anch, int alt) {
    x= px;
    y= py;
    ancho= anch;
    alto= alt;
  }

  void dibujar() {
    if (botonOver(mouseX, mouseY, x, y, ancho, alto)) {
      fill(255, 0, 0);
    } else {
      fill(255, 100, 100);
    }
    noStroke();
    rect(x, y, ancho, alto);
  }

  boolean getBotonPressed(int mx, int my) {
    boolean presionado = mx>x && mx<x+ancho && my>y&&my<y+alto == true;
    return presionado;
  }
  boolean botonOver(int mx, int my, int x, int y, int ancho, int alto) {
    if (mx>x && mx<x+ancho && my>y && my<y+alto) {
      return true;
    } else {
      return false;
    }
  }
}
