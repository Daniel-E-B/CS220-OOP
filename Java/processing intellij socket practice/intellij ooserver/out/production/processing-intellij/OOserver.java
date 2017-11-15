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

    public OOserver() {
    }

    public static void main(String[] args) {
        PApplet.main("OOserver");
    }

    public void settings() {
        this.size(50, 50);
    }

    public void setup() {
        this.clear();
        this.outData = new Data();
        println("0");

        try {
            println("0.5");
            this.sSocket = new ServerSocket(1234);
            println("0.75, waiting for a connection");
            this.pipe = this.sSocket.accept();
            println("0.8");
        } catch (Exception var2) {
            println(new Object[]{"dsgf", var2});
        }

    }

    public void draw() {
        this.clear();
        ++this.outData.a;
        println("c");

        try {
            this.pipe = this.sSocket.accept();
        } catch (Exception var2) {
            println("no new client");
        }

        try {
            println("0.9");
            this.out = new ObjectOutputStream(this.pipe.getOutputStream());
            println("1");
            this.out.writeObject(this.outData);
            println(new Object[]{"outdata: ", this.outData.a});
            this.in = new ObjectInputStream(this.pipe.getInputStream());

            while((this.inData = (Data)this.in.readObject()) != null) {
                println(new Object[]{"indata: ", this.inData.a});
            }
        } catch (Exception var3) {
            println(new Object[]{"s", var3});
        }

    }
}
