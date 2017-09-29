ArrayList<Food> Foods = new ArrayList<Food>();
ArrayList<Player> Players = new ArrayList<Player>();
//The local player is always in index 0

/* Add a new circle at x, y. */
void addPlayer(int x, int y) {
    Players.add(new Player(x, y));
}

/* Clear all game objects. */
void reset() {
    Players = new ArrayList<Player>();
    Players.add(new Player(width/2, height/2));
    Foods = new ArrayList<Food>();
    //for loop of array.add with random x's and y's
}

/* 
  Processing will automatically call this once when the
  program first starts running.
*/
void setup() {
  size(400, 400);
  Players.add(new Player(width/2, height/2));
  frameRate(30);
}

/* 
   Redraw the background, have all game objects update
   and redraw. Processing will automatically call this
   method at a set refresh rate.
*/
void draw() {
    background(255, 255, 255);
    
    Iterator<Player> gameTick=Players.iterator();//go through other players
        while(gameTick.hasNext()){
          Player element=gameTick.next();
          //kill dead circles
          if(element.die){
            gameTick.remove();
          }
          element.update(Players);
          element.display();
        }
    
}

/* Processing will call this when a key is pressed. */
void keyPressed() {
    if (key == 'r') {
        reset();
    }
}

/* Processing will call this when the mouse is clicked */
/*void mouseClicked() {
    addCircle(mouseX, mouseY);
}*/