 final int LEFT = -1;
 final int RIGHT = 1;
 
 boolean bouncedOnP1 = false;
 boolean bouncedOnP2 = false;
 
 void checkScores() {
    if (ball.xpos > player2.xpos + (player2.size/2)) {
      scores.score1++;
      ball.resetPos();
      thread("playScoreSound");
      delay(250);
    } else if (ball.xpos < player1.xpos - (player1.size/2)) {
      scores.score2++;
      ball.resetPos();
      thread("playScoreSound");
      delay(250);
    }
  }

void checkBounces() {
  if (ball.ypos + (ball.size/2) > height || ball.ypos - (ball.size/2) < 0) {
      thread("playBorderBounceSound");
      ball.speedY *= -1;
      bouncedOnP1 = false;
      bouncedOnP2 = false;
  }
  
  if (!bouncedOnP1 && checkIfPlayerBounce(player1, LEFT)) {
        bounceOnPlayer();
        bouncedOnP1 = true;
        bouncedOnP2 = false;
  }
  
  if (!bouncedOnP2 && checkIfPlayerBounce(player2, RIGHT)) {
        bounceOnPlayer();
        bouncedOnP2 = true;
        bouncedOnP1 = false;
  }
}

boolean checkIfPlayerBounce(Paddle player, int direction) {
  if (
        
        (direction * ball.xpos <= direction * player.xpos) && (direction * ball.xpos >= direction * (player.xpos - direction * (player.size/2)))
        
        && ((ball.ypos + (ball.size/2) >= player.ypos - (player.size*2)) 
        && (ball.ypos - (ball.size/2) <= player.ypos + (player.size*2)))
        
      ) {
    return true;
  }
  return false;
}

void bounceOnPlayer() {
  thread("playPaddleBounceSound");
  ball.speedX *= -1;
}
