import java.util.Iterator;
//the next thing to do is agar.io ify it and add food pellets and make the circle follow the mouse
//fragment into a parent class of gameObject, and children of food and player
class Food extends GameObject{
    
    /*
      Create a new circle at the given x,y point with a
      random speed, color, and size.'''
     */
    public Food (float x, float y) {
        super(x, y); 
                               
        this.radius = random(height/100);//yay for arbitrary numbers
    }
    
    /* Draw self on the canvas. */
    public void display() {
        fill(this.fillColor);
        stroke(0, 0, 0); // makes a black outline
        ellipse(this.x, this.y, this.radius*2, this.radius*2);
    }
}