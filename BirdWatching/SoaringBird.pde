class SoaringBird extends SkyObject{
  float minXSpeed = 1.0;
  float maxXSpeed = 3.0;

  SoaringBird() {
    super();
    this.xSpeed = random(this.minXSpeed,this.maxXSpeed);
  }
  
  void display() {
    super.display();
    ellipse(this.x, this.y, this.size*2, this.size);
  }
  
  void move() {
    // if off the right side of the screen,
    // move to just off the left side of the screen
    if (this.x > width) {
      this.x = -this.size;
    }
  }
}