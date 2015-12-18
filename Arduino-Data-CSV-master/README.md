#Saving Arduino sensor data in a CSV file using Processing JS. 

Coming to the concept of Internet of things, it not just about responding to the situation automataticlly with help of sensor technology but also using that data to design the future infrastructure. All though internet is not available everywhere to store your sensor data into database you can atleast save that data in your local machine and use it for analysis. From a simple home automated system and large scale monitering with zero configuration this data will be helpful to be future ready. Keeping this in mind I started reseaching to build a small and best module to save any sensor data in a CSV file on your local machine. The result is the combined use of Arduino IDE and most famous data visualization software Processing JS.

In this small blog post, I'll describe on how to use both of them to save any sensor data in a CSV file.

###About Processing
Processing.js is the sister project of the popular Processing visual programming language, designed for the web. Processing.js makes your data visualizations, digital art, interactive animations, educational graphs, video games, etc. work using web standards and without any plug-ins. You write code using the Processing language, include it in your web page, and Processing.js does the rest. It's not magic, but almost.

###Prequsites 

1. Arduino IDE 
2. Processing IDE [Download here](http://processingjs.org/)
3. Arduino UNO
4. Any sensor. (I'm using TMP36 Temperature Sensor)

###Lets get started!

1. Connect the circuit as show in figure below.
![TMP 36](https://learn.adafruit.com/system/assets/assets/000/000/476/medium640/temperature_tmp36fritz.gif?1396763381)
2. Now, download the Arduino code from here and upload it to your Arduino Uno. Run the code and check serial moniter for readings. If you see the readings then your code is working.
![Serial Moniter](http://i.imgur.com/YChyLPj.png)

3. Next, download Processing code and upload it to your Processing IDE. Run the code and you'll see a small tab with your temperature is vizualised in that tab.
![Data Visual](http://i.imgur.com/5CcoWlI.png)
 
4. This confirms your code and at the same time, a new folder in your Processing code is created automatically. This folder contains of a CSV file which consists of your sensor readings. 

![Data folder](http://i.imgur.com/l1rGIVa.png)

Finally, you're able to save your sensor data into a CSV file. And this data can be used for various purposes to build better system for future.
