/*
//      ___           ___           ___           ___     
 //     /  /\         /  /\         /  /\         /  /\    
 //    /  /::\       /  /::\       /  /::\       /  /::|   
 //   /  /:/\:\     /  /:/\:\     /  /:/\:\     /  /:|:|   
 //  /  /::\ \:\   /  /:/  \:\   /  /::\ \:\   /  /:/|:|__ 
 // /__/:/\:\_\:\ /__/:/ \__\:| /__/:/\:\_\:\ /__/:/_|::::\
 // \__\/  \:\/:/ \  \:\ /  /:/ \__\/  \:\/:/ \__\/  /~~/:/
 //      \__\::/   \  \:\  /:/       \__\::/        /  /:/ 
 //      /  /:/     \  \:\/:/        /  /:/        /  /:/  
 //     /__/:/       \__\::/        /__/:/        /__/:/   
 //     \__\/            __         \__\/         \__\/    
 // 
 // adam driggers 2012
 // adamdriggers.com
 */

ArrayList verts= new ArrayList();
float circRadius = 10;
int currentIndex = 1;
PVector drawVect = new PVector();
boolean greenLight = true;
boolean go = false;

void setup() {
  size(500, 500);
  smooth();
  background(0);
  //fill(255);
  //noLoop();
  stroke(255);
  noFill();
  //noStroke();
  noCursor();
}

void draw() {
  background(0);
  stroke(100);
  ellipse(mouseX, mouseY, 2*circRadius, 2*circRadius);

  if (go == true){ //&& currentIndex < verts.size()) {
    for (int i = 1; i < (currentIndex); i++) {
      stroke(255);
      drawVect = (PVector) verts.get(i);
      ellipse(drawVect.x, drawVect.y, 2*circRadius, 2*circRadius);
    }
    //currentIndex++;
  }

  if (currentIndex < verts.size()){
   currentIndex++; 
  }

  //delay(100);
}

void mousePressed() {
  //clear the arrayList
  //saveFrame();
  ////println("clear");
  go = false;
  verts.clear();
  verts.add(new PVector(mouseX, mouseY));
  currentIndex = 0;
  
}

void mouseReleased() {
  //do the calculations, still use draw to do the drawing of the circs?
  ////println("calc");
  //verts.add(new PVector(mouseX, mouseY));  // Start by adding one element
  greenLight = true;
  for (int i = 0; i < 1000 && greenLight == true; i++) {
    PVector seedVect = (PVector) verts.get(i);
    ////println("seedVect: " +seedVect);
    int seedSize = verts.size()-1;
    ////println("seedSize: " + seedSize);
    create(seedVect, seedSize);
  }
  //println(verts.size());

  currentIndex = 1;
  go = true;
}


//fuctions to add
//1. mouse clicked, clears the array list
//2. mouse released, creates the first vertices at mouse x y, then calculates the array
//3. output, create a images when the arraylist has concluded, could these be sent to a website for display?

//CREATE
//creates a new vertice to put in the arrayList
//will not pass a vertice until it has been confirmed to not intersect other vertices

void create(PVector vPrev, int arraySize) {

  boolean checkup;
  PVector temp = reSetter(vPrev);

  int counter = arraySize;
  int fail = 0;
  //println("arraySize" + arraySize);
  for (int i = counter; i > 0; i--) {
    PVector test = (PVector) verts.get(i);
    checkup = checker(temp, test); 

    if (checkup == false && fail < 50 && greenLight == true) {
      temp = reSetter(vPrev);
      i = counter; 
      fail++;
      ////println("fail #" + fail + " @" +arraySize); //debug
    } 
    else if (fail >= 50) {
      //this will be called after 50 failed attempts to find a good position, endless loop without this.
      greenLight = false;
      //println("redlight"); //debug
    }
  } 
  //this will execute once out of the for loop  
  if (greenLight == true) {
    addVert(temp);
  }
}

//ADDVERT
//Once a vertice has been confirmed to is passes here to add to the arrayList

void addVert(PVector vPrev) {
  PVector temp = vPrev;
  verts.add(temp);
  //ellipse(temp.x, temp.y, 2*circRadius, 2*circRadius); //You could try using this to draw as they are created
}

//RESETTER
//Called at the beginning of create, and anytime create needs a new vertice to test

PVector reSetter(PVector vPrev) {
  PVector prev = vPrev;
  float r = random(TWO_PI); //set random angle
  ////println("angle " + r);
  PVector temp = new PVector();

  temp.x = prev.x + cos(r) * (2*circRadius);
  temp.y = prev.y + sin(r) * (2*circRadius);

  return temp;
}

//CHECKER
//takes two pvectors and checks the distance between the two vectors

boolean checker(PVector current, PVector pVect) {
  boolean checkUp = true;
  PVector checkVect = current;
  PVector arrayVect = pVect;
  boolean insideScreen = true;

  insideScreen = boundry(current);

  float distance = checkVect.dist(arrayVect);
  ////println(distance);

  if (distance > 19 && insideScreen == true) { //19 is 2*circRadius - 1, should be a variable to makethe program more dynamic
    checkUp = true;
  } 
  else if (distance < 19 || insideScreen == false) {
    checkUp = false;
  }

  return checkUp;
}

//BOUNDRY TEST
//like checker, just checks to see if they verts are within the screen boundries,
//0 to 500 for both x and y access
//is called by checker
boolean boundry(PVector current) {
  boolean checkup = true;
  PVector checkVect = current;

  if ((checkVect.x > (500-circRadius)) || (checkVect.y > (500-circRadius)) || (checkVect.x < (0+circRadius*2)) || (checkVect.y < (0+circRadius*2))) {
    //println("ob");
    checkup = false;
  } 

  return checkup;
}


