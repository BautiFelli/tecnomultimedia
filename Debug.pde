class Debug
{
  
  
  Debug()
  {
    
  }
  
  void ViewDebug()
  {
    if (debug)
    {
      for (int i=0; i<posiciones_base.length; i++)
      {
        fill(255, 0, 0);
        text("Pos: "+(i+1), posiciones_base[i][0], posiciones_base[i][1]+150);
      }
    }
  }
}
