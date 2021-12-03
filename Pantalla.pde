class Pantalla {

  int cant=8;
  Botoncito [] bot=new Botoncito[cant];
  Textos texto;
  PImage [] fotos = new PImage [24];  
  String pant;

  Pantalla() {
    pant="inicio";
    for (int i=0; i < fotos.length; i++) {
      fotos[i] = loadImage("./img/pantalla"+i+".jpg");
    }

    texto =new Textos();

    for (int i=0; i<cant; i++) { // Cargo el arreglo de botones, hay 8 tipos de botones que van a aparecer en distintas pantallas
      if ( i == 0 ) {
        bot[i]=new Botoncito(340, 370, 120, 75); // Inicio
      } else if ( i == 1 ) {
        bot[i]=new Botoncito(315, 350, 238, 50); // Opcion vestuario A
      } else if (i == 2 ) {
        bot[i]=new Botoncito(555, 350, 230, 50); // Opcion vestuario B
      } else if ( i == 3 ) {
        bot[i]=new Botoncito(315, 370, 238, 216); // Opcion vestuario GC
      } else if ( i == 4 ) {
        bot[i]=new Botoncito(555, 370, 238, 216); // Opcion vestuario GD
      } else if ( i == 5 ) {
        bot[i]=new Botoncito(700, 550, 90, 30); // Continuar
      } else if ( i == 6) {
        bot[i]=new Botoncito(100, 450, 100, 70); //boton DudasA
      } else if (i == 7 ) {
        bot[i]=new Botoncito(600, 450, 100, 70); //boton DudasB
      }
    }
  }

  void iniciarAventura(Juego j) { // Inicio la aventura. Recibe el objeto juego desde Aventura. Esto regula que metodo se tiene que ejecutar en cada estado de pant. 


    if ( pant.equals("inicio")) {
      inicio();
    } else if ( pant.equals("vestuario") ) {
      vestuario();
    } else if ( pant.equals("vestuarioConfirmadoA") ) {
      vestuarioConfirmadoA();
    } else if ( pant.equals("vestuarioConfirmadoB") ) {
      vestuarioConfirmadoB();
    } else if ( pant.equals("contentosA") ) {
      contentosA();
    } else if ( pant.equals("confundidosA") ) {
      confundidosA();
    } else if ( pant.equals("contentosB") ) {
      contentosB();
    } else if ( pant.equals("confundidosB") ) {
      confundidosB();
    } else if ( pant.equals("arrancaA") ) {
      arrancaA();
    } else if ( pant.equals("arrancaB") ) {
      arrancaB();
    } else if (pant.equals("arrancaC") ) {
      arrancaC();
    } else if (pant.equals("arrancaD") ) {
      arrancaD();
    } else if (pant.equals("dudasA") ) {
      dudasA();
    } else if (pant.equals("golBrunoA") ) {
      golBrunoA();
    } else if (pant.equals("entreTiempoA2") ) {
      entreTiempoA2();
    } else if (pant.equals("golSanchoA") ) {    
      golSanchoA();
    } else if (pant.equals("entreTiempoA") ) {
      entreTiempoA();
    } else if (pant.equals("dudasA2") ) {
      dudasA2();
    } else if (pant.equals("campeones") ) {
      campeones();
    } else if (pant.equals("golGreenwood") ) {
      golGreenwood();
    } else if (pant.equals("golBayernA") ) {
      golBayernA();
    } else if (pant.equals("golCr7A") ) {
      golCr7A();
    } else if (pant.equals("golPogba") ) {
      golPogba();
    } else if (pant.equals("golBayernA2") ) {
      golBayernA2();
    } else if (pant.equals("dudasA3") ) {
      dudasA3();
    } else if (pant.equals("golBayernA3") ) {
      golBayernA3();
    } else if (pant.equals("golBrunoA2") ) {
      golBrunoA2();
    } else if (pant.equals("derrota") ) {
      derrota();
    } else if (pant.equals("golBayernB") ) {
      golBayernB();
    } else if (pant.equals("entreTiempoB") ) {
      entreTiempoB();
    } else if (pant.equals("golSanchoB") ) {
      golSanchoB();
    } else if (pant.equals("golBayernB2") ) {
      golBayernB2();
    } else if (pant.equals("golCavaniB") ) {
      golCavaniB();
    } else if (pant.equals("golRashfordC") ) {
      golRashfordC();
    } else if (pant.equals("entreTiempoC") ) { 
      entreTiempoC();
    } else if (pant.equals("golCr7C") ) {
      golCr7C();
    } else if (pant.equals("golBayernC") ) {
      golBayernC();
    } else if (pant.equals("dudasC") ) {
      dudasC();
    } else if (pant.equals("golCavaniC") ) {
      golCavaniC();
    } else if (pant.equals("golCr7C2") ) {
      golCr7C2();
    } else if (pant.equals("entreTiempoD") ) {
      entreTiempoD();
    } else if (pant.equals("golMaguire") ) {
      golMaguire();
    } else if (pant.equals("juego") ) {
      jugarJuego(j);
    } else if (pant.equals("golVarane") ) {
      golVarane();
    } else if (pant.equals("golBrunoD") ) {
      golBrunoD();
    } else if (pant.equals("creditos") ) {
      creditos();
    } else if (pant.equals("inicio") ) {
      inicio();
    }
  }




  // Cada pantalla tiene distintos comportamientos



  void inicio() { // Arranca
    image(fotos[0], 0, 0, width, height);
    bot[0].dibujar(); // Me manda a vestuario 
    texto.dibujar(0, 24, 255, 350, 395, 100, 55);
  }

  void vestuario() { // Vengo de inicio
    image(fotos[1], 0, 0, width, height); 
    texto.dibujar(1, 24, 0, 30, 20, 600, 200); 
    bot[1].dibujar();   // Equipo A - Me manda a vestuarioConfirmadoA 
    texto.dibujar(2, 24, 255, 330, 365, 200, 30); 
    bot[2].dibujar();   // Equipo B - Me manda a vestuarioConfirmadoB 
    texto.dibujar(3, 24, 255, 570, 365, 200, 30);
  } 

  void vestuarioConfirmadoA() { // vengo de vestuario con el primer boton
    image(fotos[22], 0, 0, width, height); // Equipo A
    texto.dibujar(4, 24, 0, 10, 40, 300, 200); // "Los jugadores esperan unas palabras de tu parte"
    //bot(360, 350, 70, 50);   // "Muchachos, esto es una final y hay que ganarla COMO SEA" - Me manda a contentosA
    bot[3].dibujar(); 
    texto.dibujar(5, 24, 255, 330, 380, 200, 200); 
    //bot(450, 350, 70, 50);   // "Muchachos, no hay presión. Lo importante es divertirse" - Me manda a confundidosA
    bot[4].dibujar(); 
    texto.dibujar(6, 24, 255, 570, 380, 200, 200);
  }

  void vestuarioConfirmadoB() { // vengo de vestuario con el segundo boton
    image(fotos[22], 0, 0, width, height);
    texto.dibujar(4, 24, 0, 10, 40, 300, 200);
    bot[3].dibujar();   // "Muchachos, esto es una final y hay que ganarla COMO SEA" - Me manda a contentosB 
    texto.dibujar(5, 24, 255, 330, 380, 200, 200); 
    bot[4].dibujar();   // "Muchachos, no hay presión. Lo importante es divertirse" - Me manda a confundidosB 
    texto.dibujar(6, 24, 255, 570, 380, 200, 200);
  }

  void contentosA() { // Vengo de vestuarioConfirmadoA
    image(fotos[2], 0, 0, width, height);
    texto.dibujar(7, 24, 0, 10, 40, 300, 200);  // "Los jugadores están felices, se quieren comer la cancha!"
    bot[5].dibujar(); // Me manda a arrancaA 
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); //Continuar
  }

  void contentosB() { // Vengo de vestuarioConfirmadoB
    image(fotos[2], 0, 0, width, height);
    texto.dibujar(7, 24, 0, 10, 40, 300, 200);  // "Los jugadores están felices, se quieren comer la cancha!"
    bot[5].dibujar(); // Me manda a arrancaB 
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); //Continuar
  }

  void confundidosA() { // vengo de vestuarioConfirmadoA
    image(fotos[3], 0, 0, width, height);
    texto.dibujar(8, 24, 0, 10, 40, 300, 200); // "Los jugadores están confundidos, cómo vas a encarar así una final??!!!!"
    bot[5].dibujar(); // Me manda a arrancaC 10
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); //Continuar
  }

  void confundidosB() { // vengo de vestuarioConfirmadoB
    image(fotos[3], 0, 0, width, height);
    texto.dibujar(8, 24, 0, 10, 40, 300, 200); // "Los jugadores están confundidos, cómo vas a encarar así una final??!!!!"
    bot[5].dibujar(); // Me manda a arrancaD 11
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); //Continuar
  }

  void arrancaA() { // Vengo de contentosA
    image(fotos[6], 0, 0, width, height);
    texto.dibujar(9, 24, 255, 10, 40, 300, 200); // "Arranca el partido!!!!"
    bot[5].dibujar();  // Me manda a dudasA 12
    texto.dibujar(59, 20, 255, 710, 555, 70, 30);
  }

  void arrancaB() { // Vengo de confundidosA
    image(fotos[6], 0, 0, width, height);
    texto.dibujar(9, 24, 255, 10, 40, 300, 200); // "Arranca el partido!!!!"
    bot[5].dibujar();  // Me manda a golBayernB
    texto.dibujar(59, 20, 255, 710, 555, 70, 30);
  }

  void arrancaC() { // Vengo de contentosB
    image(fotos[6], 0, 0, width, height);
    texto.dibujar(9, 24, 255, 10, 40, 300, 200); // "Arranca el partido!!!!"
    bot[5].dibujar();  // Me manda a golRashford
    texto.dibujar(59, 20, 255, 710, 555, 70, 30);
  }

  void arrancaD() { // Vengo de confundidosB
    image(fotos[6], 0, 0, width, height);
    texto.dibujar(9, 24, 255, 10, 40, 300, 200); // "Arranca el partido!!!!"
    bot[5].dibujar();  // Me manda a entretiempoA
    texto.dibujar(59, 20, 255, 710, 555, 70, 30);
  }

  void dudasA() { // Vengo de arrancaA 
    image(fotos[4], 0, 0, width, height);
    texto.dibujar(10, 24, 255, 10, 40, 300, 200);  // "30´ Se lesiona Sancho, pero dice que puede seguir ¿Lo dejas o lo sacás?"
    bot[6].dibujar();   // Lo dejo - Me manda a golBrunoA
    texto.dibujar(11, 20, 255, 112, 475, 80, 50); 
    bot[7].dibujar();   // Lo saco - Me manda a entreTiempoB 
    texto.dibujar(12, 20, 255, 612, 475, 80, 50);
  }

  void dudasA2() { //vengo de entreTiempoA
    image(fotos[4], 0, 0, width, height);
    texto.dibujar(18, 24, 255, 10, 40, 300, 200);  // "70´ Sigue 2-0 el partido. Se vienen unos cambios?"
    bot[6].dibujar();   // Hago cambios - Me manda a golGreenwood
    texto.dibujar(19, 20, 255, 112, 465, 80, 50); 
    bot[7].dibujar();   // No hago cambios - Me manda a golBayern 
    texto.dibujar(20, 20, 255, 612, 465, 80, 50);
  }

  void dudasA3() { //vengo de entreTiempoA2
    image(fotos[4], 0, 0, width, height);
    texto.dibujar(30, 24, 255, 10, 40, 300, 200);  // "70´ Estás cagado, sos OLE, te pones a pensar si te tirás atrás o no, qué vas a hacer?"
    bot[6].dibujar();   // Me tiro atras - Me manda a gol de bayernA3
    texto.dibujar(31, 20, 255, 112, 465, 80, 50); 
    bot[7].dibujar();   // Sigo así - Me manda a golBrunoA2
    texto.dibujar(32, 20, 255, 612, 465, 80, 50);
  }

  void dudasC () { // vengo de golBayernC2
    image(fotos[4], 0, 0, width, height);
    texto.dibujar(45, 24, 255, 10, 40, 300, 200);  // "79´ OTRO GOL DEL BAYERN HERMANO!? HACÉ ALGO!! METÉ UN CAMBIO!!! 1-2"
    bot[6].dibujar();   // "Hacer cambios" - Me manda a golCavaniC
    texto.dibujar(19, 20, 255, 112, 465, 80, 50); 
    bot[7].dibujar();   // "No Hacer cambios" - Me manda a derrota
    texto.dibujar(20, 20, 255, 612, 465, 80, 50);
  }

  void golBrunoA () { // Vengo de dudasA
    image(fotos[5], 0, 0, width, height);
    texto.dibujar(13, 24, 255, 10, 40, 300, 200); // "42´ GOOOOOOL de Bruno! Asistencia de Sancho!! MENOS MAL QUE NO LO SACASTE! 1-0"
    bot[5].dibujar(); // Boton continuar - Me manda a Gol de Sancho
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  } 

  void golBrunoA2 () { //vengo de dudasA3
    image(fotos[7], 0, 0, width, height);
    texto.dibujar(29, 24, 255, 10, 40, 300, 200); //"65´ GOOOOOL de Brunoooo 1-0. Vamos United carajo."
    bot[5].dibujar(); // Boton continuar - Me manda a campeon
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void golBrunoD () { //vengo de golVarane
    image(fotos[5], 0, 0, width, height);
    texto.dibujar(55, 24, 255, 10, 40, 300, 200); //"86´ GOOOOOOOL DE BRUNOOOOO, QUE LIQUIDA EL PARTIDO SOBRE EL FINAL, CUANTA CALIDAD DEL PORTUGUÉS MAGNIFICO!!! 3-0""
    bot[5].dibujar(); // Boton continuar - Me manda a campeon 
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void golBayernA() { // vengo de dudasA2
    image(fotos[18], 0, 0, width, height);
    texto.dibujar(24, 24, 255, 10, 40, 300, 200); //"78´ Gol del Bayern, 2-1. AYAYAYAY"
    bot[5].dibujar(); // Boton Continuar - Me manda a campeones
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void golBayernA2() { // vengo de entreTiempoA2
    image(fotos[18], 0, 0, width, height);
    texto.dibujar(28, 24, 255, 10, 40, 300, 200); //"56´ gol del Bayern. No le encontrás la vuelta. Querías a Sancho y lo sacaste. 1-0"
    bot[5].dibujar(); // Boton Continuar - me manda a derrota
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void golBayernA3() { // vengo de dudasA3
    image(fotos[18], 0, 0, width, height);
    texto.dibujar(33, 24, 255, 10, 40, 300, 200); //"90´ te empezaron a cagar a pelotazos por tirarte atrás y te lo ganan en la ultima. No aprendiste NADA, Ole."
    bot[5].dibujar(); // Boton Continuar - me manda a derrota
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void golBayernB() { // vengo de arrancaB
    image(fotos[18], 0, 0, width, height);
    texto.dibujar(34, 24, 255, 10, 40, 300, 200); //"45´ gol del Bayern sobre el final del PT"
    bot[5].dibujar(); // Boton Continuar - me manda a entreTiempoB
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // CONTINUAR
  }

  void golBayernB2() { // vengo de EntreTiempoB
    image(fotos[18], 0, 0, width, height);
    texto.dibujar(40, 24, 255, 10, 40, 300, 200); //"55´ Gol del Bayern. Se frustran todos. Pipo Gorosito es mejor que vos, Ole Gunnar. 2-0"
    bot[5].dibujar(); // Boton Continuar - me manda a derrota
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // CONTINUAR
  }

  void golBayernC() { // vengo de entreTiempoC
    image(fotos[18], 0, 0, width, height);
    texto.dibujar(44, 24, 255, 10, 40, 300, 200); //"77´ gol del Bayern. Te lo empataron por salame. 1-1"
    bot[5].dibujar(); // Boton Continuar - Me manda a dudasC
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // CONTINUAR
  }


  void jugarJuego(Juego j) { // vengo de entreTiempoD
    j.jugar(); // Llamo al juego
    if (j.getEstado() == 2) { // Pregunto si el boton cliqueado es el boton que me lleva a la pantalla créditos, si es 2, se actualiza, si es otro valor, se mantiene. 
      pant = "creditos"; // Actualizo el estado a créditos. Me manda a creditos.
    }
  }

  void golSanchoA() { // vengo de golBrunoA
    image(fotos[9], 0, 0, width, height);
    texto.dibujar(14, 24, 255, 10, 40, 300, 200); // Gol de Sancho etc etc
    bot[5].dibujar(); // Boton Continuar - me manda a Entre tiempo 
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void golSanchoB() { // vengo de entreTiempoB
    image(fotos[12], 0, 0, width, height);
    texto.dibujar(38, 24, 255, 10, 40, 300, 200); // "55´ GOOOOL, Sancho pone el empate 1-1! Dale que se puede"
    bot[5].dibujar(); // Me manda a GolCavaniB
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void golCavaniB() { // vengo de golSanchoB
    image(fotos[19], 0, 0, width, height); 
    texto.dibujar(39, 24, 255, 10, 40, 300, 200); // "90+2´ GOOOOOOOOOOOOOOOL CAVANI METE TERRIBLE CABEZAZO PARA GANAR SOBRE EL FINAL!!! MATADOOOR MATADOOOR!!!"
    bot[5].dibujar(); // Me manda a campeones 
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void golCavaniC() { // vengo de dudasC
    image(fotos[17], 0, 0, width, height);
    texto.dibujar(48, 24, 255, 10, 40, 300, 200); // "85´ EMPATA CAVANI DE PALOMITA. NO SE PIERDE LA ESPERANZA. 2-2"
    bot[5].dibujar(); //  CONTINUAR - Me manda a golCr7C2
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void entreTiempoA() { //Vengo de dudasA
    image(fotos[22], 0, 0, width, height);
    texto.dibujar(15, 24, 0, 10, 40, 300, 200); // "Entre tiempo, te vas al vestuario, todos esperan una arenga tuya"
    bot[3].dibujar();   // Arenga - Me manda a dudasA2
    texto.dibujar(16, 24, 255, 330, 380, 200, 200); 
    bot[4].dibujar();   // Conformismo - Me manda a campeones
    texto.dibujar(17, 24, 255, 570, 380, 200, 200);
  }

  void entreTiempoA2() { //Vengo de dudasA
    image(fotos[22], 0, 0, width, height);
    texto.dibujar(25, 24, 0, 10, 40, 300, 200); // "Te vas al vestuario con los jugadores, elegis dar una charla motivacional o te lamentas por la salida de Sancho"
    bot[3].dibujar();   // Lamento - Me manda a golBayernA2
    texto.dibujar(27, 24, 255, 330, 380, 200, 200); 
    bot[4].dibujar();   // Motivacion - Me manda a dudasA3
    texto.dibujar(26, 24, 255, 570, 380, 200, 200);
  }

  void entreTiempoB () { // vengo de golBayernB
    image(fotos[22], 0, 0, width, height);
    texto.dibujar(35, 24, 0, 10, 40, 300, 200); // //"Estas en el vestuario, entre tiempo, les decis que pongan mas huevos o les decis que sigan igual?"
    bot[3].dibujar();   // Huevo Huevo - Me manda a golSanchoB
    texto.dibujar(36, 24, 255, 330, 380, 200, 200); 
    bot[4].dibujar();   // Sigan asi - Me manda a golBayernB2
    texto.dibujar(37, 24, 255, 570, 380, 200, 200);
  }

  void entreTiempoC() {
    image(fotos[22], 0, 0, width, height);
    texto.dibujar(42, 24, 0, 10, 40, 300, 200); // "Entre tiempo, les decis que NO se relajen o los felicitas?"
    bot[3].dibujar();   // "No se relajen" - Me manda a golCr7C
    texto.dibujar(60, 24, 255, 330, 380, 200, 200); 
    bot[4].dibujar();   // "Felicitar" - Me manda a golBayernC
    texto.dibujar(61, 24, 255, 570, 380, 200, 200);
  }

  void entreTiempoD() { // Vengo de dudasD
    image(fotos[22], 0, 0, width, height);
    texto.dibujar(50, 24, 0, 10, 40, 300, 200 ); // "Te vas al vestuario. Aburridisimo 0-0 al entre tiempo. No sabes que hacer. Admitis que te equivocaste y que hay que ganar como sea?"
    bot[3].dibujar();   //  "Admitir Error" - me manda a golMaguire
    texto.dibujar(51, 24, 255, 330, 380, 200, 200); 
    bot[4].dibujar();   //  "Pedir sonrisas" - me manda a golBayernD
    texto.dibujar(52, 24, 255, 570, 380, 200, 200);
  }

  void golRashfordC() {
    image(fotos[14], 0, 0, width, height);
    texto.dibujar(41, 24, 255, 10, 40, 300, 200); //"40´ GOOOL DE RASHFORD A LA CONTRA. 1-0"
    bot[5].dibujar(); // Boton Continuar - Me manda a Entre tiempo
    texto.dibujar(59, 20, 255, 710, 555, 70, 30);
  }

  void golGreenwood() { // vengo de dudasA2
    image(fotos[13], 0, 0, width, height);
    texto.dibujar(21, 24, 255, 10, 40, 300, 200); //"71´ GOOOOOL de Greenwood RECIÉN ingresado!!! Qué pasó Ole!!!??? Aprendiste a hacer cambios!!! BIEEEEN!!!! 3-0."
    bot[5].dibujar(); // me manda a GolCr7
    texto.dibujar(59, 20, 255, 710, 555, 70, 30);
  }

  void golCr7A() { // vengo de golGreenwood
    image(fotos[8], 0, 0, width, height);
    texto.dibujar(22, 24, 255, 10, 40, 300, 200);
    bot[5].dibujar(); // me manda a GolPogba
    texto.dibujar(59, 20, 255, 710, 555, 70, 30);
  }

  void golCr7C() { // vengo de entreTiempoC
    image(fotos[10], 0, 0, width, height);
    texto.dibujar(43, 24, 255, 10, 40, 300, 200); //"88´ GOOLAAAAAZOOOOO DEL BICHO, CR7 IDOLO, MÁQUINA, PONE EL 2-0 SOBRE EL FINAL DEL PARTIDO, VAMOS UNITED. 2-0" 
    bot[5].dibujar(); // me manda a campeones
    texto.dibujar(59, 20, 255, 710, 555, 70, 30);
  }

  void golCr7C2() { // vengo de golCavaniC
    image(fotos[11], 0, 0, width, height);
    texto.dibujar(49, 24, 255, 10, 40, 300, 200); //"90+3´ GOOOOOL DE CRISTIANO RONALDO, QUE LE DA LA 4TA CHAMPIONS AL CLUB QUE LO VIÓ NACER!! TE SALIERON LOS CAMBIOS, OLE!! 3-2"
    bot[5].dibujar(); // me manda a campeones
    texto.dibujar(59, 20, 255, 710, 555, 70, 30);
  }

  void golPogba() { // vengo de golCr7A
    image(fotos[20], 0, 0, width, height);
    texto.dibujar(23, 24, 255, 10, 40, 300, 200);
    bot[5].dibujar(); // me manda a campeones
    texto.dibujar(59, 20, 255, 710, 555, 70, 30);
  }

  void golMaguire() { // vengo de entreTiempoD
    image(fotos[15], 0, 0, width, height);
    texto.dibujar(53, 24, 255, 10, 40, 300, 200); // "63´ GOL DE MAGUIRE HACIENDO VALER SU 1.94 DE ALTURA. 1-0."
    bot[5].dibujar(); // Me manda a golVarane
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void golVarane() { // vengo de golMaguire
    image(fotos[16], 0, 0, width, height);
    texto.dibujar(54, 24, 255, 10, 40, 300, 200); // "75´ GOL DEL OTRO CENTRAL, GOL DE VARANE. EXCELENTE PELOTA PARADA DEL UNITED. 2-0"
    bot[5].dibujar(); // Me manda a golBrunoD
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void campeones() { 
    image(fotos[21], 0, 0, width, height);
    texto.dibujar(57, 24, 255, 10, 40, 500, 200);
    bot[5].dibujar(); // Boton para reiniciar - Me manda a los créditos
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void derrota() { 
    image(fotos[23], 0, 0, width, height);
    texto.dibujar(58, 24, 255, 10, 40, 500, 200); // "Final del partido. Bayern campeón. Che, Ole, acá a la vuelta en la carnicería andan tomando CVs." 
    bot[5].dibujar(); // Boton para reiniciar - Me manda a los créditos
    texto.dibujar(59, 20, 255, 710, 555, 70, 30); // Continuar (texto)
  }

  void creditos() {
    background(0); 
    textAlign(CENTER, CENTER);
    textSize(36);
    float col; 
    float colB; 
    float colC;
    col = random(0, 255);
    colB = random(0, 255);
    colC = random(0, 255);
    fill(col, colB, colC);
    text("Gonzalo Castro Ediola//Juan Bautista Felli", 400, 220);
    textSize(26);
    text("Legajo 88125/0 // Legajo 88176/2", 400, 260);
    text("Tecno 1 Comisión 2", 400, 300);
    text("Año 2021", 400, 340);
    bot[5].dibujar(); // Boton para reiniciar - Me manda al inicio
    textAlign(CENTER);
    fill(255);
    textSize(20);
    text("Reiniciar", 710, 555, 70, 30);
  }

  void mousePressed() {
    if (bot[0].getBotonPressed(mouseX, mouseY) && pant.equals("inicio")) { // 
      pant = "vestuario";
    } else if (bot[1].getBotonPressed(mouseX, mouseY) && pant.equals("vestuario")) { // 
      pant = "vestuarioConfirmadoA";
    } else if (bot[2].getBotonPressed(mouseX, mouseY) && pant.equals("vestuario")) {  // 
      pant = "vestuarioConfirmadoB";
    } else if (bot[3].getBotonPressed(mouseX, mouseY) && pant.equals("vestuarioConfirmadoA")) { // 
      pant = "contentosA";
    } else if (bot[4].getBotonPressed(mouseX, mouseY) && pant.equals("vestuarioConfirmadoA")) { //
      pant = "confundidosA";
    } else if (bot[3].getBotonPressed(mouseX, mouseY) && pant.equals("vestuarioConfirmadoB")) { // 
      pant = "contentosB";
    } else if (bot[4].getBotonPressed(mouseX, mouseY) && pant.equals("vestuarioConfirmadoB")) { // 
      pant = "confundidosB";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("contentosA")) { // 
      pant = "arrancaA";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("confundidosA")) {  // 
      pant = "arrancaB";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("contentosB")) { // 
      pant = "arrancaC";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("confundidosB") ) { // 
      pant = "arrancaD";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("arrancaA") ) { //
      pant = "dudasA";
    } else if (bot[6].getBotonPressed(mouseX, mouseY) && pant.equals("dudasA") ) { //
      pant = "golBrunoA";
    } else if (bot[7].getBotonPressed(mouseX, mouseY) && pant.equals("dudasA") ) { //
      pant = "entreTiempoA2";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golBrunoA") ) { // 
      pant = "golSanchoA";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golSanchoA") ) {
      pant = "entreTiempoA";
    } else if (bot[3].getBotonPressed(mouseX, mouseY) && pant.equals("entreTiempoA") ) { 
      pant = "dudasA2";
    } else if (bot[4].getBotonPressed(mouseX, mouseY) && pant.equals("entreTiempoA") ) {
      pant = "campeones";
    } else if (bot[6].getBotonPressed(mouseX, mouseY) && pant.equals("dudasA2") ) {
      pant = "golGreenwood";
    } else if (bot[7].getBotonPressed(mouseX, mouseY) && pant.equals("dudasA2") ) {
      pant = "golBayernA";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golGreenwood") ) {
      pant = "golCr7A";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golCr7A") ) {
      pant = "golPogba";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golPogba") ) {
      pant = "campeones";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golBayernA") ) {
      pant = "campeones";
    } else if (bot[3].getBotonPressed(mouseX, mouseY) && pant.equals("entreTiempoA2") ) { // 
      pant = "golBayernA2";
    } else if (bot[4].getBotonPressed(mouseX, mouseY) && pant.equals("entreTiempoA2") ) { // 
      pant = "dudasA3"; //
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golBayernA2") ) {
      pant = "derrota";
    } else if (bot[6].getBotonPressed(mouseX, mouseY) && pant.equals("dudasA3") ) {
      pant = "golBayernA3";
    } else if (bot[7].getBotonPressed(mouseX, mouseY) && pant.equals("dudasA3") ) {
      pant = "golBrunoA2";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golBayernA3") ) {
      pant = "derrota";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golBrunoA2") ) {
      pant = "campeones";
      // FIN RAMA A
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("arrancaB") ) { //
      pant = "golBayernB";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golBayernB") ) { //
      pant = "entreTiempoB";
    } else if (bot[3].getBotonPressed(mouseX, mouseY) && pant.equals("entreTiempoB") ) { //
      pant = "golSanchoB";
    } else if (bot[4].getBotonPressed(mouseX, mouseY) && pant.equals("entreTiempoB") ) {
      pant = "golBayernB2";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golSanchoB") ) {
      pant = "golCavaniB";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golBayernB2") ) {
      pant = "derrota";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golCavaniB") ) {
      pant = "campeones";
      // FIN RAMA B
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("arrancaC") ) { //
      pant = "golRashfordC";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golRashfordC") ) { //
      pant = "entreTiempoC";
    } else if (bot[3].getBotonPressed(mouseX, mouseY) && pant.equals("entreTiempoC") ) { // 
      pant = "golCr7C";
    } else if (bot[4].getBotonPressed(mouseX, mouseY) && pant.equals("entreTiempoC") ) { //
      pant = "golBayernC";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golCr7C") ) { //
      pant = "campeones";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golBayernC") ) { //
      pant = "dudasC";
    } else if (bot[6].getBotonPressed(mouseX, mouseY) && pant.equals("dudasC") ) { //
      pant = "golCavaniC";
    } else if (bot[7].getBotonPressed(mouseX, mouseY) && pant.equals("dudasC") ) { //
      pant = "derrota";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golCavaniC") ) { //
      pant = "golCr7C2";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golCr7C2") ) { //
      pant = "campeones";
      //FIN RAMA C
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("arrancaD") ) { //
      pant = "entreTiempoD";
    } else if (bot[3].getBotonPressed(mouseX, mouseY) && pant.equals("entreTiempoD") ) { // 
      pant = "golMaguire";
    } else if (bot[4].getBotonPressed(mouseX, mouseY) && pant.equals("entreTiempoD") ) { //
      pant = "juego";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golMaguire") ) { //
      pant = "golVarane";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golVarane") ) {  // 
      pant = "golBrunoD";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("golBrunoD") ) { // 
      pant = "campeones";
      // FIN RAMA D
    } else if (bot[5].getBotonPressed(mouseX, mouseY) &&  pant.equals("derrota") ) {
      pant = "creditos";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) &&  pant.equals("campeones")) { //
      pant = "creditos";
    } else if (bot[5].getBotonPressed(mouseX, mouseY) && pant.equals("creditos") ) { //
      pant = "inicio";
    }
  }
}
