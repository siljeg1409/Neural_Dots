class Brain {
  PVector[] directions;
  
  int step = 0;
  
  Brain(int size) {
   directions = new PVector[size];
   randomize();
  }
  
  // test git acc
  // win credentials
  // still no result
  
    void randomize() {
    for (int i = 0; i< directions.length; i++) {
      float randomAngle = random(2*PI);
      directions[i] = PVector.fromAngle(randomAngle);
    }
  }
}
