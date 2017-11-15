
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
            socket=new Socket(InetAddress.getLocalHost(),1234);
            println("0.75, waiting for a connection");
        }catch(Exception e){println("dsgf",e);}    }

    @Override
    public void draw() {
        // TODO: Do your drawing for each frame here
        clear();
        outData.a++;
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

            while((inData=(Data) in.readObject())!=null){
                println("inData: ",inData.a);
            }

            /*socket.close();
            out.close();
            in.close();*/
        }catch(Exception e){println("s",e);}
    }
}
