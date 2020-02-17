class Dot {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Brain brain;
  
  boolean isDead = false;
   
  Dot() {
    brain = new Brain(500);
    position = new PVector(100, 700);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void Show() {
    if(isDead){
      fill(255,0,0);
      ellipse(position.x, position.y, 10, 10);
      return;
    }
    fill(0);
    ellipse(position.x, position.y, 10, 10);
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
  
}
