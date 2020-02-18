class Manager {
  Dot[] dots;

  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
  boolean allDead = true;
  float sumFitness = 0;
  float bestDotFitness = 0;
  int bestDotIndex = 0;
  int generationCount = 1;
  
  Manager(int size) {
    generateDots(size);
    generateObstacles();
  }
  
//--------------------------------------------------------------------------------------------
  void generateDots(int size) {
     dots = new Dot[size];
    for (int i = 0; i< size; i++) {
      dots[i] = new Dot();
    }
  }
  
  void generateObstacles() {
    obstacles.add(new Obstacle(0, 100, 300, 10));
    //obstacles.add(new Obstacle(300, 100, 10, 200));
    obstacles.add(new Obstacle(200, 400, 600, 10));
    //obstacles.add(new Obstacle(200, 200, 10, 200));
    obstacles.add(new Obstacle(0, 600, 400, 10));
    //obstacles.add(new Obstacle(50, 200, 150, 10));
    //obstacles.add(new Obstacle(0, 50, 10, 100));
}
  
//--------------------------------------------------------------------------------------------
   
   
 //show all dots and obstacles
  void Run() {
    background(255);
    showObstacles();
    showDots();
    showGoal();
    
    if(allDead){
      print("\nGENERATION: " + generationCount);
      dots = nextGeneration();
    }
  }
  
  void showObstacles() {
      for (Obstacle o : obstacles){
        o.Show();
    }
  }

  void showDots() {
    allDead = true;
    for (int i = 0; i < dots.length; i++) {
      checkDotPosition(dots[i]);
        if(!dots[i].isDead) 
        {
          dots[i].Move();
          allDead = false;
        }
        else if ((dots[i].isDead || dots[i].isReachedGoal) && !dots[i].isCalculated)
        {
          dots[i].isCalculated = true;
          float dotFitness = dots[i].CalculateFitness();
          sumFitness += dotFitness;
          if(bestDotFitness < dotFitness)
          {
            bestDotFitness = dotFitness;
            bestDotIndex = i;
          }
        }

        dots[i].Show();
    }
    
  }

  void showGoal() {
    fill(0,255,0);
    rect(goal.x, goal.y, 20, 20);
  }
  
  void checkDotPosition(Dot d) {
    if(d.position.x > width || d.position.x < 0 || d.position.y > height || d.position.y < 0){
       d.isDead = true; 
    } else if(dist(d.position.x, d.position.y, goal.x, goal.y) < 5){
        d.isReachedGoal = true;      
    }
    
    for (Obstacle o : obstacles){
      if(d.position.x > o.X && d.position.x < (o.X + o.Width) && d.position.y > o.Y && d.position.y < (o.Y + o.Height)){
       d.isDead = true; 
      }
    } 
  }
  
  
  
  Dot[] nextGeneration() {
    Dot[] newGenDots = new Dot[dots.length]; 
    Dot parent = dots[bestDotIndex];
    
    newGenDots[0] = new Dot();
    newGenDots[0].brain = parent.brain.Clone();
    newGenDots[0].isBestDot = true;
    newGenDots[0].dotRadius = 10;
    
    for (int i = 1; i< newGenDots.length; i++) {
      //select parent based on fitness
      //Dot parent = selectParent();
      
      Dot baby = new Dot();
      if(parent != null)
        baby.brain = parent.brain.Clone();
      //get baby from them
      newGenDots[i] = baby;
    }
    resetProperties();
    return newGenDots;
    
  }
  
  
  Dot selectParent() {
    float rand = random((sumFitness / 2), sumFitness);
    float runningSum = 0;
    
    for (int i = 0; i < dots.length; i++) {
      runningSum+= dots[i].fitness;
      if (runningSum  > rand) {
        return dots[i];
      }
    }
    print("\nPROBLEM! ");
    return null;
  }
  
  
  void resetProperties()
  {
    generationCount++;
    allDead = false;
    sumFitness = 0;
    bestDotFitness = 0;
    bestDotIndex = 0; 
  }
  
}
