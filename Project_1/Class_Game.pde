
class Game {
  Paddle paddle;
  Ball ball;
  BrickGrid bricks;

  int lives = 3;
  int score = 0;
  int level = 1;

  boolean started = false;
  boolean paused = false;

  Game() {
    paddle = new Paddle();
    ball = new Ball();
    bricks = new BrickGrid();
  }

  void reset() {
    lives = 3;
    score = 0;
    level = 1;
    started = false;
    paused = false;

    paddle.reset();
    ball.reset();
    bricks.build();
  }

  void nextLevel() {
    level++;
    started = false;
    paddle.reset();
    ball.reset();
    bricks.build();
  }

  void update() {
    drawBackground();

    if (paused) return;

    paddle.update();

    if (started) {
      ball.update();
      ball.checkWalls();
      ball.checkPaddle(paddle);

      if (bricks.checkHit(ball)) {
        score += 10;
      }

      if (ball.isMissed()) {
        lives--;
        started = false;
        paddle.reset();
        ball.reset();

        if (lives <= 0) {
          reset();
        }
      }

      if (bricks.cleared()) {
        nextLevel();
      }
    } else {
      ball.stickToPaddle(paddle);
    }

    drawHUD();
  }

  void display() {
    bricks.display();
    paddle.display();
    ball.display();

    if (!started) {
      fill(255);
      textAlign(CENTER);
      textSize(24);
      text("Press SPACE or Click", width/2, height/2);
    }

    if (paused) {
      fill(255);
      textAlign(CENTER);
      textSize(32);
      text("PAUSED", width/2, height/2);
    }
  }

  void drawBackground() {
    background(10, 10, 25);
    for (int y = 0; y < height; y += 20) {
      stroke(15, 15, 40);
      line(0, y, width, y);
    }
  }

  void drawHUD() {
    fill(255);
    textSize(14);
    text("Score: " + score, 10, 20);
    text("Lives: " + lives, 10, 38);
    text("Level: " + level, 10, 56);
  }

  void keyPressed(char k, int code) {
    if (k == ' ') {
      if (!started) {
        started = true;
        ball.launch();
      } else {
        paused = !paused;
      }
    }

    if (k == 'r' || k == 'R') reset();

    if (code == LEFT) paddle.setLeft(true);
    if (code == RIGHT) paddle.setRight(true);
  }

  void keyReleased(int code) {
    if (code == LEFT) paddle.setLeft(false);
    if (code == RIGHT) paddle.setRight(false);
  }

  void mousePressed(int mx, int my) {
    if (!started) {
      started = true;
      ball.launch();
    }
  }

  void mouseDragged(int mx) {
    paddle.setX(mx - paddle.w/2);
  }
}
