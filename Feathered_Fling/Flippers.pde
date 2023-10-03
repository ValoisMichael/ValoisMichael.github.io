class Flipper {
  PVector position;
  float width;
  float height;
  boolean isLeft;
  float rotationSpeed;
  float angle = 0;
  

  Flipper(PVector position, float width, float height, boolean isLeft, float rotationSpeed) {
    this.position = position.copy();
    this.width = width;
    this.height = height;
    this.rotationSpeed = radians(rotationSpeed);
    this.isLeft = isLeft;
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    fill(#684c4e);
    rect(-width / 2, -10, width, height);
    popMatrix();
  }

  void update() {
    // Limit maximum angle for flippers
    if (!isLeft) {
      angle = constrain(angle, -PI/4, PI/4);
    }
    angle *= 0.9;
  }

  void flip() {
    // Flip flipper upwards when key is pressed
    if (isLeft) {
      angle += rotationSpeed;
    } else {
      angle -= rotationSpeed;
    }
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
