

Population dotPopulation;

void setup() {
  size(800, 800);
  frameRate(20);
  dotPopulation = new Population(1000);
}


void draw() { 
  
  background(255);
  dotPopulation.Show();
 
}
