//TODO: Add collision code to the server
import java.io.*;
import java.net.*;

ServerSocket serverSocket=null;
Socket socket = null;
ObjectInputStream inStream=null;

ArrayList<Food> foods = new ArrayList<Food>();
ArrayList<rPlayer> rPlayers = new ArrayList<rPlayer>();//r stand for remote
int foodInterval=120;//every 120 frames, add a food;

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
  frameRate(5);
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
    //read in players
    //TODO:
    /*
    since players handle eating food, make them transmit any food they ate?
    maybe in a separate object, and if we can read in that object, then delete the food[i] that they ate? idk...
    */
    try{
      serverSocket=new ServerSocket(24342);
      serverSocket.accept();
      inStream=new ObjectInputStream(socket.getInputStream());
      rPlayer inPlayer = (rPlayer)inStream.readObject();//what is this syntax??
      boolean flag=false;
      for(rPlayer p : rPlayers){
        if(p.playerID==inPlayer.playerID){
          flag=true;
        }
      }
      if(flag==false){//if the incoming player is new; TODO: make a way to delete players that are inactive/left
        rPlayers.add(inPlayer);
      }
      socket.close();
    }catch(IOException e){println( e);}
    catch(ClassNotFoundException cnf){println( cnf);}
    catch(NullPointerException e){println( e);}
    finally{try{socket.close();}catch(Exception y){println(y);}}
    
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
    //send out players
    try{
      ObjectOutputStream pOut=new ObjectOutputStream(socket.getOutputStream());
      for(rPlayer outPlayer : rPlayers){
        pOut.writeObject(outPlayer);
      }
      flush();
    }catch(IOException e){println( e);}
     catch(NullPointerException e){println( e);}
    //send out foods
    try{
      ObjectOutputStream fOut=new ObjectOutputStream(socket.getOutputStream());
      fOut.writeObject(foods);
      flush();
    }catch(IOException e){println( e);}
     catch(NullPointerException e){println( e);}
}

/* Processing will call this when a key is pressed. */
void keyPressed() {
    if (key == 'r') {
        reset();
    }
}