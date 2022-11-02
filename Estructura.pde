class Estructura
{
  private int Material; // 0 vidrio, 1 madera, 2 roca
  private PImage Sprite;
  private int Duracion;
  private FBox Hitbox;
  private boolean Destruido;

  Estructura(int xpos, int ypos, int ancho, int alto, int material, float density)
  {
    this.Hitbox = new FBox(ancho, alto);
    this.Hitbox.setWidth(ancho);
    this.Hitbox.setHeight(alto);
    this.Hitbox.setPosition(xpos, ypos);
    this.Hitbox.setNoFill();
    this.Hitbox.setNoStroke();
    this.Hitbox.setDensity(density);
    this.Hitbox.setGrabbable(false);
    this.Material = material;
    this.Sprite = loadImage(PathGen(this.Material)+(ancho > alto ? "h":"v")+".png");

    // Inicializa la duracion 0 = Vidrio, 1 = Madera, 2 = Piedra
    switch(this.Material) {
    case 0:
      this.Duracion = 2;
      break;
    case 1:
      this.Duracion = 3;
      break;
    case 2:
      this.Duracion = 6;
      break;
    }
  }

  void Dibujar()
  {
    pushMatrix();
    imageMode(CENTER);
    translate(this.Hitbox.getX(), this.Hitbox.getY());
    rotate(this.Hitbox.getRotation());
    image(this.Sprite, 0, 0, this.Hitbox.getWidth(), this.Hitbox.getHeight());
    popMatrix();
    if (debug) {
      textSize(12);
      textAlign(CENTER,BASELINE);
      text("HP: "+this.Duracion, this.Hitbox.getX(), this.Hitbox.getY());
    }
  }

  FBody GetHitbox()
  {
    return this.Hitbox;
  }

  void RemoverHitbox()
  {
    this.Destruido = true;
    mundo.Remove(this.Hitbox);
  }

  int GetDuracion()
  {
    return this.Duracion;
  }

  void SetDuracion(int nueva_duracion)
  {
    this.Duracion = nueva_duracion;
  }

  boolean GetDestruido()
  {
    return this.Destruido;
  }

  void SetDestruido(boolean destruido)
  {
    this.Destruido = destruido;
  }
}
