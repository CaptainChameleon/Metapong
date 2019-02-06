 void checkScores() {
    if (ball.xpos - (ball.size/2) > player2.xpos + (player2.size/2)) {
      println("--[Score]--");
      println("Ball.pos(" + ball.xpos + ", " + ball.ypos + ") Player1.pos(" + player1.xpos + ", " + player1.ypos + ") Player2.pos(" + player2.xpos + ", " + player2.ypos + ")");
      println("Ball.speed(" + ball.speedX + ", " + ball.speedY + ")");
      println("-----------");
      scores.score1++;
      ball.resetPos();
      thread("playScoreSound");
      delay(250);
    } else if (ball.xpos + (ball.size/2) < player1.xpos - (player1.size/2)) {
      println("--[Score]--");
      println("Ball.pos(" + ball.xpos + ", " + ball.ypos + ") Player1.pos(" + player1.xpos + ", " + player1.ypos + ") Player2.pos(" + player2.xpos + ", " + player2.ypos + ")");
      println("Ball.speed(" + ball.speedX + ", " + ball.speedY + ")");
      println("-----------");
      scores.score2++;
      ball.resetPos();
      thread("playScoreSound");
      delay(250);
    }
  }

void processBounces() {
  if (ball.ypos + (ball.size/2) > height || ball.ypos - (ball.size/2) < 0) {
      ball.speedY *= -1;
      thread("playBorderBounceSound");
  }
  if ((ball.xpos - (ball.size/2) + ball.speedX < player1.xpos + (player1.size/2)) 
      && (ball.ypos - (ball.size/2) >= player1.ypos - (player1.size*2)) 
      && (ball.ypos + (ball.size/2) <= player1.ypos + (player1.size*2))) {
        thread("playPaddleBounceSound");
        squareHorBounce();
  }
      
  if ((ball.xpos + (ball.size/2) + ball.speedX > player2.xpos - (player2.size/2)) 
      && ((ball.ypos - (ball.size/2) >= player2.ypos - (player2.size*2)) 
      && (ball.ypos + (ball.size/2) <= player2.ypos + (player2.size*2)))) {
        thread("playPaddleBounceSound");
        squareHorBounce();
  }
}

void horBounce() {
  ball.speedX *=-1;
}

void squareHorBounce() {
  float newSpeedX = ball.speedY;
  float newSpeedY = ball.speedX;
  if (ball.speedX > 0 && newSpeedX > 0 || ball.speedX < 0 && newSpeedX < 0) {
    ball.speedX = -newSpeedX;
  } else {
    ball.speedX = newSpeedX;
  }
  if (ball.speedY > 0 && newSpeedY < 0 || ball.speedY < 0 && newSpeedY > 0) {
    ball.speedY = -newSpeedY;
  } else {
    ball.speedY = newSpeedY;
  }
}
