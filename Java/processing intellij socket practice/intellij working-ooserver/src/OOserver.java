//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import processing.core.PApplet;
import java.util.ArrayList;
import java.util.Iterator;

public class OOserver extends PApplet {
    rPlayer outPlayer;
    rPlayer inPlayer;
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
        outPlayer=null;
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

        try{
            println("0.9");
            out=new ObjectOutputStream(pipe.getOutputStream());
            println("1");
            out.writeObject(outPlayer);
            println("1.1");
            println("outPlayer xy: ",outPlayer.x," ",outPlayer.y);
            in=new ObjectInputStream(pipe.getInputStream());//TODO: problem line
            println("1.2");
            inPlayer=(rPlayer) in.readObject();
            println("1.3");
            boolean flag=false;
                for(rPlayer p : rPlayers){
                    if(p.playerID==inPlayer.playerID){
                        flag=true;
                    }
                }
                if(flag==false){//if the incoming player is new; TODO: make a way to delete players that are inactive/left
                    rPlayers.add(inPlayer);
                }
            println("inplayer xy: ", inPlayer.x, " ", inPlayer.y);
            }catch(Exception a){println("object input and output streams: ",a);}

            /*pipe.close();
            in.close();*/
            //////////////
        for(int i=0; i<rPlayers.size();++i){
            //check if players ate each other
            for(int p=i+1; p<rPlayers.size(); ++p){
                //eat people... rPlayer no longer extends eatable, so fix it
                //rPlayers.get(i).r+=rPlayers.get(i).eatPlayer(rPlayers.get(i),rPlayers)/PI;
            }
            //check if players ate food
            for(int f=0; f<foods.size(); ++f){
                //eat food... rPlayer no longer extends eatable for reasons
                //rPlayers.get(i).r+=rPlayers.get(i).eatFood(rPlayers.get(i),foods)/PI;
            }
        }
        //update food array
        Iterator<Food> fIterator=foods.iterator();
        while(fIterator.hasNext()){
            Food element=fIterator.next();

            if(element.alive==0){
                fIterator.remove();
            }
        }
        addFood();
        //update player array
        //ON THE CLIENT SIDE, CHECK IF THE PLAYER IS DEAD, AND IF IT IS, DISCONNECT
        Iterator<rPlayer> pIterator=rPlayers.iterator();
        while(pIterator.hasNext()){
            rPlayer element=pIterator.next();

            if(element.alive==0){
                pIterator.remove();
            }
        }
        //send out players
        try{
            for(rPlayer outPlayer : rPlayers){
                out.writeObject(outPlayer);
            }

        }catch(IOException e){println("writing players: ", e);}
        catch(NullPointerException e){println("writing players: ", e);}
        //send out foods
        try{
            out.writeObject(foods);

        }catch(IOException e){println("writing foods: ", e);}
        catch(NullPointerException e){println("writing foods: ", e);}
        }

}

