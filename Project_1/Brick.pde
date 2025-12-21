
class BrickGrid {
  int cols = 10;
  int rows = 6;

  Brick[][] grid;

  float brickW = 70;
  float brickH = 25;
  float gap = 6;
  float startX = 80;
  float startY = 60;

  BrickGrid() {
    build();
  }

  void build() {
    grid = new Brick[cols][rows];

    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        float x = startX + c * (brickW + gap);
        float y = startY + r * (brickH + gap);
        grid[c][r] = new Brick(x, y, brickW, brickH);
      }
    }
  }

  void display() {
    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        grid[c][r].display();
      }
    }
  }

  boolean checkHit(Ball b) {
    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        Brick br = grid[c][r];
        if (br.hit(b)) {
          b.vy *= -1;
          return true;
        }
      }
    }
    return false;
  }

  boolean cleared() {
    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows; r++) {
        if (grid[c][r].alive) return false;
      }
    }
    return true;
  }
}

// --- Brick class inside same tab ---
class Brick {
  float x, y, w, h;
  boolean alive = true;

  Brick(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }

  void display() {
    if (!alive) return;
    fill(100, 180, 255);
    stroke(255);
    rect(x, y, w, h, 4);
  }

  boolean hit(Ball b) {
    if (!alive) return false;

    if (b.x + b.r > x &&
        b.x - b.r < x + w &&
        b.y + b.r > y &&
        b.y - b.r < y + h) {
      alive = false;
      return true;
    }
    return false;
  }
}
