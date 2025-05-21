int size = 100;
boolean big = true;
boolean small = false;

void intro() {
  textSize(size);
  background(black);

  fill(lavender);
  text("BREAKOUT", width/2, size*2);

  if (size > 150) {
    big = false;
    small = true;
  } else if (size < 50) {
    big = true;
    small = false;
  }

  if (big == true) {
    size += 1;
  } else if (small == true) {
    size -= 1;
  }

  textSize(50);
  fill(white);
  text("Click Anywhere To Start", width/2, height*0.75);
}

void introClick() {
  mode = GAME;
}
