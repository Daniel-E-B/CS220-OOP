import java.net.*;
import java.io.*;
Data outData;
Data inData;

ServerSocket sSocket;
ObjectInputStream in;
ObjectOutputStream out;
Socket pipe;

void setup(){
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


void draw(){
  outData.a++;
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