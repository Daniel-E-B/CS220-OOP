class SkyObject implements Creature{
  float x;
  float y;
  float size;
  color fillColor;
  float xSpeed;
  
  SkyObject(){
    this.x = random(0, width);
    this.y = random(0, height);
    this.fillColor = color(random(0,255), random(0,255), random(0,255));
  }
  
  void move(){
    this.x+=xSpeed;
  }
  void display(){
    fill(this.fillColor);
  }
}