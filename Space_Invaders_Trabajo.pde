 int ancho=600;
 int alto= 600;
 int x = ancho/2;
 int y = alto - (alto/10);
 boolean derecha = false;
 boolean izquierda = false;
 int tam= (ancho+alto/2)/300;
 ArrayList<Disparo> balas = new ArrayList<Disparo>();
 ArrayList<Alien> alienigenas = new ArrayList<Alien>();
 ArrayList<DisparoAlien> tiros = new ArrayList<DisparoAlien>();
 int orientacion=1;
 int fall=0;
 PImage fondo;
 PImage boton;
 int pantalla = 0;
 int score = 0;
 int limite= 0;
void setup ()
{
  size(600,600);
  background(0);
  fill(255);
  fondo = loadImage("fondo.jpg");
  boton = loadImage("gameButton.png");
 generarAliens();
}

 void draw(){
   if(pantalla ==0){
     pantallaInicial();
   } else if(pantalla==1){ //Jugar
     background(0);
     nave();
     movimientoNave();
     dibujarBalas();
     score();
     dibujarTiros();
     for (Alien a : alienigenas){
       if(a.estaVivo){
         a.dibujarAlien();
         a.moveAlien();
       }
     }
   }   
 }
 
 void pantallaInicial(){
  background(0);
  image(fondo, 0, 0,width,height);
  int anchoboton = int(width*0.4);
  int altoboton = int(height*0.13);
  
  boolean inButton = mouseX>=(width/2-anchoboton/2) && mouseX<=(width/2+(anchoboton/2)) && mouseY >= height/2+tam*4-altoboton/2 && mouseY <= height/2+tam*4+altoboton/2;
  if(inButton){
    anchoboton = int(width*0.47);
    altoboton = int(height*0.15);
  }
  if (mousePressed && (mouseButton == LEFT) && inButton) {
    pantalla = 1;
  }
  image(boton, width/2-anchoboton/2,height/2+tam*4-altoboton/2,anchoboton,altoboton);
}
 
 void keyPressed(){
    //println("" + keyCode);//  PARA VER LOS CODIGOS DE LAS TECLAS
   if (keyCode == 39 || keyCode == 68) // tecla DERECHA o D
   {
     derecha= true; 
   }
   if (keyCode == 37 || keyCode == 65){// tecla IZQUIERDA o A   
     izquierda = true;
   }
   if (keyCode == 32){// barra espaciadora  
     if(balas.size()<3){
       Disparo aux = new Disparo(x,y);
       balas.add(aux);
     }
   }
 }
 
 void keyReleased()
 {
   if (keyCode == 39 || keyCode == 68){
     derecha= false;
   }
   if (keyCode == 37|| keyCode == 65){
     izquierda=false;
   }
 }
 void movimientoNave(){
   if  (derecha == true){ //Si el valor derecha esta activado
   x= x+(height/200);
   }
   if (izquierda == true){// Si el valor izquierda esta activado 
   x= x-(height/200);
   }
   if (x<tam*10){
     x=tam*10;
   }
   if (x>width-tam*10){
     x=width-tam*10;
   }
 }
 
 void nave(){
  //int tam= (height+width/2)/300;
  noStroke();
  fill(255,0,0);//cuadros rojos
  rect(x,y,tam,tam*2);
  rect(x-tam,y-tam*2,tam,tam*3);
  rect(x+tam,y-tam*2,tam,tam*3);
  rect(x-tam*4,y+tam*4,tam*2,tam);
  rect(x-tam*4,y+tam*4,tam,tam*2);
  rect(x+tam*3,y+tam*4,tam*2,tam);
  rect(x+tam*4,y+tam*4,tam,tam*2);
  rect(x-tam*6,y+tam*2,tam,tam*2);
  rect(x+tam*6,y+tam*2,tam,tam*2);
  fill(0,0,255);//cuadros azules
  rect(x,y-tam*4,tam,tam*4);
  rect(x-tam*4,y,tam,tam);
  rect(x+tam*4,y,tam,tam);
  rect(x-tam*3,y-tam,tam,tam);
  rect(x+tam*3,y-tam,tam,tam);
  fill(255,255,255);//cuadros blancos
  rect(x,y-tam*6,tam,tam*2);
  rect(x-tam,y-tam*4,tam,tam*2);
  rect(x+tam,y-tam*4,tam,tam*2);
  rect(x-tam*4,y+tam,tam*4,tam*3);
  rect(x+tam,y+tam,tam*4,tam*3);
  rect(x-tam,y+tam*2,tam*3,tam*3);
  rect(x-tam*2,y-tam*2,tam,tam*3);
  rect(x+tam*2,y-tam*2,tam,tam*3);
  rect(x-tam*3,y,tam,tam);
  rect(x+tam*3,y,tam,tam);
  rect(x-tam*5,y+tam*4,tam,tam*2);
  rect(x+tam*5,y+tam*4,tam,tam*2);
  rect(x-tam*6,y+tam*4,tam,tam);
  rect(x+tam*6,y+tam*4,tam,tam);
 }
  void score(){
    fill(255);
    textSize(32);
    text(score, 10, 30);
  }
  class DisparoAlien{
    int tirox=0;
    int tiroy=0;
    DisparoAlien(int xtiro, int ytiro){
      tirox=xtiro;
      tiroy=ytiro;
    }
    void hacerTiro(){
      fill(255,0,0);
      stroke(255,0,0);
      rect(tirox,tiroy+fall,tam,tam*3);
    }
    void avanzeTiro(){
      tiroy=tiroy+3;
    }
    Boolean sale(){
      if (tiroy>height){
        return true;
      }
      return false; 
  }
  }
