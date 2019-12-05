class Asteroid extends Floater
{
	public void setX(int x) { myCenterX = x; }
    public void setY(int y) { myCenterY = y; }
    public int getX() { return (int)myCenterX; }
    public int getY() { return (int)myCenterY; } 
    public void setDirectionX(double x) { myDirectionX = x; }
    public void setDirectionY(double y) { myDirectionY = y; }
    public double getDirectionX() { return myDirectionX; }
    public double getDirectionY() { return myDirectionY; }
    public void setPointDirection(int degrees) { myPointDirection = degrees; }
    public double getPointDirection() { return myPointDirection; }
    public void setType(boolean t) {type1 = t;}
    public void setASize(int u) {myASize = u;}
    private int myRSpeed, myColor2, myASize;
    private boolean type1, alive; 
    Asteroid()
    {
    	myASize = (int)(Math.random()*5)+5;
    	corners = 7;
    	xCorners = new int[corners];
    	yCorners = new int[corners];
    	//0
    	xCorners[0] = 0*myASize;
    	yCorners[0] = 4*myASize;
    	//1
    	xCorners[1] = 2*myASize;
    	yCorners[1] = 2*myASize;
    	//2
    	xCorners[2] = 3*myASize;
    	yCorners[2] = -1*myASize;
    	//3
    	xCorners[3] = 1*myASize;
    	yCorners[3] = -4*myASize;
    	//4
    	xCorners[4] = -2*myASize;
    	yCorners[4] = -4*myASize;
    	//5
    	xCorners[5] = -5*myASize;
    	yCorners[5] = -1*myASize;
    	//6
    	xCorners[6] = -4*myASize;
    	yCorners[6] = 2*myASize;
    	myColor = color(124,65,6);
    	myColor2 = color(124,18,6);
    	myCenterX = Math.random()*900;
    	myCenterY = Math.random()*900;
    	myDirectionX = Math.random()*3;
    	myDirectionY = Math.random()*3;
    	myPointDirection = Math.random()*360;
    	myRSpeed = (int)(Math.random()*5)-2;
    	type1 = true;
    	alive = true;
    }
    public void move()
    {
	   super.move();
	   myPointDirection += myRSpeed;
    }
    public void kill(){
    	alive = false;
    }
    public boolean getAlive(){
    	return alive;
    }
    public void show ()  //Draws the floater at the current position  
	  {     
	  if(alive){       
	    if (type1 == true)
	    {
	    	fill(myColor);
	    	stroke(myColor);
	    }	  
	    else
	    {
	    	fill(myColor2);
	     	stroke(myColor2);
	     }
	    //translate the (x,y) center of the ship to the correct position
	    translate((float)myCenterX, (float)myCenterY);

	    //convert degrees to radians for rotate()     
	    float dRadians = (float)(myPointDirection*(Math.PI/180));
	    
	    //rotate so that the polygon will be drawn in the correct direction
	    rotate(dRadians);
	    
	    //draw the polygon
	    beginShape();
	    for (int nI = 0; nI < corners; nI++)
	    {
	      vertex(xCorners[nI], yCorners[nI]);
	    }
	    endShape(CLOSE);
	        //"unrotate" and "untranslate" in reverse order
	    rotate(-1*dRadians);
	    translate(-1*(float)myCenterX, -1*(float)myCenterY);
	  }   
	}
}