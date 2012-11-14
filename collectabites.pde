// collectabites, a project in shared nutrition
// this sketch takes pictures of people that have eaten 
// fruit/veggies and high fived a giant apple with a sensor
// The images are sent to a Tumblr that documents our shared healthy eating habits
// Sound is played and a meter goes up

import gifAnimation.*;
import processing.video.*;
import ddf.minim.*;
import processing.serial.*;     // import the Processing serial library
Serial myPort;                  // The serial port

// when was the last time the sensors got an "in range" reading?
int lastTime = 0;

// audio to be played
Minim minim = new Minim(this);
AudioSample beautifulGirl;
AudioSample beHealthy;
AudioSample satisfied;
AudioSample followLights;
AudioSample somethingGood;
AudioSample goodVibrations;
AudioSample bigPimpin;
AudioSample workout;
AudioSample soFresh;
AudioSample winFinal;

// background image
PImage panel;
                 
// to make the gifs    
GifMaker gifExport;
Capture video;

//highFive counter
int highFive = 14;
int magicNumber = 15;

// font
PFont myFont;

void setup() {
  size(displayWidth, displayHeight);
  background(0);
  video = new Capture (this, width, height, 30);
  // load songs 
  beautifulGirl = minim.loadSample("bg.mp3");
  beHealthy = minim.loadSample("bh.mp3");
  satisfied = minim.loadSample("sat.mp3");
  followLights = minim.loadSample("ftl.mp3");
  somethingGood = minim.loadSample("sg.mp3");
  goodVibrations = minim.loadSample("gv.mp3");
  bigPimpin = minim.loadSample("bp.mp3");
  workout = minim.loadSample("wo.mp3");
  soFresh = minim.loadSample("sf.mp3");
  winFinal = minim.loadSample("win.mp3");
  rectMode(CENTER);
  myFont = createFont("Candara", 80);
  panel = loadImage("panel2.png");
  apple = loadShape("apple.svg");
  apple.disableStyle();
  video.start();
  // dealing with serial communication from arduino
  // List all the available serial ports
  println(Serial.list());
  // I know that the first port in the serial list on my mac
  // is always my  Arduino module, so I open Serial.list()[0].
  // Change the 0 to the appropriate number of the serial port
  // that your microcontroller is attached to.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  // read bytes into a buffer until you get a linefeed (ASCII 10):
  //myPort.bufferUntil('\n');
}

void draw() {
  background(0);
  if (video.available()) {
    video.read();
  }
  image (video, 80,140, 860, 695);
  image(panel,0,0);
  // date in bottom right
  fill(0);
  textSize(40);
  text("Nov "+ d, width-135, height-40);
  meter();  
  gifCreation(); 
}

/*void mousePressed(){
  highFive++;
  globalframecount = 1;
  // give me a random number to play a song
  int ran = (int)(random(1,9));
  //play random song on high five
  if (highFive > 0 && highFive < magicNumber){
   if (ran == 1){
     beautifulGirl.trigger();
   }
   else if (ran == 2){
     beHealthy.trigger();
   }
   else if (ran == 3){
     satisfied.trigger();
   }
   else if (ran == 4){
     followLights.trigger();
   }
   else if (ran == 5){
     somethingGood.trigger();
   }
   else if (ran == 6){
     goodVibrations.trigger();
   }
   else if (ran == 7){
     bigPimpin.trigger();
   }
   else if (ran == 8){
     soFresh.trigger();
   }
   else if (ran == 9){
     workout.trigger();
   }
  }
  // play WIN song on the magic number being reached
  else if (highFive == magicNumber){ 
    winFinal.trigger();
  }
}*/

void serialEvent(Serial myPort) { 
  // read the serial buffer:
  // get the byte:
  int inByte = myPort.read(); 
  //String myString = myPort.readStringUntil('\n');
  //if (myString != null) {
    //myString = trim(myString);
    // split the string at the commas
    // and convert the sections into integers:
    //int sensors[] = int(split(myString, ','));
    // print out the values you got:
    //for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
      //print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t"); 
    //}
    // add a linefeed after all the sensor values are printed:
    //println();
    // if there is a high five detected by the senors, trigger the needed actions
    if (inByte >= 10){
      // when there is reading in range, reset timer
      int lastTime = 0;
    }
    if (inByte >= 10 && (millis() - lastTime > 20000)){
        lastTime = millis();
        highFive++;
        globalframecount = 1;
        // give me a random number to play a song
        int ran = (int)(random(1,9));
        //play random song on high five
        if (highFive > 0 && highFive < magicNumber){
         if (ran == 1){
           beautifulGirl.trigger();
           }
         else if (ran == 2){
           beHealthy.trigger();
           }
         else if (ran == 3){
           satisfied.trigger();
           }
         else if (ran == 4){
           followLights.trigger();
         }
         else if (ran == 5){
           somethingGood.trigger();
         }
         else if (ran == 6){
           goodVibrations.trigger();
         }
         else if (ran == 7){
           bigPimpin.trigger();
         }
         else if (ran == 8){
           soFresh.trigger();
         }
         else if (ran == 9){
           workout.trigger();
         }
        }
        // play WIN song on the magic number being reached
        else if (highFive == magicNumber){ 
          winFinal.trigger();
        }
      }
    //}
}

void stop()
{
beautifulGirl.close();
beHealthy.close();
satisfied.close();
followLights.close();
somethingGood.close();
goodVibrations.close();
bigPimpin.close();
workout.close();
soFresh.close();
winFinal.close();
minim.stop();
super.stop();
}


