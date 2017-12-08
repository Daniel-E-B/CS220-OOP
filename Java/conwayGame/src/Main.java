
import processing.core.*;

public class Main extends PApplet {

    public static void main(String args[]) {
        PApplet.main("Main");
    }

    final int CELL_SIZE=5;
    LifeEngine gameManager;

    @Override
    public void settings() {
        size(1280, 720);
    }

    @Override
    public void setup() {
        gameManager=new LifeEngine();
    }

    @Override
    public void draw() {
        clear();
        fill(255);
        rect(50, 50, 100, 100);
    }
}
