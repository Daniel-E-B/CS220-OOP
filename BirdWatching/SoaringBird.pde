class SoaringBird extends BirdObject{
  float minXSpeed = 1.0;
  float maxXSpeed = 3.0;
  float size = 5.0;

  SoaringBird() {
    super();
    this.img=loadImage("soaringBird.png");
    this.y = random(0, height);
    this.xSpeed = random(this.minXSpeed,this.maxXSpeed);
  }
  
  void move() {
    this.x += this.xSpeed;
    if (this.x > width) {
      this.x = -this.size;
    }
  }
}