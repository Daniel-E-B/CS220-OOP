#include <SFML/Audio.hpp>
#include <SFML/Graphics.hpp>
#include <SFML/System.hpp>
#include <SFML/Network.hpp>
#include <cstdlib>
#include <cmath>
#include <vector>

using namespace std;

//The objective has changed slightly from that of circles.py
//When a shape collides with another shape, the smaller of the two will assume the color of the larger
//If 1000 frames pass without a shape "taking over" another shape, then that shape dies

class Bound{
public:
	sf::RectangleShape boundShape;
	Bound(float x, float y, float w, float h){
		boundShape.setSize(sf::Vector2f(w, h));
		boundShape.setPosition(x, y);
	}
};

class Shape{
private:
	vector<sf::Vector2f>shapePoints;//0 and 1 are two points from the first shape, 2 and 3 are from the second shape
	float distance(float x1, float x2, float y1, float y2){
		return(sqrt(pow((x1-x2),2)+pow((y1-y2),2)));
	}
public:
	double speed, direction;
	int interval=0;//number of frames since takeover
	void update(sf::RenderWindow &window, vector<Shape> &shapes, vector<Bound> &bounds){
		//bounce checks:
		for(int i=0; i<bounds.size(); ++i){
			if(bounds[i].boundShape.getGlobalBounds().intersects(shape.getGlobalBounds()))
				shape.rotate(rand()%-45-120);//results in some spazzing, but its not too bad...
		}
		shape.move(speed*cos(shape.getRotation()), speed*sin(shape.getRotation()));
		++interval;
		
		//collision checks:
		for(int i=0; i<shapes.size();++i){
			for(int j=0; j<shapes.size();++j){
				if(shapes[i].shape.getGlobalBounds().intersects(shapes[j].shape.getGlobalBounds())){
					//if two shapes intersect, the one with the longer first sidelength wins
					if(distance(shapes[i].shape.getPoint(0).x, shapes[i].shape.getPoint(1).x,shapes[i].shape.getPoint(0).y, shapes[i].shape.getPoint(0).y)>distance(shapes[j].shape.getPoint(0).x,shapes[j].shape.getPoint(1).x,shapes[j].shape.getPoint(0).y,shapes[j].shape.getPoint(1).y)){
						//if shape i wins,
						//you can't convert somebody on your team!!
						if(shapes[j].shape.getFillColor()!=shapes[i].shape.getFillColor()){
						shapes[i].interval=0;
						shapes[j].shape.setFillColor(shapes[i].shape.getFillColor());
						}
					}else{
						//if shape j wins,
						if(shapes[j].shape.getFillColor()!=shapes[i].shape.getFillColor()){
						shapes[j].interval=0;
						shapes[i].shape.setFillColor(shapes[j].shape.getFillColor());
						}
					}
				}
			}
			if(shapes[i].interval>=1000){
				shapes.erase(shapes.begin()+i);
			}
		}
		
		window.draw(shape);
	}
	sf::ConvexShape shape;
};


class Quadrilateral: public Shape{
public:

	Quadrilateral(){
		shape.setPosition(rand()%1920, rand()%1080);
		shape.setFillColor(sf::Color(rand()%255, rand()%255, rand()%255, 255));
		shape.setOutlineColor(sf::Color::Black);
		speed=rand()%8+1;
		shape.setRotation(rand()%360);
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
		speed=rand()%8+1;
		shape.setRotation(rand()%360);
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
		speed=rand()%8+1;
		shape.setRotation(rand()%360);
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
		speed=rand()%8+1;
		shape.setRotation(rand()%360);
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
vector<Bound>gameBounds;
int shapeSelect=0;

int main()
{
	//bound setup:
	gameBounds.push_back(Bound(0, 0, 1920, 100));
	gameBounds.push_back(Bound(-100, 0, 100, 1080));
	gameBounds.push_back(Bound(0, 1080, 1920, 100));
	gameBounds.push_back(Bound(1920, 0, 100, 1080));
	
	srand(time(NULL));
	sf::RenderWindow window(sf::VideoMode(1920, 1080), "Shape Collisions");
	window.setVerticalSyncEnabled(true);
	while(window.isOpen()){
		
	sf::Event event;
	while (window.pollEvent(event))
	{
		if (event.type == sf::Event::Closed)
			window.close();
		
		if(sf::Keyboard::isKeyPressed(sf::Keyboard::Key::R)){
			gameObjects.erase(gameObjects.begin(), gameObjects.end());
		}
		
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
	window.clear(sf::Color::White);
	for(int i=0; i<gameObjects.size(); ++i){
		gameObjects[i].update(window, gameObjects, gameBounds);
	}
	window.display();
	}
    return 0;
}
