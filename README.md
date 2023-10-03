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

Your goal is to get the highest score you can before either egg falls out of the tree. If either egg does, you lose and the game resets. 

<p align="center">
  <img width="600" height="800" src="https://github.com/ValoisMichael/ValoisMichael.github.io/assets/85034605/fe0e2f72-b1e1-4dcb-92b6-31fa9ed66f81">
</p>

<br>

## Video Link
https://youtu.be/40k5TRsKeNc
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
| Pinball Game  | 1:21  |

<br>
<br>

## Basic Pinball Dynamics (0:03)
I use Circle, Ball, and unaligned Rectangle collision detection along with gravity and restitution to achieve the basic dynamics of the pinball game. 

## Multiple Balls Interacting (0:13)
Here, Ball-Ball collision is used, resulting in the pilliard ball effect discussed in class combined with gravity.

## Circular Obstacles (0:18)
Using the Circle collision detection from class, I have given both types of circles there own color, reaction, and score.

## Line-Segment and/or Polygonal Obstacles
The branches of this virtual tree use unaligned Rectangle collision to detect and correctly impart a new velocity onto each ball.

## Particle System Effects
When either ball collides with anything, a partical emitter releases particles, reminiscent of leaves falling from a tree. Each particle is given a random shape using the ellipses function, making them look more like leaves.

## Plunger/Launcher to shoot balls
Both balls, or eggs in the game, are launched from there nests. The upward velocity is randomly assigned from a range of numbers to add some variance to the pinball game.

## Textured Background
The background is a gif texture of a bunch of rustling leaves. It is supposed to help the in-a-tree-with-the-birds feel. Also the walls of the pinball game are given a random color of green from a selection to help add to the variance.

## Reactive Obstacles
Both types of circle, bigger and smaller, have different velocities they impart onto the balls when collided with. The bigger circles impart less velocity and the smaller ones impart more. This is calculated by the score each circle rewards.

## Sound Effects
I decided to compose a theme for the game. It doesn't have a name, but thought it would and to the game. I have included the sheet music of the song for anyone who is currious.

## Score Display
The score is calculated based on which circles you hit; the bigger ones give 1 point and the smaller ones give 5 points. Hitting "r" resets the game including the score. The old score is left up on the screen until you launch the balls in order to give you time to read what you sdcored from last game.

## Pinball Game
The paddles gave me trouble, as the collisions with them freak out both balls. I was not able to fix that issue, but was able to get them fluidly moving and returning to a resting point. I'd say balls will bounce of them currently roughly 50% of the time.

## Art Contest:
<p align="center">
   Here is my submission for the art contest. Here we see both eggs in flight, bouncing around the tree!
</p>
<p align="center">
  <img width="600" height="800" src="https://github.com/ValoisMichael/ValoisMichael.github.io/assets/85034605/761e98c8-fa1c-4213-b4ed-bcc4d9fa93ea">
</p>
