import java.io.Serializable;
import java.util.Random;
import java.util.Iterator;
//add pokey foods
class Food implements Serializable{//cant extend gameobject, bc serializable
    float alive=1;
    float radius;
    float x, y;
    float r,g,b;
    boolean die=false;

    private static final long serialVersionUID=363245L;
    /*
      Create a new circle at the given x,y point with a
      random speed, color, and size.'''
     */
    public Food (float x, float y, float radius) {

        this.x = x;
        this.y = y;

        Random rand = new Random();
        this.r=rand.nextInt(255)+0;//random between 0 and 255
        this.g=rand.nextInt(255)+0;
        this.b=rand.nextInt(255)+0;

        this.radius=radius;
        //this.radius = random(height/100);//yay for arbitrary numbers
    }
    public void display() {
        //I need to display this not from inside this class, bc I cant inherit from gameobject/papplet
    }

}