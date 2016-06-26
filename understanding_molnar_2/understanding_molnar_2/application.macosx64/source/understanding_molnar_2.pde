import gab.opencv.*;
import processing.video.*;
import java.awt.*;

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

int gridCounter;
ArrayList<Cube> cubes = new ArrayList<Cube>();


Capture video;
OpenCV opencv;

int timeDelay = 600; //milliseconds in one minute
int time = 0;

void setup(){
  size(800, 700,P3D);
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

void draw(){
  background(#c0bbbf);
  lightFalloff(1.0, 0.005, 0.0);
  ambientLight(179, 174, 171);
  ambient(#b3aeab);
  lightSpecular(206, 214, 217);
  specular(206, 214, 217);
  shininess(1.0); 
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
    int dice = int(random(0,cubes.size()));
    for (int i = 0; i < cubes.size(); i++) {
      if (i == dice){
        Cube cub = cubes.get(i);
        cub.animDisplay();
      }
    }
  time=millis();
  }

}

void initGrid(){
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

void captureEvent(Capture c) {
  c.read();
}