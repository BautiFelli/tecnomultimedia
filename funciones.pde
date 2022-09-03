String conseguirNombre (FBody cuerpo){
  
  String nombre = "nada";
  
  if(cuerpo != null){
    
    nombre= cuerpo.getName();
    
    if (nombre == null){
      
      nombre = "nada";
    }
  }
  return nombre;
}


/*void dividirEstruc(FBox estruc){
  
    for (int i =0; i<estruc.length; i++){
  
  float d = estruc[i].getSize()/4;
  float x = estruc[i].getX();
  float y = estruc[i].getY();
  
  mundo.remove("rec"+i);
  

   for(int i = 0; i<4; i++){
    FBox hijo = new FBox (d);
    hijo.setPosition (x + random(-d, d), y + random (-d,d));
    mundo.add(hijo);
  }}
}*/
