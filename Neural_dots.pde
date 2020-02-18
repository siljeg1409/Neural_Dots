Manager mngr;
PVector goal  = new PVector(40, 20);

void setup() {
  
  size(800, 750); // window size
  frameRate(200);  // frame rate 
  mngr = new Manager(1000); // Specify number of dots per iteration
  
}

void draw() { 
  mngr.Run(); 
}
