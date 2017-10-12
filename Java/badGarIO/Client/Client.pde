import processing.net.*;
ArrayList<Food> Foods = new ArrayList<Food>();//this doesn't control food, but needs to draw it
ArrayList<rPlayer> rPlayers = new ArrayList<rPlayer>();
Player localPlayer;
Client pClient;
//playerID, size, x, y, r, g, b, alive
String input;


void addPlayer(int x, int y) {
    localPlayer=(new Player(x, y));
}

void setup() {
  size(1024, 768);
  localPlayer=(new Player(random(0,width), random(0,height)));
  frameRate(60);
  noStroke();
  textMode(CENTER);
  textAlign(CENTER);
  pClient=new Client(this, "10.1.129.171",24274);//this should not be an error!
}

void draw() {
    background(255, 255, 255);
    if (pClient.available() > 0) { 
  } 
}