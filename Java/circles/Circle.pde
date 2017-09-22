import java.util.Iterator;

class Circle {
    float x;
    float y;
    color fillColor;
    float radius;
    float speed=0;
    float angle=0;
    boolean die=false;
    
    /*
      Create a new circle at the given x,y point with a
      random speed, color, and size.'''
     */
    public Circle (float x, float y) {

        this.x = x; 
        this.y = y;
        while(speed==0){
          this.speed = random(-5, 5);//make sure that shapes have to move
        }
        this.angle=random(0, 359);
        // this creates a random color. We draw it with an
        // outline, so we'll be able to see it on a white
        // background regardless
        this.fillColor = color(random(0,255),
                               random(0,255),
                               random(0,255));
                               
        this.radius = random(5,height/12);//yay for arbitrary numbers
    }

     //distance formula
      float distance(float x1, float y1, float x2, float y2){
        return sqrt((pow((x1-x2),2)+pow((y1-y2),2)));
      }

    /* Update current location by speed. */
    public void update(ArrayList<Circle> gameObjects) {
        //move the shapes
        this.x += speed*sin(this.angle);
        this.y += speed*cos(this.angle);
        
        //check for collisions with borders
        if(this.x<this.radius||this.x>width-this.radius||this.y<this.radius||this.y>height-this.radius){
          this.angle+=(180);
        }
       

       //check for collisions
       //the circle in index 1 keeps getting eaten. It get eaten twice, and then dies. no matter where it is.
        for(int i=0; i<gameObjects.size(); ++i){
          for(int j=i+1; j<gameObjects.size(); ++j){
            if(gameObjects.get(i).radius+gameObjects.get(j).radius<distance(gameObjects.get(i).x, 
                gameObjects.get(i).y, gameObjects.get(j).x, gameObjects.get(j).y)){
                  println(gameObjects);
              if(gameObjects.get(i).radius<gameObjects.get(j).radius){
                 gameObjects.get(j).eat(gameObjects.get(i));
                 println(j, "eating");
                 gameObjects.get(i).die=true;
              }else{
                gameObjects.get(i).eat(gameObjects.get(j));
                println(j, "eaten");
                gameObjects.get(j).die=true;
              }
            }
          }
        }
        
    }
  
    
    public void eat(Circle c){
        this.radius+=c.radius;
    }
    
    /* Draw self on the canvas. */
    public void display() {
        fill(this.fillColor);
        stroke(0, 0, 0); // makes a black outline
        ellipse(this.x, this.y, this.radius*2, this.radius*2);
    }
}