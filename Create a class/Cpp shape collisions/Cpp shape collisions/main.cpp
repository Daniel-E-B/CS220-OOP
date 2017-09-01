#include <SFML/Audio.hpp>
#include <SFML/Graphics.hpp>
#include <SFML/System.hpp>
#include <SFML/Network.hpp>
#include <cstdlib>
#include <cmath>
#include <vector>

using namespace std;


class Shape{
public:
	double speed, direction;
	void update(){
		shape.move(speed*cos(direction), speed*sin(direction));
	}
	sf::ConvexShape shape;
};


class Quadrilateral: public Shape{
public:

	Quadrilateral(){
		shape.setPosition(rand()%1920, rand()%1080);
		shape.setFillColor(sf::Color(rand()%255, rand()%255, rand()%255, 255));
		shape.setOutlineColor(sf::Color::Black);
		speed=0.5;
		direction=rand()%360;
		shape.setPointCount(4);
		shape.setPoint(0, sf::Vector2f(0,0));
		shape.setPoint(1, sf::Vector2f(0,rand()%100));
		shape.setPoint(2, sf::Vector2f(rand()%100,rand()%100));
		shape.setPoint(3, sf::Vector2f(rand()%100,0));
		shape.setOutlineThickness(3);
	}
};

class Rect: public Shape{
public:
	
	Rect(){
		shape.setPosition(rand()%1920, rand()%1080);
		shape.setFillColor(sf::Color(rand()%255, rand()%255, rand()%255, 255));
		shape.setOutlineColor(sf::Color::Black);
		speed=0.5;
		direction=rand()%360;
		float cornerX=rand()%100;
		float cornerY=rand()%100;
		shape.setPointCount(4);
		shape.setPoint(0, sf::Vector2f(0,0));
		shape.setPoint(1, sf::Vector2f(0,cornerY));
		shape.setPoint(2, sf::Vector2f(cornerX,cornerY));
		shape.setPoint(3, sf::Vector2f(cornerX,0));
		shape.setOutlineThickness(3);
	}
};

class Triangle: public Shape{
public:

	Triangle(){
		shape.setPosition(rand()%1920, rand()%1080);
		shape.setFillColor(sf::Color(rand()%255, rand()%255, rand()%255, 255));
		shape.setOutlineColor(sf::Color::Black);
		speed=0.5;
		direction=rand()%360;
		shape.setOutlineThickness(3);
		float p1x=rand()%100;
		float p2x=rand()%100;
		float p1y=rand()%100;
		float p2y=rand()%100;
		shape.setPointCount(3);
		shape.setPoint(0,sf::Vector2f(0, 0));
		shape.setPoint(1, sf::Vector2f(p1x, p1y));
		shape.setPoint(2, sf::Vector2f(p2x,p2y));
	}
};

class Square: public Shape{
public:

	int size=0;

	Square(){
		shape.setPosition(rand()%1920, rand()%1080);
		shape.setFillColor(sf::Color(rand()%255, rand()%255, rand()%255, 255));
		shape.setOutlineColor(sf::Color::Black);
		speed=0.5;
		direction=rand()%360;
		size=rand()%100;
		shape.setOutlineThickness(3);
		shape.setPointCount(4);
		float corner=rand()%100;
		shape.setPoint(0, sf::Vector2f(0,0));
		shape.setPoint(1, sf::Vector2f(0,corner));
		shape.setPoint(2, sf::Vector2f(corner,corner));
		shape.setPoint(3, sf::Vector2f(corner,0));
	}
};

vector<Shape>gameObjects;
int shapeSelect=0;

int main()
{

	srand(time(NULL));
	sf::RenderWindow window(sf::VideoMode(1920, 1080), "Shape Collisions");
	window.setVerticalSyncEnabled(true);
	while(window.isOpen()){
		
	sf::Event event;
	while (window.pollEvent(event))
	{
		if (event.type == sf::Event::Closed)
			window.close();
		
		if(event.type==sf::Event::MouseButtonPressed){
			if(event.mouseButton.button==sf::Mouse::Left){
				shapeSelect=rand()%3;
				if(shapeSelect==0){
					gameObjects.push_back(Rect());
				}else if(shapeSelect==1){
					gameObjects.push_back(Square());
				}else if (shapeSelect==2){
					gameObjects.push_back(Triangle());
				}else{
					gameObjects.push_back(Quadrilateral());
				}
			}
		}

	}
		//collision checks
		for(int i=0; i<gameObjects.size(); ++i){
			for(int j=0; j<gameObjects.size(); ++j){
				if(gameObjects[i].shape.getGlobalBounds().intersects(gameObjects[j].shape.getGlobalBounds())){
					gameObjects[i].shape.rotate(180);
					gameObjects[j].shape.rotate(-180);
				}
			}
		}
	window.clear(sf::Color::White);
	for(int i=0; i<gameObjects.size(); ++i){
		window.draw(gameObjects[i].shape);
		gameObjects[i].update();
	}
	window.display();
	}
    return 0;
}
