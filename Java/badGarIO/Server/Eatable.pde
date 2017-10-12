class Eatable{//make one function to check for both
//adapt to work with rPlayer for the server class
  float eatPlayer(Player c, ArrayList<Player> playerObjects){
          for(int i=0; i<playerObjects.size(); ++i){
            if(playerObjects.get(i)!=c){
              if(playerObjects.get(i).radius+c.radius>c.distance(playerObjects.get(i).x, 
                playerObjects.get(i).y, c.x, c.y)){
              if(playerObjects.get(i).radius<c.radius){
                 playerObjects.get(i).die=true;
                 return playerObjects.get(i).radius;
              }
            }
        }
      }
        return 0;
  }
  float eatFood(Player c, ArrayList<Food> foodObjects){
          for(int i=0; i<foodObjects.size(); ++i){
              if(foodObjects.get(i).radius+c.radius>c.distance(foodObjects.get(i).x, 
                foodObjects.get(i).y, c.x, c.y)){
              if(foodObjects.get(i).radius<c.radius){
                 foodObjects.get(i).die=true;
                 return foodObjects.get(i).radius;
              }
            }
        }
        return 0;
  }
}