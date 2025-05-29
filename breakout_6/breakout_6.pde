import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Start variables() ==============================================================================================

Minim minim;
AudioPlayer theme, hitPaddle, hitObject, life, gameover, press;

color black    = #000000;
color white    = #FFFFFF;
color purple   = #4C159D;
color lavender = #B9A5E2;
color gray     = #505050;

float ballX, ballY, ballR; // Ball's position and radius.
float vX, vY; // Ball's velocity.

int HP = 3;
int score = 0;

float paddleX, paddleY; // Player's position.
float r; // Player's radius.

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int WINMODE = 4;

boolean aKey, dKey, wKey, sKey; // Player operations.

// Brick Variables

int[] x;
int[] y;
int[] c;
boolean[] alive;
int n;
int tempX;
int tempY;
int tempC;

int brickR = 30;


int f = 0;

PImage[] gif;
int numberOfFrames;

// End variables() ================================================================================================

void setup() { // Start setup() ===================================================================================

  size(800, 800, P2D);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  mode = INTRO;

  ballX = width/2;
  ballY = height-200;
  ballR = 10;
  vX = 0;
  vY = 5;

  paddleX = width/2;
  paddleY = height;
  r = 70;

  minim = new Minim(this);
  theme = minim.loadFile("MUSIC.mp3");
  hitObject = minim.loadFile("hitPaddle.wav");
  life = minim.loadFile("life.wav");
  gameover = minim.loadFile("gameover.wav");
  hitPaddle = minim.loadFile("hitObject.wav");
  press = minim.loadFile("press.wav");

  theme.loop();

  // Array setup
  n = 32;

  x = new int[n];
  y = new int[n];
  c = new int[n];
  alive = new boolean[n];

  tempX = 50;
  tempY = 50;
  tempC = 1;

  int j = 0;
  while (j < n) {
    x[j] = tempX;
    y[j] = tempY;
    c[j] = tempC;
    alive[j] = true;
    tempX += 100;
    if (tempX > width) {
      tempX = 50;
      tempY += 100;
      tempC += 1;
    }
    j += 1;
  }
  
  
  numberOfFrames = 23;
  gif = new PImage[numberOfFrames];
  
  int k = 0;
  while (k < numberOfFrames) {
    gif[k] = loadImage("frame_" + k + "_delay-0.03s.gif");
    k += 1;
  }
} // End setup() ==================================================================================================

void draw() { // Start draw() =====================================================================================
  


  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == WINMODE) {
    win();
  } else {
    println("Error: mode" + mode);
  }

} // End draw() ===================================================================================================
