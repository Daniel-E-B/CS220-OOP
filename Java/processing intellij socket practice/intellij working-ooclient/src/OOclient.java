
import processing.core.*;
import java.net.*;
import java.io.*;
import java.util.ArrayList;

public class OOclient extends PApplet {

    public static void main(String args[]) {
        PApplet.main("OOclient");
    }

    Player localPlayer;
    rPlayer localrPlayer;
    int numPlayers,numFoods;

    ArrayList<Food> foods = new ArrayList<Food>();//this doesn't control food, but needs to draw it
    ArrayList<rPlayer> rPlayers = new ArrayList<rPlayer>();

    ObjectInputStream in;
    ObjectOutputStream out;
    Socket socket;

    @Override
    public void settings(){
        this.size(150,150);
    }

    @Override
    public void setup() {
        // TODO: Your custom drawing and setup on applet start belongs here
        localrPlayer=null;
        println("0");
        localPlayer=(new Player(random(0,width), random(0,height)));
        frameRate(60);
        noStroke();
        textAlign(CENTER);
        background(255);
        try{
            println("0.5");
            socket=new Socket(InetAddress.getLocalHost(),1234);
            println("0.75, waiting for a connection");
        }catch(Exception e){println("dsgf",e);}    }

    @Override
    public void draw() {
        // TODO: Do your drawing for each frame here
        background(0,255,0);
        rect(30, 20, 55, 55);
        println("c");

        localrPlayer=new rPlayer(localPlayer.playerID,localPlayer.radius,localPlayer.x,
                localPlayer.y,localPlayer.r,localPlayer.g, localPlayer.b,1);

        try{
            println("0.9");
            //in=new ObjectInputStream(pipe.getInputStream());
            out=new ObjectOutputStream(socket.getOutputStream());
            println("1");
            out.writeObject(localrPlayer);
            println("out player xy: ",localrPlayer.x, " ",localrPlayer.y);
            in=new ObjectInputStream(socket.getInputStream());//TODO: PROBLEM LINE
            println("1.1");
            rPlayer inPlayer=(rPlayer) in.readObject();
            println("inplayer xy: ", inPlayer.x, " ",inPlayer.y);


            //display everything
            for(int i=0; i<foods.size(); ++i){
                foods.get(i).display();
            }
            //update local player

            //get other players

            //get foods
            /*socket.close();
            out.close();
            in.close();*/
        }catch(Exception e){println("s",e);}
    }
}
