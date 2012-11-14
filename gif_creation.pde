int globalframecount = 0;
int countdowntimer = 10;
int imageName = 0;
int prevImage = 0; 
int x = 100;  // x- position text
int y = height-50; // y- position text
int d = day();    // Values from 1 - 31
int m = month();  // Values from 1 - 12
int timestamp;
int lf = 10;
int hlIndex = 0;
// how many times has the sketch been run for the given period?
int sketchCounter = 0;

void gifCreation(){
textAlign(CENTER);
textSize(80);  
textFont(myFont);
rectMode(CENTER);
noStroke();
if (sketchCounter == 0){
 fill(0);
    textSize(48); 
    text("This Person Could be a Health Star", ((width/2)-225), 152); 
}
if (globalframecount == 0) {
    if (sketchCounter > 0){
      PImage mostRecentImage = loadImage(prevImage + "-" + d + "-" + m + ".gif"); 
      image(mostRecentImage, 0,0);
    }
  }
  if (globalframecount < 300 && globalframecount > 0 ) {
    // text up top
    if (globalframecount == 1){
      hlIndex++;
      if (hlIndex > 4){
       hlIndex = 0;
      }
    }
    String[] headlines = new String[5];
    headlines[0] = "Healthy Eating Superstar!";
    headlines[1] = "I am what I eat (aka awesome)";
    headlines[2] = "Health is my Middle Name!";
    headlines[3] = "Get on wit my healthy self!";
    headlines[4] = "Health es Mi Mejor Amigo!";
    fill(0);
    textSize(48); 
    text(headlines[hlIndex], ((width/2)-225), 152);
    if (globalframecount == 40) {
      gifExport = new GifMaker(this, "data/" + imageName + "-" + d + "-" + m + ".gif");
      imageName++;
      prevImage = imageName - 1;
      gifExport.setQuality(256);
      gifExport.setRepeat(0);
    }
    textSize(80); 
    if (globalframecount > 0 && globalframecount < 50) {
     fill(0, 0, 0, 120);
      rectMode(CENTER);
      rect(width/2-200, height/2-30, 600, 100); 
      fill(93,186,83);
      text("You Rock!", width/2-200, height/2);     
    }
    if (globalframecount == 51) {
      //fill(35,192,255);
      //rect(640, 480, width*2, height*2);
    }
    if (globalframecount == 52) {
      gifExport.setDelay(300);
      gifExport.addFrame();
    }
    if (globalframecount > 60 && globalframecount < 110) {
       fill(0, 0, 0, 120);
      rectMode(CENTER);
      rect(width/2-200, height/2-30, 600, 100);  
      fill(32,228,232);
      text("Smile!", width/2-200, height/2);
    }
    if (globalframecount == 111) {
      //fill(118,200,176);
      //rect(640, 480, width*2, height*2);
    }
    if (globalframecount == 112) {
      gifExport.setDelay(300);
      gifExport.addFrame();
    }
    if (globalframecount > 120 && globalframecount < 170) {
       fill(0, 0, 0, 120);
      rectMode(CENTER);
      rect(width/2-200, height/2-30, 600, 100);  
      fill(118,200,176);
      text("Good on you!", width/2-200, height/2);
    }
    if (globalframecount == 171) {
      //fill(32,228,232);
      //rect(640, 480, width*2, height*2);
    }
    if (globalframecount == 172) {
      gifExport.setDelay(300);
      gifExport.addFrame();
    }
    if (globalframecount > 180 && globalframecount < 230) {
       fill(0, 0, 0, 120);
      rectMode(CENTER);
      rect(width/2-200, height/2-30, 600, 100); 
      fill(35,192,255);
      text("Keep it up!", width/2-200, height/2);
    }
    if (globalframecount == 231) {
      //fill(93,186,83);
      //rect(640, 480, width*2, height*2);
    }
    if (globalframecount == 232) {
      gifExport.setDelay(300);
      gifExport.addFrame();
    }
    if (globalframecount == 233) {
      gifExport.finish();
    }
    globalframecount++;
    sketchCounter++;
    if (globalframecount == 234) {
      globalframecount = 0;
    }
  }
  println(globalframecount);
}
