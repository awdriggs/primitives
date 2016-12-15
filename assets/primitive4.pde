int gCounter = 0;
int limiter = 10000;
float startDia;
float sCenterX, sCenterY;
Fractal[] children = new Fractal[limiter];

void setup() {
  size(500, 500);
  background(0);
  smooth();
  //noStroke();



  startDia = width/3;
  sCenterX = width/2;
  sCenterY = height/2;

  children[gCounter] = new Fractal(sCenterX, sCenterY, startDia, 0);
  //gCounter++;
}


void draw() {
  delay(1000);
}

void mouseMoved() {
  for(int i = 0; i <= gCounter; i++) {
    children[i].mouseTest();
    
    //if(
    //println(gCounter);
  }
}

class Fractal {
  int count = 0;

  float centerX, centerY;
  float diameter;

  int type;

  //constructor
  Fractal(float x, float y, float dia, int cast) {
    centerX = x;
    centerY = y;
    diameter = dia;
    type = cast;

    fill(255);
    ellipse(centerX, centerY, diameter, diameter);
  }
  void mouseTest() {
    //test to see if the circle has been clicked
    //if true increase count
    //run addFractal

    if(mouseX >= (centerX - diameter/2) && mouseX <= (centerX + diameter/2) 
      && mouseY >= (centerY - diameter/2) && mouseY <= (centerY + diameter/2)) {
      count++;
      addFractal();
      
      //return true;
    }
  } 

  void addFractal() {
    //called when mousepressed test is true
    //create new fractal, count determines positioning
    //this fractals gridsize/2 will be the new fractals gridsize

    //center type
    if (type == 0) {
      if(count == 1) {
        left();
      } 
      else if(count == 2) {
        top();
      } 
      else if(count == 3) {
        right();
      }
      else if(count == 4) {
        bottom();
      }
      else {
      }
    }

    //left type
    if (type == 1) {
      if(count == 1) {
        left();
      } 
      else if(count == 2) {
        top();
      } 
      else if(count == 3) {
        bottom();
      }
      else {
      }
    } 
    
    //top type
     if (type == 3) {
      if(count == 1) {
        left();
      } 
      else if(count == 2) {
        top();
      } 
      else if(count == 3) {
        right();
      }
      else {
      }
    }
    
    //right type
     if (type == 2) {
      if(count == 1) {
        bottom();
      } 
      else if(count == 2) {
        top();
      } 
      else if(count == 3) {
        right();
      }
      else {
      }
    }
    
    //bottom type
     if (type == 4) {
      if(count == 1) {
        left();
      } 
      else if(count == 2) {
        bottom();
      } 
      else if(count == 3) {
        right();
      }
      else {
      }
    }
  }

  void left() {
    gCounter++;
    children[gCounter] = new Fractal(centerX - diameter/2-(diameter/4), centerY, diameter/2, 1);
  }
  void right() {
     gCounter++;
     children[gCounter] = new Fractal(centerX + diameter/2+(diameter/4), centerY, diameter/2, 2);
  }
  void top() {
    gCounter++;
    children[gCounter] = new Fractal(centerX, centerY - diameter/2-(diameter/4), diameter/2, 3);
  }
  
  void bottom() {
    gCounter++;
    children[gCounter] = new Fractal(centerX, centerY + diameter/2+(diameter/4), diameter/2, 4);
  }
}

