// Start variables() ==============================================================================================
color purple   = #4c159d;
color lavender = #b9a5e2;
color black    = #000000;
color white    = #ffffff;

float x1, y1; // P1 position.
float x2, y2; // P2 position.
float d1; // P1 diameter.
float d2; // P2 diameter.

float ballX, ballY, ballD; // Ball's position and diameter.
float vX, vY; // Ball's velocity.

boolean aKey, dKey, wKey, sKey; // P1 operations.
boolean leftKey, rightKey, upKey, downKey; // P2 operations.
// End variables() ================================================================================================

void setup() { // Start setup() ===================================================================================
  size(800, 800, P2D);

  x1 = width*0.25;
  y1 = height/2;
  x2 = width*0.75;
  y2 = height/2;
  d1 = 100;
  d2 = 100;
  ballX = width/2;
  ballY = height/2;
  ballD = 50;

  vX = 8;
  vY = 10;
} // End setup() ==================================================================================================

void draw() { // Start draw() =====================================================================================
  background(purple);

  strokeWeight(5);
  stroke(white);

  if (x1 > 0)      if (aKey) x1     -= 15;
  if (x1 < width)  if (dKey) x1     += 15;
  if (y1 > 0)      if (wKey) y1     -= 15;
  if (y1 < height) if (sKey) y1     += 15;

  if (x2 > 0)      if (leftKey) x2  -= 15;
  if (x2 < width)  if (rightKey) x2 += 15;
  if (y2 > 0)      if (upKey) y2    -= 15;
  if (y2 < height) if (downKey) y2  += 15;

  fill(lavender);
  circle(x1, y1, d1);

  fill(black);
  circle(x2, y2, d2);
  
  fill(white);
  circle(ballX, ballY, ballD);

  if (ballX < ballD/2 || ballX > -ballD/2 + width)  vX = -vX;
  if (ballY < ballD/2 || ballY > -ballD/2 + height) vY = -vY;

  ballX += vX;
  ballY += vY;
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
