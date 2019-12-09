
class Spaceship extends Floater
{   

    public Spaceship(){
       int [] ship2X = {-8,16,-8,-2};
       int [] ship2Y = {-8,0,8,0};

        myCenterX = cx;
        myCenterY = cy;
        corners = 4;
        
        xCorners = new int [corners]; 
        xCorners = ship2X;
        yCorners = new int [corners];
        yCorners = ship2Y;

        myColor = color(255,255,255);
        myDirectionX = 0;
        myDirectionY = 0;
        myPointDirection = 0;

    }
    public void setX(int x){myCenterX = x;}

    public int getX(){return (int)myCenterX;}

    public void setY(int y){myCenterY = y;}

    public int getY(){return (int)myCenterY;}

    public void setDirectionX(double x){myDirectionX = x;}

    public double getDirectionX(){return myDirectionX;}

    public void setDirectionY(double y){myDirectionY = y;}

    public double getDirectionY(){return myDirectionY;}

    public void setPointDirection(int degrees){myPointDirection = degrees;}

    public double getPointDirection(){return myPointDirection;}
    public double getCentX(){return myCenterX;}

    public double getCentY(){return myCenterY;}
    public void setCentX(double x){myCenterX = x;}

    public void setCentY(double y){myCenterY = y;}

}
