import processing.pdf.*;

PVector v1,v2,v3,v4,v5;
int gridCounter;

void setup() {
  size(700, 800);
  beginRecord(PDF, second()+"_"+"molnar.pdf"); 
  gridCounter = 12;
  background(230);
  drawGrid();
  endRecord();
}
void draw() {
}

void drawGrid(){
  float gridX,gridY;
  rectMode(CENTER);
  for (int i = 1; i < gridCounter; i++) {
    for (int j = 1; j < gridCounter; j++) {
      gridX = width/gridCounter*i;
      gridY = height/gridCounter*j;
      noFill();
      //rect(width/gridCounter*i,height/gridCounter*j,width/gridCounter,width/gridCounter);
      drawPoly(gridX,gridY);
    }
  }
}

void drawPoly(float _gridX, float _gridY){
  float centerX = _gridX;
  float centerY = _gridY;
  
  float wobbly = 6;
  
  v1 = new PVector(random(-10*wobbly,3*wobbly),-50);
  v2 = new PVector(random(3*wobbly,10*wobbly),-50);
  v3 = new PVector(random(3*wobbly,10*wobbly),0);
  v4 = new PVector(random(-10*wobbly,3*wobbly),0);
  
  pushMatrix();
  translate(centerX, centerY);
  strokeWeight(2);
  line(v1.x,v1.y,v2.x,v2.y);
  line(v2.x,v2.y,v3.x,v3.y);
  line(v3.x,v3.y,v4.x,v4.y);
  line(v4.x,v4.y,v1.x,v1.y);
  popMatrix();
  
}