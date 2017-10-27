class Collidable {
    boolean noBounce=false;
    Collidable(boolean _noBounce){
      this.noBounce=_noBounce;
    }
          //check for collisions with wallBuffer for no spazzing
    void collide(Player c){
        if(c.x<c.radius||c.x>width-c.radius||c.y<c.radius||c.y>height-c.radius){
          if(!noBounce){
            c.speed*=-1;
          }
          else{//let it keep moving on one axis when colliding with a border on the other
            if(c.x<c.radius||c.x>width-c.radius)//fix this later. Move shape along border to see the problem
              c.xSpeed=0;
             if(c.y<c.radius||c.y>height-c.radius)
               c.ySpeed=0;
          }
        }
    }
}