
import java.util.Iterator;
//ad pokey foods
class Food extends GameObject{
    

    public Food (float x, float y) {
        super(x, y);                     
        this.radius = random(height/100);//yay for arbitrary numbers
    }
   
}