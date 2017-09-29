class Eatable{
  float eat(Player c, ArrayList<Player> gameObjects){
          for(int i=0; i<gameObjects.size(); ++i){
            if(gameObjects.get(i)!=c){
              if(gameObjects.get(i).radius+c.radius>c.distance(gameObjects.get(i).x, 
                gameObjects.get(i).y, c.x, c.y)){
              if(gameObjects.get(i).radius<c.radius){
                 gameObjects.get(i).die=true;
                 return gameObjects.get(i).radius;
              }
            }
        }
      }
        return 0;
  }
}