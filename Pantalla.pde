class Pantallas {
  
  int pantalla = 1;
  
  void statusPantalla(){
  switch (pantalla){
    case 1:
    Inicio();
    break;
    
    case 2:
    Instrucciones();
    break;
    
    case 3:
    Victimless();
    break;
  }
  }
  
  void Inicio() {
    fill(255);
    image(inicio,0,0);
    textSize(30);
    textAlign(CENTER, CENTER);
    textFont(f);
    text("Victimless Leather", width/2, height/2);
    textSize(20);
    text("> Presiona '1' para continuar", 500, 600);
    
    if (keyPressed)
    if(key == '1')
    pantalla++;
  }
  
  void Instrucciones() {
    fill(255);
    textFont(f);
    image(inicio,0,0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("jacket", width/2, 80);
    textFont(ff);
    textSize(25);
    text("Esta es una simulacion de la obra del bioarte 'Victimless Leather'" ,width/2, 150);
    text("creada por Orons Catts e Ionatt Zurr. ", width/2-150, 180);
    text("La obra cultiva una chamarra de cuero de manera artificial", width/2-30, 250);
    text("a través de un mecanismo de goteo que alimenta a las células", width/2-15, 280);
    text("madres en crecimiento.", width/2-225, 310);
    
    textFont(f);
    textSize(20);
    text("> Presiona '2' para continuar.", 500, 600);
    
    if (keyPressed)
    if(key == '2')
    pantalla++;
  }
  
  void Victimless(){
  background(fondo);
  
  tint(255,120);
  image(botella, width/2-250,-30,500,500);
  noTint();
  chaqueta.dibujar();
  
    if (random(15) < 0.1) {
    gotas.add(new Gota((width/2),5,5));
  }
   

  box2d.step();
  
    for (int i = gotas.size()-1; i >= 0; i--) {
    Gota g = gotas.get(i);
    g.dibujar();
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    if (g.done()) {
      gotas.remove(i);
   }
    }
    
    
    if (keyPressed)
    if(key == '3')
    exit();

  }
    

  }
