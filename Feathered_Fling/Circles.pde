class Circle {
  PVector position;
  float radius; 
  int points;
  
  Circle(PVector position, float radius, int points) {
    this.position = position.copy();
    this.radius = radius;
    this.points = points;
  }
  
  void display() {
    ellipse(position.x, position.y, radius * 2, radius * 2);
  }
}
