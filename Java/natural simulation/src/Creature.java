import processing.core.PApplet;
import java.util.Random;
import java.lang.Math;

abstract class Creature {
    int health;// Starts at 100. Stays at 100 for food
    protected int healthColor;//really a color.
    float x,y;
    PApplet p;
    int SIZE;
    float SPEED;
    float angle;
    boolean dead;
    private Random rand = new Random();
    Creature(PApplet parent){
        this.p=parent;
        this.x= rand.nextInt(p.width)+0;
        this.y=rand.nextInt(p.height)+0;
        this.health = 100;
        this.dead=false;
        this.angle=this.rand.nextInt(360);
    }
    public void update(float direction){
        this.angle=direction;
        this.checkDead();
        this.move();
    }
    public void display(){
        this.updateHealthColor();
        this.p.ellipse(this.x,this.y,this.SIZE,this.SIZE);
    }

    private void checkDead(){
        if(this.health<=0){
            this.dead=true;
        }
    }
    protected void updateHealthColor(){
        this.healthColor=this.p.color(255-(float)(health*2.55), (float)(health*2.55),0);
        this.p.fill(healthColor);
    }

    private void move(){
        this.x += this.SPEED * Math.sin(this.angle);
        this.y += this.SPEED * Math.cos(this.angle);
        //wrap around edges:
        //if it goes off of top:
        if(this.y<0+this.SIZE/2){
            this.y=this.p.height-this.SIZE/2;
        }
        //if it goes off of bottom:
        else if(this.y>this.p.height-this.SIZE/2){
            this.y=0+this.SIZE/2;
        }
        //if it goes off to left:
        if(this.x<0+this.SIZE/2){
            this.x=this.p.width-this.SIZE/2;
        }
        //if it goes off to right:
        else if(this.x>this.p.width-this.SIZE/2){
            this.x=0+this.SIZE/2;
        }
    }
}
