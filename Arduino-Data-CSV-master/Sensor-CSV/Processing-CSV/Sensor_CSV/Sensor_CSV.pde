import processing.serial.*;
Serial myPort;
String sensorReading="";
import java.io.BufferedWriter;
import java.io.FileWriter;
String outFilename = "data.csv";

String timestamp = "";

void setup() {
  size(400,200);
  myPort = new Serial(this,"/dev/cu.usbmodem1411", 9600);       //Arduino Port 
  myPort.bufferUntil('\n');
  writeText("data visualization, stop with any key");            //Data Vizualization
  
}

void draw() {
  //The serialEvent controls the display
}  

void serialEvent (Serial myPort){
 sensorReading = myPort.readStringUntil('\n');
  if(sensorReading != null){
    sensorReading=trim(sensorReading);
    timestamp=year()+"/"+month()+"/"+day()+" "+hour()+":"+minute()+":"+second()+"," ;
  }
  // make a timestamp
  

  writeText("Sensor Reading: " + timestamp + sensorReading);
  
  appendTextToFile(outFilename, timestamp +   sensorReading);

}


void writeText(String textToWrite){
  background(255);
  fill(0);
  text(textToWrite, width/20, height/2);   
}


void keyPressed() {

  exit();  // Stops the program with any key pressed
}

/**
 * Appends text to the end of a text file located in the data directory, 
 * creates the file if it does not exist.
 * Can be used for big files with lots of rows, 
 * existing lines will not be rewritten
 */

void appendTextToFile(String filename, String text){
  File f = new File(dataPath(filename));
  if(!f.exists()){
    createFile(f);
  }
  try {
    PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));   // true to append the output
    out.println(text);
    out.close();                                      // clean close allows to read / copy file while processing runs
  }catch (IOException e){
      e.printStackTrace();
  }
}

// The below part create new subfolder. 

void createFile(File f){
  File parentDir = f.getParentFile();
  try{
    parentDir.mkdirs(); 
    f.createNewFile();
     }
    catch(Exception e){
    e.printStackTrace();
    }
}    
