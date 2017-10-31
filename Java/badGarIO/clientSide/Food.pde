
import java.util.Iterator;
//add pokey foods
class Food extends GameObject{
    

    public Food (float x, float y, float r) {
        super(x, y);         
        this.radius=r;
        this.fillColor=color(127,127,127);
        //this.radius = random(height/100);//yay for arbitrary numbers
    }
   
}