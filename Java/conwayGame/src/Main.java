import processing.core.*;

import java.util.ArrayList;

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
        this.gameManager = new LifeEngine(this, 100.0f);
        this.frameRate(30);
        this.gameManager.populateRandom();
    }

    @Override
    public void draw() {
        background(255);
        this.gameManager.drawBoard();
        this.gameManager.updateBoard();
    }

    public void mousePressed() {
        if (this.gameManager.pause) {
            if (mouseButton == LEFT) {
                this.gameManager.drawInput();
            } else if (mouseButton == RIGHT) {
                this.gameManager.deleteInput();
            }
        }
    }

    public void keyPressed() {
        if (key == ' ' && !this.gameManager.pause) {
            this.gameManager.pause = true;
        } else if (key == ' ' && gameManager.pause) {
            this.gameManager.pause = false;
        } else if (key == 'c') {
            this.gameManager.killAll();
        } else if (key == 'r') {
            this.gameManager.populateRandom();
        }
    }
}
