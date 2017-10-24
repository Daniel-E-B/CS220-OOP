abstract class GameObject{
    float x;
    float y;
    color fillColor;
    float r, g, b;
    float radius;
    float speed=0;
    boolean alive=true;
    Collidable collision = new Collidable(true);
    Eatable eatCheck = new Eatable();
    
    public GameObject (float x, float y) {

        this.x = x; 
        this.y = y;
        // this creates a random color. We draw it with an
        // outline, so we'll be able to see it on a white
        // background regardless
        this.fillColor = color(random(0,255),
                               random(0,255),
                               random(0,255));
                               
    }

     //distance formula
      float distance(float x1, float y1, float x2, float y2){
        return sqrt((pow((x1-x2),2)+pow((y1-y2),2)));
      }
  
    
    public void display() {
        fill(this.fillColor);
        ellipse(this.x, this.y, this.radius*2, this.radius*2);
    }
}