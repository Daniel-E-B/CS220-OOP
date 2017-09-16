ArrayList<Circle> gameObjects = new ArrayList<Circle>();

/* Add a new circle at x, y. */
void addCircle(int x, int y) {
    gameObjects.add(new Circle(x, y));
}

/* Clear all game objects. */
void reset() {
    gameObjects = new ArrayList<Circle>();
}

float distance(float x1, float y1, float x2, float y2){
  return sqrt((pow((x1-x2),2)+pow((y1-y2),2)));
}

void collisionChecks(){
    for(int i=0; i<gameObjects.size(); ++i){
      for(int j=0; j<gameObjects.size(); ++j){
        if(gameObjects.get(i).radius+gameObjects.get(j).radius<=distance(gameObjects.get(i).x, 
            gameObjects.get(i).y, gameObjects.get(j).x, gameObjects.get(j).y)){
          if(gameObjects.get(i).radius<gameObjects.get(j).radius){
             gameObjects.get(j).eat(gameObjects.get(i));
          }else{
            gameObjects.get(i).eat(gameObjects.get(j));
          }
        }
      }
    }
}

/* 
  Processing will automatically call this once when the
  program first starts running.
*/
void setup() {
  size(1024, 768);
}

/* 
   Redraw the background, have all game objects update
   and redraw. Processing will automatically call this
   method at a set refresh rate.
*/
void draw() {
    background(255, 255, 255);
    
    for (Circle gameObject : gameObjects) {
        gameObject.update();
        gameObject.display();
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