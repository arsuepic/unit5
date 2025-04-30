// Start variables() ==============================================================================================
color purple   = #4c159d;
color lavender = #b9a5e2;
color black    = #000000;
color white    = #ffffff;

float ballX, ballY, ballD; // Ball's position and diameter.
float vX, vY; // Ball's velocity.
float aX, aY; // Balls' acceleration.
// End variables() ================================================================================================

void setup() { // Start setup() ===================================================================================
  size(800, 800, P2D);
  ballX = width/2;
  ballY = height/2;
  ballD = 70;

  vX = random(-8, 8);
  vY = random(5, 10);

  aX = 0;
  aY = 0.5;
} // End setup() ==================================================================================================

void draw() { // Start draw() =====================================================================================
  background(purple);

  strokeWeight(5);
  stroke(white);
  fill(lavender);

  circle(ballX, ballY, ballD);

  if (ballX < ballD/2) { // Left.
    vX = vX * -0.9;
    ballX = ballD/2;
  }

  if (ballX > -ballD/2 + width) { // Right.
    vX = vX * -0.9;
    ballX = width - ballD/2;
  }

  if (ballY < ballD/2) { // Top.
    vY = vY * -0.9;
    ballY = ballD/2;
  }

  if (ballY > -ballD/2 + height) { // Bottom.
    vY = vY * -0.9;
    ballY = height - ballD/2;
  }

  ballX += vX;
  ballY += vY;

  vX += aX;
  vY += aY;
} // End draw() ===================================================================================================
