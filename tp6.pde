Aventura a;


void setup() {
  size(800, 600);
  a= new Aventura();
}

void draw() {
  background(120);
  a.iniciar();
}
void mousePressed() {
  a.mousePressed();
}
