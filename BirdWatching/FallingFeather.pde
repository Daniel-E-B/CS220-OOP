class FallingFeather extends BirdObject implements Creature{
  float xSpeed;
  float ySpeed;
  float size = 5.0;

  FallingFeather() {
    super();
    this.y = random(-height, 0);
    this.xSpeed = random(-1,1);
    this.ySpeed = random(0.5, 1.5);
  }
  
  void display() {
    fill(this.fillColor);
    rect(this.x, this.y, this.size*2, this.size);
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