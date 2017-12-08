
import processing.core.*;

public class Main extends PApplet {

    public static void main(String args[]) {
        PApplet.main("Main");
    }

    final int CELL_SIZE=5;
    private LifeEngine gameManager;

    @Override
    public void settings() {
        size(1280, 720);
    }

    @Override
    public void setup() {
        gameManager=new LifeEngine(this);
    }

    @Override
    public void draw() {
        background(255);
        gameManager.drawBoard();
    }
}
