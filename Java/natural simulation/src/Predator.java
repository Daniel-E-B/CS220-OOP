import processing.core.*;

public class Predator extends Creature{


    Predator(PApplet parent){
        super(parent);
        this.SIZE=this.p.height/25;
        this.SPEED=6;
        this.health=100;
    }


}