import processing.net.*;
ArrayList<Food> Foods = new ArrayList<Food>();//this doesn't control food, but needs to draw it
ArrayList<rPlayer> rPlayers = new ArrayList<rPlayer>();
Player localPlayer = new Player(0,0);
Server s=new Server(this, 24274);
Client c;
float data[];//playerID, size, x, y, r, g, b, alive
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
}

void draw() {
    background(255, 255, 255);

}