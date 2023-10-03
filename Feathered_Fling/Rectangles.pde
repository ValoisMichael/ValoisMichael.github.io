class Rectangle {
  PVector position;
  float width;
  float height;
  float angle;
  int colour;
  
  Rectangle(PVector position, float width, float height, float angle, int colour) {
    this.position = position.copy();
    this.width = width;
    this.height = height;
    this.angle = -radians(angle);
    this.colour = colour;
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    rect(-width/2, -height/2, width, height);
    popMatrix();
  }
  
  PVector normal() {
    // Calculate components of normal vector and return it normalized
    float normalX = cos(-angle);
    float normalY = sin(-angle);
    PVector normalVector = new PVector(normalX, normalY);
    normalVector.normalize();
    return normalVector;
  }
}
