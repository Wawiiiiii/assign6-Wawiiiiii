class Dinosaur extends Enemy{
	// Requirement #4: Complete Dinosaur Class
  
	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float currentSpeed =1f;
  
  Dinosaur(float x, float y){
    super(x,y);
    this.x = x;
    this.y = y;
    
  }

  void display(){
    if(currentSpeed>0)image(dinosaur,x,y);
    if(currentSpeed<0){
    pushMatrix();
    translate(x + w, y);
    scale(-1, 1);
    image(dinosaur,0,0);
    popMatrix();
    }
  }
  
  void update(){
    x+=currentSpeed;
    if(currentSpeed>0){
      currentSpeed = 1f;
      if(y==player.y && player.x>x)currentSpeed *= TRIGGERED_SPEED_MULTIPLIER;
    }
    if(currentSpeed<0){
      currentSpeed = -1f;
      if(y==player.y && player.x<x)currentSpeed *= TRIGGERED_SPEED_MULTIPLIER;
    }
    if(x<=0 || x>=width-w){
      currentSpeed *=-1;
    }
  }
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5;

	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
