import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import gab.opencv.*; 
import processing.video.*; 
import java.awt.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class understanding_molnar_2 extends PApplet {





int gridCounter;

Capture video;
OpenCV opencv;

public void setup(){
  
  video = new Capture(this, width/2, height/2);
  opencv = new OpenCV(this, width/2, height/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  video.start();
  gridCounter = 13;
  lights();}

public void draw(){
  pushMatrix(); 
  scale(2);
  opencv.loadImage(video);
  opencv.flip(OpenCV.HORIZONTAL);
  Rectangle[] faces = opencv.detect();
  println(faces.length);
  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    pointLight(200, 200, 200, faces[i].x, faces[i].y, 100);

  }
  popMatrix();
  ambientLight(100, 100, 100);
  drawGrid();

}

public void drawGrid(){
float gridX,gridY;
  background(230);
  rectMode(CENTER);
  for (int i = 1; i < gridCounter; i++) {
    for (int j = 1; j < gridCounter; j++) {
      gridX = width/gridCounter*i;
      gridY = height/gridCounter*j;
      trapez(gridX,gridY);
    }
  }
}

public void trapez(float x, float y){
  noStroke();
  pushMatrix();
  translate(x,y,0); 
  box(40,40,10);
  popMatrix();
  //rect(x,y + (random(-6,6)),40,40);
}

public void captureEvent(Capture c) {
  c.read();
}
  public void settings() {  size(700, 700,P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#E6E6E6", "--stop-color=#cccccc", "understanding_molnar_2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
