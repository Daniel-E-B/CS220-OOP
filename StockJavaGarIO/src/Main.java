import java.awt.*;
import java.awt.image.BufferStrategy;
import javax.swing.*;

public class Main{


    public static int width=800;
    public static int height=600;


    public static void main(String[] args){
        int mouseX=0, mouseY=0;
        int radius=50;

        System.out.println("began");

        JFrame mainFrame=new JFrame("a title");
        mainFrame.setSize(width,height);
        mainFrame.setVisible(true);//display and stuff;

        Canvas canvas=new Canvas();
        canvas.setSize(width,height);//from JFrame
        canvas.setVisible(true);//do i really need this?
        canvas.setBackground(Color.BLACK);

        mainFrame.add(canvas);

        canvas.createBufferStrategy(3);

        BufferStrategy gBuffer;
        Graphics g;

        while(true){
            mouseX=MouseInfo.getPointerInfo().getLocation().x;
            mouseY=MouseInfo.getPointerInfo().getLocation().y;
            //the above return the mouse's position on the screen, not in the window...
            //I could override the functions to return its position on the screen, but for now im doing this:

            mouseX-=mainFrame.getLocation().x+0.5*radius;
            mouseY-=mainFrame.getLocation().y+0.6*radius;

            //the above works a little better, but uses a ghetto way of accounting for the default OSX window offset thingies

            gBuffer=canvas.getBufferStrategy();
            g=gBuffer.getDrawGraphics();
            g.clearRect(0,0,width,height);

            g.setColor(Color.yellow);
            g.fillOval(mouseX, mouseY, radius, radius);

            gBuffer.show();
            g.dispose();
        }
    }
}
