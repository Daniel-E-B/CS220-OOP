class SoaringBird extends BirdObject{
  private final float MIN_X_SPEED = 1.0;
  private final float MAX_Y_SPEED = 3.0;

  SoaringBird() {
    super();
    this.size=5;
    this.img=loadImage("soaringBird.png");
    this.y = random(0, height);
    this.xSpeed = random(this.MIN_X_SPEED,this.MAX_Y_SPEED);
  }
  
  final void move() {
    this.x += this.xSpeed;
    if (this.x > width) {
      this.x = -this.size;
    }
  }
}