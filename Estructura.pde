class Estructura {
  FBox Hitbox;
  PImage Sprite;
  boolean Destruido;
  
  Estructura(int x, int y, int w, int h) {
    this.Hitbox = new FBox(w,h);
    this.Hitbox = new FBox(w, h);
    this.Hitbox.setWidth(w);
    this.Hitbox.setHeight(h);
    this.Hitbox.setPosition(x, y);
    this.Hitbox.setNoFill();
    this.Hitbox.setNoStroke();
    this.Hitbox.setDensity(.06);
    this.Hitbox.setGrabbable(false);
    this.Sprite = loadImage("./assets/madera"+ (w > h ? "h":"v")+".jpg");
  }

  void Dibujar() {
    pushMatrix();
    imageMode(CENTER);
    translate(this.Hitbox.getX(), this.Hitbox.getY());
    rotate(this.Hitbox.getRotation());
    image(this.Sprite, 0, 0, this.Hitbox.getWidth(), this.Hitbox.getHeight());
    popMatrix();
  }
}
