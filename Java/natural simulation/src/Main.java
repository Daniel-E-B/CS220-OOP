
import processing.core.*;

public class Main extends PApplet {

    public static void main(String args[]) {
        PApplet.main("Main");
    }

    HuntManager manager;

    @Override
    public void settings(){
        this.size(1000,700);
    }

    @Override
    public void setup() {
        // TODO: Your custom drawing and setup on applet start belongs here
        manager=new HuntManager(2,10,this);
        //prey seems to work okayish
        //predators are borked beyond all reason. Half appear to track the x of preys, half appear to track y
        frameRate(60);
    }
    public void draw() {
        // TODO: Do your drawing for each frame here
        background(255,255,255);
        manager.gameTick();
        manager.displayCreatures();
    }
}
