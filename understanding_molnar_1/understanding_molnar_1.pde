import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

boolean positive;

ArrayList<Trapez> trapezes = new ArrayList<Trapez>();

PVector v1,v2,v3,v4;
int gridCounter;
float chaos;
boolean record;
boolean recordToggle;

boolean displayControl = false;

int timeDelay = 600; //milliseconds in one minute
int time = 0;

void setup() {
  chaos = 0; //Initial Chaosnumber
  positive = true; //Chaos will increase
  Ani.init(this);
  Ani.setDefaultEasing(Ani.QUAD_IN_OUT);
  smooth();
  size(1000, 1000);
  gridCounter = 15; //Number of Rows
  drawGrid(); //Create the first Objects
}

void draw(){
  background(230);
  // Loop for displaying the Objects
  for (int i = 0; i < trapezes.size(); i++) {
    Trapez trap = trapezes.get(i);
    trap.display();
  }
  //Roll dice wich and if object should be modified
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
    time=millis();
    //Check if Chaos is smaller than 100. If so, increase number.
    if (chaos <= 100 && positive){
      chaos += 1;
    }
    else {
      positive = false;
      chaos -= 1;
    }
    if (!positive && chaos <= 0){
      positive = true;
    }
  }
}

void drawGrid(){
  float gridX,gridY;
  background(230);
  rectMode(CENTER);
  //Calculate the grid
  for (int i = 1; i < gridCounter; i++) {
    for (int j = 1; j < gridCounter; j++) {
      gridX = width/gridCounter*i;
      gridY = height/gridCounter*j;
      trapezes.add(new Trapez(gridX,gridY,gridCounter,chaos)); //Add new Object and its position
    }
  }
  for (int i = 0; i < trapezes.size(); i++) {
    Trapez trap = trapezes.get(i);
    trap.reCalcDisplay(); //Display the frist Objects
  }
}