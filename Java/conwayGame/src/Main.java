
import processing.core.*;

public class Main extends PApplet {

    public static void main(String args[]) {
        PApplet.main("Main");
    }

    private LifeEngine gameManager;

    @Override
    public void settings() {
        size(1280, 700);
    }

    @Override
    public void setup() {
        gameManager=new LifeEngine(this, 200.f);
        frameRate(1);
    }

    @Override
    public void draw() {
        background(255);
        gameManager.drawBoard();
        gameManager.updateBoard();
    }
}
