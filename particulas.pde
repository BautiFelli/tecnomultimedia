class Particulas {
  private ArrayList<FCircle> onworld = new ArrayList<FCircle>();

  Particulas() {
  }

  void  Create(float x, float y, int r, int g, int b) {
    for (int i=0; i<int(random(5)); i++) {
      FCircle nuevo = new FCircle(random(5, 15));
      nuevo.setNoStroke();
      nuevo.setPosition(x, y);
      nuevo.setFill(r,g,b);
      nuevo.setDensity(.2);
      this.onworld.add(nuevo);
      mundo.add(nuevo);
      nuevo.addImpulse(int(random(-500, 500)), int(random(-1000, 1000)));
    }

    for (FCircle actual : this.onworld) {
    }
  }

  void Handle() {
    for (int i=0; i<this.onworld.size(); i++) {
      FCircle actual = this.onworld.get(i);
      float tamaño = actual.getSize();

      if (tamaño > 1) {
        if (frameCount%2 == 0) actual.setSize(tamaño - 1);
      } else {
        mundo.remove(this.onworld.remove(i));
        //this.onworld.remove(i);
        println(this.onworld.size());
      }
    }
  }
}
