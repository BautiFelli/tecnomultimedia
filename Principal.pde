
class Principal {
  Bala Bala;
  Base Base;
  Escenario Win, Lose, Manual;
  Receptor Receptor;
  Administrador Admin;
  Enemigo Enemigo;
  
  FPoly Piedra;

  ArrayList <Estructura> Estructuras = new ArrayList<Estructura>();
  int OscPort = 12345;
  int[][]PosEst = new int[16][5];
  int[][]PosBase = new int[31][2];
  int Estado = -1;
  int TimerGeneral = 5;
  int Proyectiles = 3;
  PImage Fondo;
  String BalaEstado = "cuenta";
  PFont font;

  Principal(FWorld mundo) {
    this.Enemigo = new Enemigo(600, 370);
    this.CargaPosicionesEstructuras();
    this.CargaPosicionesBase();
    this.Bala = new Bala(30, 520);
    this.Piedra = new FPoly();
    this.Base = new Base(this.PosBase);
    this.Win = new Escenario("¡GANASTE!", false);
    this.Lose = new Escenario("PERDISTE", false);
    this.Manual = new Escenario("", true);
    this.Fondo = loadImage("./assets/fondoo.jpg");
    font=loadFont("Impact-48.vlw");
    
    this.Piedra.setStatic(true);
    this.Piedra.setGrabbable(false);
    //this.Piedra.vertex(width/2-90, 0);
    //this.Piedra.vertex(width/2+90, 80);
    //this.Piedra.vertex(width/2+160, 0);

    this.Piedra.vertex(680-50, 80);
    this.Piedra.vertex(700-50, 120-20);
    this.Piedra.vertex(715-50, 110-20);
    this.Piedra.vertex(750-50, 130-20);
    this.Piedra.vertex(800-50, 190-20);
    this.Piedra.vertex(800-20, 230);
    this.Piedra.vertex(750-50, 280);
    this.Piedra.vertex(700-50, 240-20);
    this.Piedra.vertex(600-50, 180);
    this.Piedra.vertex(550, 125);

    mundo.add(this.Bala.Hitbox);
    mundo.add(this.Base.Suelo);
    mundo.add(this.Enemigo.Hitbox);
    mundo.add(this.Piedra);


    this.ReseteaAmbiente(mundo);
    this.Receptor = new Receptor();
    setupOSC(this.OscPort);
  }

  void DibujarPrincipal() {
    switch(this.Estado) {
    case -1:
      this.Manual.MostrarEscenario(this.Base.Suelo);
      break;
    case 0:
      this.Bala.Dibujar();
      this.DibujarEstructuras();
      this.Enemigo.Dibujar();
      pushMatrix();
      for (Blob b : this.Receptor.blobs) {
        float x = map(b.centroidX, 0, 1, 0, width);
        float y = map(b.centroidY, 0, 1, 0, height);
        strokeWeight(0);
        textAlign(CENTER, CENTER);
        textSize(72);
        text(this.Proyectiles, x, y);
      }
      popMatrix();
      break;
    case 1:
      this.Win.MostrarEscenario(this.Base.Suelo);
      break;
    case 2:
      this.Lose.MostrarEscenario(this.Base.Suelo);
      break;
    }
  }

  void LogicaPrincipal(FWorld mundo) {
    switch(this.Estado) {
    case -1:
      this.TimerPantallas(mundo);
      break;
    case 0:
      textFont(font);
      textSize(36);
      text("Proyectiles: "+this.Proyectiles, 125, 40);
      text("Tiempo:"+ this.TimerGeneral, 90, 120);

      switch(this.BalaEstado) {
      case "cuenta":
        if (this.TimerGeneral > 0) {
          if (frameCount % 80 == 0) {
            //println("Pre disparo: "+this.TimerGeneral);
            this.TimerGeneral --;
          }
        } else {
          this.TimerGeneral = 5;
          this.BalaEstado = "disparo";
        }
        break;
      case "disparo":
        println("Disparado");
        if (this.Receptor.blobs.size()>0) {
          for (Blob b : this.Receptor.blobs) {
            println("Blobs: "+ this.Receptor.blobs.size());
            float x = map(b.centroidX, 0, 1, 0, width);
            float y = map(b.centroidY, 0, 1, 0, height);
            this.Bala.DispararBala(x, y);
          }
          s_disparo.play();
          this.BalaEstado = "disparada";
        }else{
         this.BalaEstado = "cuenta"; 
        }
        break;
      case "disparada":
        //println("En aire: "+this.TimerGeneral);

        if (this.TimerGeneral > 0) {
          if (frameCount % 80 == 0) {
            this.TimerGeneral --;
          }
        } else {
          this.TimerGeneral = 5;
          this.BalaEstado = "cuenta";
          this.Bala.Vida = 1;
          this.Bala.ResetearPosicion();
          this.Proyectiles --;
          if (this.Proyectiles == 0) {
            s_perder.play();
            this.Estado = 2;
          }
        }
        break;
      }
      this.Receptor.actualizar(mensajes);
      break;
    case 1:
      mundo.remove(this.Enemigo.Hitbox);
      mundo.add(this.Enemigo.Hitbox);
      this.TimerPantallas(mundo);
      break;
    case 2:
      mundo.remove(this.Enemigo.Hitbox);
      mundo.add(this.Enemigo.Hitbox);
      this.TimerPantallas(mundo);
      break;
    }
  }

