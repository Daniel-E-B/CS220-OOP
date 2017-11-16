import processing.core.*;

class GameObject extends PApplet{
    float x;
    float y;
    int fillColor;//even though this gets set to a color, it is an int for now... yay processing in intellij!
    float radius;
    float speed=0;
    boolean die=false;
    Eatable eatCheck = new Eatable();

    /*
      Create a new circle at the given x,y point with a
      random speed, color, and size.'''
     */
    public GameObject (float x, float y) {

        this.x = x;
        this.y = y;
        // this creates a random color. We draw it with an
        // outline, so we'll be able to see it on a white
        // background regardless
        this.fillColor = color(random(0,255),
                random(0,255),
                random(0,255));

    }

    //distance formula
    float distance(float x1, float y1, float x2, float y2){
        return sqrt((pow((x1-x2),2)+pow((y1-y2),2)));
    }


    /* Draw self on the canvas. */
    public void display() {
        fill(this.fillColor);
        ellipse(this.x, this.y, this.radius*2, this.radius*2);
    }
}