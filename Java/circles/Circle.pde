class Circle {
    float x;
    float y;
    color fillColor;
    float radius;
    float speed=0;
    float angle=0;
    
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

    /* Update current location by speed. */
    public void update() {
        //move the shapes
        this.x += speed*sin(this.angle);
        this.y += speed*cos(this.angle);
        
        //check for collisions with borders
        if(this.x<this.radius||this.x>width-this.radius||this.y<this.radius||this.y>height-this.radius){
          this.angle+=(180);
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