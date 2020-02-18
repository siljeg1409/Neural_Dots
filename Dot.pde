class Dot {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Brain brain;
  
  boolean isDead = false;
  boolean isReachedGoal = false;
  boolean isCalculated = false;
  boolean isBestDot = false;
  
  float fitness = 0;
  float dotRadius = 5;
  
  Dot() {
    brain = new Brain(500);
    position = new PVector(100, 700);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

//---------------------------------------------------------------------------------------------------
  void Show() {
    
    //change colors of dot if dead, reached goal, best, or traveling
    if(isDead)
    {
      fill(255, 0, 0);
    } 
    else if (isReachedGoal) 
    {
      fill(0, 0, 255);
    } 
    else if (isBestDot) 
    {
      fill(0, 255, 0);
    } 
    else 
    {
      fill(0);
    }
    
    //draw dot
    ellipse(position.x, position.y, dotRadius, dotRadius);
  }
  
  void Move() {
   if (brain.directions.length > brain.step) {//if there are still directions left then set the acceleration as the next PVector in the direcitons array
      acceleration = brain.directions[brain.step];
      brain.step++;
    } else {//if at the end of the directions array then the dot is dead
      isDead = true;
    }
   
   velocity.add(acceleration);
   velocity.limit(5);
   position.add(velocity);
  }
//---------------------------------------------------------------------------------------------------

  float CalculateFitness() {
    
    if(isReachedGoal) {
      fitness = 1.0 / (float)(brain.step * brain.step);
      //print("fitness 1 calculated: " + fitness);
    }
    else {
      float distanceToGoal = dist(position.x, position.y, goal.x, goal.y);
      fitness = 1.0 / (distanceToGoal * distanceToGoal);
      //print("fitness 2 calculated: " + fitness);
    }
    
    return fitness;
    
  }
  
//---------------------------------------------------------------------------------------------------
}
