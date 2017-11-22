import processing.core.*;

public class Prey extends Creature {

    Prey(PApplet parent){
        super(parent);
        this.SIZE=this.p.height/30;
        this.SPEED=9;
    }

   // @Override
    public void display(){
        this.p.ellipse(this.x,this.y,this.SIZE,this.SIZE);
    }
}
