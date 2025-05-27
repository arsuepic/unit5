import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Start variables() ==============================================================================================

Minim minim;
AudioPlayer theme, hitPaddle, hitObject, life, gameover;

color black    = #000000;
color white    = #FFFFFF;
color purple   = #4C159D;
color lavender = #B9A5E2;

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

boolean aKey, dKey, wKey, sKey; // Player operations.

// Brick Variables

int[] x;
int[] y;
int n;

int brickD = 100;

// End variables() ================================================================================================

void setup() { // Start setup() ===================================================================================

  size(800, 800);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  mode = INTRO;

  ballX = width/2;
  ballY = height/2;
  ballR = 10;
  vX = 0;
  vY = -10;

  paddleX = width/2;
  paddleY = height;
  r = 70;

  minim = new Minim(this);
  theme = minim.loadFile("MUSIC.mp3");
  hitPaddle = minim.loadFile("hitPaddle.wav");
  life = minim.loadFile("life.wav");
  gameover = minim.loadFile("gameover.wav");
  
  theme.loop();
  
  // Array setup
  n = 4;
  
  x = new int[n];
  y = new int[n];
  
  x[0] = 100;
  y[0] = 100;
  
  x[1] = 400;
  y[1] = 100;
  
  x[2] = 700;
  y[2] = 100;
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
  } else {
    println("Error: mode" + mode);
  }
} // End draw() ===================================================================================================
