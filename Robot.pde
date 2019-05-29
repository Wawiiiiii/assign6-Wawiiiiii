class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  float currentSpeed = 2f;
  float lastCurrentSpeed = 0;
  float a;
  
  Robot(float x, float y){
    super(x,y);
    this.x = x;
    this.y = y;
  }


  void display(){
    if(currentSpeed>0 || (currentSpeed == 0 && lastCurrentSpeed>0))image(robot,x,y);
    if(currentSpeed<0 || (currentSpeed == 0 && lastCurrentSpeed<0)){
    pushMatrix();
    translate(x + w, y);
    scale(-1, 1);
    image(robot,0,0);
    popMatrix();
    }
  }
  
  void update(){
    x+=currentSpeed;
    if(currentSpeed>0)lastCurrentSpeed = 2f;
    else if(currentSpeed<0)lastCurrentSpeed = -2f;
    if(player.y <=y+PLAYER_DETECT_RANGE_ROW*80 && player.y>=y-PLAYER_DETECT_RANGE_ROW*80){
      if((currentSpeed>0 && player.x>x) || (currentSpeed<0 && player.x<x)){
        currentSpeed = 0;
        println(lastCurrentSpeed);
      }
    }
    else{
      if(lastCurrentSpeed>0) currentSpeed=2f;
      if(lastCurrentSpeed<0) currentSpeed=-2f;
    }
    if(x<=0 || x>=width-w){
      currentSpeed *=-1;
    }
  }
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;

	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
