import java.util.ArrayList;
import processing.core.*;

public class HuntManager {
    /*this needs to handle:
        *   the taking of health periodically from predators
        *   telling each predator where the nearest prey is, and giving them an angle to get there
        *   telling each prey where the nearest predator is, and giving then an angle to get away
        *   relating to above: how will that work with wrap around edges
        *   PREY NEED TO BE SLIGHTLY SLOWER THAN PREDATORS?
        *   collisions
        *   predators eating prey
        *   removing predators and prey
        *   the "global" arraylists of predators and prey
     */
    private ArrayList<Predator> predators;
    private ArrayList<Prey> preys;

    HuntManager(int numPreys, int numPredators, PApplet parent) {
        predators = new ArrayList<>();
        preys = new ArrayList<>();

        for (int i = 0; i < numPreys; ++i) {
            preys.add(new Prey(parent));
        }
        for (int i = 0; i < numPredators; ++i) {
            predators.add(new Predator(parent));
        }
    }

    public void gameTick(){
        updateCreatures();
    }
    public void displayCreatures(){
        for(Prey prey : preys){
            prey.display();
        }
        for(Predator predator : predators){
            predator.display();
        }
    }

    private void updateCreatures(){
        for(Predator predator : predators){
            //run a float function that gives me the angle to the nearest thingy
            float angle=0;//it should = that function
            //0 is down
            predator.update(angle);
        }
        for(Prey prey : preys){
            //run a float function that gives me the angle to the nearest thingy
            float angle=0;//it should = that function
            prey.update(angle);
        }
    }
}


