

class Paddle {
  float x, y;
  float w = 120;
  float h = 15;
  float speed = 7;

  boolean left = false;
  boolean right = false;

  Paddle() {
    reset();
  }

  void reset() {
    x = width/2 - w/2;
    y = height - 50;
  }

  void update() {
    if (left) x -= speed;
    if (right) x += speed;
    x = constrain(x, 0, width - w);
  }

  void display() {
    fill(200);
    stroke(255);
    rect(x, y, w, h, 6);
  }

  void setLeft(boolean state) {
    left = state;
  }

  void setRight(boolean state) {
    right = state;
  }

  void setX(float nx) {
    x = constrain(nx, 0, width - w);
  }
}
