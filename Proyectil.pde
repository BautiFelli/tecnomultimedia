class Proyectil
{
  private PImage Sprite;
  private FCircle Hitbox;
  private int Duracion;
  private boolean Destruido;
  private int Timer;
  private int startX, startY;
  public boolean Enaire;

  Proyectil(int x, int y, int s, float d)
  {
    this.Hitbox = new FCircle(s);
    this.Hitbox.setPosition(x, y);
    this.Hitbox.setNoFill();
    this.Hitbox.setNoStroke();
    this.Hitbox.setDensity(d);
     this.Sprite = loadImage("./assets/proyectil.png");
    this.startX = x;
    this.startY = y;
    // Relativo en segundos
    this.Timer = 6;
  }

  void Dibujar()
  {
    int s = int(this.Hitbox.getSize());

    pushMatrix();
    imageMode(CENTER);
    translate(this.Hitbox.getX(), this.Hitbox.getY());
    rotate(this.Hitbox.getRotation());
    image(this.Sprite, 0, 0, s, s);
    popMatrix();
  }

  public FBody GetHitbox()
  {
    return this.Hitbox;
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

  void StartTimer()
  {
    this.SetDestruido(true);
    println(this.Timer);
    if (this.Timer == 0)
    {
      this.Timer = 10;
      this.Destruido = false;
      this.Hitbox.setPosition(this.startX, this.startY);
      if (mundo.GetProyectiles() == 0)
      {
        this.Enaire = false;
        base.setNoFill();
        s_perder.play();
        estado = 1;
      } else
      {
        this.Enaire = false;
      }
    } else if (frameCount % 60 == 0)
    {
      this.Timer --;
    }
  }
}
