class Bullet extends GameObjects
{

  Bullet() 
  {
    speed = 20;
  }
  void move()
   { 

    forward.x = -cos(theta)* speed;
    forward.y =  sin(theta)* speed;
    PVector velocity = PVector.mult(forward, speed);
    position.add(forward);
    
    if (position.x  > -15 && position.x  < width ) 
    {
      alive = true;
    }
    else {
      alive = false;
       position.x = -100;
       position.y = -100;
    }
  }
  void touched()
  {
    alive =false;
    position.x = -100;
    position.y = -100;
  }
  void display() {
    //println(fireDirection);
    pushMatrix();
    translate(position.x,position.y);
    fill(255,0,0);
    ellipse(45,55,15, 5);
    popMatrix();
    
  }
  void explosion()
  {
    explosion.play();
    explosion.rewind();
    pushMatrix();
    translate(position.x,position.y);
    fill(255,0,0);
    ellipse(20,50,50,50);
    fill(255,255,0);
    ellipse(20,50,40,40);
    fill(255,0,0);
    ellipse(20,50,30,30);
    fill(255,255,0);
    ellipse(20,50,20,20);
    popMatrix();
  }

  
}

