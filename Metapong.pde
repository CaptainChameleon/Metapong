final float SLOW = 1;
final float MEDIUM = 0.90;
final float FAST = 0.75;

float speedFactor = MEDIUM;

Ball ball;
Paddle player1;
Paddle player2;
Scoreboard scores;

void setup() {
  size(880,680);
  
  ball = new Ball(speedFactor);
  player1 = new Paddle(speedFactor, 1);
  player2 = new Paddle(speedFactor, 2);
  scores = new Scoreboard();
}   

void draw() {
  background(0);
  ball.move();
  scores.update();
  ball.display();
  player1.display();
  player2.display();
  scores.display();
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    if (player1.speed > 0) player1.speed = -player1.speed;
    player1.move();
  } else if (key == 's' || key == 'S') {
    if (player1.speed < 0) player1.speed = -player1.speed;
    player1.move();
  } 
  
  if (key == CODED) {
    if (keyCode == UP) {
      if (player2.speed > 0) player2.speed = -player2.speed;
      player2.move();
    } else if (keyCode == DOWN) {
      if (player2.speed < 0) player2.speed = -player2.speed;
      player2.move();
    }
  }
}
