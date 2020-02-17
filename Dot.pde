class Dot {
   float x_pos;
   float y_pos;
   
  Dot() {
   x_pos = 400;
   y_pos = 800;
  }
  
  void Show() {

  float rand_x = random(-20, 20);
  float rand_y = random(-20, 20);
  
  if((x_pos + rand_x + 10) > width || (x_pos + rand_x - 10) < 0){
     rand_x *= -1; 
  }
 
 if((y_pos + rand_y + 10) > height || (y_pos + rand_y - 10) < 0) {
    rand_y *= -1; 
 }
  
  fill(0);
  x_pos += rand_x;
  y_pos += rand_y;
  ellipse(x_pos, y_pos, 10, 10);
  }
  
}
