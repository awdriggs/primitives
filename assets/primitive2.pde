int diameter, radius;
float x1, x2;
int direction = 1;
float speedX;

void setup(){
 size(500,500);
 noStroke();
 smooth();
 diameter = 100;
 radius = diameter/2;
 x1 = radius;
 speedX = .25;
}

void draw(){
 background(0);
   if(x1 > width-radius || x1 < 0 + radius){
    direction = direction * -1;
  
     x1  = x1 + ( speedX * direction );
  
  } else {
    x1  = x1 + ( speedX * direction );
  }
   
   fill(255); 
   ellipse(x1, height/2, diameter, diameter);
 
   x2 = map(x1, 0, width, diameter+radius/2, width-diameter-radius/2);
   fill(0);
   ellipse(x2, height/2, diameter, diameter);  
}


