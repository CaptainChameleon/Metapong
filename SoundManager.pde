import processing.sound.*;
import java.util.*;  

class SoundManager {
  
  PApplet parent;
  
  SoundFile score;
  SoundFile borderBounce;
  SoundFile paddleBounce;
  
  Map<String,SoundFile> scoreEffects;
  Map<String,SoundFile> borderEffects;
  Map<String,SoundFile> paddleEffects;
  
  SoundManager(PApplet parent) {
    this.parent = parent;
    
    loadScoreEffects();
    loadBorderEffects();
    loadPaddleEffects();
    
    score = scoreEffects.get("Default");
    borderBounce = borderEffects.get("Default");
    paddleBounce = paddleEffects.get("Default");
  }
  
  private void loadScoreEffects() {
    scoreEffects = new HashMap();
    String scoreEffectsPath = ".\\Sound Effects\\Score Effects\\";
    scoreEffects.put("Default", new SoundFile(parent, scoreEffectsPath + "collect-normal-coin.wav"));
    scoreEffects.put("Coin", new SoundFile(parent, scoreEffectsPath + "Coin.wav"));
    scoreEffects.put("Cash Register", new SoundFile(parent, scoreEffectsPath + "CashRegister.wav"));
  }
  
  private void loadBorderEffects() {
    borderEffects = new HashMap();
    String borderEffectsPath = ".\\Sound Effects\\Border Bounce Effects\\";
    borderEffects.put("Default", new SoundFile(parent, borderEffectsPath + "lotom-sfxr.wav"));
    //borderEffects.put("Wah", new SoundFile(parent, borderEffectsPath + "Wah.wav"));
  }
  
  private void loadPaddleEffects() {
    paddleEffects = new HashMap();
    String paddleEffectsPath = ".\\Sound Effects\\Paddle Bounce Effects\\";
    paddleEffects.put("Default", new SoundFile(parent, paddleEffectsPath + "Jump.wav"));
    paddleEffects.put("Wah", new SoundFile(parent, paddleEffectsPath + "Wah.wav"));
    paddleEffects.put("Oof", new SoundFile(parent, paddleEffectsPath + "Oof.wav"));
    paddleEffects.put("Fart", new SoundFile(parent, paddleEffectsPath + "Fart.wav"));
    paddleEffects.put("Wololo", new SoundFile(parent, paddleEffectsPath + "Wololo.wav"));
  }
  
  public void playBorderBounceSound() {
    borderBounce.play();
  }
  
  public void playPaddleBounceSound() {
    paddleBounce.play();
  }
  
  public void playScoreSound() {
    score.play();
  }
}
