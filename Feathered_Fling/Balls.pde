class Ball {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float radius;
  
  Ball(PVector position, PVector velocity, float radius) {
    this.position = position.copy();
    this.velocity = velocity.copy();
    this.acceleration = new PVector(0, 0);
    this.radius = radius;
  }
  
  void display() {
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  void gravity(PVector gravity) {
    acceleration.add(gravity);
  }
    
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.set(0,0);
  }
  
  boolean collide(Rectangle rect) {
    // Transform circle to rotated rectangle
    float dx = position.x - rect.position.x;
    float dy = position.y - rect.position.y;
    float cosAngle = cos(-rect.angle);
    float sinAngle = sin(-rect.angle);
    float rotatedX = cosAngle * dx - sinAngle * dy;
    float rotatedY = sinAngle * dx + cosAngle * dy;

    // Clamp circle to rectangle
    float halfWidth = rect.width / 2;
    float halfHeight = rect.height / 2;
    float closestX = constrain(rotatedX, -halfWidth, halfWidth);
    float closestY = constrain(rotatedY, -halfHeight, halfHeight);

    // Calculate distance between circle and closest point
    float distanceSquared = (rotatedX - closestX) * (rotatedX - closestX) + (rotatedY - closestY) * (rotatedY - closestY);

    // Check for collision
    return distanceSquared <= (radius * radius);
  }  
  
  boolean flipCollide(Flipper flip) {
    // Transform circle circle to rotated flipper
    float dx = position.x - flip.position.x;
    float dy = position.y - flip.position.y;
    float cosAngle = cos(-flip.angle);
    float sinAngle = sin(-flip.angle);
    float rotatedX = cosAngle * dx - sinAngle * dy;
    float rotatedY = sinAngle * dx + cosAngle * dy;

    // Clamp circle to flipper
    float halfWidth = flip.width / 2;
    float halfHeight = flip.height / 2;
    float closestX = constrain(rotatedX, -halfWidth, halfWidth);
    float closestY = constrain(rotatedY, -halfHeight, halfHeight);

    // Calculate distance between circle and closest point
    float distanceSquared = (rotatedX - closestX) * (rotatedX - closestX) + (rotatedY - closestY) * (rotatedY - closestY);

    // Check for collision
    return distanceSquared <= (radius * radius);
  }  

   boolean circleCollide(Circle cir) {
    // Calculate distance between ball and circle and check for collision
    float distance = dist(position.x, position.y, cir.position.x, cir.position.y);
    return distance < (radius + cir.radius);
  }
  
  void bounce(Rectangle rect, float restitution) {
    // Check if vertical rectangle
    if (rect.angle == radians(90) || rect.angle == -radians(90)) {
      velocity.x = -velocity.x;
    }
    
    // Calculate reflection of angled rectangle
    PVector norm = rect.normal();
    float dotProduct = velocity.dot(norm);
    PVector reflectionComponent = PVector.mult(norm, (1 + restitution) * dotProduct);
    PVector reflectedVelocity = PVector.sub(velocity, reflectionComponent);
  
    // Update velocity
    velocity.set(reflectedVelocity);
  }
  void flipBounce(Flipper flip, float restitution) {
    // Calculate reflection of angled flipper
    PVector norm = flip.normal();
    float dotProduct = velocity.dot(norm);
    PVector reflectionComponent = PVector.mult(norm, (1 + restitution) * dotProduct);
    PVector reflectedVelocity = PVector.sub(velocity, reflectionComponent);
  
    // Update velocity
    velocity.set(reflectedVelocity);
  }
  
  void circleBounce(Circle cir) {
    // Calculate dircetion of ball collision and change velocity
    PVector collisionVector = PVector.sub(position, cir.position);
    float collisionAngle = collisionVector.heading();
    float newHorizontalVelocity = cos(collisionAngle) * abs(velocity.mag());
    velocity.set(newHorizontalVelocity, velocity.y * (1+cir.points/10));
  }

  boolean ballCollide(Ball otherBall) {
    // Calculate distance between balls and check for collision
    float distance = PVector.dist(position, otherBall.position);
    return distance < (radius + otherBall.radius);
  }
  
  void ballBounce(Ball otherBall) {
    // Calculate direction of ball to other ball's center
    PVector collisionVector = PVector.sub(position, otherBall.position);
    float collisionAngle = collisionVector.heading();
    
    // Calculate new velocities for each ball based on collision angle
    float thisNewXVel = cos(collisionAngle) * velocity.mag();
    float thisNewYVel = sin(collisionAngle) * velocity.mag();
    float otherNewXVel = cos(collisionAngle + PI) * otherBall.velocity.mag();
    float otherNewYVel = sin(collisionAngle + PI) * otherBall.velocity.mag();
    
    // Set new velocities for both balls
    velocity.set(thisNewXVel, thisNewYVel);
    otherBall.velocity.set(otherNewXVel, otherNewYVel);
  }
}
