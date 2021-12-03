class Textos {
  String []textos = new String [63];
  PFont fuente;


  Textos() {  
    fuente = loadFont ("AgencyFB-Bold-48.vlw");
    textos=loadStrings("textos/textos.txt");
  }

  void dibujar(int pos, int e, int c, float x, float y, float alt, float anch) {
    pushStyle();
    textAlign(CENTER);
    textFont(fuente);
    textSize(e);
    fill(c);
    text(textos[pos], x, y, alt, anch);   //alt max width anch max height
    popStyle();
  }
}
