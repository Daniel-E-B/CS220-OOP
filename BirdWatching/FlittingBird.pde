class FlittingBird extends BirdObject{
  float minXSpeed = 2.0;
  float maxXSpeed = 5.0;
  float ySpeed;
  float minYSpeed = -1.0;
  float maxYSpeed = 1.0;
  float size = 11.0;

  FlittingBird() {
    super();
    this.img=loadImage("flittingBird.png");
    this.y = random(0, height);
    this.xSpeed = random(minXSpeed, maxXSpeed);
    this.ySpeed = random(minYSpeed, maxYSpeed);
  }
  
  void move() {
    this.x += this.xSpeed;
    this.y += this.ySpeed;
    if (this.x > width) {
      this.x = -this.size;
    }
    if (this.y < -this.size || this.y > height) {
      this.ySpeed = -this.ySpeed;
    }
    // about 20% of the time, change speed a bit
    if (random(0,1) > 0.8) {
      this.ySpeed += random(-0.5, 0.5);
      this.ySpeed = max(this.minYSpeed, this.ySpeed);
      this.ySpeed = min(this.maxYSpeed, this.ySpeed);

      this.xSpeed += random(-0.5, 0.5);
      this.xSpeed = max(this.minXSpeed, this.xSpeed);
      this.xSpeed = min(this.maxXSpeed, this.xSpeed);
    }
  }
}