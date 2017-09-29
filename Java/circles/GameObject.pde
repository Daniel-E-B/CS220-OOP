class GameObject{
    float x;
    float y;
    color fillColor;
    float radius;
    float speed=0;
    float angle=0;
    boolean die=false;
    int bounces=0;
    Collidable collision = new Collidable(true);
    Eatable eatCheck = new Eatable();
    
    /*
      Create a new circle at the given x,y point with a
      random speed, color, and size.'''
     */
    public GameObject (float x, float y) {

        this.x = x; 
        this.y = y;
        // this creates a random color. We draw it with an
        // outline, so we'll be able to see it on a white
        // background regardless
        this.fillColor = color(random(0,255),
                               random(0,255),
                               random(0,255));
                               
        //this.radius = random(5,height/12);//yay for arbitrary numbers
    }

     //distance formula
      float distance(float x1, float y1, float x2, float y2){
        return sqrt((pow((x1-x2),2)+pow((y1-y2),2)));
      }
  
    
    /* Draw self on the canvas. */
    public void display() {
        fill(this.fillColor);
        stroke(0, 0, 0); // makes a black outline
        ellipse(this.x, this.y, this.radius*2, this.radius*2);
    }
}