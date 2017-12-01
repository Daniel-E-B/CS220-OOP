
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
        manager=new HuntManager(5,10,this);
        frameRate(60);
    }
    public void draw() {
        background(255,255,255);
        manager.gameTick();
        manager.displayCreatures();
    }
}
