import processing.core.*;

public class Prey extends Creature {

    Prey(PApplet parent){
        super(parent);
        this.SIZE=this.p.height/30;
        this.SPEED=5;
    }

    @Override
    protected void updateHealthColor() {
        this.healthColor = this.p.color(0, 0, 255);
        this.p.fill(healthColor);
    }
}
