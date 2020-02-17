class Population {
  Dot[] dots;
  
  Population(int size) {
    dots = new Dot[size];
    for (int i = 0; i< size; i++) {
      dots[i] = new Dot();
    }
  }
  
  
  //show all dots
  void Show() {
    for (int i = 0; i< dots.length; i++) {
      dots[i].Show();
    }
  }
  
}
