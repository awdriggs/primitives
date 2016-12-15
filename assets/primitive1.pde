int boundRad;
float x, y;
int radius;
int xOrigin, yOrigin;
boolean inside = false;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  background(0);

  boundRad = width/4;

  xOrigin = width/2;
  yOrigin = width/2;

  radius = boundRad/2;

  //fill(100);
  //ellipse(width/2, height/2, boundRad*2, boundRad*2);
}

void draw() {
  fill(0, 8);
  rect(0, 0, width, height);
  
  update();
  //ellipse(x, y, radius*2, radius*2);
  
}

void setRandom() {
  x = random(xOrigin-boundRad, xOrigin+boundRad);
  y = random(yOrigin-boundRad, yOrigin+boundRad);
}

void insider(float dx, float dy){
  inside = false;
  
  if((sq(dx - xOrigin) + sq(dy - yOrigin))<= sq(boundRad-radius/2)) {
      inside = true;
      //println(inside);
    } 
    else {
      inside = false;
      //println(inside);

    }
  }
  
void update() {
    fill(255);
    setRandom();

    insider(x, y);

    while(inside == false) {
      setRandom();
      insider(x, y);
      //println(inside);
    }

    if(inside == true) {
      ellipse(x, y, radius, radius);
    }
  }
  

