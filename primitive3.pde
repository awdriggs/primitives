Atom[] grid;
int numCirc, gridSize;
int cols, rows;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  background(0);

  gridSize = 50;
  cols = width/gridSize; //ten right now
  rows = height/gridSize;
  numCirc = rows * cols;

  grid = new Atom[numCirc];
  int index = 0;

  for(int i = 0; i < cols; i++) {
    for(int j = 0; j < rows; j++) {
      int x = i*gridSize;
      int y = j*gridSize;
      
      //fill(100);
      //ellipse(x+gridSize/2, y+gridSize/2, gridSize, gridSize); //grid debug
      
      grid[index] = new Atom();
      grid[index].start(gridSize, x, y);

      index++;
    }
  }
  //fill(150);
  //ellipse(width/2, height/2, boundRad*2, boundRad*2);
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  
  for(int i = 0; i < numCirc; i++) {
    grid[i].update();
  }
}

class Atom {
  int boundRad;
  float x, y;
  int radius;
  int xOrigin, yOrigin;
  boolean inside = false;

  void start(int bsize, int bx, int by) {
    xOrigin = bx;
    yOrigin = by;
    boundRad = bsize/2; 

    radius = bsize/2;
  }

  void insider(float dx, float dy) {
    inside = false;

    if((sq(dx - xOrigin) + sq(dy - yOrigin))<= sq(boundRad-radius/2)) {
      inside = true;
    } 
    else {
      inside = false;
    }
  }

  void setRandom() {
    x = random(xOrigin-boundRad-radius, xOrigin+boundRad);
    y = random(yOrigin-boundRad-radius, yOrigin+boundRad);
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
      ellipse(x+radius, y+radius, radius, radius);
    }
  }
}

