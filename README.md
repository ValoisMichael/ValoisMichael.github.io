<p align="right">
Michael Valois (valoi016)
</p>
<p align="right">
CSCI 5611 Pinball Project
</p>
<h1 align="center">
Feathered Fling
</h1>

Here is my pinball game, "Feathered Fling!" It was created for project 1 for CSCI 5611. The game takees place in a tree, where two eggs decide to leave their nests and explore the tree. 

The controls are "a" and "d" for the left and right flippers, "s" to launch the eggs, and "r" to reset the game. 

Your goal is to get the highest score you can before both eggs falls out of the tree. If both eggs fall out, you lose and the game resets. 

<p align="center">
  <img width="600" height="800" src="https://github.com/ValoisMichael/ValoisMichael.github.io/assets/85034605/fe0e2f72-b1e1-4dcb-92b6-31fa9ed66f81">
</p>

<br>

# Video Link
https://youtu.be/40k5TRsKeNc 

(These timestamps are also listed in the description of the video)
| Feature  | Time Stamp |
| ------------- | ------------- |
| Basic Pinball Dynamics | 0:03 |
| Multiple Balls Interacting | 0:13 |
| Circular Onstacles  | 0:18 |
| Line-Segment and/or Polygonal Obstacles  | 0:27 |
| Particle System Effects  | 0:32 |
| Plunger/Launcher to shoot balls  | 0:40 |
| Textured Background  | 0:46 |
| Reactive Obstacles  | 0:57 |
| Sound Effects | 1:03 |
| Score Display   | 1:17  |
| Multiple Material Types | 0:18 |
| Pinball Game  | 1:21  |

<br>

# Features

### Basic Pinball Dynamics (0:03)
I use Circle, Ball, and unaligned Rectangle collision detection along with gravity and restitution to achieve the basic dynamics of the pinball game. 

<br>

### Multiple Balls Interacting (0:13)
Here, Ball-Ball collision is used, resulting in the pilliard ball effect discussed in class combined with gravity.

<br>

### Circular Obstacles (0:18)
Using the Circle collision detection from class, I have given both types of circles there own color, reaction, and score.

<br>

### Line-Segment and/or Polygonal Obstacles (0:27)
The branches of this virtual tree use unaligned Rectangle collision to detect and correctly impart a new velocity onto each ball.

<br>

### Particle System Effects (0:32)
When either ball collides with anything, a partical emitter releases particles, reminiscent of leaves falling from a tree. Each particle is given a random shape using the ellipses function, making them look more like leaves.

<br>

### Plunger/Launcher to shoot balls (0:40)
Both balls, or eggs in the game, are launched from there nests. The upward velocity is randomly assigned from a range of numbers to add some variance to the pinball game.

<br>

### Textured Background (0:46)
The background is a gif texture of a bunch of rustling leaves. It is supposed to help the in-a-tree-with-the-birds feel. Also the walls of the pinball game are given a random color of green from a selection to help add to the variance.

<br>

### Reactive Obstacles (0:57)
Whenever a ball collides with a circle, the circle flashes a brighter color of brown. This indicates that the ball has collided, points have been added to the score, and the circle has given the ball extra velocity on impact.

<br>

### Sound Effects (1:03)
I decided to compose a theme for the game. It doesn't have a name, but thought it would and to the game. I have included the sheet music of the song for anyone who is currious. It plays at the start of the game, reseting when the user presses "r" to reset the game. 

<br>

### Score Display (1:17)
The score is calculated based on which circles you hit; the bigger ones give 1 point and the smaller ones give 5 points. Hitting "r" resets the game including the score. The old score is left up on the screen until you launch the balls in order to give you time to read what you sdcored from last game.

<br>

### Multiple Material Types (best seen at 0:18)
Both types of circle, bigger and smaller, have different velocities they impart onto the balls when collided with. The bigger circles impart less velocity and the smaller ones impart more. This is calculated by the score each circle rewards.

<br>

### Pinball Game (1:21)
The paddles gave me trouble, as the collisions with them freak out both balls. I was not able to fix that issue, but was able to get them fluidly moving and returning to a resting point. I'd say balls will bounce of them currently roughly 50% of the time.

# Code

Github link: https://github.com/ValoisMichael/ValoisMichael.github.io.git

All code was written by me.

# Tools

Resources Used:
* I used the lecture slides, labs, and notes from class.
* I used this website a fair amount for understanding Processing: https://processing.org/reference
* I also used this website for extra help with some of the collision detection algorithms: https://developer.mozilla.org/en-US/docs/Games/Techniques/2D_collision_detection

For libraries, I used:
* gifAnimation.*   --- (for handling the gif background)
* ddf.minim.*  ---  (for handling the music)
* java.util.ArrayList   --- (for handling lists)
* processing.core.PApplet ---   (for ellipses and other draw features)

# Difficulties
I had a hard time getting the unaligned Rectangle collision code work, as calculating the reflection vector was difficult. I didn't know Processing has it's radians going counter clockwise rather than clockwise, so the
angle at which the ball bounced off was wildly wrong. Once I figured that out and adjust my code it seemed to work a lot better

I also, as metioned above, struggled with the paddles. The collision between the ball and the paddles makes the balls get stuck in them. I think it is due to the movement of the paddles moving into the space the ball
was previously in, making the colision code capture the ball rather than deflect it. I was unable to fix it fully, but it works somewhat well.

 <br>
 
# Art Contest:
<p align="center">
   Here is my submission for the art contest. Here we see both eggs in flight, bouncing around the tree! You can see the leaf particles really well in this shot.
</p>
<p align="center">
  <img width="600" height="800" src="https://github.com/ValoisMichael/ValoisMichael.github.io/assets/85034605/761e98c8-fa1c-4213-b4ed-bcc4d9fa93ea">
</p>
