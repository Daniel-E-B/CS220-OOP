import java.util.Iterator;
//the next thing to do is agar.io ify it and add food pellets and make the circle follow the mouse
class Player extends GameObject{
     float xSpeed;
     float ySpeed;
     int framesPassed=0;//used to subtract health;
     float playerID;
    public Player (float x, float y) {
        super(x, y);
        this.radius = height/25;//yay for arbitrary numbers. Radius=health
        this.speed=height/200;
        this.playerID=random(0, 10000);
    }
      

    void moveToMouse(){
      float relativeMouseY=mouseY-this.y;
      float relativeMouseX=mouseX-this.x;
      if(abs(relativeMouseX)>this.radius/10&&abs(relativeMouseY)>this.radius/10){//dont move it if the mouse is over the center of the player
        float dist = distance(this.x, this.y, mouseX, mouseY);
        float px = dist/speed;
        this.ySpeed=relativeMouseY/px;
        this.xSpeed=relativeMouseX/px;
        this.x+=xSpeed;
        this.y+=ySpeed;//these are for only moving using one speed when on a border
      }
    }
    void loseHealth(int interval){//how often to lose health
      if(framesPassed>=interval){
        this.radius*=0.98;//slowly kill player
        framesPassed=0;
      }
    }
    
    void display(){
      super.display();
      textSize(radius/2);
      fill(0);
      text(int(radius), this.x, this.y);
    }
    
    public void update(ArrayList<Player> playerObjects, ArrayList<Food> foodObjects) {
        //move the shapes
          moveToMouse();
          this.collision.collide(this);//check for collisions with wall
          ++framesPassed;
          loseHealth(60);
    }

}