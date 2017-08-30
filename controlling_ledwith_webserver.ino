#include <ESP8266WiFi.h>
//#include <WiFiClient.h>  
//#include <ThingSpeak.h>
//const char* ssid = "OHD";
//const char* password = "OHD_WIFI";
  int val;
  int tempPin = A0;
//int ledPin = 13; // GPIO13
//WiFiServer server(80);
//WiFiClient client;  
//unsigned long myChannelNumber = 321580;  
//const char * myWriteAPIKey = "FETTP94G518XIJFH";   
void setup() {
  Serial.begin(115200);
  delay(10);
 
  //pinMode(tempPin, OUTPUT);
  //digitalWrite(tempPin, LOW);
 
  // Connect to WiFi network
  Serial.println();
  Serial.println();
  /*Serial.print("Connecting to ");
  //Serial.println(ssid);
 
  //WiFi.begin(ssid, password);
 
//  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
 
  // Start the server
  server.begin();
  Serial.println("Server started");
 
  // Print the IP address
  Serial.print("Use this URL to connect: ");
  Serial.print("http://");
  Serial.print(WiFi.localIP());
  Serial.println("/");
  ThingSpeak.begin(client);*/
}
 
void loop() {
  val = analogRead(tempPin);
float mv = ( val/1024.0)*5000; 
float cel = mv/10;
float farh = (cel*9)/5 + 32;

Serial.print("TEMPRATURE = ");
Serial.print(cel);
Serial.print("*C");
Serial.println();
delay(1000);

/* uncomment this to get temperature ifarenhite 
Serial.print("TEMPRATURE = ");
Serial.print(farh);
Serial.print("*F");
Serial.println();*/
// ThingSpeak.writeField(myChannelNumber, 1,cel, myWriteAPIKey);  

   delay(100); }
 
