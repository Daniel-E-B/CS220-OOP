import processing.net.*;
import java.util.Scanner;
ArrayList<Food> Foods = new ArrayList<Food>();//this doesn't control food, but needs to draw it
ArrayList<rPlayer> rPlayers = new ArrayList<rPlayer>();
Player localPlayer;
Client c;
Scanner s;
int numPlayers,numFoods;
//playerID, size, x, y, r, g, b, alive
String input;
String data[];

void setup() {
  size(1024, 768);
  localPlayer=(new Player(random(0,width), random(0,height)));
  frameRate(60);
  noStroke();
  c = new Client(this, "10.1.130.189", 24342);//this should not be an error!
  textMode(CENTER);
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
    //  try{input=input.substring(0,input.indexOf("\n"));}//only read up to newline}
     // catch(StringIndexOutOfBoundsException e){println("Dropped input");}
      data=(split(input, ' '));//split values into array
      
       //s = new Scanner(input).useDelimiter(",");//delimiter separates by ,
      //receive the food from the server
      if(data[0]=="FOOD"){
        numFoods=data.length;//may or may not be good
        try{
          for(int i=2;i<numFoods;++i){
          s=new Scanner(data[i]).useDelimiter(",");
          //first and 0th index used by other stuff. Start at 2nd index
          //Each string has x,y,alive terminated by a space
           Foods.clear();
           Foods.add(new Food(s.nextFloat(), s.nextFloat(), s.nextFloat()));
           println(Foods.size());
          }
        }
        catch(ArrayIndexOutOfBoundsException e){
          println("Dropped packet FOOD");
        }
      }
      //receive the players from the server
      else if(data[0]=="PLAYERS"){
        numPlayers=data.length;//may or may not be good
        try{
          for(int i=0; i<numPlayers; ++i){
          s=new Scanner(data[i]).useDelimiter(",");
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
  } 
  println(Foods.size());
  //display everything
  for(int i=0; i<Foods.size(); ++i){
    Foods.get(i).display();
  }
  //update local player
}

void addPlayer(int x, int y) {
    localPlayer=(new Player(x, y));
    localPlayer.playerID=random(0,100000);
}