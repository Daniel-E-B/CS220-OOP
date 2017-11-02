//TODO: Add collision code to the server

import processing.net.*;
ArrayList<Food> foods = new ArrayList<Food>();
ArrayList<rPlayer> rPlayers = new ArrayList<rPlayer>();//r stand for remote
int foodInterval=120;//every 120 frames, add a food;
Server gameServer;
Client c;
float data[];//playerID, size, x, y, r, g, b, alive/dead
String input;
String foodOutput="";
String playerOutput="";
//The local player is always in index 0

void initFood(int numfoods){
  for(int i=0; i<numfoods; ++i){
    foods.add(new Food(random(0,width),random(0,height), random(height/100)));
  }
}

void addFood(){
  if(foodInterval>=120){
    foods.add(new Food(random(0, width), random(0, height), random(height/100)));
    foodInterval=0;
  }
}

/* Clear all game objects. */
void reset() {
    rPlayers = new ArrayList<rPlayer>();
    foods = new ArrayList<Food>();
    initFood(height/25);
}

/* 
  Processing will automatically call this once when the
  program first starts running.
*/
void setup() {
  size(1024, 768);
  gameServer = new Server(this, 24342);
  frameRate(60);
  initFood(height/25);
  noStroke();
  textMode(CENTER);
  textAlign(CENTER);
  initFood(500);
}

/* 
   Redraw the background, have all game objects update
   and redraw. Processing will automatically call this
   method at a set refresh rate.
*/
void draw() {
    background(255, 255, 255);
    
     for(int i=0; i<rPlayers.size();++i){
       //check if players ate each other
       for(int p=i+1; p<rPlayers.size(); ++p){
         //eat people
         rPlayers.get(i).r+=rPlayers.get(i).eatPlayer(rPlayers.get(i),rPlayers)/PI;
       }
       //check if players ate food
       for(int f=0; f<foods.size(); ++f){
        //eat food
        rPlayers.get(i).r+=rPlayers.get(i).eatFood(rPlayers.get(i),foods)/PI;
       }
    }
     //update food array
     Iterator<Food> fIterator=foods.iterator();
     while(fIterator.hasNext()){
       Food element=fIterator.next();
       
       if(element.alive==0){
         fIterator.remove();
       }
     }
     addFood();
     //update player array
     //ON THE CLIENT SIDE, CHECK IF THE PLAYER IS DEAD, AND IF IT IS, DISCONNECT
     Iterator<rPlayer> pIterator=rPlayers.iterator();
     while(pIterator.hasNext()){
       rPlayer element=pIterator.next();
       
       if(element.alive==0){
         pIterator.remove();
       }
     }
    
    c=gameServer.available();
    if(c!=null){
      //receive player from client
      input = c.readString();//stick this all in a class    
      data = float(split(input, ' '));  // Split values into an array
      //the data array is twice as long as its supposed to be!! (0-14 indexes)
      //check that it is a full packet
      try{ float temp = data[7]; } catch(ArrayIndexOutOfBoundsException e){
        println("array index out of bounds, dropped packet", e);
      }/*bad form. If I change the size of data, I need to change this.
      if the player is already in the arraylist, update them. */
      boolean inSystem=false;
      for(int i=0; i<rPlayers.size(); ++i){
        if(rPlayers.get(i).playerID==data[0]){
          rPlayers.set(i, new rPlayer(data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7]));
          inSystem=true;
        }
    }
    if(inSystem==false){//if the plater is not in the system, add them
      try{
        rPlayers.add(new rPlayer(data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7]));
      }catch(ArrayIndexOutOfBoundsException e){println("Couldn't create rPlayer instance",e);}
      inSystem=true;
    }
   }
  ++foodInterval;
  //write the food array out to the clients
  //parse the food array into a string
  //for every food, the constructor only needs an x and a y
  foodOutput="";
  //the first part of the array should be FOOD
  foodOutput+="FOOD ";
  //send the number of foods (for dropped packet checking)
  foodOutput+=String.valueOf(foods.size());
  foodOutput+=" ";
  for(Food f : foods){
    foodOutput+=(f.x);
    foodOutput+=(",");//separate coordinates by ","
    foodOutput+=(f.y);
    foodOutput+=(",");
    foodOutput+=(f.alive);
    foodOutput+=(" ");//terminate with a " "
  }
  gameServer.write(foodOutput);
  gameServer.write(";");//separate the foodoutput and the player output
  //write the players out to the clients (including the client that is came from)
  //the clients should ignore the x and y that they get back from the server, but use all of the other stuff
  playerOutput="";
  //the first part of the array should be PLAYERS
  playerOutput+="PLAYERS ";
  //send the number of players (for dropped packet checking)
  playerOutput+=String.valueOf(rPlayers.size());
  for(rPlayer p : rPlayers){
    //parse out and separate by "," for same player parameters
    //spearate by " " for separation between players
    playerOutput+=(p.playerID);
    println(p.playerID);
    playerOutput+=",";
    playerOutput+=(p.radius);
    playerOutput+=",";
    playerOutput+=(p.x);
    playerOutput+=",";
    playerOutput+=(p.y);
    playerOutput+=",";
    playerOutput+=(p.r);
    playerOutput+=",";
    playerOutput+=(p.g);
    playerOutput+=",";
    playerOutput+=(p.b);
    playerOutput+=",";
    playerOutput+=(p.alive);
    playerOutput+=" ";
  }
  gameServer.write(playerOutput);
}

/* Processing will call this when a key is pressed. */
void keyPressed() {
    if (key == 'r') {
        reset();
    }
}