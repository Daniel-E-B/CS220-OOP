
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
        this.gameManager=new LifeEngine(this, 100.0f);
        frameRate(15);
        //gameManager.addGlider(5,5);
        this.gameManager.populateRandom();
    }

    @Override
    public void draw() {
        background(255);
        this.gameManager.drawBoard();
        this.gameManager.updateBoard();
        //try{TimeUnit.MILLISECONDS.sleep(2000);}catch(java.lang.InterruptedException e){}
    }

    public void mousePressed(){
        if(this.gameManager.pause){
            this.gameManager.drawInput();
        }
    }
    public void keyPressed(){
        if (key==' '&&!this.gameManager.pause){
            this.gameManager.pause=true;
        }else if(key==' '&&gameManager.pause){
            this.gameManager.pause=false;
        }else if(key=='c'){
            gameManager.killAll();
        }else if(key=='r'){
            gameManager.populateRandom();
        }
    }
}
