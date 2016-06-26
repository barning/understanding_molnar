class Cube {
  float myCenterX;
  float myCenterY;
  
  Ani thisAni;
  
  Cube(float centerX, float centerY){
    myCenterX = centerX;
    myCenterY = centerY+random(-10,10);
  }
  
  void Display(){
  noStroke();
  pushMatrix();
  translate(myCenterX,myCenterY,0);
  fill(10);
  box(40,40,0);
  popMatrix();
    
  }
  
  void animDisplay(){
        float randomY = myCenterY + random(-5,5);
        thisAni = Ani.to(this, 0.2f, "myCenterY", randomY);
  }
}