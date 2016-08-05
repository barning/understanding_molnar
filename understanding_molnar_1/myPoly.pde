class Trapez {
  PVector v1,v2,v3,v4,anv1,anv2,anv3,anv4;
  float myLeftTop;
  float myCenterX;
  float myCenterY;
  
  Ani thisAniX1,thisAniX2,thisAniX3,thisAniX4;
  Ani thisAniY1,thisAniY2,thisAniY3,thisAniY4;
  
  Trapez(float centerX, float centerY, int gridCounter, float wobbly){
    myCenterX = centerX;
    myCenterY = centerY;
    myLeftTop = (width/gridCounter)/2;
  }
  
  void reCalcDisplay(){
  
    v1 = new PVector(0-myLeftTop+random(-chaos,chaos),0-myLeftTop);
    v2 = new PVector(myLeftTop+random(-chaos,chaos),0-myLeftTop);
    v3 = new PVector(myLeftTop+random(-chaos,chaos),myLeftTop);
    v4 = new PVector(0-myLeftTop+random(-chaos,chaos),myLeftTop);
    
    pushMatrix();
    translate(myCenterX, myCenterY);
    noFill();
    strokeWeight(2);
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
    strokeWeight(2);
    scale(0.6);
    beginShape();
    vertex(v1.x,v1.y);
    vertex(v2.x,v2.y);
    vertex(v3.x,v3.y);
    vertex(v4.x,v4.y);
    endShape(CLOSE);
    popMatrix();
  }
  
  void animDisplay(){
    
    anv1 = new PVector(0-myLeftTop+random(-chaos,chaos),0-myLeftTop);
    anv2 = new PVector(myLeftTop+random(-chaos,chaos),0-myLeftTop);
    anv3 = new PVector(myLeftTop+random(-chaos,chaos),myLeftTop);
    anv4 = new PVector(0-myLeftTop+random(-chaos,chaos),myLeftTop);
    
    thisAniX1 = Ani.to(v1, 0.2f, "x", anv1.x);
    thisAniY1 = Ani.to(v1, 0.2f, "y", anv1.y);
    thisAniX2 = Ani.to(v2, 0.2f, "x", anv2.x);
    thisAniY2 = Ani.to(v2, 0.2f, "y", anv2.y);
    thisAniX3 = Ani.to(v3, 0.2f, "x", anv3.x);
    thisAniY3 = Ani.to(v3, 0.2f, "y", anv3.y);
    thisAniX4 = Ani.to(v4, 0.2f, "x", anv4.x);
    thisAniY4 = Ani.to(v4, 0.2f, "y", anv4.y);
    
  }
}