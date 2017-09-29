class Collidable {
    boolean noBounce=false;
    Collidable(boolean _noBounce){
      this.noBounce=_noBounce;
    }
          //check for collisions with wallBuffer for no spazzing
    void collide(Player c){
        if(c.x<c.radius||c.x>width-c.radius||c.y<c.radius||c.y>height-c.radius){
          if(!noBounce){
            c.angle+=(180);
            c.speed*=-1;
          }else{
            c.speed=0;//find some way to 
          }
          //make a spazz detector that makes a big circle split into smaller ones
        }
    }
}