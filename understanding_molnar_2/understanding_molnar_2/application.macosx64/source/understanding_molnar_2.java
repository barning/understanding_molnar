import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import gab.opencv.*; 
import processing.video.*; 
import java.awt.*; 
import de.looksgood.ani.*; 
import de.looksgood.ani.easing.*; 

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
ArrayList<Cube> cubes = new ArrayList<Cube>();


Capture video;
OpenCV opencv;

int timeDelay = 600; //milliseconds in one minute
int time = 0;

public void setup(){
  
  //fullScreen(P3D);
  video = new Capture(this, width/2, height/2);
  opencv = new OpenCV(this, width/2, height/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  video.start();
  gridCounter = 15;
  Ani.init(this);
  Ani.setDefaultEasing(Ani.QUAD_IN_OUT);
  initGrid();
}

public void draw(){
  background(0xffc0bbbf);
  lightFalloff(1.0f, 0.005f, 0.0f);
  ambientLight(179, 174, 171);
  ambient(0xffb3aeab);
  lightSpecular(206, 214, 217);
  specular(206, 214, 217);
  shininess(1.0f); 
  //emissive(#2a2529);
  pushMatrix(); 
  scale(2);
  opencv.loadImage(video);
  opencv.flip(OpenCV.HORIZONTAL);
  Rectangle[] faces = opencv.detect();

  for (int i = 0; i < faces.length; i++) {
    pointLight(201, 205, 232, faces[i].x+50, faces[i].y+20, faces[i].width/2);

  }
  popMatrix();
  for (int i = 0; i < cubes.size(); i++) {
    Cube cub = cubes.get(i);
    cub.Display();
  }
  
  if(millis()-time>=timeDelay){
    int dice = PApplet.parseInt(random(0,cubes.size()));
    for (int i = 0; i < cubes.size(); i++) {
      if (i == dice){
        Cube cub = cubes.get(i);
        cub.animDisplay();
      }
    }
  time=millis();
  }

}

public void initGrid(){
  float gridX,gridY;
  rectMode(CENTER);
  for (int i = 1; i < gridCounter; i++) {
    for (int j = 1; j < gridCounter; j++) {
      gridX = width/gridCounter*i;
      gridY = height/gridCounter*j;
      //trapez(gridX,gridY);
      cubes.add(new Cube(gridX,gridY));
    }
  }
}

public void captureEvent(Capture c) {
  c.read();
}
class Cube {
  float myCenterX;
  float myCenterY;
  
  Ani thisAni;
  
  Cube(float centerX, float centerY){
    myCenterX = centerX;
    myCenterY = centerY+random(-10,10);
  }
  
  public void Display(){
  noStroke();
  pushMatrix();
  translate(myCenterX,myCenterY,0);
  fill(10);
  box(40,40,0);
  popMatrix();
    
  }
  
  public void animDisplay(){
        float randomY = myCenterY + random(-5,5);
        thisAni = Ani.to(this, 0.2f, "myCenterY", randomY);
  }
}
  public void settings() {  size(800, 700,P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#C0BBBF", "--stop-color=#cccccc", "understanding_molnar_2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
