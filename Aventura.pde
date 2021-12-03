class Aventura {

  Juego j;   
  Pantalla pant;

  Aventura() { // Constructor
    //size(800, 600);  
    pant =new Pantalla();
    j=new Juego();
  }

  void iniciar() {
    pant.iniciarAventura(j);// Inicio la aventura y le paso el objeto Juego por parametros. Ahora Pant conoce el objeto juego y puede acceder a sus metodos tambien.
  }



  void mousePressed() {
    pant.mousePressed();
  }
}
