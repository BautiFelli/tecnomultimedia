class Enemigo {
  float x=600;
  float y=370;
  PImage lobo;
  public FBox hitbox;

  Enemigo() {
    lobo = loadImage("img/lobito.png");
    this.hitbox = new FBox(80, 50);
    this.hitbox.setPosition(x, y);
    this.hitbox.setNoStroke();
    this.hitbox.setFill(0,0,0,0);
  }

  void colocar() {
    pushMatrix();
    imageMode(CENTER);
    translate(int(this.hitbox.getX()), int(this.hitbox.getY()));
    rotate(this.hitbox.getRotation());
    image(lobo, 0, 0);
    popMatrix();
  }
}
