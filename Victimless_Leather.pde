import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

PImage gota;
PImage jacket;
PImage fondo;
PImage botella;
PImage inicio;
PFont f, ff;

ArrayList<Gota> gotas;
Chaqueta chaqueta;
Pantallas pantalla;


void setup() {
  size(1000,654);
  smooth();
  fondo = loadImage("fondo.jpg");
  botella = loadImage("esfera.png");
  gota = loadImage("gota.png");
  jacket = loadImage("jacket.png");
  inicio = loadImage("inicio.jpg");
  f = loadFont("LOVES-REG-48.vlw");
  ff = loadFont("MicrosoftYaHeiLight-48.vlw");
  pantalla = new Pantallas();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  
  gotas = new ArrayList<Gota>();
  chaqueta = new Chaqueta(width/2-25,height/2-25,60,40);
  

}

void draw() {
  pantalla.statusPantalla();
}

void beginContact(Contact cp) {

  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();

  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  if (o1.getClass() == Gota.class && o2.getClass() == Chaqueta.class) {
    Gota p1 = (Gota) o1;
    p1.delete();
    Chaqueta p2 = (Chaqueta) o2;
    p2.crecer();
  }
  
  if (o1.getClass() == Chaqueta.class && o2.getClass() == Gota.class) {
    Gota p1 = (Gota) o2;
    p1.delete();
    Chaqueta p2 = (Chaqueta) o1;
    p2.crecer();
  }
  
 

}

void endContact(Contact cp) {
}
