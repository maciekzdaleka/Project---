class Player extends GameObjects
{

  PImage playerr;
  float direction;
  float gravity = .5;
  float jumpSpeed = 10;
  float up;
  float buletCounter;
  boolean alive = true;
  int fireDirection;
  


  Player(float x ,float y)
  {
    playerr = loadImage("sir3.png");
    position.x = x;
    position.y = y;
  }



void display()
{  
  if (position.y < 600)
  {
    velocity.y += gravity;
    position.add(velocity);
    up = 0;
  }
  else
  {
    velocity.y = 0;
  }
  if (position.y >= 600 && up != 0)
  {
    velocity.y = -jumpSpeed;
    position.add(velocity);
    up = 0;
  }
    println(x); 
    pushMatrix();
    translate(position.x, position.y);
    scale(direction, 1);
    image(playerr, 0, 0);
    popMatrix();
}

void move()
{
  
forward.x = 5;
  if(keyPressed)
  {
    switch(key)
    {
      case 'd':
      position.add(forward);
      direction = -1;
     fireDirection = 0;
        break;
      case 'a':
      position.sub(forward);
      direction = 1;
      fireDirection = 180;
        break;
      case 'w':
      jump.play();
      jump.rewind();
      up = 1;
        break;
        case ' ':
        if(alive == true)
        {
          objects.add( new Bullet());    
          alive =false;
          buletCounter = 0;
        }
        if(alive == false)
        {
          buletCounter ++;
          if(buletCounter == 5)
          {
            alive = true;
          }
        }
        break;
    }
  }
}


}
