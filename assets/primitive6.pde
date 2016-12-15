int counter;
int Gdiameter;
int radius;
int numFaders = 5;

Flash[] faders = new Flash[numFaders];

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  background(0);

  Gdiameter = 100;
  radius = Gdiameter/2;

  for(int i = 0; i < numFaders; i++) {
    faders[i] = new Flash(i*Gdiameter+radius, height/2, i+2);
  }
}

void draw() {
  fill(0, 10); // used to create the fade effect
  rectMode(CORNER);
  rect(0,0,width,height);

  counter = second() + 2;
  //println(counter);

  for(int i = 0; i < numFaders; i++) {
    faders[i].on(counter);
  }
}

class Flash {
  int x, y;
  int rate;
  int shade;
  //int diameter;

  Flash(int xValue, int yValue, int frate) {
    x = xValue;
    y = yValue;
    rate = frate;
    shade = 0;
  }

  void on(int fIndex) {
    if(fIndex % rate == 0) {
      shade = 255;
      fill(shade);
      ellipse(x, y, Gdiameter, Gdiameter);
    }
  }
}

