class Ball {
  color c;
  int size;
  float xpos;
  float ypos;
  float speedMod;
  float speedX;
  float speedY;
  
  Ball(float speedFactor) {
    c = color(255);
    size = height/30;
    xpos = width/2;
    ypos = height/2;
    speedMod = (width/2) / (speedFactor*frameRate);
    setRandomSpeed();
  }
  
  void setRandomSpeed() {
    speedX = int(pow(-1,int(random(1)+0.5))) * random(1, speedMod + 1);
    speedY = int(pow(-1,int(random(1)+0.5))) * sqrt(pow(speedMod, 2) - pow(speedX, 2));
  }
  
  void move() {
    if (ypos + size > height || ypos - size < 0) {
      speedY *= -1;
    }
    if ((xpos+(size/2) == player1.xpos+(size/2) && ypos+(size/2) < player1.ypos+(size*2) && ypos-(size/2) > player1.ypos-(size*2))
          || (xpos+size == player2.xpos+(size/2) && ypos+size < player2.ypos+(size*2) && ypos-size > player2.ypos-(size*2))) {
      float newSpeedX = speedY;
      float newSpeedY = speedX;
      if (speedX > 0 && newSpeedX > 0 || speedX < 0 && newSpeedX < 0) {
        speedX = -newSpeedX;
      } else {
        speedX = newSpeedX;
      }
      if (speedY > 0 && newSpeedY < 0 || speedY < 0 && newSpeedY > 0) {
        speedY = -newSpeedY;
      } else {
        speedY = newSpeedY;
      }
    } 
    xpos += speedX;
    ypos += speedY;
  }
  
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, size, size);
  }
  
  void resetPos() {
    xpos = width/2;
    ypos = height/2;
    setRandomSpeed();
  }
}

class Paddle {
  color c;
  int size;
  float xpos;
  float ypos;
  float speed;
  
  Paddle(float speedFactor, int player) {
    c = color(255);
    size = height/30;
    speed = (width/2) / (speedFactor * 0.5 * frameRate);
    ypos = height/2;
    switch(player) {
      case 1:
        xpos = 0 + size;
        break;
      case 2:
        xpos = width -  size;
        break;
    }
  }
  
  void move() {
    if ((speed > 0 && (ypos+(size*2)+speed) <= height) || (speed < 0 && (ypos-(size*2)+speed) >= 0)) ypos += speed;
  }
  
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, size, size*4);
  }
}

class Scoreboard {
  int score1 = 0;
  int score2 = 0;
  
  void update() {
    if (ball.xpos + (ball.size/2) > width) {
      scores.score1++;
      ball.resetPos();
      delay(250);
    } else if (ball.xpos - (ball.size/2) < 0) {
      scores.score2++;
      ball.resetPos();
      delay(250);
    }
  }
  
   void display() {
     textSize(50);
     text(score1, width/2 - width/7, height/5);
     text(score2, width/2 + width/7, height/5);
   }
  
  void reset() {
    score1 = 0;
    score2 = 0;
  }
}
