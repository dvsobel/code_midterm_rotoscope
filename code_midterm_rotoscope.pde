// CODE MIDTERM
// Rotoscoping
//
// This sketch loads the assigned frames and plays them back
// Add your own draw code
// Then it saves out the rendered frames
//
// DON'T FORGET TO CHANGE THE VALUE OF THE STUDENTNAME VARIABLE TO YOUR NAME!!

import java.io.File;

File[] tempfiles;
ArrayList<File> files;
PImage image;
String currentFilename;

// EDIT THIS LINE WITH YOUR NAME!
String studentName = "Danielle Sobel";

void setup() {
  files = new ArrayList<File>();

  // get list of files from directory
  File dir = new File(sketchPath() + "/rawFrames");
  tempfiles = dir.listFiles();

  // filter out files that don't end in .png
  for (int i = 0; i < tempfiles.length; i++) {
    String path = tempfiles[i].getAbsolutePath();
    if (path.toLowerCase().endsWith(".png")) {
      files.add(tempfiles[i]);
    }
  }

  // Resize the canvas to full-HD 1080p glory
  size(960, 540);
  //pixelDensity(2);
  
  // if that doesn't work, comment it out and uncomment this instead:
  //size(1920, 1080);
  //pixelDensity(1);
 

}
void draw() {
  // DO NOT ALTER THE LINE BELOW
  prepare();

  // BEGIN ADDING YOUR CODE HERE -----

//fill in all the houses :)

fill(208, 255, 10, 80); //lime green color, last number is opacity
rect(70,255,50,180); //x, y, w, h
noStroke();

fill(28, 255, 207, 80); //aqua color
rect(120,200,90,220);
noStroke();

fill(239, 84, 17, 80); //orange color, on top
rect(140, 90, 80, 100);
noStroke();

fill(242, 5, 92, 80); //hot pink color
rect(220,50,130,375);
noStroke();

fill(255, 250, 0, 80); //yellow color
rect(350,175,130,250);
noStroke();

fill(0, 255, 31, 80); //green color
rect(475,330,100,90);
noStroke();

fill (255, 250, 0, 80); //yellow color also on top of houses
rect(450, 40, 95, 375);
noStroke();

fill(23, 0, 252, 80); //blue color
rect(550,80,100,350);
noStroke();

fill(232, 19, 0, 80); //red color
rect(650,270,110,150);
noStroke();

fill(255, 0, 181, 80); //pink color, top house
rect (650, 0, 150, 255);
noStroke();

fill(255, 250, 0, 80); //yellow color
rect(770,140,90,280);
noStroke();




  // STOP ADDING YOUR CODE HERE -----

  // DO NOT ALTER THE LINES BELOW
  if (frameCount < files.size()) { 
    export();
  } else {
    exit();
  }
}

// DO NOT ALTER THIS FUNCTION!!
void prepare() {
  String path = files.get(frameCount-1).getAbsolutePath();
  currentFilename = files.get(frameCount-1).getName();

  // Load current file into our PImage variable
  tint(255, 255);
  image = loadImage(path);
  image(image, 0, 0, width, height);
}

// DO NOT ALTER THIS FUNCTION!!
void export() {
  // saves frame without watermark
  saveFrame(sketchPath() + "/outFrames/edited_" + currentFilename);

  int sidePadding = 125;
  int bottomPadding = 50;
  
  textAlign(LEFT);
  textSize(32);
  fill(255);
  text(studentName, sidePadding + 1, height - bottomPadding + 1);
  fill(0);
  text(studentName, sidePadding, height - bottomPadding);

  // saves frame with watermark
  saveFrame(sketchPath() + "/outFrames/watermarked_" + currentFilename);
}