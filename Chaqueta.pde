class Chaqueta  {

  float x,y;
  float w,h;
  float r;
  
  Body b;

  Chaqueta(float x, float y,float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
   
   
    PolygonShape sd = new PolygonShape();

    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    b.createFixture(sd,1);
    
    b.setUserData(this);
  }
  
  void crecer() {
    w += 1;
    h += 1;
  }

  void dibujar() {
    pushMatrix();
    translate(x,y);
    //imageMode(CENTER);
    image(jacket,0,0,w,h);
    //imageMode(CORNER);
    popMatrix();
  }
}
