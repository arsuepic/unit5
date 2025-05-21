import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Start variables() ==============================================================================================

Minim minim;
AudioPlayer theme, hitPaddle, hitObject, click, life, gameover;

color black    = #000000;
color white    = #FFFFFF;
color purple   = #4C159D;
color lavender = #B9A5E2;

float ballX, ballY, ballR; // Ball's position and radius.
float vX, vY; // Ball's velocity.

float x, y; // Player's position.
float r; // Player's radius.

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

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

  x = 0;
  y = height;
  r = 50;

  minim = new Minim(this);
  theme = minim.loadFile("MUSIC.mp3");
} // End setup() ==================================================================================================

void draw() { // Start draw() =====================================================================================

  theme.play();

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
