import java.util.Iterator;
//the next thing to do is agar.io ify it and add food pellets and make the circle follow the mouse
//fragment into a parent class of gameObject, and children of food and player
class Player extends GameObject{
    
    /*
      Create a new circle at the given x,y point with a
      random speed, color, and size.'''
     */
    public Player (float x, float y) {
        super(x, y);   
        //this.angle=radians(random(0, 359));//0 is straight down, 90 is straight right                       
        this.radius = height/25;//yay for arbitrary numbers
        this.speed=this.radius/12;
    }
      

    void moveToMouse(){//returns angle to go towards the mouse
      float relativeMouseY=mouseY-this.y;
      float relativeMouseX=mouseX-this.x;
      //float slope=(this.y-mouseY)/this.x-mouseX;
      if(relativeMouseX>0)
        this.x+=speed;
      else
        this.x-=speed;
      if(relativeMouseY>0)
        this.y+=speed;
      else
        this.y-=speed;
    }
      

    public void update(ArrayList<Player> gameObjects) {
        //move the shapes
          moveToMouse();
          //this.x += this.speed*sin(this.angle);
          //this.y += this.speed*cos(this.angle);
          this.speed=radius/6;
          this.collision.collide(this);//check for collisions with wall and bounce
          this.radius+=eatCheck.eat(this, gameObjects);//dumb way of growing
    }
  
    

    
    /* Draw self on the canvas. */
    public void display() {
        fill(this.fillColor);
        stroke(0, 0, 0); // makes a black outline
        ellipse(this.x, this.y, this.radius*2, this.radius*2);
    }
}