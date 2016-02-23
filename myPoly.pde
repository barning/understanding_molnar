class Trapez {
  PVector v1,v2,v3,v4;
  float myLeftTop;
  float myCenterX;
  float myCenterY;
  
  Trapez(float centerX, float centerY, int gridCounter, float wobbly){
    myCenterX = centerX;
    myCenterY = centerY;
    myLeftTop = (width/gridCounter)/2;
  }
  
  void reCalcDisplay(){
    v1 = new PVector(0-myLeftTop+random(-wobbly,wobbly),0-myLeftTop);
    v2 = new PVector(myLeftTop+random(-wobbly,wobbly),0-myLeftTop);
    v3 = new PVector(myLeftTop+random(-wobbly,wobbly),myLeftTop);
    v4 = new PVector(0-myLeftTop+random(-wobbly,wobbly),myLeftTop);
    pushMatrix();
    translate(myCenterX, myCenterY);
    noFill();
    strokeWeight(1);
    scale(0.6);
    beginShape();
    vertex(v1.x,v1.y);
    vertex(v2.x,v2.y);
    vertex(v3.x,v3.y);
    vertex(v4.x,v4.y);
    endShape(CLOSE);
    popMatrix();
  }
  
  void display(){
    pushMatrix();
    translate(myCenterX, myCenterY);
    noFill();
    strokeWeight(1);
    scale(0.6);
    beginShape();
    vertex(v1.x,v1.y);
    vertex(v2.x,v2.y);
    vertex(v3.x,v3.y);
    vertex(v4.x,v4.y);
    endShape(CLOSE);
    popMatrix();
  }
}