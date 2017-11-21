
import processing.core.*;

public class Main extends PApplet {

    public static void main(String args[]) {
        PApplet.main("Main");
    }

    @Override
    public void settings(){
        this.size(150,150);
    }

    @Override
    public void setup() {
        // TODO: Your custom drawing and setup on applet start belongs here
        frameRate(60);
        noStroke();
    }
    public void draw() {
        // TODO: Do your drawing for each frame here
        background(255,255,255);

    }
}
