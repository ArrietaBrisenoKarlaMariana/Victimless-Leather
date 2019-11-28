class Gota {

  Body body;
  float x = width/2;
  float y = height/2;
  float r;
  boolean delete = false;

  Gota(float x, float y, float r) {
    this.r = r;
    this.x = x;
    this.y = y;

    makeBody(x, y, r);
    body.setUserData(this);
  }
  
  void delete() {
    delete = true;
  }

  void killBody() {
    box2d.destroyBody(body);
  }

  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+r*2 || delete) {
      killBody();
      return true;
    }
    return false;
  }

  // 
  void dibujar() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
    pushMatrix();
    translate(pos.x, pos.y); 
    image(gota,0,0,r*1.5,r*1.5);
    popMatrix();
  }

  void makeBody(float x, float y, float r) {
    BodyDef bd = new BodyDef();

    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;

    body = box2d.world.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;

    fd.density = 1.0;
    fd.friction = 0.01;
    fd.restitution = 0.3; 

    body.createFixture(fd);

    body.setAngularVelocity(random(-0.01, 0.01));
  }
}
