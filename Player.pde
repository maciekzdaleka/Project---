class Player extends GameObjects
{

  float gravity = .5;
  float jumpSpeed = 11;
  float up;
  float buletCounter;
  boolean alive = true;
  float hand;
  float leg;

  Player(float x ,float y)
  {
    position.x = x;
    position.y = y;
    theta = 0;
  }

void display()
{  
  if (position.y < 340)
  {
    velocity.y += gravity;
    position.add(velocity);
    up = 0;
  }
  else
  {
    velocity.y = 0;
  }
  if (position.y >= 340 && up != 0)
  {
    velocity.y = -jumpSpeed;
    position.add(velocity);
    up = 0;
  }
    pushMatrix();
    translate(position.x,position.y);
    noStroke();
   fill(252,130,244); //eyball color
   rect(hx,hy,30,20); //face
   fill(255,255,0);
   triangle(hx, hy, hx+5, hy- 10, hx+10, hy);
   triangle(hx+10, hy, hx+15, hy- 10, hx+20, hy);
   triangle(hx+20, hy, hx+25, hy- 10, hx+30, hy);
   stroke(255);
   line(hx+15,hy+20,hx+15,(hy+20)+35);
   line(hx+15,hy+55,hx,hy+80); 
   line(hx,hy+80,hx+leg,hy+80);//left leg
   line(hx+15,hy+55,hx+30,hy+80); //right leg
   line(hx+30,hy+80,hx+30+leg,hy+80);
   line(hx+15,hy+40,hx+hand,hy+30);
   fill(0,0,255);
   ellipse(hx+7,hy+6,5,5);
   ellipse(hx+24,hy+6,5,5);
   triangle(hx+10, hy+15, hx+15, hy+10, hx+20, hy+15);
   rotate(theta);
   
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
     leg = 10;
     theta  =  179.07;
     hand = 30;
        break;
      case 'a':
      position.sub(forward);
      leg = -10;
      theta = 0;
      hand = 0;
        break;
      case 'w':
      jump.play();
      jump.rewind();
      up = 1;
        break;
        case ' ':
        if(alive == true)
        { 
          Bullet bullet = new Bullet();
          bullet.position = position.get();    
          bullet.theta = theta;
          objects.add(bullet);
          bullets.add(bullet);
          alive =false;
          buletCounter = 0;
          shoot.play();
          shoot.rewind();
//       if (position.x  > 0 && position.x  < width && position.y > 0 && position.x  < height) {
//            offset= true;
//       }
//       else {
//         offset = false;
//         }
//          if(offset = false)
//          {
//            objects.remove(bullet);
//          }
        }
       if(alive == false)
        {
          buletCounter ++;
          if(buletCounter == 10 )
          {
            alive = true;
          }
        }
        break;
    }
  }
}



}
