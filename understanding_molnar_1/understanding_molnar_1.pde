import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

import processing.pdf.*;

boolean positive;

ArrayList<Trapez> trapezes = new ArrayList<Trapez>();

PVector v1,v2,v3,v4;
int gridCounter;
float wobbly;
boolean record;
boolean recordToggle;

boolean displayControl = false;

int timeDelay = 600; //milliseconds in one minute
int time = 0;

void setup() {
  wobbly = 0;
  positive = true;
  Ani.init(this);
  Ani.setDefaultEasing(Ani.QUAD_IN_OUT);
  smooth();
  size(1000, 1000);
  gridCounter = 15;
  drawGrid();
}

void draw(){
  background(230);
  for (int i = 0; i < trapezes.size(); i++) {
    Trapez trap = trapezes.get(i);
    trap.display();
  }
  if(millis()-time>=timeDelay){
    timeDelay = int(random(1000,3000));
    int dice1 = int(random(0,trapezes.size()));
    int dice2 = int(random(0,trapezes.size()));
    int dice3 = int(random(0,trapezes.size()));
    int dice4 = int(random(0,trapezes.size()));
    int dice5 = int(random(0,trapezes.size()));
    for (int i = 0; i < trapezes.size(); i++) {
      if (i == dice1 || i == dice2 || i == dice3 || i == dice4 || i == dice5 ){
      Trapez trap = trapezes.get(i);
      trap.animDisplay();
      }
    }
    //print(wobbly);
    time=millis();
    if (wobbly <= 100 && positive){
      wobbly += 1;
    }
    else {
      positive = false;
      wobbly -= 1;
    }
    if (!positive && wobbly <= 0){
      positive = true;
    }
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