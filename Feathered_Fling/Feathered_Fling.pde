import gifAnimation.*;
import ddf.minim.*;
import java.util.ArrayList;
import processing.core.PApplet;

// Initializing vars globally
float gravity;
float restitution = 0.9;
boolean started;
boolean collision;
int score = 0;

// Initializing ArrayLists globally
ArrayList<Rectangle> rectangles;
ArrayList<Circle> circles;
ArrayList<Integer> colorList;
ArrayList<Ball> balls;
ArrayList<Particle> particles;

// Initializes Audio
Minim minim;
AudioPlayer player;

// Initializing Nest parts
Rectangle nest1;
Rectangle nest2;
Rectangle nest3;
Rectangle nest4;
Rectangle nest5;
Rectangle nest6;
Rectangle nest7;
Rectangle nest8;

// Initializing Flipper globally
Flipper leftFlipper;
Flipper rightFlipper;

// Initializing Emitter and Background
PVector emitter;
Gif backgroundGif;

void setup() {
  // Setting up window and background Gif
  size(600, 800);
  backgroundGif = new Gif(this, "background.gif");
  backgroundGif.loop();
  backgroundGif.play();
  
  // Loads and plays theme
  minim = new Minim(this);
  player = minim.loadFile("theme.mp3");
  player.play();
  
  // Initializing global vars
  gravity = 0.0;
  collision = false;
  started = false;
  
  // Initializing ArrayLists
  balls = new ArrayList<Ball>();
  rectangles = new ArrayList<Rectangle>();
  circles = new ArrayList<Circle>();
  colorList = new ArrayList<Integer>();
  
  // Initializing colors for walls
  colorList.add(color(#083430));
  colorList.add(color(#052c28));
  colorList.add(color(#052c28));
  
  // Creating Balls
  balls.add(new Ball(new PVector(width/2 + 237, height/2 + 330), new PVector(0, 0), 10));
  balls.add(new Ball(new PVector(width/2 - 237, height/2 + 330), new PVector(0, 0), 10));
  
  // Creating Walls
  rectangles.add(new Rectangle(new PVector(width/2 + 200, height/2 + 400), 250, 100, 10, colorList.get(int(random(0, colorList.size())))));
  rectangles.add(new Rectangle(new PVector(width/2 - 200, height/2 + 400), 250, 100, -10, colorList.get(int(random(0, colorList.size())))));
  rectangles.add(new Rectangle(new PVector(width/2, 0), 1000, 100, 0, colorList.get(int(random(0, colorList.size())))));
  rectangles.add(new Rectangle(new PVector(width, height/2 + 400), 2000, 100, 90, colorList.get(int(random(0, colorList.size())))));
  rectangles.add(new Rectangle(new PVector(0, height/2 + 400), 2000, 100, 90, colorList.get(int(random(0, colorList.size())))));
  rectangles.add(new Rectangle(new PVector(width/2, 0), 1000, 100, 20, colorList.get(int(random(0, colorList.size())))));
  rectangles.add(new Rectangle(new PVector(width/2, 0), 1000, 100, -20, colorList.get(int(random(0, colorList.size())))));
  rectangles.add(new Rectangle(new PVector(width/2+150, height/2), 100, 10, 0, color(#684c4e)));
  rectangles.add(new Rectangle(new PVector(width/4, height/3), 100, 10, 50, color(#684c4e)));
  rectangles.add(new Rectangle(new PVector(width/2, height-250), 80, 10, 90, color(#684c4e)));
  
  // Creating Nests
  nest1 = new Rectangle(new PVector(width/2 + 237, height/2 + 340), 50, 9, 12, color(#684c4e));
  nest2 = new Rectangle(new PVector(width/2 + 237, height/2 + 340), 50, 9, -17, color(#684c4e));
  nest3 = new Rectangle(new PVector(width/2 + 237, height/2 + 340), 30, 6, -50, color(#684c4e));
  nest4 = new Rectangle(new PVector(width/2 + 237, height/2 + 340), 30, 6, 60, color(#684c4e));
  nest5 = new Rectangle(new PVector(width/2 - 237, height/2 + 340), 50, 9, 12, color(#684c4e));
  nest6 = new Rectangle(new PVector(width/2 - 237, height/2 + 340), 50, 9, -17, color(#684c4e));
  nest7 = new Rectangle(new PVector(width/2 - 237, height/2 + 340), 30, 6, -50, color(#684c4e));
  nest8 = new Rectangle(new PVector(width/2 - 237, height/2 + 340), 30, 6, 60, color(#684c4e));
  
  // Creating Circles
  circles.add(new Circle(new PVector(width - 200, height/2), 40, 1));
  circles.add(new Circle(new PVector(width/3, height/4), 40, 1));
  circles.add(new Circle(new PVector(width/2, height-200), 40, 1));
  circles.add(new Circle(new PVector(width/2, height/2+50), 20, 5));
  circles.add(new Circle(new PVector(width/4, height/3), 20, 5));
  circles.add(new Circle(new PVector(width-400, height/2.3), 20, 5));
  
  // Creating Flippers
  rightFlipper = new Flipper(new PVector(width * 0.65, height-20), 130, 10, true, 40);
  leftFlipper = new Flipper(new PVector(width * 0.35, height-20), 130, 10,  false, 40);
  
  // Creating Particle Emitter
  particles = new ArrayList<Particle>();
  emitter = new PVector(width/2, height/2);
}

void draw() {
  // Displaying Gif Background
  noStroke();
  image(backgroundGif, 0, 0);
  
  // Render flippers
  leftFlipper.update();
  rightFlipper.update();
  leftFlipper.display();
  rightFlipper.display();
  
  // Check for both balls collisions
  for (Ball ball : balls) {
    PVector prevPosition = ball.position.copy();
    
    // Ball-Ball collision
    for (Ball ball2 : balls) {
     if(ball == ball2) {
       continue;
     } else if (ball.ballCollide(ball2)) {
         ball.ballBounce(ball2);

       }
    }
    
    // Apply gravity
    ball.gravity(new PVector(0, gravity));
    
    // Reset if balls have fallen down the hole
    if (ball.position.y > height+150) {
      stopAudio();
      setup();
    }
    
    //Ball-Rectangle collision
    for (Rectangle rect : rectangles) {
      if (ball.collide(rect)) {
        if (!collision) {
          // Emit particles on collision
          emitter = new PVector(ball.position.x, ball.position.y);
          if (frameCount % 1 == 0) {
            Particle p = new Particle(new PVector(emitter.x, emitter.y));
            particles.add(p);
          }
          
          // Move ball back to prev positiona and calculate new velocity
          ball.position = prevPosition;
          ball.bounce(rect, restitution);
          ball.velocity.y *= -1;
          collision = true;
        }  else {
          gravity = -0.2;
        }
      } else if (!ball.collide(rect) && started && collision) {
        collision = false;
        gravity = 0.2;
      }
      
      // Render Rectangles
      fill(rect.colour);
      rect.display();
    }
    
    //Ball-Circle collision
    for (Circle cir : circles) {
      if (ball.circleCollide(cir)) {
        // Emit particles on collision
        emitter = new PVector(ball.position.x, ball.position.y);
        if (frameCount % 1 == 0) {
          Particle p = new Particle(new PVector(emitter.x, emitter.y));
          particles.add(p);
        }
        
        // calulate ball's new velocity
        ball.circleBounce(cir);
        ball.velocity.y *= -1;
        
        // Update score based on circle's value
        score += cir.points;
        println(score);
      }
      
      // Change color depending on which circle is impacted
      if (cir.points == 1) {
            fill(ball.circleCollide(cir) ? color(#684c4e) : color(#5b3e4f));
      } else if (cir.points == 5) {
            fill(ball.circleCollide(cir) ? color(#684c4e) : color(#473547));
      }
      
      // Render Circle
      cir.display();
      
    }
    
    // Ball Flipper collision
    if (ball.flipCollide(rightFlipper)) {
      ball.flipBounce(rightFlipper, restitution);
      ball.velocity.y *= -1;
    }
    if (ball.flipCollide(leftFlipper)) {
      ball.flipBounce(leftFlipper, restitution);
      ball.velocity.y *= -1;
    }
  
    // Render Particles
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.display();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  
    // Render Balls
    fill(#FFFFFF);
    ball.update();
    ball.display();
  }
  
  // Render nests
  fill(nest1.colour);
  nest1.display();
  nest2.display();
  nest3.display();
  nest4.display();
  nest5.display();
  nest6.display();
  nest7.display();
  nest8.display();
  
  // Render Score Board
  textSize(40);
  fill(255);
  text("Score: " + score, 20, 60);
}

void keyPressed() {
  // Start
  if (key == 'S' || key == 's') {
    score = 0;
    gravity = 0.1;
    started = true;
    
    // Launch both balls
    Ball first = balls.get(0);
    first.velocity = new PVector(0, random(-17, -14));
    Ball second = balls.get(1);
    second.velocity = new PVector(0, random(-17, -14));
  }
  
  // Reset
  if (key == 'R' || key == 'r') {
    player.close();
    setup();
  }
  
  // Left Flipper
  if (key == 'A' || key == 'a') {
      leftFlipper.flip();
  }
  
  // Right Flipper
  if (key == 'D' || key == 'd') {
    rightFlipper.flip();
  }
}

void stopAudio() {
  player.close();
}

// Handles closing music files
void stop() {
  player.close();
  minim.stop();
  super.stop();
}
