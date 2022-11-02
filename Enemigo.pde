public class Enemigo
{
  private PImage Sprite;
  private FBox Hitbox;

  Enemigo(int xpos,int ypos,int density)
  {
    this.Sprite = loadImage("./assets/lobito2.png");
    this.Hitbox = new FBox(50,33);
    this.Hitbox.setPosition(xpos, ypos);
    this.Hitbox.setNoFill();
    this.Hitbox.setNoStroke();
    this.Hitbox.setDensity(density);
    this.Hitbox.setGrabbable(false);
  }

  void Dibujar()
  {
    pushMatrix();
    imageMode(CENTER);
    translate(this.Hitbox.getX(),this.Hitbox.getY());
    rotate(this.Hitbox.getRotation());
    image(this.Sprite,0,0);
    popMatrix();
  }
   
  FBox GetHitbox()
  {
     return this.Hitbox; 
  }
}
