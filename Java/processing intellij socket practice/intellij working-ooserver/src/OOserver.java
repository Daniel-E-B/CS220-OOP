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
    public void settings() {
        // TODO: Customize screen size and so on here
        size(50, 50);
    }

    @Override
    public void setup() {
        this.clear();
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
        this.clear();
        //outData.a++;
        println("c");

        try{
            println("0.9");
            //in=new ObjectInputStream(pipe.getInputStream());
            out=new ObjectOutputStream(pipe.getOutputStream());
            println("1");
            out.writeObject(outData);
            in=new ObjectInputStream(pipe.getInputStream());

            while((inData=(Data) in.readObject())!=null){
                println("indata: ", inData.a);
            }

            pipe.close();
            in.close();
        }catch(Exception e){println("s",e);}

    }
}
