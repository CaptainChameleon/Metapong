final float SLOW = 1.2;
final float MEDIUM = 0.90;
final float FAST = 0.70;

float speedFactor = SLOW;

Ball ball;
Paddle player1;
Paddle player2;
Scoreboard scores;
SoundManager soundManager;

boolean wPressed;
boolean sPressed;
boolean upPressed;
boolean downPressed;

void setup() {
  size(1200,800);
  
  ball = new Ball(speedFactor);
  player1 = new Paddle(speedFactor, 1);
  player2 = new Paddle(speedFactor, 2);
  scores = new Scoreboard();
  soundManager = new SoundManager(this);
}   

void draw() {
  background(0);
  movePlayers();
  ball.move();
  checkBounces();
  checkScores();
  ball.display();
  player1.display();
  player2.display();
  scores.display();
}

public void playBorderBounceSound() {
    soundManager.playBorderBounceSound();
}
  
public void playPaddleBounceSound() {
    soundManager.playPaddleBounceSound();
}
  
public void playScoreSound() {
    soundManager.playScoreSound();
}
