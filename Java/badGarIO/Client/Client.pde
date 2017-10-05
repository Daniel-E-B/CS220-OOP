import processing.net.*;
ArrayList<Food> Foods = new ArrayList<Food>();
//ArrayList<Player> Players = new ArrayList<Player>();
ArrayList<RemotePlayer> remotePlayers = new ArrayList<RemotePlayer>();
Player localPlayer = new Player(0,0);
int foodInterval=120;//every 120 frames, add a food;
Server s=new Server(this, 24274);
Client c;
float data[];//playerID, size, x, y, r, g, b
String input;
//The local player is always in index 0

void initFood(int numFoods){
  for(int i=0; i<numFoods; ++i){
    Foods.add(new Food(random(0,width),random(0,height)));
  }
}

/* Add a new circle at x, y. */
void addPlayer(int x, int y) {
    Players.add(new Player(x, y));
}

void addFood(){
  if(foodInterval>=120){
    Foods.add(new Food(random(0, width), random(0, height)));
    foodInterval=0;
  }
}

/* Clear all game objects. */
void reset() {
    Players = new ArrayList<Player>();
    Players.add(new Player(width/2, height/2));
    Foods = new ArrayList<Food>();
    initFood(height/25);

}

/* 
  Processing will automatically call this once when the
  program first starts running.
*/
void setup() {
  size(1024, 768);
  Players.add(new Player(width/2, height/2));
  frameRate(60);
  initFood(height/25);
  noStroke();
  textMode(CENTER);
  textAlign(CENTER);
}

/* 
   Redraw the background, have all game objects update
   and redraw. Processing will automatically call this
   method at a set refresh rate.
*/
void draw() {
    background(255, 255, 255);
    

    
    Iterator<Player> gameTick=Players.iterator();//go through players
        while(gameTick.hasNext()){
          Player element=gameTick.next();
          //kill dead circles
          if(element.die){
            gameTick.remove();
          }
          element.update(Players, Foods);
          element.display();
          
          if(element==Players.get(0)){//dont do this for other players
            Iterator<Food> foodTick=Foods.iterator();
            while(foodTick.hasNext()){
            Food fElement = foodTick.next();
            fElement.display();
              if(fElement.die){
                foodTick.remove();
              }
            }
          }
        }   
   addFood();
  ++foodInterval;
}

/* Processing will call this when a key is pressed. */
void keyPressed() {
    if (key == 'r') {
        reset();
    }
}