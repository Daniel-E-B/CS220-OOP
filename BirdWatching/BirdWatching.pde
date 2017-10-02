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