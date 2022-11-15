import fisica.*;

FWorld mundo;

void setup() {

  size(1080, 1050);
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges(255);
  background(255);

  FPoly base = new FPoly();
  base.vertex(650, 250);

base.vertex(680,220);
  base.vertex(700, 240);
   base.vertex(715, 230);
   base.vertex(750, 240);
base.vertex(800,300);
base.vertex(750, 380);
    base.vertex(700, 350);
    base.vertex(600, 285);
  
  /*  base.vertex(620, 240);

    base.vertex(610, 210);*/


  base.setStatic(true);
  base.setGrabbable(false);
  base.setFill(237, 224, 212);
  mundo.add(base);
}
void draw() {
  mundo.draw();
}
