class Manager {
  Dot[] dots;
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
  
  boolean allDead = true;
  
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
    obstacles.add(new Obstacle(300, 100, 10, 200));
    obstacles.add(new Obstacle(200, 400, 600, 10));
    obstacles.add(new Obstacle(200, 200, 10, 200));
    obstacles.add(new Obstacle(0, 600, 600, 10));
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
    
    //if(allDead)
      //print("NO MORE DOTS!");
  }
  
  void showObstacles() {
      for (Obstacle o : obstacles){
        o.Show();
    }
  }

  void showDots() {
    allDead = true;
      for (Dot d : dots){
        checkDotPosition(d);
        if(!d.isDead){
          d.Move();
          allDead = false;
        }
        d.Show();
    }
  }

  void showGoal() {
    fill(0,255,0);
    rect(50, 40, 20, 20);
  }
  
  void checkDotPosition(Dot d) {
    if((d.position.x + 10) > width || (d.position.x - 10) < 0 || (d.position.y + 10) > height || (d.position.y - 10) < 0){
       d.isDead = true; 
    }
    
    for (Obstacle o : obstacles){
      if((d.position.x + 10) > o.X && (d.position.x + 10) < (o.X + o.Width) && (d.position.y + 10) > o.Y && (d.position.y - 10) < (o.Y + o.Height)){
       d.isDead = true; 
      }
    }
    
  }
  
}
