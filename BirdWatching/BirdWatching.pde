/*
stuff to do to clean up this poor code:
Create a parent class for FallingFeather, FlittingBird and SoaringBird
composition is not really needed, interfaces are
make an interface that requires display() and move()
make a gameObjects ArrayList and fill it with the required number of objects
Iterate through it to create, move and display
*/

SoaringBird sb1;
SoaringBird sb2;
SoaringBird sb3;
SoaringBird sb4;
SoaringBird sb5;

FlittingBird fb1;
FlittingBird fb2;
FlittingBird fb3;
FlittingBird fb4;
FlittingBird fb5;

FallingFeather ff1;
FallingFeather ff2;
FallingFeather ff3;
FallingFeather ff4;
FallingFeather ff5;
FallingFeather ff6;
FallingFeather ff7;
FallingFeather ff8;
FallingFeather ff9;
FallingFeather ff10;

void setup() {
  noStroke();
  size(600, 400);
  
  sb1 = new SoaringBird();
  sb2 = new SoaringBird();
  sb3 = new SoaringBird();
  sb4 = new SoaringBird();
  sb5 = new SoaringBird();

  fb1 = new FlittingBird();
  fb2 = new FlittingBird();
  fb3 = new FlittingBird();
  fb4 = new FlittingBird();
  fb5 = new FlittingBird();

  ff1 = new FallingFeather();
  ff2 = new FallingFeather();
  ff3 = new FallingFeather();
  ff4 = new FallingFeather();
  ff5 = new FallingFeather();
  ff6 = new FallingFeather();
  ff7 = new FallingFeather();
  ff8 = new FallingFeather();
  ff9 = new FallingFeather();
  ff10 = new FallingFeather();
}

void draw() {
  background(173,216,230);
  
  sb1.move();
  sb2.move();
  sb3.move();
  sb4.move();
  sb5.move();
  fb1.move();
  fb2.move();
  fb3.move();
  fb4.move();
  fb5.move();
  ff1.move();
  ff2.move();
  ff3.move();
  ff4.move();
  ff5.move();
  ff6.move();
  ff7.move();
  ff8.move();
  ff9.move();
  ff10.move();
  
  sb1.display();
  sb2.display();
  sb3.display();
  sb4.display();
  sb5.display();
  fb1.display();
  fb2.display();
  fb3.display();
  fb4.display();
  fb5.display();
  ff1.display();
  ff2.display();
  ff3.display();
  ff4.display();
  ff5.display();
  ff6.display();
  ff7.display();
  ff8.display();
  ff9.display();
  ff10.display();
}