class Player extends GameObjects
{

  PImage playerr;
  float fireRate = 5.0f;
  float direction;
  float gravity = .5;
  float jumpSpeed = 10;

  Player(float x ,float y)
  {
    playerr = loadImage("sir1.png");
    position.x = x;
    position.y = y;
    position.x += velocity.x;
    position.y += velocity.y;
  }



void display()
{  
  if (position.y < 600)
  {
    velocity.y += gravity;
  }
  else
  {
    velocity.y = 0;
  }
  if (position.y >= 600 &&  'w' != 0)
  {
    velocity.y = -jumpSpeed;
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
      direction = 1;
        break;
      case 'a':
      position.sub(forward);
      direction = -1;
        break;
      case 'w':
      position.add(velocity);
        break;
    }
  }

}
}
