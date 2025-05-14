// Start variables() ==============================================================================================
color black  = #000000;
color white  = #FFFFFF;
color blue   = #0000FF;
color red    = #FF0000;
color fieldR = #A7382E;
color fieldB = #4F7694;

float x1, y1; // P1 position.
float x2, y2; // P2 position.
float r1; // P1 radius.
float r2; // P2 radius.

float ballX, ballY, ballR; // Ball's position and radius.
float vX, vY; // Ball's velocity.

float holeX1, holeY1; // Hole 1 position.
float holeX2, holeY2; // Hole 2 position.
float holeR1; // Hole 1 radius.
float holeR2; // Hole 2 radius.

int points1; // P1 score.
int points2; // P2 score.

boolean aKey, dKey, wKey, sKey; // P1 operations.
boolean leftKey, rightKey, upKey, downKey; // P2 operations.
// End variables() ================================================================================================

void setup() { // Start setup() ===================================================================================
  size(700, 900, P2D);
  textSize(40);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  x1 = width/2;
  y1 = height*0.25;
  x2 = width/2;
  y2 = height*0.75;
  r1 = 50;
  r2 = 50;

  ballX = width/2;
  ballY = height/2;
  ballR = 25;

  holeX1 = width/2;
  holeY1 = height*1.05;
  holeX2 = width/2;
  holeY2 = 0 - height*0.05;
  holeR1 = 80;
  holeR2 = 80;

  vX = 0;
  vY = 0;

  points1 = 0;
  points2 = 0;
} // End setup() ==================================================================================================

void draw() { // Start draw() =====================================================================================
  background(white);

  strokeWeight(10);
  stroke(fieldB);
  noFill();
  line(width*0.025, height*0.25, width*0.975, height*0.25);
  line(width*0.025, height*0.75, width*0.975, height*0.75);
  circle(width/2, height/2, 200);

  stroke(fieldR);
  line(width*0.025, height/2, width*0.975, height/2);
  line(width*0.14, height*0.11, width*0.36, height*0.11);
  line(width*0.14, height*0.14, width*0.36, height*0.14);
  line(width*0.86, height*0.11, width*0.64, height*0.11);
  line(width*0.86, height*0.14, width*0.64, height*0.14);
  line(width*0.14, height*0.89, width*0.36, height*0.89);
  line(width*0.14, height*0.86, width*0.36, height*0.86);
  line(width*0.86, height*0.89, width*0.64, height*0.89);
  line(width*0.86, height*0.86, width*0.64, height*0.86);
  rect(width/2, height/2, width*0.95, height*0.95, 100);
  fill(white);
  circle(width*0.25, height*0.125, height*0.15);
  circle(width*0.25, height*0.875, height*0.15);
  circle(width*0.75, height*0.125, height*0.15);
  circle(width*0.75, height*0.875, height*0.15);

  noStroke();
  fill(fieldB);
  circle(width/2, height/2, 30);

  fill(fieldR);
  circle(width*0.25, height*0.275, 20);
  circle(width*0.75, height*0.275, 20);
  circle(width*0.25, height*0.725, 20);
  circle(width*0.75, height*0.725, 20);
  circle(width*0.25, height*0.125, 20);
  circle(width*0.25, height*0.875, 20);
  circle(width*0.75, height*0.125, 20);
  circle(width*0.75, height*0.875, 20);

  if (x1 > 0 - r1/2)      if (aKey) x1     -= 10;
  if (x1 < width + r1/2)  if (dKey) x1     += 10;
  if (y1 > 0 - r1/2)      if (wKey) y1     -= 10;
  if (y1 < height/2)      if (sKey) y1     += 10;

  if (x2 > 0 - r2/2)      if (leftKey) x2  -= 10;
  if (x2 < width + r2/2)  if (rightKey) x2 += 10;
  if (y2 > height/2)      if (upKey) y2    -= 10;
  if (y2 < height + r2/2) if (downKey) y2  += 10;

  fill(black);
  circle(ballX, ballY, 2*ballR);

  stroke(fieldR);
  strokeWeight(10);
  fill(fieldB);
  circle(holeX1, holeY1, 2*holeR1);
  circle(holeX2, holeY2, 2*holeR2);

  noStroke();
  fill(red);
  circle(x1, y1, 2*r1);
  fill(white);
  text(points1, x1, y1);

  fill(blue);
  circle(x2, y2, 2*r2);
  fill(white);
  text(points2, x2, y2);

  ballX += vX;
  ballY += vY;

  if (ballX < ballR || ballX > -ballR + width)  vX *= random(-0.85,-0.95);
  if (ballY < ballR || ballY > -ballR + height) vY *= random(-0.85,-0.95);

  if (dist(x1, y1, ballX, ballY) < r1 + ballR) {
    vX = (ballX - x1) / random(4, 6);
    vY = (ballY - y1) / random(4, 6);
  }

  if (dist(x2, y2, ballX, ballY) < r2 + ballR) {
    vX = (ballX - x2) / random(4, 6);
    vY = (ballY - y2) / random(4, 6);
  }

  if (dist(holeX1, holeY1, ballX, ballY) < holeR1 + ballR) {
    points1 += 1;
    ballX = width/2;
    ballY = height/2;
    
    x1 = width/2;
    y1 = height*0.25;
    x2 = width/2;
    y2 = height*0.75;
    vX = 0;
    vY = 0;
  }

  if (dist(holeX2, holeY2, ballX, ballY) < holeR1 + ballR) {
    points2 += 1;
    ballX = width/2;
    ballY = height/2;
    
    x1 = width/2;
    y1 = height*0.25;
    x2 = width/2;
    y2 = height*0.75;
    vX = 0;
    vY = 0;
  }
} // End draw() ===================================================================================================

void keyPressed() { // Start keyPressed() =========================================================================
  if (key == 'a' || key == 'A') aKey = true;
  if (key == 'd' || key == 'D') dKey = true;
  if (key == 'w' || key == 'W') wKey = true;
  if (key == 's' || key == 'S') sKey = true;

  if (keyCode == LEFT) leftKey       = true;
  if (keyCode == RIGHT) rightKey     = true;
  if (keyCode == UP) upKey           = true;
  if (keyCode == DOWN) downKey       = true;
} // End keyPressed() =============================================================================================

void keyReleased() { // Start keyReleased() =======================================================================
  if (key == 'a' || key == 'A') aKey = false;
  if (key == 'd' || key == 'D') dKey = false;
  if (key == 'w' || key == 'W') wKey = false;
  if (key == 's' || key == 'S') sKey = false;

  if (keyCode == LEFT) leftKey       = false;
  if (keyCode == RIGHT) rightKey     = false;
  if (keyCode == UP) upKey           = false;
  if (keyCode == DOWN) downKey       = false;
} // End keyReleased() ============================================================================================
