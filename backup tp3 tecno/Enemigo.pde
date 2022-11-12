class Enemigo {
  FBox Hitbox;
  PImage Sprite;
  int Vida;

  Enemigo(int x, int y) {
    this.Sprite = loadImage("./assets/lobito2.png");
    this.Hitbox = new FBox(50, 33);
    this.Hitbox.setPosition(x, y);
    this.Hitbox.setNoFill();
    this.Hitbox.setNoStroke();
    this.Hitbox.setDensity(1);
    this.Hitbox.setGrabbable(false);
  }

  void Dibujar(){
    pushMatrix();
    imageMode(CENTER);
    translate(this.Hitbox.getX(), this.Hitbox.getY());
    rotate(this.Hitbox.getRotation());
    image(this.Sprite, 0, 0);
    popMatrix();
  }
}
