import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

import processing.pdf.*;
import controlP5.*;


ControlP5 cp5;
ArrayList<Trapez> trapezes = new ArrayList<Trapez>();

PVector v1,v2,v3,v4;
int gridCounter;
float wobbly;
boolean record;
boolean recordToggle;

boolean displayControl = true;

int timeDelay = 600; //milliseconds in one minute
int time = 0;

void setup() {
  Ani.init(this);
  Ani.setDefaultEasing(Ani.QUAD_IN_OUT);
  smooth();
  size(700, 800);
  gridCounter = 10;
  wobbly = 1;
  
  cp5 = new ControlP5(this);
  cp5.addSlider("wobbly")
     .setPosition(35,height-35)
     .setRange(0,50)
     .setSize(200,30)
     .setValue(0)
     ;
  cp5.addButton("engage")
     .setValue(0)
     .setPosition(310,height-35)
     .setSize(100,30)
     ;
  cp5.addToggle("recordToggle")
     .setValue(0)
     .setPosition(480,height-35)
     .setSize(100,30)
     ;
  drawGrid();
}

void draw(){
  background(230);
  for (int i = 0; i < trapezes.size(); i++) {
    Trapez trap = trapezes.get(i);
    trap.display();
  }
  if(millis()-time>=timeDelay){
    int dice = int(random(0,trapezes.size()));
    for (int i = 0; i < trapezes.size(); i++) {
      if (i == dice){
      Trapez trap = trapezes.get(i);
      trap.animDisplay();
      }
  }
    time=millis();
   }
  if (displayControl == false) {
    cp5.hide();
  }
  else {
    cp5.show();
  }
}

public void engage() {
  background(230);
  print(trapezes.size()+" ");
  record = true;
      for (int i = 0; i < trapezes.size(); i++) {
    Trapez trap = trapezes.get(i);
    trap.reCalcDisplay();
  }
}

void drawGrid(){
    if (record && recordToggle) {
    beginRecord(PDF,month()+"_"+day()+"_"+hour()+minute()+"_"+second()+".pdf"); 
  }
  float gridX,gridY;
  background(230);
  rectMode(CENTER);
  for (int i = 1; i < gridCounter; i++) {
    for (int j = 1; j < gridCounter; j++) {
      gridX = width/gridCounter*i;
      gridY = height/gridCounter*j;
      trapezes.add(new Trapez(gridX,gridY,gridCounter,wobbly));
    }
  }
  for (int i = 0; i < trapezes.size(); i++) {
    Trapez trap = trapezes.get(i);
    trap.reCalcDisplay();
  }
    if (record) {
    endRecord();
    record = false;
  }
}

void keyPressed() {
  if (key == 'a') {
    displayControl = false;
  }
  if (key == 's') {
    displayControl = true;
  }
}