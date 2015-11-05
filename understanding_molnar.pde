
int gridCounter;

void setup() {
  size(800, 800);
  gridCounter = 6;
  frameRate(2);
  drawGrid();
}
void draw() {
}

void drawGrid(){
  float gridX,gridY;
  rectMode(CENTER);
  for (int i = 1; i < gridCounter; i++) {
    for (int j = 1; j < gridCounter; j++) {
      gridX = width/2*i;
      gridY = height/2*i;
      noFill();
      rect(width/gridCounter*i,height/gridCounter*j,60,60);
    }
  }
}