class Base extends FPoly 
{

  Base(int[][]posiciones) 
  {
    super();
    this.setGrabbable(false);
    this.setStatic(true);
    this.SetearVertexPoints(posiciones);
    this.setGrabbable(false);
    

  }

  void SetearVertexPoints(int[][]posiciones) 
  {
    for (int i=0; i<posiciones.length; i++) {
      int x = posiciones[i][0];
      int y = posiciones[i][1]+150;
      this.vertex(x,y);
    }
  }
}
