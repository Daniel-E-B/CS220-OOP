class FlittingBird extends BirdObject{
  private final float MIN_X_SPEED = 2.0;
  private final float MAX_X_SPEED = 5.0;
  private float ySpeed;
  private final float MIN_Y_SPEED = -1.0;
  private final float MAX_Y_SPEED = 1.0;

  FlittingBird() {
    super();
    this.size=11;
    this.img=loadImage("flittingBird.png");
    this.y = random(0, height);
    this.xSpeed = random(MIN_X_SPEED, MAX_X_SPEED);
    this.ySpeed = random(MIN_Y_SPEED, MAX_Y_SPEED);
  }
  
  final void move() {
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
      this.ySpeed = max(this.MIN_Y_SPEED, this.ySpeed);
      this.ySpeed = min(this.MAX_Y_SPEED, this.ySpeed);

      this.xSpeed += random(-0.5, 0.5);
      this.xSpeed = max(this.MIN_X_SPEED, this.xSpeed);
      this.xSpeed = min(this.MAX_X_SPEED, this.xSpeed);
    }
  }
}