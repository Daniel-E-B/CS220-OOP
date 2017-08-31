#include <SFML/Audio.hpp>
#include <SFML/Graphics.hpp>
#include <SFML/System.hpp>
#include <SFML/Network.hpp>
#include <cstdlib>
#include <vector>

using namespace std;

class Shape{
private:
		sf::RectangleShape shape;

public:
	double x_speed,y_speed;
	
	Shape(){
		srand(time(NULL));
		shape.setPosition(rand()%800, rand()%600);
		shape.setFillColor(sf::Color(rand()%255, rand()%255, rand()%255, 255));
		shape.setOutlineColor(sf::Color::Black);
		x_speed=rand()%50;
		y_speed=rand()%50;
		shape.setSize(sf::Vector2f(rand()%100, rand()%100));
	}
	void update(){
		shape.move(x_speed, y_speed);
	}
	sf::RectangleShape getShape(){
		return shape;
	}
	void sDraw(sf::RenderWindow w)
	{
		w.draw(shape);
	}
};


class Rect: public Shape{
private:
	sf::RectangleShape shape;

public:
	Rect(){
		srand(time(NULL));
		shape.setPosition(rand()%800, rand()%600);
		shape.setFillColor(sf::Color(rand()%255, rand()%255, rand()%255, 255));
		shape.setOutlineColor(sf::Color::Black);
		x_speed=rand()%50;
		y_speed=rand()%50;
		shape.setSize(sf::Vector2f(rand()%100, rand()%100));
	}
	sf::RectangleShape getShape(){
		return shape;
	}
};

class Circle: public Shape{
private:
	sf::CircleShape shape;
	
public:
	Circle(){
		srand(time(NULL));
		shape.setPosition(rand()%800, rand()%600);
		shape.setFillColor(sf::Color(rand()%255, rand()%255, rand()%255, 255));
		shape.setOutlineColor(sf::Color::Black);
		x_speed=rand()%50;
		y_speed=rand()%50;
		shape.setRadius(rand()%100);
	}
	sf::CircleShape getShape(){
		return shape;
	}
};

class Square: public Shape{
private:
	sf::RectangleShape shape;
	
public:
	int size=0;

	Square(){
		srand(time(NULL));
		shape.setPosition(rand()%800, rand()%600);
		shape.setFillColor(sf::Color(rand()%255, rand()%255, rand()%255, 255));
		shape.setOutlineColor(sf::Color::Black);
		x_speed=rand()%50;
		y_speed=rand()%50;
		size=rand()%100;
		shape.setSize(sf::Vector2f(size,size));
	}
	
};

vector<Shape>gameObjects;
sf::Font font;
sf::Text text;
int shapeSelect=0;

int main()
{
	font.loadFromFile("arial.ttf");
	text.setFont(font);
	text.setPosition(100,100);
	text.setCharacterSize(30);
	text.setFillColor(sf::Color::Black);
	srand(time(NULL));
	sf::RenderWindow window(sf::VideoMode(800, 600), "Shape Collisions");
	while(window.isOpen()){
		
	sf::Event event;
	while (window.pollEvent(event))
	{
		if (event.type == sf::Event::Closed)
			window.close();
		
		/*if(event.type==sf::Event::KeyPressed){
			if(event.key.code==sf::Keyboard::S){
				shapeSelect=rand()%2;
				text.setString(to_string(shapeSelect));
				if(shapeSelect==0){
					gameObjects.push_back(Circle());
				}else if(shapeSelect==1){
					gameObjects.push_back(Circle());
				}else if (shapeSelect==2){
					gameObjects.push_back(Circle());

				}
			}
		}*/

	}
		gameObjects.push_back(Circle());
	window.clear(sf::Color::White);
	for(int i=0; i<gameObjects.size(); ++i){
		window.draw(gameObjects[i].getShape());
		//gameObjects[i].sDraw(window);
	}
	window.draw(text);
	window.display();
	}
    return 0;
}
