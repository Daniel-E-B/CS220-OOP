class Eatable{//make one function to check for both
//adapt to work with rPlayer for the server class
  float eatPlayer(rPlayer p, ArrayList<rPlayer> playerObjects){
          for(int i=0; i<playerObjects.size(); ++i){
            if(playerObjects.get(i)!=p){
              if(playerObjects.get(i).radius+p.radius>p.distance(playerObjects.get(i).x, 
                playerObjects.get(i).y, p.x, p.y)){
              if(playerObjects.get(i).radius<p.radius){
                 playerObjects.get(i).alive=0;
                 return playerObjects.get(i).radius;
              }
            }
        }
      }
        return 0;
  }
  float eatFood(rPlayer p, ArrayList<Food> foodObjects){
          for(int i=0; i<foodObjects.size(); ++i){
              if(foodObjects.get(i).radius+p.radius>p.distance(foodObjects.get(i).x, 
                foodObjects.get(i).y, p.x, p.y)){
              if(foodObjects.get(i).radius<p.radius){
                 foodObjects.get(i).die=true;
                 return foodObjects.get(i).radius;
              }
            }
        }
        return 0;
  }
}