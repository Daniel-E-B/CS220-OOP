/*
stuff to do to clean up this poor code:
Create a parent class for FallingFeather, FlittingBird and SoaringBird
composition is not really needed, interfaces are
make an interface that requires display() and move()
make a gameObjects ArrayList and fill it with the required number of objects
Iterate through it to create, move and display
*/
ArrayList<Creature> creatures = new ArrayList<Creature>();
void setup() {
  noStroke();
  size(600, 400);
  
  for(int i=0; i<5; ++i){
    creatures.add(new SoaringBird());
    creatures.add(new FlittingBird());
    creatures.add(new FallingFeather());
    creatures.add(new FallingFeather());
  }
}

void draw() {
  background(173,216,230);
  for(int i=0; i<creatures.size(); ++i){
    creatures.get(i).move();
    creatures.get(i).display();
  }
}