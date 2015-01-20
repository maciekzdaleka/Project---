int stage;
PFont startfont;
PFont normalfont;
PImage gameplan;
import ddf.minim.*;

boolean[] keys = new boolean[526];

ArrayList<GameObjects> objects = new ArrayList<GameObjects>();

Minim minim;
AudioPlayer theme;
AudioPlayer game;
AudioPlayer jump;

void setup()
{
  size(800,800);
  frameRate(60);
  stage = 1;
  objects.add(new Player(400,600));
  objects.add(new Bullet());
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
  gameplan = loadImage("background.png");
  gameplan.resize(800,800);
  background(gameplan);
  for(int i = 0;i <objects.size(); i++)
  {
    objects.get(i).move();
    objects.get(i).display();
  }
    
}

void splash()
{
    background(0);
    theme.play(); 
    startfont = createFont("start.ttf",40);
    normalfont = createFont("start.ttf",25);
    textFont(startfont);
    text("Zombie Destruction",100,300);
    textFont(normalfont);
    text("Press Space to start",200,400);
    fill(0,255,0);
    text("Press H for help",250,500);
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
    startfont = createFont("start.ttf",40);
    normalfont = createFont("start.ttf",25);
    textFont(startfont);
    text("Zombie Destruction",100,250);
    textFont(normalfont);
    fill(255,0,0);
    text("A -------> LEFT",230,350);
    fill(0,255,0);
    text("D -------> RIGHT",230,400);
    fill(0,0,255);
    text("W -------> JUMP",230,450);
    fill(255,255,0);
    text("SPACE ---> SHOOT",230,500);
    textFont(startfont);
    fill(255);
    text("Press b to go back",100,600);
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
