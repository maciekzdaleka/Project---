int stage;
PFont startfont;
PFont normalfont;
PImage gameplan;
import ddf.minim.*;
int score = 0;
int lives = 3;



ArrayList<GameObjects> objects = new ArrayList<GameObjects>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Zombie> zombies = new ArrayList<Zombie>();
ArrayList<BigZombie> bigzombies = new ArrayList<BigZombie>();
ArrayList<Health> healths = new ArrayList<Health>();


Minim minim;
AudioPlayer theme;
AudioPlayer game;
AudioPlayer jump;
AudioPlayer explosion;
AudioPlayer gameover;
AudioPlayer shoot;
AudioPlayer health;

void setup()
{
  size(800,600);
  frameRate(60);
  stage = 1;
  for( int i = 0 ; i<1; i++)
  {
     Player player = new Player(400,300);
     objects.add(player);
     players.add(player);
  }
  minim = new Minim(this);
  theme = minim.loadFile("theme.mp3");
  game = minim.loadFile("game.mp3");
  jump = minim.loadFile("Jump.wav");
  explosion = minim.loadFile("explosion.wav");
  gameover = minim.loadFile("gameover.mp3");
  shoot = minim.loadFile("shoot.wav");
  health = minim.loadFile("health.wav");
  smooth();
}

void draw()
{
  switch(stage)
  {
    case 1:
      splash();
      break;
    case 2:
     game();
      break;
    case 3:
      help();
      break;
    case 4:
      help();
      break;
    case 5:
      gameover();
      break;
   }

}
void gameover()
{
  game.pause();
  gameover.play();
  fill(255,0,0);
  background(0);
  startfont = createFont("start.ttf",40);
  textFont(startfont);
  text("Game Over :(",200,250);
  text("Score:"+score,250,350);
  if(keyPressed)
    {
      if(key == 'b')
      {
        stage = 1;
        lives = 3;
        score = 0;
      }
      else
      {
        stage = 5;
      }
    }
  
}

void game()
{
  theme.pause();
  game.play();
  background(0);
  stroke(255);
  noFill();
  line(0,300,800,300);
  line(0,450,800,450);
  fill(150);
  rect(50,220,60,80,10,10,0,0);
  line(80,150,80,220);
  line(50,180,110,180);
  rect(650,220,60,80,10,10,0,0);
  line(680,150,680,220);
  line(650,180,710,180);
  line(250,100,250,300);
  line(200,150,300,150);
  rect(400,220,60,80,50,50,0,0);
  normalfont = createFont("start.ttf",10);
  textFont(normalfont);
  fill(255);
  text("R.I.P.",408,250);
  text("R.I.P.",60,250);
  text("R.I.P.",657,250);
  noStroke();
  fill(255,255,0);
  ellipse(600,100,100,100);
  fill(0);
  ellipse(570,100,100,100);
  fill(102,51,0,50);
  rect(0,451,800,149);
  fill(255,0,0);
  startfont = createFont("start.ttf",30);
  textFont(startfont);
  text("Score:"+score,40,500);
  text(lives+":Lives",600,500);
  

  
  for(int i = 0;i <objects.size(); i++)
  {
    objects.get(i).move();
    objects.get(i).display();
    if (! objects.get(i).alive)
    {
      objects.remove(i);
    }
  }
  for(int i = 0 ; i < players.size()  ; i ++)
  {
    Player player = players.get(i);
    for (int j = 0; j < zombies.size() ; j ++)
    {
      Zombie zombie1 = zombies.get(j);
      if (dist(player.position.x,player.position.y,zombie1.position.x,zombie1.position.y) <=10)
      {
        lives --;
        zombie1.touched();
      } 
    }
  }
  for(int i = 0 ; i < players.size()  ; i ++)
  {
    Player player = players.get(i);
    for (int j = 0; j < bigzombies.size() ; j ++)
    {
      BigZombie zombie1 = bigzombies.get(j);
      if (dist(player.position.x,player.position.y,zombie1.position.x,zombie1.position.y) <=60)
      {
        lives --;
        zombie1.touched();
      } 
    }
  }
  for(int i = 0 ; i < bullets.size()  ; i ++)
  {
    Bullet bullet = bullets.get(i);
    println(bullet.position.x);
    for (int j = 0; j < zombies.size() ; j ++)
    {
      Zombie zombie1 = zombies.get(j);
      if (dist(bullet.position.x,bullet.position.y,zombie1.position.x,zombie1.position.y) <=20)
      {
        score++;
        bullet.explosion();
        bullet.touched();
        zombie1.touched();
      } 
    }
  }
  for(int i = 0 ; i < bullets.size()  ; i ++)
  {
    Bullet bullet = bullets.get(i);
    println(bullet.position.x);
    for (int j = 0; j < zombies.size() ; j ++)
    {
      BigZombie zombie1 = bigzombies.get(j);
      if (dist(bullet.position.x,bullet.position.y,zombie1.position.x,zombie1.position.y) <=20)
      {
        score++;
        bullet.explosion();
        bullet.touched();
        zombie1.touched();
      } 
    }
  }
  for(int i = 0 ; i < players.size()  ; i ++)
  {
    Player player = players.get(i);
    for (int j = 0; j < healths.size() ; j ++)
    {
      Health health = healths.get(j);
      if (dist(player.position.x,player.position.y,health.position.x,health.position.y) <= 40)
      {
        lives = lives +1 ;
        health.touched();
      } 
    }
  }
  if(lives <= 0)
  {
    stage =5;
  }
  if(frameCount % 300 == 0)
  {
    BigZombie bigzombie = new BigZombie();
    objects.add(bigzombie);
    bigzombies.add(bigzombie);
    
    Health health = new Health();
    objects.add(health);
    healths.add(health);
    
    Zombie zombie = new Zombie();
    objects.add(zombie);
    zombies.add(zombie);
  }

  
    
}
void splash()
{
    background(0);
    theme.play(); 
    startfont = createFont("start.ttf",30);
    normalfont = createFont("start.ttf",20);
    textFont(startfont);
    text("Zombie Destruction",200,200);
    textFont(normalfont);
    text("Press Space to start",250,300);
    fill(0,255,0);
    text("Press H for help",280,400);
    fill(255);
    if(keyPressed)
    {
      if(key == 'h' || key == 'H')
      {
        stage = 4;
      }
    }
    if(keyPressed)
    {
      if(key == ' ')
      {
        stage = 2;
      }
    }
}
void help()
{
    background(0);
    startfont = createFont("start.ttf",30);
    normalfont = createFont("start.ttf",20);
    textFont(startfont);
    text("Zombie Destruction",200,150);
    textFont(normalfont);
    fill(255,0,0);
    text("A -------> LEFT",300,250);
    fill(0,255,0);
    text("D -------> RIGHT",300,300);
    fill(0,0,255);
    text("W -------> JUMP",300,350);
    fill(255,255,0);
    text("SPACE ---> SHOOT",300,400);
    textFont(startfont);
    fill(255);
    text("Press b to go back",200,500);
    if(keyPressed)
    {
      if(key == 'b')
      {
        stage = 1;
      }
      else
      {
        stage = 4;
      }
    }
}
