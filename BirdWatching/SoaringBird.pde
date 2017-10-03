class SoaringBird extends BirdObject implements Creature{
  float minXSpeed = 1.0;
  float maxXSpeed = 3.0;
  float size = 5.0;

  SoaringBird() {
    super();
    img=loadImage("soaringBird.png");
    this.y = random(0, height);
    this.xSpeed = random(this.minXSpeed,this.maxXSpeed);
  }
  
  void display() {
    fill(this.fillColor);
    imageMode(CENTER);
    image(this.img, this.x, this.y, width/this.size, height/this.size);
  }
  
  void move() {
    this.x += this.xSpeed;
    // if off the right side of the screen,
    // move to just off the left side of the screen
    if (this.x > width) {
      this.x = -this.size;
    }
  }
}