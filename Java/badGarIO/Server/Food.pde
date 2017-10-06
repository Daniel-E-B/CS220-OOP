import java.util.Iterator;
//ad pokey foods
class Food extends GameObject{
    
    /*
      Create a new circle at the given x,y point with a
      random speed, color, and size.'''
     */
    public Food (float x, float y, float radius) {
        super(int(x), int(y));        
        this.radius=radius;
        //this.radius = random(height/100);//yay for arbitrary numbers
    }
   
}