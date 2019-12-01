class Star //note that this class does NOT extend Floater
{
	private int myX,myY,myA, myB,myC,mySize;
  public Star(int x, int y, int a, int b, int c,int size){
  		myX = x;
  		myY = y;
  		myA = a;
  		myB = b;
  		myC = c;
      mySize = size;
  	}
  	public void show(){
  		fill(myA,myB,myC);
  		ellipse(myX,myY,mySize,mySize);
  	}
}