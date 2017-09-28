class Collidable {
          //check for collisions with wallBuffer for no spazzing
    void collide(Circle c){
        if(c.x<c.radius||c.x>width-c.radius||c.y<c.radius||c.y>height-c.radius){
          c.angle+=(180);
          c.speed*=-1;
          //make a spazz detector that makes a big circle split into smaller ones
        }
    }
}