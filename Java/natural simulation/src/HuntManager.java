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
    PApplet parent;
    private long frames;
    private int numPreys;

    HuntManager(int numPreys, int numPredators, PApplet parent) {
        this.numPreys=numPreys;
        this.parent=parent;
        predators = new ArrayList<>();
        preys = new ArrayList<>();

        for (int i = 0; i < numPreys; ++i) {
            preys.add(new Prey(this.parent));
        }
        for (int i = 0; i < numPredators; ++i) {
            predators.add(new Predator(this.parent));
        }
    }

    public void gameTick(){
        updateCreatures();
        ++this.frames;
        manageHealth();
        manageCollisions();
    }

    private void manageHealth(){
        if(this.frames>=10) {
            for (Predator predator : predators) {
                --predator.health;
            }
            this.frames=0;
        }
        if(preys.size()<numPreys){//make sure there are always enough prey
            preys.add(new Prey(this.parent));
        }
        //make it so that if predator's health is over 150, they have a baby and loses 100 health
        //also kill dead ones
    }

    private void manageCollisions(){
        //if a predator eats a prey, it gains 25 health
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
            float angle=angleToClosestPrey(predator);
            //0 is down
            predator.update(angle);
        }
        for(Prey prey : preys){
            float angle=angleFromClosestPredator(prey);
            prey.update(angle);
        }
    }

    private float angleFromClosestPredator(Prey prey){
        double distanceOfClosest=this.parent.width;
        Predator closest=null;
        for(Predator predator: predators){
            if(distance(prey.x,predator.x,prey.y,predator.y)<distanceOfClosest){
                closest=predator;
                distanceOfClosest=distance(prey.x,predator.x,prey.y,predator.y);
            }
        }
        return (float)angleToPoint(prey.x,closest.x,prey.y,closest.y)-180;
    }

    private float angleToClosestPrey(Predator predator){
        double distanceOfClosest=this.parent.width;
        Prey closest=null;
        for(Prey prey: preys){
            if(distance(predator.x,prey.x,predator.y,prey.y)<distanceOfClosest){
                closest=prey;
                distanceOfClosest=distance(predator.x,prey.x,predator.y,prey.y);
            }
        }
        return (float)angleToPoint(predator.x,closest.x,predator.y,closest.y);
    }

    private double angleToPoint(float x1, float x2, float y1, float y2){
        double angle;
        float dX = x1 - x2;
        float dY = y1 - y2;
        angle = (Math.atan2(dX,dY));
        //doesnt work so well?
        return angle;
    }

    private double distance(float x1, float x2, float y1, float y2){
        double distance=Math.sqrt(Math.pow((x1-x2),2)+Math.pow((y1-y2),2));
        return(distance);
    }
}


