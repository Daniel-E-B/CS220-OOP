class BirdObject{
  float x;
  float y;
  color fillColor;
  BirdObject(){
    this.fillColor = color(random(0,255), random(0,255), random(0,255));
    this.x = random(0, width);
  }
}