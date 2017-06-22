final class NaveUsuario {
  int colorWhiteLevel = 255;
  int teclaDerecha = 39;
  int teclaIzquierda = 37;
  int teclaDisparo = 32;
  int x = ancho/2;
  int y = alto - (alto/10);
  int salud = 6;
  int saludAnterior = salud;
  boolean derecha = false;
  boolean izquierda = false;
  
  
  NaveUsuario(){
    //Con defaults
  }
  NaveUsuario(int teclaI, int teclaD, int teclaDis){
    teclaIzquierda = teclaI;
    teclaDerecha = teclaD;
    teclaDisparo = teclaDis;
  }
  NaveUsuario(int teclaI, int teclaD, int teclaDis,int whiteCL){
    teclaIzquierda = teclaI;
    teclaDerecha = teclaD;
    teclaDisparo = teclaDis;
    colorWhiteLevel = whiteCL;
  }
  
  void recibirTeclas(){
    if(keyPressed){
       println(keyCode);
       //println("" + keyCode);//  PARA VER LOS CODIGOS DE LAS TECLAS
       if (keyCode == teclaDerecha) // tecla DERECHA o D
       {
         derecha=true;
       }
       if (keyCode == teclaIzquierda){// tecla IZQUIERDA o A   
         izquierda = true;
       }
    }
  }
  
  void soltarTeclas(int kodigoTecla){
      if (kodigoTecla == teclaDerecha){
        derecha= false;
      }
      if (kodigoTecla == teclaIzquierda){
        izquierda=false;
      }
      if (kodigoTecla == teclaDisparo){// barra espaciadora  
         if(balas.size()<3 && !estaMuerto()){
           Disparo aux = new Disparo(x,y);
           balas.add(aux);
         }
       }
  }
  
  void dibujarVidas(int index){
    int vida = salud;
    int numeroDeCorazon = 0;
    dibujar((int)(0.95*width),(int)((0.05*height)+(tam*5)+(tam*20*index)));
    while(vida > 0){
      if(vida>1){
        dibujaCorazon((int)((0.85*width)-(numeroDeCorazon*(tam*15))),(int)((0.05*height)+(tam*20*index)), false);
        vida = vida - 2;
      } else {
        dibujaCorazon((int)((0.85*width)-(numeroDeCorazon*(tam*15))),(int)((0.05*height)+(tam*20*index)), true);
        vida = vida - 1;
      }
      numeroDeCorazon++;
    }
  }
  
  void dibujaCorazon(int x, int y, boolean par){
    int tam = 2;
    noStroke();
    fill(255,255,255);
    rect(x+tam,y-tam,tam,tam*3);
    rect(x-tam,y+tam*2,tam,tam*6);
    rect(x+tam*18,y+tam*2,tam,tam*6);
    rect(x-tam,y+tam,tam*2,tam);
    rect(x+tam,y-tam,tam*16,tam);
    rect(x+tam*8,y,tam*2,tam*2);
    rect(x+tam*16,y,tam,tam*4);
    rect(x+tam*16,y+tam,tam*3,tam);
    rect(x-tam,y+tam*8,tam*3,tam);
    rect(x+tam*16,y+tam*8,tam*3,tam);
    rect(x+tam,y+tam*8,tam,tam*2);
    rect(x+tam*16,y+tam*8,tam,tam*2);
    rect(x+tam*3,y+tam*10,tam,tam*2);
    rect(x+tam*14,y+tam*10,tam,tam*2);
    rect(x+tam*5,y+tam*12,tam,tam*2);
    rect(x+tam*12,y+tam*12,tam,tam*2);
    rect(x+tam*7,y+tam*14,tam,tam*2);
    rect(x+tam*10,y+tam*14,tam,tam*2);
    rect(x+tam*9,y+tam*16,tam,tam);
    rect(x+tam*8,y+tam*16,tam,tam);
    rect(x+tam,y+tam*10,tam*2,tam);
    rect(x+tam*15,y+tam*10,tam*2,tam);
    rect(x+tam,y+tam*10,tam*2,tam);
    rect(x+tam*3,y+tam*12,tam*2,tam);
    rect(x+tam*13,y+tam*12,tam*2,tam);
    rect(x+tam*5,y+tam*14,tam*2,tam);
    rect(x+tam*11,y+tam*14,tam*2,tam);
    
    fill(0,0,0);
    rect(x+tam*2,y,tam*6,tam*2);
    rect(x+tam*8,y+tam*2,tam*2,tam*2);
    rect(x+tam*10,y,tam*6,tam*2);
    rect(x,y+tam*2,tam*2,tam*6);
    rect(x+tam*16,y+tam*2,tam*2,tam*6);
    rect(x+tam*2,y+tam*8,tam*2,tam*2);
    rect(x+tam*14,y+tam*8,tam*2,tam*2);
    rect(x+tam*4,y+tam*10,tam*2,tam*2);
    rect(x+tam*12,y+tam*10,tam*2,tam*2);
    rect(x+tam*6,y+tam*12,tam*2,tam*2);
    rect(x+tam*10,y+tam*12,tam*2,tam*2);
    rect(x+tam*8,y+tam*14,tam*2,tam*2);
    fill(255,0,0);
    rect(x+tam*10,y+tam*2,tam*6,tam*6);
    rect(x+tam*10,y+tam*8,tam*4,tam*2);
    rect(x+tam*10,y+tam*10,tam*2,tam*2);
    rect(x+tam*9,y+tam*4,tam,tam*10);
    if(par){
      fill(255,255,255);
    }
    rect(x+tam*2,y+tam*2,tam*6,tam*6);
    rect(x+tam*4,y+tam*8,tam*4,tam*2);
    rect(x+tam*6,y+tam*10,tam*2,tam*2);
    rect(x+tam*8,y+tam*4,tam,tam*10);
  
  }
  
  boolean estaMuerto(){
    if(salud<=0){
      return true;
    } else {
      return false;
    }
  }
  
  void dibujar(){
    if(estaMuerto()){
      return;
    }
    if  (derecha == true){ //Si el valor derecha esta activado
      x= x+(height/200);
    }
    if (izquierda == true){// Si el valor izquierda esta activado 
      x= x-(height/200);
    }
    //Que no se salga del margen
    if (x<tam*10){
      x=tam*10;
    }
    if (x>width-tam*10){
      x=width-tam*10;
    }
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
    if(salud!=saludAnterior){
      saludAnterior = salud;
      fill(255,0,0);//cuadros blancos
    } else {
      fill(colorWhiteLevel,colorWhiteLevel,colorWhiteLevel);//cuadros blancos
    }
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
    //Circulos de colision
    //fill(0,255,0);
    //ellipse(x,y,tam*10,tam*10);
    //ellipse(x+tam*5,y+tam*4,tam*4,tam*4);
    //ellipse(x-tam*5,y+tam*4,tam*4,tam*4);
  }
  
  void dibujar(int x, int y){
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
    if(salud<=0){
      fill(255,0,0);//cuadros blancos
    } else {
      fill(colorWhiteLevel,colorWhiteLevel,colorWhiteLevel);//cuadros blancos
    }
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
    //Circulos de colision
    //fill(0,255,0);
    //ellipse(x,y,tam*10,tam*10);
    //ellipse(x+tam*5,y+tam*4,tam*4,tam*4);
    //ellipse(x-tam*5,y+tam*4,tam*4,tam*4);
  }
  
    void reducirSalud(){
    salud = salud-1;
  }
}