import processing.sound.*;

SoundFile scoreEffect;
SoundFile borderBounceEffect;
SoundFile paddleBounceEffect;


final float SLOW = 1.2;
final float MEDIUM = 0.90;
final float FAST = 0.65;

float speedFactor = FAST;

Ball ball;
Paddle player1;
Paddle player2;
Scoreboard scores;

boolean wPressed;
boolean sPressed;
boolean upPressed;
boolean downPressed;

void setup() {
  size(880,680);
  scoreEffect = new SoundFile(this, ".\\Sound Effects\\Score Effects\\collect-normal-coin.wav");
  borderBounceEffect = new SoundFile(this, ".\\Sound Effects\\Border Bounce Effects\\lotom-sfxr.wav");
  paddleBounceEffect = new SoundFile(this, ".\\Sound Effects\\Paddle Bounce Effects\\Wah.mp3");
  ball = new Ball(speedFactor);
  player1 = new Paddle(speedFactor, 1);
  player2 = new Paddle(speedFactor, 2);
  scores = new Scoreboard();
}   

void draw() {
  background(0);
  processBounces();
  movePlayers();
  ball.move();
  checkScores();
  ball.display();
  player1.display();
  player2.display();
  scores.display();
}
