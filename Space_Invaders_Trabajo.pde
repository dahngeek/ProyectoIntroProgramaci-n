 int ancho=600;
 int alto= 600;
 int x = ancho/2;
 int y = alto - (alto/10);
 boolean derecha = false;
 boolean izquierda = false;
 int tam= (ancho+alto/2)/300;
 ArrayList<Disparo> balas = new ArrayList<Disparo>();
 ArrayList<Alien> alienigenas = new ArrayList<Alien>();
 int orientacion=1;
 int fall=0;
 PImage fondo;
 PImage boton;
 int pantalla = 0;
void setup ()
{
  size(600,600);
  background(0);
  fill(255);
 // disparos(x,y-tam*6);
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
  
  boolean inButton = mouseX>=(width/2-anchoboton/2) && mouseX<=(width/2+anchoboton) && mouseY >= height/2+tam*4-altoboton/2 && mouseY <= height/2+tam*4+altoboton;
  if(inButton){
    anchoboton = int(width*0.47);
    altoboton = int(height*0.15);
  }
  if (mousePressed && (mouseButton == LEFT) && inButton) {
    pantalla = 1;
  }
  image(boton, width/2-anchoboton/2,height/2+tam*4-altoboton/2,anchoboton,altoboton);
}
 
 void keyPressed(){ // Se Activa Cuando se presiona una tecla
    //println("" + keyCode);//  PARA VER LOS CODIGOS DE LAS TECLAS
   if (keyCode == 39 || keyCode == 68) // Si se presiona la tecla DERECHA o D
   {
     derecha= true; 
   }
   if (keyCode == 37 || keyCode == 65){// Si se presiona la tecla IZQUIERDA o A   
     izquierda = true;
   }
   if (keyCode == 32){// Si se presiona la barra espaciadora  
     if(balas.size()<3){
       Disparo aux = new Disparo(x,y);
       balas.add(aux);
     }
   }
 }
 
 void keyReleased() // El Void KeyReleased se activa cuando se suelta una tecla
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

void generarAliens(){
  int xInicial = int(width*0.1);
  int yInicial = int(height*0.2);
  
  int fila = 0;
  while(fila<3){
    for(int i=0;i<8;i++){
      Alien generado = new Alien(xInicial+i*2*(tam*10),yInicial+(fila*(tam*15)));
      alienigenas.add(generado);
    }
    fila++;
  }
  
}

void dibujarBalas(){
  for (int bal = 0; bal<balas.size(); bal++ ){
     Disparo balaActual = balas.get(bal);
     if(balaActual.salio()){
       balas.remove(bal);
     } else {
       balaActual.avanzeBala();
       balaActual.hacerBala();
     }
   }
}

class Disparo{
    int xshot=0;
    int yshot=0;
    Disparo(int xball, int yball){
      xshot=xball;
      yshot=yball;
    }
    void hacerBala(){
      fill(0,255,0);
      stroke(0,255,0);
      line(xshot,yshot-tam*6,xshot,yshot);
    }
    void avanzeBala(){
      boolean colisiona = false;
      
      for(int a = 0; a<alienigenas.size(); a++){
        Alien alienActual = alienigenas.get(a);
        if(alienActual.colisiona(xshot,yshot-tam*6)){
          colisiona = true;
          alienigenas.remove(a);
          break; //Deja de evaluar porque sabemos que colisionó con esta bala
        }
      }
      
      if(colisiona){
        yshot = -1;
      } else{
        yshot= yshot-4;
      }
    }
    boolean salio(){
      if (yshot<0){
        return true;
      }
      return false;
    }
}

class Alien{
    int posx = 0;
    int posy = 0;
    boolean puedeDisparar = false;
    boolean estaVivo = true;
    float anchoAlien = tam*9;
    float altoAlien = tam*10;
    Alien(int xball, int yball){
      posx=xball;
      posy=yball;
      
      //Aqui define si el alien puede o no disparar. 
      if(random(50)>40){
        puedeDisparar = true;
      }
      
    }
    void dibujarAlien(){
      //Si no está vivo no lo imprimimos
      if(!estaVivo){
        return;
      }
      //dibuja el alien..
        noStroke();
        fill(255,255,0);//color amarillo
        rect(posx,posy+fall,tam,tam*5);
        rect(posx-tam*2,posy+tam+fall,tam,tam);
        rect(posx+tam*2,posy+tam+fall,tam,tam);
        rect(posx-tam*2,posy+tam*3+fall,tam*5,tam);
        rect(posx-tam,posy+tam*4+fall,tam*3,tam);
        rect(posx-tam,posy+tam*7+fall,tam*3,tam);
        fill(255,0,0);//color rojo
        rect(posx-tam,posy+tam+fall,tam,tam*2);
        rect(posx+tam,posy+tam+fall,tam,tam*2);
        rect(posx-tam*2,posy+tam*2+fall,tam*2,tam);
        rect(posx+tam*2,posy+tam*2+fall,tam,tam);
        rect(posx-tam,posy+tam*5+fall,tam*3,tam*2);
        rect(posx-tam,posy+tam*8+fall,tam*3,tam);
        rect(posx,posy+tam*9+fall,tam,tam);
        if(puedeDisparar){
          fill(150,0,255);//color violeta
        } else {
          fill(0,0,255);//color azul
        }
        rect(posx-tam*4,posy+fall,tam,tam*2);
        rect(posx+tam*4,posy+fall,tam,tam*2);
        rect(posx-tam*3,posy+tam*2+fall,tam,tam);
        rect(posx+tam*3,posy+tam*2+fall,tam,tam);
        rect(posx-tam*4,posy+tam*5+fall,tam*2,tam*5);
        rect(posx+tam*3,posy+tam*5+fall,tam*2,tam*5);
        rect(posx-tam*4,posy+tam*5+fall,tam*2,tam*5);
        rect(posx-tam*3,posy+tam*4+fall,tam*2,tam*2);
        rect(posx+tam*2,posy+tam*4+fall,tam*2,tam*2);
  
      //Si puede disparar, genera un disparo
      if(puedeDisparar){
        this.dispararBala();
      }
    }
    
    void moveAlien(){
      posx=posx+orientacion;
      if (posx+tam*9>width||posx-tam*9<0){
        orientacion=orientacion*-1;
        fall=fall+tam*2;
      }
    }
    
    boolean colisiona(int xbala, int ybala){
      if (posx-tam*4<=xbala && posx+tam*4>=xbala && posy-tam*5<=ybala && posy+tam*10>=ybala){
        return true;
      }        
      return false;
    }
    
    void matar(){
      estaVivo = false;
    }
    
    void dispararBala(){
      if (random(50)>45){
        //aqui dispara una bala.
      }
    }
  }