  void LogicaColisiones(FContact contacto, FWorld mundo) {
    for (Estructura e : this.Estructuras) {
      if (contacto.contains(this.Bala.Hitbox, e.Hitbox)) {
        if (this.Bala.Vida > 0 ) {
          this.Bala.Vida --;
          e.Destruido = true;
          mundo.remove(e.Hitbox);
        }
      }
    }

    if (contacto.contains(this.Bala.Hitbox, this.Enemigo.Hitbox)) {
      s_lobohurt.play();
      s_derrumbe.play();
      this.Estado = 1;
    }
   
   if(contacto.contains(this.Piedra, this.Bala.Hitbox)){
      this.Bala.Hitbox.addImpulse(500,500);
    }  

}

  void DibujaFondo() {
    pushMatrix();
    imageMode(CORNER);
    image(this.Fondo, 0, 0, width, height);
    popMatrix();
  }

  void CargaPosicionesEstructuras() {
    JSONArray listado = loadJSONArray("./data/data.json");
    for (int i=0; i<this.PosEst.length; i++) {
      JSONObject item = listado.getJSONObject(i);
      int x = item.getInt("x");
      int y = item.getInt("y");
      int w = item.getInt("w");
      int h = item.getInt("h");
      int id = item.getInt("id");
      this.PosEst[i][0] = x;
      this.PosEst[i][1] = y;
      this.PosEst[i][2] = w;
      this.PosEst[i][3] = h;
      this.PosEst[i][4] = id;
    }
  }

  void CargaPosicionesBase() {
    JSONArray listado = loadJSONArray("./data/limites.json");
    for (int i=0; i<this.PosBase.length; i++) {
      JSONObject item = listado.getJSONObject(i);
      int x = item.getInt("x");
      int y = item.getInt("y");
      this.PosBase[i][0] = x;
      this.PosBase[i][1] = y;
    }
  }

  void ReseteaAmbiente(FWorld mundo) {
    this.Base.Suelo.setFill(181, 131, 141);
    this.Base.Suelo.setStrokeWeight(8);
    this.Base.Suelo.setStroke(127, 85, 57);

    for (Estructura e : this.Estructuras) mundo.remove(e.Hitbox);
    this.Bala.ResetearPosicion();

    this.Estructuras.clear();
    for (int i=0; i<this.PosEst.length; i++) {
      int x = PosEst[i][0];
      int y = PosEst[i][1];
      int w = PosEst[i][2];
      int h = PosEst[i][3];

      Estructura actual = new Estructura(x, y, w, h);
      this.Estructuras.add(actual);
      mundo.add(actual.Hitbox);
    }
  }

  void DibujarEstructuras() {
    Iterator<Estructura> iterador = this.Estructuras.iterator();
    while (iterador.hasNext()) {
      Estructura actual = iterador.next();
      if (!actual.Destruido) {
        actual.Dibujar();
      } else {
        iterador.remove();
      }
    }
  }

  void TimerPantallas(FWorld mundo) {
    if (this.TimerGeneral > 0) {
      if (frameCount % 80 == 0) {
        this.TimerGeneral --;
        println(this.TimerGeneral);
      }
    } else {
      this.TimerGeneral = 5;
      this.Estado = 0;
      this.Proyectiles = 3;
      this.ReseteaAmbiente(mundo);
    }
  }
}
