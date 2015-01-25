int stage;
PFont startfont;
PFont normalfont;
PImage gameplan;
import ddf.minim.*;
int zcount = 4;



ArrayList<GameObjects> objects = new ArrayList<GameObjects>();
ArrayList<Bullet> bullets;
ArrayList<Player> players;


Minim minim;
AudioPlayer theme;
AudioPlayer game;
AudioPlayer jump;

void setup()
{
  size(800,600);
  frameRate(60);
  stage = 1;
  objects.add(new Player(300,300));
  for(int i = 0; i < zcount; i++)
  {
    objects.add(new Zombie());
  }
  minim = new Minim(this);
  theme = minim.loadFile("theme.mp3");
  game = minim.loadFile("game.mp3");
  jump = minim.loadFile("Jump.wav");
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
  fill(102,51,0);
  rect(0,451,800,149);
  
  
  for(int i = 0;i <objects.size(); i++)
  {
    objects.get(i).move();
    objects.get(i).display();
    if (! objects.get(i).alive)
    {
      objects.remove(i);
    }
    //if(bullets.intersect(zombies))
    //{
    //  zombie.touched();
   // }
    
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
