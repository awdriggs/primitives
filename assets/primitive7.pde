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
// July 8, 2011
*/

int gridSize, radius, scaler; //gridsize is the diameter, among other things
int numCols, numRows;

Column[] Cols;
//int arraySize;
int inside=0;
int xPlace = 0; //used to

void setup() {
  size(500, 500);  
  smooth();
  noStroke();
  //noCursor();
  background(0);
  
  scaler = 10;
  gridSize = width/scaler;
  
  numRows = height/gridSize;
  numCols = width/gridSize;
  radius = gridSize/2;

  
  Cols = new Column[numCols];
  
  for(int i=0; i < numCols; i++){
    
    int x = i*gridSize;
    
    Cols[i] = new Column();
    Cols[i].build(x+radius, numRows, gridSize);
  }
  
}

void draw()
{
  fill(0,10); // used to create the fade effect
  rectMode(CORNER);
  rect(0,0,width,height);
  
  for(int i = 0; i < numCols; i++){
   Cols[i].fall(inside);
  }
  
  inside++; //this is creating the "index" value that each col is using % to check
  
 
}

void mousePressed(){
  /* //this function will reset all on mouse press
    for(int i = 0; i < numCols; i++){
    Cols[i].reset();
    }
  */
  
  //this function will reset the column that is clicked
  
  float holder = mouseX;
  holder = map(holder, 0, width, 0, numCols);
  int xPlace = floor(holder);
  Cols[xPlace].reset();
  //println(xPlace); //use to check the xplace on the grid
  
  }

class Circ {
  int x, y;
  int diameter;
  int shade;

  void start(int xpos, int ypos, int dia, int sh) {
    x = xpos;
    y = ypos;
    diameter = dia;
    shade = sh;
    
    fill(shade);
    ellipse(x, y, diameter, diameter);
  }
  
  void update() {
    
      shade = 255;
      fill(shade);
      ellipse(x, y, diameter, diameter);
  }
}

class Column {
  int numCirc;
  int colX;
  int colY;
  int gridCol;
  Circ[] colCirc;
  int fallRate = 2;
  int index = 0;
 
 //column builder
  void build(int xpos, int colH, int grid) {
    numCirc = colH;
    colX = xpos;
    gridCol = grid;
    colCirc = new Circ[numCirc];
    
    //println("grid:" + gridCol);
    //println("colH:" + numCirc);
    
    for(int i = 0; i < numCirc; i++){
       
       colY = i * gridCol+radius;
       
       colCirc[i] = new Circ();
       colCirc[i].start(colX, colY, gridCol, 0);
    } 
    
    reset();
  } 
  
  void fall(int fIndex){
    
    if(fIndex%fallRate == 0){
      colCirc[index].update();
      index++;
     }
     
     if(index > numRows-1){
       index = 0;
       //reset(); //this statement could be used to change the rate after each "drop"
     }
  }
  
  void reset(){
    float floR = random(5, 20);
    fallRate = int(floR);
  }
}

