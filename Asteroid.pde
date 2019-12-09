

class Asteroid extends Floater
{
    private int rotSpeed;
    
    public Asteroid()
    {
        rotSpeed = (int)(Math.random()*11-6);
        myColor = (156);
        myCenterX = (Math.random()*1000)+1;
        myCenterY = (Math.random()*700)+1;
        corners = 4;
        int [] astX = {10,10,-10,-10};
        int [] astY = {-10,10,10,-10};
        for(int i = 0; i < 4; i++){
            astX[i] = astX[i]*(int)((Math.random()*2)+1);
            astY[i] = astY[i]*(int)((Math.random()*2)+1);
        }
        xCorners = new int [corners];
        xCorners = astX;
        yCorners = new int [corners];
        yCorners = astY;

        myCenterX = Math.random() * 1000;
        myCenterY = Math.random() * 700;
        myDirectionX = Math.random() * 3 - 1.5;
        myDirectionY = Math.random() * 3 - 1.5;
        myPointDirection = 0;

        rotSpeed = (int)(Math.random() * 4);

        if(rotSpeed == 0)
        {
            rotSpeed = (int)(Math.random() * 4);
        }
    }

    public void move()
    {
        turn(rotSpeed);
        super.move();

        if(myCenterX > width)
        {     
          myCenterX = 0;    
        }    
        else if (myCenterX<0)
        {     
          myCenterX = width;    
        }    
        if(myCenterY > 700)
        {    
          myCenterY = 0;    
        } 
        else if (myCenterY < 0)
        {     
          myCenterY = 700;    
        }   
    }

    public double getCentX()
    {
        return myCenterX;
    }

    public double getCentY()
    {
        return myCenterY;
    }
}