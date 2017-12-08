import processing.core.*;

public class Predator extends Creature{


    Predator(PApplet parent){
        super(parent);
        this.SIZE=this.p.height/25;
        this.SPEED=1;//TODO: make their speed have to do with how healthy they are
        this.health=100;
    }


}