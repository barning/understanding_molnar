import processing.pdf.*;
import controlP5.*;

ControlP5 cp5;

PVector v1,v2,v3,v4;
int gridCounter;
float wobbly;
boolean record;

void setup() {
  size(700, 800);
  gridCounter = 10;
  wobbly = 1;
  
  cp5 = new ControlP5(this);
  cp5.addSlider("wobbly")
     .setPosition(20,height-50)
     .setRange(0,50)
     .setSize(200,30)
     .setValue(0)
     ;
  cp5.addButton("engage")
     .setValue(0)
     .setPosition(300,height-50)
     .setSize(100,30)
     ;
  
  drawGrid();
}

void draw(){
}

public void engage(int theValue) {
  record = true;
  drawGrid();
}

void drawGrid(){
    if (record) {
    beginRecord(PDF,month()+"_"+day()+"_"+hour()+minute()+"_"+second()+".pdf"); 
  }
  float gridX,gridY;
  background(230);
  rectMode(CENTER);
  for (int i = 1; i < gridCounter; i++) {
    for (int j = 1; j < gridCounter; j++) {
      gridX = width/gridCounter*i;
      gridY = height/gridCounter*j;
      drawPoly(gridX,gridY);
    }
  }
    if (record) {
    endRecord();
    record = false;
  }
}

void drawPoly(float _gridX, float _gridY){
  float centerX = _gridX;
  float centerY = _gridY;
  float leftTop = (width/gridCounter)/2;
  
  v1 = new PVector(0-leftTop+random(-wobbly,wobbly),0-leftTop);
  v2 = new PVector(leftTop+random(-wobbly,wobbly),0-leftTop);
  v3 = new PVector(leftTop+random(-wobbly,wobbly),leftTop);
  v4 = new PVector(0-leftTop+random(-wobbly,wobbly),leftTop);
  
  pushMatrix();
  translate(centerX, centerY);
  noFill();
  strokeWeight(1);
  beginShape();
  vertex(v1.x,v1.y);
  vertex(v2.x,v2.y);
  vertex(v3.x,v3.y);
  vertex(v4.x,v4.y);
  endShape(CLOSE);
  popMatrix();
  
}