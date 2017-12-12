
import processing.core.*;

import java.util.concurrent.TimeUnit;

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
        gameManager=new LifeEngine(this, 200.0f);
        frameRate(15);
        //gameManager.addGlider(5,5);
        gameManager.populateRandom();
    }

    @Override
    public void draw() {
        background(255);
        gameManager.drawBoard();
        gameManager.updateBoard();
        //try{TimeUnit.MILLISECONDS.sleep(2000);}catch(java.lang.InterruptedException e){}
    }
}
