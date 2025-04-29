// Start variables() ==============================================================================================
color purple   = #4c159d;
color lavender = #b9a5e2;
color black    = #000000;
color white    = #ffffff;

float x1, y1; // P1 Position.
float x2, y2; // P2 Position.
float d; // Diameter.

boolean aKey, dKey, wKey, sKey; // P1 operations.
boolean leftKey, rightKey, upKey, downKey; // P2 operations.
// End variables() ================================================================================================

void setup() { // Start setup() ===================================================================================
  size(800, 800);

  x1 = width*0.25;
  y1 = height/2;
  x2 = width*0.75;
  y2 = height/2;
  d  = 100;
} // End setup() ==================================================================================================

void draw() { // Start draw() =====================================================================================
  background(purple);

  strokeWeight(5);
  stroke(white);

  if (x1 > 0)      if (aKey) x1     -= 8;
  if (x1 < width)  if (dKey) x1     += 8;
  if (y1 > 0)      if (wKey) y1     -= 8;
  if (y1 < height) if (sKey) y1     += 8;

  if (x2 > 0)      if (leftKey) x2  -= 8;
  if (x2 < width)  if (rightKey) x2 += 8;
  if (y2 > 0)      if (upKey) y2    -= 8;
  if (y2 < height) if (downKey) y2  += 8;

  fill(lavender);
  circle(x1, y1, d);

  fill(black);
  circle(x2, y2, d);
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
