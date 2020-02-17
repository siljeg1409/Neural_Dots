class Obstacle {
 
  float X = 0;
  float Y = 0;
  float Height = 0;
  float Width;
  
  Obstacle(float x, float y, float w, float h) {
    X = x;
    Y = y;
    Height = h;
    Width = w;
    
    
  }
  
  void Show() {
    fill(100);
    rect(X, Y, Width, Height);
  }
  
}
