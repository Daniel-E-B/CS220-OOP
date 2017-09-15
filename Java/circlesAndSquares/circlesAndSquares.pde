ArrayList<RegularShape> gameObjects = new ArrayList<RegularShape>();

/* Add a new shape at x, y. */
void addShape(float x, float y) {
    if (random(0, 1) > 0.5) {
        gameObjects.add(new Circle(x, y));
    } else {
        gameObjects.add(new Square(x, y));
    }
}

/* Clear all game objects. */
void reset() {
    gameObjects = new ArrayList<RegularShape>();
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

    for (RegularShape gameObject : gameObjects) {
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
    addShape(mouseX, mouseY);
}