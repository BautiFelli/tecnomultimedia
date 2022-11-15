class Bala {
  FCircle Hitbox;
  int SX, SY;
  PImage Sprite;
  int Vida;
  boolean Disparada;

  Bala(int x, int y) {
    this.Hitbox = new FCircle(25);
    this.Hitbox.setPosition(x, y);
    this.Hitbox.setNoStroke();
    this.Hitbox.setNoFill();
    this.Hitbox.setDensity(1);
    this.Sprite = loadImage("./assets/proyectil.png");
    this.Disparada = false;
    this.SX = x;
    this.SY = y;
    this.Vida = 1;
  }

  void Dibujar() {
    int s = int(this.Hitbox.getSize());

    pushMatrix();
    imageMode(CENTER);
    translate(this.Hitbox.getX(), this.Hitbox.getY());
    rotate(this.Hitbox.getRotation());
    image(this.Sprite, 0, 0, s, s);
    popMatrix();
  }

  void DispararBala(float x_, float y_) {
    float d = dist(x_, height, this.Hitbox.getX(), height);
    float p = map(d, 0, width, 0, 2500);
    float y = map(y_, height, 0, 0, -1800);
    this.Hitbox.addImpulse(p, y);
  }

  void ResetearPosicion() {
    this.Hitbox.setPosition(30,520);
  }
}
