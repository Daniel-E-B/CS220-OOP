
import processing.core.*;

public class Main extends PApplet {

    public static void main(String args[]) {
        PApplet.main("Main");
    }

    @Override
    public void settings() {
        size(200, 200);
    }

    @Override
    public void setup() {
    }

    @Override
    public void draw() {
        clear();
        fill(255);
        rect(50, 50, 100, 100);
    }
}
