private int x,y,a,b,c,d;
private Star [] stars;
private Spaceship ship;
private int cx = 600;
private int cy = 350;
private boolean hyperspace = false;
private boolean rotatingLeft = false;
private boolean rotatingRight = false;
private boolean forward = false;
private boolean backward = false;
private ArrayList <Asteroid> roids = new ArrayList <Asteroid> ();
private ArrayList <Bullet> shot = new ArrayList <Bullet>();
private boolean shooting = false;

private int hp = 3;
private boolean dead = false;
private int maxRoid = 10;
private int counter = 0;


public void setup() 
{
	background(0);
  size(1000,700);
  ship = new Spaceship();
  stars = new Star [200];
  for(int i = 0; i < stars.length; i++){
    strokeWeight((float)(Math.random()*4));
  	x = (int)(Math.random()*1200)+1;
  	y = (int)(Math.random()*800)+1;
  	a = (int)(Math.random()*255)+1;
  	b = (int)(Math.random()*255)+1;
  	c = (int)(Math.random()*255)+1;
    d = (int)(Math.random()*10)+1;
  	stars[i] = new Star(x,y,a,b,c,d);
  }
  for(int i = 0; i < maxRoid; i++){
    roids.add(new Asteroid());
  }
      smooth();

}
public void draw() 
{

  background(0);
  fill(255);
  textSize(25);
  text("Score: " + counter, 25, 50);
  fill(255);
	for(int i = 0; i < stars.length; i++){stars[i].show();}
  strokeWeight(0);
  ship.show();
  ship.move();
     for(int i = 0; i < roids.size(); i++){
    Asteroid temp = roids.get(i);
    temp.show();
    temp.move();
    if(dist( (float) roids.get(i).getCentX(), (float) roids.get(i).getCentY(), (float) ship.getCentX(), (float) ship.getCentY()) < 25 && frameCount > 30)
      {
        roids.remove(i);
        hp--;
        counter++;
      }
  }
  startHyperSpace();
  if(forward == true){ship.accelerate(0.05);}

  if(backward == true){ship.accelerate(-0.05);}

  if(rotatingLeft == true){ship.turn(-3);}

  if(rotatingRight == true){ship.turn(3);}
  if(hp == 3)
    {
      for(int x = 10; x <= 110; x += 50)
      {
        fill(255, 0, 0);
        rect(x, 670, 50, 10);
      }
    }
    else if(hp == 2)
  { 
    for(int x = 10; x <= 60; x += 50)
      {
        fill(255, 0, 0);
        rect(x, 670, 50, 10);
      }
  }
    else if(hp == 1)
    {
      fill(255, 0, 0);
      rect(10, 670, 50, 10);
    }
    else
    {
      noLoop();
      dead = true;
      textAlign(CENTER);
      textSize(50);
      fill(255);
      text("GAME OVER", 500, 350);
      textSize(25);
      text("Press R to restart", 500, 425);
    }
for(int i = 0; i < shot.size(); i++)
  {
    shot.get(i).show();
    shot.get(i).move();

    if(shot.get(i).getCentX() == 500 || shot.get(i).getCentX() == 0 || shot.get(i).getCentY() == 500 || shot.get(i).getCentY() == 0)
    {
      shot.remove(i);
    }
  }

  for(int i = 0; i < shot.size(); i++)
  {
    for(int j = 0; j < roids.size(); j++)
    {
      if(dist( (float) roids.get(j).getCentX(), (float) roids.get(j).getCentY(), (float) shot.get(i).getCentX(), (float) shot.get(i).getCentY()) < 15)
        {
          roids.remove(j);
          shot.remove(i);
          counter++;
          break;
      }
    }
  }

  if(roids.size() == 0 && maxRoid <= 50)
  {
        maxRoid += 2;

        for(int k = 0; k < maxRoid; k++)
        {
          roids.add(new Asteroid());
        } 
  }
    if(shooting == true)
  {
    if(frameCount % 6 == 0)
    {
      shot.add(new Bullet(ship));

    }
  }

}

public void startHyperSpace(){
    if(hyperspace == true){
        ship.setX((int)(Math.random()*1000));
        ship.setY((int)(Math.random()*700));
        ship.setPointDirection((int)(Math.random()*360));
        ship.setDirectionX(0);
        ship.setDirectionY(0);
    }
    hyperspace = false;
}
public void keyPressed(){
  if(key == 'w' || key == 'W'){
    forward = true;
  }
  if(key == 's' || key == 'S'){
    backward = true;
  }
  
  if(key == 'a' || key == 'A'){
    rotatingLeft = true;
  }
  if(key == 'd' || key == 'D'){
    rotatingRight = true;
  }
  if(key == 'h' || key == 'H'){
    hyperspace = true;
  }

   if(key == ' ')
  {
    shooting = true;
  }

  if(key == 'r' && dead == true)
  {
    loop();
    dead = false;
    hp = 3;
    ship.setX(500);
    ship.setY(350);
    ship.setPointDirection(-90);
    ship.setDirectionX(0);
    ship.setDirectionY(0);

    if(roids.size() < 10)
    {
      for(int i = roids.size(); i < 10; i++)
      {
        roids.add(new Asteroid());
      }
    }
  }
}
void keyReleased(){
  if(key == 'w' || key == 'W'){
    forward = false;
  }
  if(key == 's' || key == 'S'){
    backward = false;
  }
  if(key == 'a' || key == 'A'){
    rotatingLeft = false;
  }
  if(key == 'd' || key == 'D'){
    rotatingRight = false;
  }
    if(key == ' ')
  {
    shooting = false;
  }
}