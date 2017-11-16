//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import processing.core.PApplet;
import java.util.ArrayList;

public class OOserver extends PApplet {
    Data outData;
    Data inData;
    ServerSocket sSocket;
    ObjectInputStream in;
    ObjectOutputStream out;
    Socket pipe;

    ArrayList<Food> foods = new ArrayList<Food>();
    ArrayList<rPlayer> rPlayers = new ArrayList<rPlayer>();//r stand for remote
    int foodInterval=120;//every 120 frames, add a food;

    //TODO: I could make a class GameManager to contain the following functions
    public void initFood(int numfoods){
        for(int i=0; i<numfoods; ++i){
            foods.add(new Food(random(0,width),random(0,height), random(height/100)));
        }
    }

    public void addFood(){
        if(foodInterval>=120){
            foods.add(new Food(random(0, width), random(0, height), random(height/100)));
            foodInterval=0;
        }
    }

    /* Clear all game objects. */
    public void reset() {
        rPlayers = new ArrayList<rPlayer>();
        foods = new ArrayList<Food>();
        initFood(height/25);
    }

    public static void main(String[] args) {
        PApplet.main("OOserver");
    }

    @Override
    public void settings(){
        size(150,150);
    }

    @Override
    public void setup() {
        outData=new Data();
        println("0");

        initFood(height/25);
        noStroke();
        textMode(CENTER);
        textAlign(CENTER);
        initFood(500);

        try{
            println("0.5");
            //TODO: make it work with multiple clients
            sSocket = new ServerSocket(1234);
            println("0.75, waiting for a connection");
            pipe=sSocket.accept();
            println("0.8");
        }catch(Exception e){println("dsgf",e);}

    }

    @Override
    public void draw() {
        background(255);
        ++foodInterval;
        println("c");
        fill(0);
        //why doesnt the text show up? what am i doing wrong now?
        try{text("inData: "+inData.a, 12, 12); } // Default depth, no z-value specified
        catch(Exception e){println("no indata to show");}

        try{
            println("0.9");
            //in=new ObjectInputStream(pipe.getInputStream());
            out=new ObjectOutputStream(pipe.getOutputStream());
            println("1");
            out.writeObject(outData);
            println("outData: ",outData.a);
            in=new ObjectInputStream(pipe.getInputStream());

            inData=(Data) in.readObject();
            println("indata: ", inData.a);
            /*pipe.close();
            in.close();*/
        }catch(Exception e){println("s",e);}

    }
}
