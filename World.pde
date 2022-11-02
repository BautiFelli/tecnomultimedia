class Mundo extends FWorld
{
  private PImage Fondo;
  int Proyectiles;
  
  Mundo()
  {
    super();
    this.Proyectiles = 3;
    this.setEdges();
    this.Fondo = loadImage("./assets/fondoo.jpg");
  }

  void ConfigurationGeneral()
  {
    imageMode(CORNER);
    image(this.Fondo, 0, 0,1920,1080);
  }

  void Add(FBody body)
  {
    this.add(body);
  }

  void Add(ArrayList<FBody> bodys)
  {
    for (FBody b : bodys) {
      this.add(b);
    }
  }

  void Remove(FBody body)
  {
    this.remove(body);
  }

  void Remove(ArrayList<FBody> bodys)
  {
    for (FBody b : bodys) {
      this.remove(b);
    }
  }
  
  void SetProyectiles(int cantidad)
  {
    this.Proyectiles = cantidad;
  }
  
  int GetProyectiles()
  {
    return this.Proyectiles;
  }
}
