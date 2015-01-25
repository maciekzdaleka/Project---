class Bullet extends GameObjects
{

  Bullet() 
  {
   
  }
  void move()
   { 

    forward.x = -cos(theta)* speed;
    forward.y =  sin(theta)* speed;
    speed = 10;
    PVector velocity = PVector.mult(forward, speed);
    position.add(forward);
    
    if (position.x  > -30 && position.x  < width ) 
    {
      alive = true;
    }
    else {
      alive = false;
    }
  }
  void display() {
    //println(fireDirection);
    pushMatrix();
    translate(position.x,position.y);
    fill(255,0,0);
    ellipse(45,55,15, 5);
    println(position.x);
    popMatrix();
    
  }
  
}

