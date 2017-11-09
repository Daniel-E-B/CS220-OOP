abstract class BirdObject{
  protected PImage img;//like private, but child can see it
  protected float xSpeed;
  protected float x;
  protected float y;
  protected float size;
  BirdObject(){//could be protected but doesn't need to be b/c BirdObject is abstract
    this.x = random(0, width);
  }
  
  void display() {
    imageMode(CENTER);
    image(this.img, this.x, this.y, width/this.size, height/this.size);
  }
  void move(){}
}