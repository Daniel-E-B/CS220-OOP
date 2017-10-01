class SoaringBird {
  float x;
  float y;
  float xSpeed;
  float minXSpeed = 1.0;
  float maxXSpeed = 3.0;
  float size = 30.0;
  color fillColor;

  SoaringBird() {
    this.x = random(0, width);
    this.y = random(0, height);
    this.xSpeed = random(this.minXSpeed,this.maxXSpeed);
    this.fillColor = color(random(0,255), random(0,255), random(0,255));
  }
  
  void display() {
    fill(this.fillColor);
    ellipse(this.x, this.y, this.size*2, this.size);
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