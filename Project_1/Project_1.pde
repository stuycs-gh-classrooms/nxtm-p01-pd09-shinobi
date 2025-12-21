//Aman Ibrahim
//PD.9

Game game;

void settings() {
  size(900, 700);
}

void setup() {
  surface.setTitle("GridRock - Breakout");
  frameRate(60);
  game = new Game();
}

void draw() {
  game.update();
  game.display();
}

void keyPressed() {
  game.keyPressed(key, keyCode);
}

void keyReleased() {
  game.keyReleased(keyCode);
}

void mousePressed() {
  game.mousePressed(mouseX, mouseY);
}

void mouseDragged() {
  game.mouseDragged(mouseX);
}
