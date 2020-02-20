Manager mngr;
PVector goal  = new PVector(40, 20);

void setup() {
  
  size(800, 750); // window size
  frameRate(100);  // frame rate 
  mngr = new Manager(500); // Specify number of dots per iteration
  
}

void draw() { 
  mngr.Run(); 
}
