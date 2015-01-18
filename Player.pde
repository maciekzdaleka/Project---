class Player extends GameObjects
{

  PImage playerr;
  float direction;
  float gravity = .5;
  float jumpSpeed = 10;
  float up;
  

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
        break;
      case 'a':
      position.sub(forward);
      direction = 1;
        break;
      case 'w':
      up = 1;
        break;
    }
  }
}


}
