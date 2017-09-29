import java.util.Iterator;
//the next thing to do is agar.io ify it and add food pellets and make the circle follow the mouse
//fragment into a parent class of gameObject, and children of food and player
class Player extends GameObject{
    /*
      Create a new circle at the given x,y point with a
      random speed, color, and size.'''
     */
     int framesPassed=0;//used to subtract health;
    public Player (float x, float y) {
        super(x, y);   
        //this.angle=radians(random(0, 359));//0 is straight down, 90 is straight right                       
        this.radius = height/25;//yay for arbitrary numbers. Radius=health
        this.speed=this.radius/12;
    }
      

    void moveToMouse(){//returns angle to go towards the mouse
      float relativeMouseY=mouseY-this.y;
      float relativeMouseX=mouseX-this.x;
      if(abs(relativeMouseX)>this.radius/10){//dont move it if the mouse is over the center of the player
        float dist = distance(this.x, this.y, mouseX, mouseY);
        float px = dist/speed;
        this.y+=relativeMouseY/px;
        this.x+=relativeMouseX/px;
      }
    }
    void loseHealth(int interval){//how often to lose health
      if(framesPassed>=interval){
        this.radius*=0.98;//slowly kill player
        framesPassed=0;
      }
    }
    
    public void update(ArrayList<Player> playerObjects, ArrayList<Food> foodObjects) {
        //move the shapes
          moveToMouse();
          this.speed=radius/6;
          this.collision.collide(this);//check for collisions with wall and bounce
          this.radius+=eatCheck.eatPlayer(this, playerObjects)/PI;//dumb way of growing
          this.radius+=eatCheck.eatFood(this,  foodObjects)/PI; 
          ++framesPassed;
          loseHealth(60);
    }

}