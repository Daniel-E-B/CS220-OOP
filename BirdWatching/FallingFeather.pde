class FallingFeather extends BirdObject implements Creature{
  float ySpeed;
  float size = 6.0;

  FallingFeather() {
    super();
    img=loadImage("feather.png");
    this.y = random(-height, 0);
    this.xSpeed = random(-1,1);
    this.ySpeed = random(0.5, 1.5);
  }
  
  void display() {
    fill(this.fillColor);
    imageMode(CORNER);
    image(this.img, this.x, this.y, width/this.size, height/this.size);
  }
  
  void move() {
    this.x += this.xSpeed;
    this.y += this.ySpeed;
    // if off the bottom of the screen, move to the top
    if (this.y > height) {
      this.y = -this.size;
    }
    // about 5% of the time,
    // or if going off the left or right of the screen,
    // reverse x direction
    if (random(0, 1) > 0.95 || this.x < -this.size || this.x > width) {
      this.xSpeed = -this.xSpeed;
    }
  }
}