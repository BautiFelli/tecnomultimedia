import fisica.*;

FWorld mundo;

void setup() {

  size(1080, 1050);
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges(255);
  background(255);

  FPoly base = new FPoly();
  base.vertex(650, 120);

base.vertex(680,100);
  base.vertex(700, 120);
   base.vertex(715, 110);
   base.vertex(750, 130);
base.vertex(800,190);
base.vertex(750, 270);
    base.vertex(700, 240);
   base.vertex(600, 225);
  
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
