import processing.net.*;
ArrayList<Food> Foods = new ArrayList<Food>();
ArrayList<rPlayer> rPlayers = new ArrayList<rPlayer>();//r stand for remote
int foodInterval=120;//every 120 frames, add a food;
Server gameServer;
Client c;
float data[];//playerID, size, x, y, r, g, b, alive/dead
String input;
//The local player is always in index 0

void initFood(int numFoods){
  for(int i=0; i<numFoods; ++i){
    Foods.add(new Food(random(0,width),random(0,height)));
  }
}

void addFood(){
  if(foodInterval>=120){
    Foods.add(new Food(random(0, width), random(0, height)));
    foodInterval=0;
  }
}

/* Clear all game objects. */
void reset() {
    rPlayers = new ArrayList<rPlayer>();
    Foods = new ArrayList<Food>();
    initFood(height/25);
}

/* 
  Processing will automatically call this once when the
  program first starts running.
*/
void setup() {
  size(1024, 768);
  gameServer = new Server(this, 24274);
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
    
    c=gameServer.available();
    if(c!=null){
      //receive player from client
      input = c.readString();//stick this all in a class
      input = input.substring(0, input.indexOf("\n"));//stop reading at newline
      data = float(split(input, ' '));  // Split values into an array
      //check that it is a full packet
      try{ float temp = data[7]; } catch(ArrayIndexOutOfBoundsException e){
      println("array index out of bounds, dropped packet", e);
      }/*bad form. If I change the size of data, I need to change this.
      if the player is already in the arraylist, update them. */
      boolean inSystem=false;
      for(int i=0; i<rPlayers.size(); ++i){
        if(rPlayers.get(i).playerID==data[0]){
          rPlayers.get(i)=new rPlayer(data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7]);
          inSystem=true;
        }
    }if(inSystem==false){//if the plater is not in the system, add them
      rPlayers.add(new rPlayer(data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7]));
      inSystem=true;
    }
     /*
     check if people ate each other
     update food array
     transmit food array
     transmit players to other players
     */
            Iterator<Food> foodTick=Foods.iterator();
            while(foodTick.hasNext()){
            Food fElement = foodTick.next();
            fElement.display();
              if(fElement.die){
                foodTick.remove();
              }
            }
          
         
     addFood();
    }
  ++foodInterval;
}

/* Processing will call this when a key is pressed. */
void keyPressed() {
    if (key == 'r') {
        reset();
    }
}