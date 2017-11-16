//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import processing.core.PApplet;

public class OOserver extends PApplet {
    Data outData;
    Data inData;
    ServerSocket sSocket;
    ObjectInputStream in;
    ObjectOutputStream out;
    Socket pipe;

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
        try{
            println("0.5");
            sSocket = new ServerSocket(1234);
            println("0.75, waiting for a connection");
            pipe=sSocket.accept();
            println("0.8");
        }catch(Exception e){println("dsgf",e);}

    }

    @Override
    public void draw() {
        background(0,255,0);
        //outData.a++;
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

           /* while((inData=(Data) in.readObject())!=null){
                println("indata: ", inData.a);
            }*/
            inData=(Data) in.readObject();
            println("indata: ", inData.a);
            /*pipe.close();
            in.close();*/
        }catch(Exception e){println("s",e);}

    }
}
