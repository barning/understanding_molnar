//Use OpenCV for Facetracking
import gab.opencv.*;
import processing.video.*;
import java.awt.*;
//Use Ani for Animatiion
import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

int gridCounter;
ArrayList<Cube> cubes = new ArrayList<Cube>();

Ani thisAniLight;

Capture video;
OpenCV opencv;

int timeDelay = 600; //milliseconds in one minute
int time = 0;

float lightCenterX, lightCenterY, lightWidth;

void setup(){
  size(800, 700,P3D);
  video = new Capture(this, width/2, height/2); //Capture Video
  opencv = new OpenCV(this, width/2, height/2); //Create OpenCV
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); // Set to Frontal Face
  video.start(); //Start Video
  gridCounter = 15; //Number of Grid Rows
  Ani.init(this);
  Ani.setDefaultEasing(Ani.QUAD_IN_OUT);
  initGrid(); //Init first Objects
}

void draw(){
  background(#c0bbbf);
  //Manage the light of the scene
  lightFalloff(1.0, 0.005, 0.0);
  ambientLight(179, 174, 171);
  ambient(#b3aeab);
  lightSpecular(206, 214, 217);
  specular(206, 214, 217);
  shininess(1.0); 
  pushMatrix(); 
  scale(2);
  opencv.loadImage(video); //Load Webcam to OpenCV
  opencv.flip(OpenCV.HORIZONTAL);
  Rectangle[] faces = opencv.detect(); //Create list of Faces
  //Set position of face to center of Light
  for (int i = 0; i < faces.length; i++) {
    lightCenterX = faces[i].x+50;
    lightCenterY = faces[i].y+20;
    lightWidth = faces[i].width/2;
   }
  if (faces.length == 0){
    thisAniLight = Ani.to(this, 0.5f, "lightCenterX", width/4);
    thisAniLight = Ani.to(this, 0.5f, "lightCenterY", height/4);
    lightWidth = 60;
  }
  pointLight(201, 205, 232, lightCenterX, lightCenterY, lightWidth); //Setup LIght
  
  popMatrix();
  for (int i = 0; i < cubes.size(); i++) {
    Cube cub = cubes.get(i);
    cub.Display(); //Display Cubes
  }
}

void initGrid(){
  float gridX,gridY;
  rectMode(CENTER);
  //Calculate Grid
  for (int i = 1; i < gridCounter; i++) {
    for (int j = 1; j < gridCounter; j++) {
      gridX = width/gridCounter*i;
      gridY = height/gridCounter*j;
      cubes.add(new Cube(gridX,gridY)); //Create Objects
    }
  }
}

void captureEvent(Capture c) {
  c.read();
}