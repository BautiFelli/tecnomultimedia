class Base {
  FPoly Suelo;

  Base(int[][]posiciones) {
    this.Suelo = new FPoly();
    this.Suelo.setGrabbable(false);
    this.Suelo.setStatic(true);
    this.Suelo.setFill(181, 131, 141);
    this.Suelo.setStrokeWeight(8);
    this.Suelo.setStroke(127, 85, 57);

    for (int i=0; i<posiciones.length; i++) {
      int x = posiciones[i][0];
      int y = posiciones[i][1]+150;
      this.Suelo.vertex(x, y);
    }
  }
}
