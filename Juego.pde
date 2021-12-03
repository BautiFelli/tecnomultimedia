class Juego {

  PImage [] fondos = new PImage[2];
  PImage publico, escBayern, escUtd, inicio;
  int cant=500, resBayern=0, resUtd=0, pantallas=0;
  Pelota p;
  Arquero a;
  Papelitos[] pu=new Papelitos[cant];
  PFont fuente;
  boolean fueGol;
  String [] insultos=new String[6];
  String [] textInicio= new String [6];
  int status;

  Juego() {
    //constructor
    //estado = "juego";
    p=new Pelota();
    a=new Arquero();

    //Cargo todas las imagenes que requiere la clase

    escBayern=loadImage("escBayern.png");
    publico= loadImage("Publico.png");
    escUtd=loadImage("united.png");
    fuente=loadFont("AgencyFB-Bold-48.vlw");
    insultos=loadStrings("insultos.txt");
    textInicio=loadStrings("textosinicio.txt");
    inicio=loadImage("inicio.jpg");


    for (int i=0; i<cant; i++) { // Inicializo el arreglo de papelitos
      pu[i]= new Papelitos ();
    }

    for (int i=0; i<2; i++) {  // Vuelvo a cargar las dos imagenes de victoria y derrota de la carpeta data para no pasar todo el arreglo por parámetros.
      if (i==0) {
        fondos[i]=loadImage("./img/pantalla21.jpg"); //Campeones
      } else {
        fondos[i]=loadImage("./img/pantalla23.jpg"); //Derrota
      }
    }
  }

  void jugar() {
    if (pantallas==0) { //inicio
      imageMode(CENTER);
      image(inicio, 400, 300);
      boton(350, 500, 100, 50, 0);
      status = 0; //Actualizo el status a 0 para que se vuelva a iniciar el juego. De otro modo, pant en pantallas saltaría a créditos. 
      texto(textInicio[5], 24, 255, 350, 515, 100, 50);
      texto(textInicio[0], 72, 255, 50, 30, 700, 100); 
      texto(textInicio[1], 24, 255, 270, 120, 250, 50);
      texto(textInicio[2], 24, 255, 270, 170, 250, 50);
      texto(textInicio[3], 24, 255, 270, 220, 250, 50);
      texto(textInicio[4], 24, 255, 270, 270, 250, 100);
      imageMode(CORNER);
    } else if (pantallas==1) { //juego
      dibujarJuego();
    } else if (pantallas==3) { //pantalla victoria
      imageMode(CORNER);
      image(fondos[0], 0, 0, width, height);
      texto("¡GANASTE!", 72, 0, 50, 150, 700, 100);
      boton(300, 300, 200, 100, 1);
      texto("VOLVER A JUGAR", 42, 255, 300, 310, 200, 100);
      boton(700, 550, 90, 30, 2);
      texto("CONTINUAR", 18, 255, 710, 555, 70, 30);
    } else if (pantallas==4) { //pantalla derrota
      imageMode(CORNER);
      image(fondos[1], 0, 0, width, height);
      texto("PERDISTE", 72, 0, 50, 150, 700, 100); 
      boton(300, 300, 200, 100, 1); //Dibujo boton Volver a jugar
      texto("VOLVER A JUGAR", 42, 255, 300, 310, 200, 100); 
      boton(700, 550, 90, 30, 2);  // Dibujo boton continuar
      texto("CONTINUAR", 18, 255, 710, 555, 70, 30);
    }
  }

  int getEstado() { //Esto es lo que hace que Pantallas sepa cuando actualizar el estado de pant a "creditos"
    return status;
  }


  void dibujarJuego() {

    //fondo
    fill (37, 62, 124); 
    rect(0, 0, 800, 280);
    fill(57, 176, 44);
    rect(0, 280, 800, 320);

    //público atrás arco
    imageMode(CENTER);
    image(publico, 400, 140); 
    image(escBayern, 300, 40);
    image(escUtd, 500, 40);


    //arco
    fill(255);
    noStroke();
    rect(120, 80, 20, 200);
    rect(650, 80, 20, 200);
    rect(120, 80, 530, 20);

    //lineas cancha
    stroke(255);
    strokeWeight(2);
    line(0, 280, 800, 280);
    line(70, 280, 70, 420);
    line(70, 420, 730, 420);
    line(730, 420, 730, 280);





    a.colocar();
    p.dibujar(); 
    p.patear(a);
    contador();
    fueGol=p.getFueGol();
    if (fueGol && resUtd>0) {  // Opciones de dibujo del arreglo (papelitos)
      for (int i=0; i<pu.length; i++) {
        pu[i].dibujarPapelitos();
      }
    } else {

      if (resBayern>0) { // Opciones de dibujo del arreglo de insultos (texto)
        for (int i=0; i<insultos.length; i++) {
          texto(insultos[i], 24, 200, random(800), random(250), 70, 30);
        }
      }
    }
  }

  void contador() { // Void de dibujo del contador de goles. 
    textAlign(LEFT);  
    textFont(fuente, 70);
    textSize(36);
    text(resBayern + " - " + resUtd, 370, 55);
  }
  void actualizarContUtd() { // Si metes el penal se actualiza el contador a tu favor (United)
    resUtd++;
    if (resUtd==10) { //Si ganas te manda a victoria
      pantallas=3;
    }
  }
  void actualizarContBay() { // Si erras el penal se actualiza el contador en contra tuyo (Bayern)
    resBayern++;
    if (resBayern==10) { // Si perdes, te manda a derrota
      pantallas=4;
    }
  }
  void texto(String tx, int e, int c, float x, float y, float alt, float anch) { // Mando ( el texto a escribir, tamaño, color, posX, posY, alto, ancho)
    pushStyle();
    textAlign(CENTER);
    textFont(fuente);
    textSize(e);
    fill(c);
    text(tx, x, y, alt, anch);   // Se dibuja el texto que pasé
    popStyle();
  }

  void boton(float x, float y, float tamX, float tamY, int st) {       
    pushStyle();
    fill(255, 100, 100);
    noStroke();
    if (mouseX>x && mouseX<x+tamX && mouseY>y && mouseY<y+tamY) {
      fill(255, 0, 0);
      if (mousePressed && pantallas==0 && (st==0)) { // Que pasa si en inicio del juego clickeo el boton iniciar (st 0)
        pantallas=1;
        status=0;
      } else if (mousePressed && (pantallas==3 || pantallas ==4) && (st==1) ) { // Que pasa si clickeo en la pantalla de derrota/victoria el boton de volver a jugar(st 1)
        reiniciar(st);
      } else if (mousePressed && (pantallas==3 ||pantallas == 4) && (st==2) ) { // Que pasa si clickeo en la pantalla de derrota/victoria el boton de continuar(st 2)
        reiniciar(st);
      }
    }
    rect(x, y, tamX, tamY);
    popStyle();
  }

  void reiniciar(int st) { // reinicia la pantalla a la pantalla de inicio del juego junto con los contadores.
    resBayern=0;
    resUtd=0;
    pantallas=0; 
    status = st; // Me actualiza status para que en Pantalla se me actualice el estado y me mande a "creditos"
  }
}
