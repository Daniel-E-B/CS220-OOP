class rPlayer extends Eatable{
  float playerID;
  float radius;
  float x;
  float y;
  float r;
  float g;
  float b;
  float alive;
  
  rPlayer(float id, float rad, float x, float y, float r, float g, float b, float alive){
    this.playerID=id;
    this.radius=rad;
    this.x=x;
    this.y=y;
    this.r=r;
    this.g=g;
    this.b=b;
    this.alive=alive;
  }
  
  float distance(float x1, float y1, float x2, float y2){
    return sqrt((pow((x1-x2),2)+pow((y1-y2),2)));
  }
}