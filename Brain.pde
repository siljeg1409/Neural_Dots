class Brain {
  PVector[] directions;
  
  int step = 0;
  
  Brain(int size) {
   directions = new PVector[size];
   randomize();
  }
  
  void randomize() {
    for (int i = 0; i< directions.length; i++) {
      float randomAngle = random(2*PI);
      directions[i] = PVector.fromAngle(randomAngle);
    }
  }
  
  
  //returns a copy of this brain object with a mutation for next generatin
  Brain Clone() {
    Brain clone = new Brain(directions.length);
    for (int i = 0; i < directions.length; i++) {
      clone.directions[i] = directions[i].copy();
    }
    clone.mutate();
    return clone;
  }

  void mutate() {
    float mutationRate = 0.01;//chance that any vector in directions gets changed
    for (int i = 0; i < directions.length; i++) {
      float rand = random(1);
      if (rand < mutationRate) {
        //set this direction as a random direction 
        float randomAngle = random(2*PI);
        directions[i] = PVector.fromAngle(randomAngle);
      }
    }
  }

}
