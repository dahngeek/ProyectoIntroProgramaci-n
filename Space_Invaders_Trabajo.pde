 int ancho;
 int alto;
 int tam;
 
 PFont gover;
 boolean derecha = false;
 boolean izquierda = false;
 ArrayList<Disparo> balas = new ArrayList<Disparo>();
 ArrayList<Alien> alienigenas = new ArrayList<Alien>();
 ArrayList<DisparoAlien> tiros = new ArrayList<DisparoAlien>();
 ArrayList<NaveUsuario> usuarios =  new ArrayList<NaveUsuario>();
 int orientacion=1;
 int fall=0;
 PImage fondo;
 PImage gameover;
 PImage boton;
 int pantalla = 0;
 int score = 1900;
 int limite= 0;
 int golpes=0;
 GameController juego = new GameController(); 
 
 
void setup ()
{
  size(700,700);
  tam=(width+height/2)/300;
  ancho=width;
  alto= height;
  //fullScreen();
  background(0);
  fill(255);
  fondo = loadImage("fondo.jpg");
  boton = loadImage("gameButton.png");
  gameover = loadImage("gameover.jpg");
  juego.generarAliens();
  gover = createFont("Gameplay.ttf",72);
  textFont(gover);
}

 void draw(){
   if(pantalla ==0){
     pantallaInicial();
   } else if(pantalla==1){
     pantallaDeJuego();
   } else if(pantalla==2){
     pantallaFinal();  
   }
 }

void pantallaInicial(){
  background(0);
  if(width>600 && height>600){
    image(fondo, (int)((width/2)-300),(int)((height/2)-300),600,600);
  } else {
    image(fondo, 0,0,width,height);
  }
  
  int anchoboton = int(width*0.4);
  int altoboton = int(height*0.13);
  
  //Detectar mouse en el boton 
  boolean inButton = mouseX>=(width/2-anchoboton/2) && mouseX<=(width/2+(anchoboton/2)) && mouseY >= height/2+tam*4-altoboton/2 && mouseY <= height/2+tam*4+altoboton/2;
  if(inButton){
    anchoboton = int(width*0.47);
    altoboton = int(height*0.15);
  }
  
  //Cambiar a la pantalla de juego.
  if (mousePressed && (mouseButton == LEFT) && inButton) {
    NaveUsuario user1 = new NaveUsuario();
    usuarios.add(user1);
    pantalla = 1;
  }
  
  //Cambiar a la pantalla de juego.
  if (mousePressed && (mouseButton == RIGHT) && inButton) {
    NaveUsuario user1 = new NaveUsuario();
    usuarios.add(user1);
    NaveUsuario user2 = new NaveUsuario(34,33,35,150);
    usuarios.add(user2);
    pantalla = 1;
  }
  image(boton, width/2-anchoboton/2,height/2+tam*4-altoboton/2,anchoboton,altoboton);
 
}

void pantallaDeJuego(){
   juego.revisarJuego();
   //Las Funciones no necesitan descripcion haha.
   background(0);
   juego.imprimirUsuarios();
   //movimientoNave();
   dibujarBalas();
   score();
   //golpes();
   dibujarTiros();
   for (Alien a : alienigenas){
     if(a.estaVivo){
       a.dibujarAlien();
       a.moveAlien();
     }
   }
}

void pantallaFinal(){
   background(0);
    if(width>600 && height>600){
      image(gameover, (int)((width/2)-300),(int)((height/2)-300),600,600);
    } else {
      image(gameover, 0,0,width,height);
    }
   fill(255);
   textSize(72);
   if(score<9){
     text(score, width*0.45, height*0.70);
   } else if(score<99){
     text(score, width*0.38, height*0.70);
   }
   else if(score<990){
     text(score, width*0.36, height*0.70);
   } else {
     text(score, width*0.34, height*0.70);
   }
   
   if (keyPressed){
     pantalla=0;
   }
 }
 
 void keyReleased()
 {
   for(int i =0; i<usuarios.size();i++){
     NaveUsuario naveActual = usuarios.get(i);
     naveActual.soltarTeclas(keyCode);
   }
   //println(keyCode);
 }
 //void movimientoNave(){
 //  if  (derecha == true){ //Si el valor derecha esta activado
   
 //  }
 //  if (izquierda == true){// Si el valor izquierda esta activado 
   
 //  }
   
   
 //}
  void score(){
    fill(255);
    textSize(32);
    text(score, 20, 60);
  }
  
  //void golpes(){
  //  fill(255);
  //  textSize(32);
  //  text(golpes, 400, 30);
  //}