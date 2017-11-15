
import processing.core.*;
import java.net.*;
import java.io.*;

public class OOserver extends PApplet {

    public static void main(String args[]) {
        PApplet.main("OOserver");
    }

    Data outData;
    Data inData;

    ServerSocket sSocket;
    ObjectInputStream in;
    ObjectOutputStream out;
    Socket pipe;

    @Override
    public void settings() {
        // TODO: Customize screen size and so on here
        size(50, 50);
    }

    @Override
    public void setup() {
        // TODO: Your custom drawing and setup on applet start belongs here
        clear();
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
        // TODO: Do your drawing for each frame here
        clear();
        outData.a++;
        println("c");
        //try{pipe=sSocket.accept();}catch(Exception e){println("no new client");}
        //if that worked, i could have multiple clients
        try{
            println("0.9");
            //in=new ObjectInputStream(pipe.getInputStream());
            out=new ObjectOutputStream(pipe.getOutputStream());
            println("1");
            out.writeObject(outData);
            println("outdata: ",outData.a);
            in=new ObjectInputStream(pipe.getInputStream());

            while((inData=(Data) in.readObject())!=null){
                println("indata: ", inData.a);
            }

            //pipe.close();
            //in.close();
        }catch(Exception e){println("s",e);}
    }
}
