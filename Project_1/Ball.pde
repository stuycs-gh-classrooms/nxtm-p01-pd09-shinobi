

class Ball {
  float x, y;
  float r = 10;
  float vx = 0;
  float vy = 0;

  Ball() {
    reset();
  }

  void reset() {
    x = width/2;
    y = height - 70;
    vx = 0;
    vy = 0;
  }

  void stickToPaddle(Paddle p) {
    x = p.x + p.w/2;
    y = p.y - r - 2;
  }

  void launch() {
    vx = random(-3, 3);
    if (vx == 0) vx = 2;
    vy = -5;
  }

  void update() {
    x += vx;
    y += vy;
  }

  void checkWalls() {
    if (x < r || x > width - r) vx *= -1;
    if (y < r) vy *= -1;
  }

  void checkPaddle(Paddle p) {
    if (y + r >= p.y &&
        x > p.x &&
        x < p.x + p.w) {
      vy *= -1;

      float hit = (x - p.x) / p.w;
      vx = map(hit, 0, 1, -5, 5);
    }
  }

  boolean isMissed() {
    return y - r > height;
  }

  void display() {
    fill(255);
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
}
