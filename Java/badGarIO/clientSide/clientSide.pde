import processing.net.*;
import java.util.Scanner;
ArrayList<Food> foods = new ArrayList<Food>();//this doesn't control food, but needs to draw it
ArrayList<rPlayer> rPlayers = new ArrayList<rPlayer>();
Player localPlayer;
Client c;
Scanner s;
int numPlayers,numFoods;
//playerID, size, x, y, r, g, b, alive
String input;
String data[];
String fData[]; 
String pData[];

void setup() {
  size(1024, 768);
  localPlayer=(new Player(random(0,width), random(0,height)));
  frameRate(60);
  noStroke();
  c = new Client(this, "10.1.130.19", 24342);
  textAlign(CENTER);
}

void draw() {
    background(255, 255, 255);
    if (c.available() > 0) { 
      //send the local player to the server
      c.write(localPlayer.playerID+" "+localPlayer.radius+" "+
                    localPlayer.x+" "+localPlayer.y+" "+localPlayer.r+" "+
                    localPlayer.g+" "+localPlayer.b+" "+localPlayer.alive);
      //read in data from server
      input=c.readString();
      data=(split(input, ";"));//split values into player stuff and food stuff
      try{
        fData=split(data[0], " ");
      }catch (ArrayIndexOutOfBoundsException e){
        println("Couldn't split food",e);
      }
      try{
        pData=split(data[1], " ");
        println(pData.length);
      }catch (ArrayIndexOutOfBoundsException e){
        println("Couldn't split players",e);
      }
       //s = new Scanner(input).useDelimiter(",");//delimiter separates by ,
      //receive the food from the server
     try{
      if(fData[0]=="FOOD"){
        numFoods=fData.length;//may or may not work
      println(fData.length);
        try{
          for(int i=2;i<numFoods;++i){
          s=new Scanner(fData[i]).useDelimiter(",");
          //first and 0th index used by other stuff. Start at 2nd index
          //Each string has x,y,alive terminated by a space
           foods.clear();
           foods.add(new Food(s.nextFloat(), s.nextFloat(), s.nextFloat()));
          }
        }
        catch(NullPointerException e){
          println("Dropped packet FOOD");
        }
      }
     }catch(ArrayIndexOutOfBoundsException e){
       println("Couldn't get fData",e);
     }
      //receive the players from the server
     try{
      if(pData[0]=="PLAYERS"){
        numPlayers=pData.length;//may or may not be good
        try{
          for(int i=0; i<numPlayers; ++i){
          s=new Scanner(pData[i]).useDelimiter(",");
          //first and 0th index used by other stuff. Start at 2nd index
          //Each string has x,y,alive terminated by a space
           rPlayers.clear();
           rPlayers.add(new rPlayer(s.nextFloat(), s.nextFloat(), s.nextFloat(), s.nextFloat()
                        , s.nextFloat(), s.nextFloat(), s.nextFloat(), s.nextFloat()));            
          }
         }
        catch(ArrayIndexOutOfBoundsException e){
          println("Dropped packet PLAYERS");
        }
      }
     }catch(NullPointerException e){
       println("Could not get pData",e);
     }
  }
  //display everything
  for(int i=0; i<foods.size(); ++i){
    //foods is empty!!
    foods.get(i).display();
  }
  //update local player
}

void addPlayer(int x, int y) {
    localPlayer=(new Player(x, y));
}