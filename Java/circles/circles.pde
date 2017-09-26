ArrayList<Circle> gameObjects = new ArrayList<Circle>();

/* Add a new circle at x, y. */
void addCircle(int x, int y) {
    gameObjects.add(new Circle(x, y));
}

/* Clear all game objects. */
void reset() {
    gameObjects = new ArrayList<Circle>();
}



/* 
  Processing will automatically call this once when the
  program first starts running.
*/
void setup() {
  size(400, 400);
}

/* 
   Redraw the background, have all game objects update
   and redraw. Processing will automatically call this
   method at a set refresh rate.
*/
void draw() {
    background(255, 255, 255);
    
    
     Iterator<Circle> gameTick=gameObjects.iterator();
        while(gameTick.hasNext()){
          Circle element=gameTick.next();
          //kill dead circles
          if(element.die){
            gameTick.remove();
          }
          element.update(gameObjects);
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
void mouseClicked() {
    addCircle(mouseX, mouseY);
}