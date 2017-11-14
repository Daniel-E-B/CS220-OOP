import java.net.*;
import java.io.*;
Data outData;
Data inData;

ObjectInputStream in;
ObjectOutputStream out;
Socket socket;

void setup(){
  outData=new Data();
  println("0");
  try{
    println("0.5");
    socket=new Socket(InetAddress.getLocalHost(),1234);
    println("0.75, waiting for a connection");
  }catch(Exception e){println("dsgf",e);}
}


void draw(){
  outData.a++;
  println("c");
  
  try{
   println("0.9");
   //in=new ObjectInputStream(pipe.getInputStream());
   out=new ObjectOutputStream(socket.getOutputStream());
   println("1");
   out.writeObject(outData);
   in=new ObjectInputStream(socket.getInputStream());
   
   while((inData=(Data) in.readObject())!=null){
     println(inData.a);
   }

   socket.close();
   out.close();
   in.close();
  }catch(Exception e){println("s",e);}
}