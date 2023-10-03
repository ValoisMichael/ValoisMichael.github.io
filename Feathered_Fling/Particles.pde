class Particle {
  PVector position;
  PVector velocity;
  int lifespan;

  Particle(PVector position) {
    this.position = position.copy();
    this.velocity = PVector.random2D().mult(random(1, 2));
    this.lifespan = 250;
  }

  void update() {
    position.add(velocity);
    lifespan--;
  }

  void display() {
    noStroke();
    fill(#052c28, lifespan);
    ellipse(position.x, position.y, random(5, 10), random(5, 10));
  }

  boolean isDead() {
    return lifespan <= 0;
  }
}
