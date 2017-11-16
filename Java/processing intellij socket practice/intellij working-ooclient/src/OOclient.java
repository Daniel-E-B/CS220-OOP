
import processing.core.*;
import java.net.*;
import java.io.*;

public class OOclient extends PApplet {

    public static void main(String args[]) {
        PApplet.main("OOclient");
    }

    Data outData;
    Data inData;

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
        outData=new Data();
        println("0");
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
        outData.a++;
        println("c");

        try{
            println("0.9");
            //in=new ObjectInputStream(pipe.getInputStream());
            out=new ObjectOutputStream(socket.getOutputStream());
            println("1");
            out.writeObject(outData);
            println("outData: ",outData.a);
            in=new ObjectInputStream(socket.getInputStream());

            inData=(Data) in.readObject();
            println("indata: ", inData.a);

            /*socket.close();
            out.close();
            in.close();*/
        }catch(Exception e){println("s",e);}
    }
}
