abstract class BirdObject{
  PImage img;
  float xSpeed;
  float x;
  float y;
  float size;
  BirdObject(){
    this.x = random(0, width);
  }
  
  void display() {
    imageMode(CENTER);
    image(this.img, this.x, this.y, width/this.size, height/this.size);
  }
  void move(){}
}