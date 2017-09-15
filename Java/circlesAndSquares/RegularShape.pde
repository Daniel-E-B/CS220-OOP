public class RegularShape {
    float x;
    float y;
    float xSpeed;
    float ySpeed;
    color fillColor;
    float diameter;
    
    /*
       Create a new circle at the given x,y point with a
       random speed, color, and size.
     */
    public RegularShape (float x, float y) {    
        this.x = x;
        this.y = y;
        this.xSpeed = random(-5,5);
        this.ySpeed = random(-5,5);
        // this creates a random color. We draw it with an
        // outline, so we'll be able to see it on a white
        // background regardless
        this.fillColor = color(random(0,255),
                               random(0,255),
                               random(0,255));
        this.diameter = random(5,75);
    }

    /* Update current location by speed. */
    public void update() {
        this.x += this.xSpeed;
        this.y += this.ySpeed;
    }

    /* don't do anything, by default */
    public void display() {
    }
}