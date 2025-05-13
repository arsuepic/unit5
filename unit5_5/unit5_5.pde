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
  textSize(30);
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
  holeR1 = 100;
  holeR2 = 100;

  vX = random(-10, 10);
  vY = random(-10, 10);

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
  rect(width/2, height/2, width*0.95, height*0.95, 100);

  noStroke();
  fill(fieldB);

  circle(width/2, height/2, 30);

  if (x1 > 0)        if (aKey) x1     -= 15;
  if (x1 < width)    if (dKey) x1     += 15;
  if (y1 > 0)        if (wKey) y1     -= 15;
  if (y1 < height/2) if (sKey) y1     += 15;

  if (x2 > 0)        if (leftKey) x2  -= 15;
  if (x2 < width)    if (rightKey) x2 += 15;
  if (y2 > height/2) if (upKey) y2    -= 15;
  if (y2 < height)   if (downKey) y2  += 15;

  fill(red);
  circle(x1, y1, 2*r1);
  fill(white);
  text(points1, x1, y1);

  fill(blue);
  circle(x2, y2, 2*r2);
  fill(white);
  text(points2, x2, y2);

  fill(black);
  circle(ballX, ballY, 2*ballR);

  stroke(fieldR);
  strokeWeight(10);
  fill(fieldB);
  circle(holeX1, holeY1, 2*holeR1);
  circle(holeX2, holeY2, 2*holeR2);

  ballX += vX;
  ballY += vY;

  if (ballX < ballR || ballX > -ballR + width)  vX = -vX;
  if (ballY < ballR || ballY > -ballR + height) vY = -vY;

  if (dist(x1, y1, ballX, ballY) < r1 + ballR) {
    vX = (ballX - x1) / 4.5;
    vY = (ballY - y1) / 4.5;
  }

  if (dist(x2, y2, ballX, ballY) < r2 + ballR) {
    vX = (ballX - x2) / 4.5;
    vY = (ballY - y2) / 4.5;
  }

  if (dist(holeX1, holeY1, ballX, ballY) < holeR1 + ballR) {
    points1 += 1;
    ballX = width/2;
    ballY = height/2;

    vX = random(-10, 10);
    vY = random(-10, 10);
  }
  
  if (dist(holeX2, holeY2, ballX, ballY) < holeR1 + ballR) {
    points2 += 1;
    ballX = width/2;
    ballY = height/2;

    vX = random(-10, 10);
    vY = random(-10, 10);
  }
} // End draw() ===================================================================================================

void keyPressed() { // Start keyPressed() =========================================================================
  if (key == 'a') aKey           = true;
  if (key == 'd') dKey           = true;
  if (key == 'w') wKey           = true;
  if (key == 's') sKey           = true;

  if (keyCode == LEFT) leftKey   = true;
  if (keyCode == RIGHT) rightKey = true;
  if (keyCode == UP) upKey       = true;
  if (keyCode == DOWN) downKey   = true;
} // End keyPressed() =============================================================================================

void keyReleased() { // Start keyReleased() =======================================================================
  if (key == 'a') aKey           = false;
  if (key == 'd') dKey           = false;
  if (key == 'w') wKey           = false;
  if (key == 's') sKey           = false;

  if (keyCode == LEFT) leftKey   = false;
  if (keyCode == RIGHT) rightKey = false;
  if (keyCode == UP) upKey       = false;
  if (keyCode == DOWN) downKey   = false;
} // End keyReleased() ============================================================================================
