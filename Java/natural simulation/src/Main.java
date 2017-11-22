
import processing.core.*;

public class Main extends PApplet {

    public static void main(String args[]) {
        PApplet.main("Main");
    }

    Prey prey;

    @Override
    public void settings(){
        this.size(1000,700);
    }

    @Override
    public void setup() {
        // TODO: Your custom drawing and setup on applet start belongs here
        prey=new Prey(this);
        frameRate(60);
    }
    public void draw() {
        // TODO: Do your drawing for each frame here
        background(255,255,255);
        prey.update();
        prey.display();
    }
}
