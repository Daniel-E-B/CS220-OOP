//All images from openclipart.org. October 2, 2017
ArrayList<BirdObject> birdObjects = new ArrayList<BirdObject>();

void setup() {
  noStroke();
  size(600, 400);
  
  for(int i=0; i<5; ++i){
    birdObjects.add(new SoaringBird());
    birdObjects.add(new FlittingBird());
    birdObjects.add(new FallingFeather());
    birdObjects.add(new FallingFeather());
  }
}

void draw() {
  background(173,216,230);
  
  for(BirdObject bird: birdObjects){
    bird.move();
    bird.display();
  }
}