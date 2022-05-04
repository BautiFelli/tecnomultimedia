ArrayList<Caminante>c;
Paleta paleta;
int cantidad;

void setup(){
 size(1200,800); 
  background(255); 
 paleta= new Paleta ("paleta.jpg");
  c= new ArrayList<Caminante>();
  for(int i=0; i<500;i++){
  c.add(new Caminante (paleta.darUnColor()));
  }
  }


void draw(){
for(Caminante c: c){
 c.dibujar(); 
 c.cambiarGrosor();
c.cambiarAltura();
 //c.mover();
}

}
