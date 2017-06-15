void generarAliens(){
  int xInicial = int(width*0.1);
  int yInicial = int(height*0.2);
  
  int fila = 0;
  while(fila<4){
    for(int i=0;i<8;i++){
      Alien generado = new Alien(xInicial+i*2*(tam*10),yInicial+(fila*(tam*15)));
      alienigenas.add(generado);
    }
    fila++;
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
        limite=limite+1;
        
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
      if (posx-tam*4<=xbala && posx+tam*4>=xbala && posy-tam*5+fall<=ybala && posy+tam*9+fall>=ybala){
        return true;
      }        
      return false;
    }
    void matar(){
      estaVivo = false;
    }
    
    void dispararBala(){
      if (random(50)>49){
        for(int a = 0; a<alienigenas.size(); a++){
        Alien alienActual = alienigenas.get(a);
        if(alienActual.puedeDisparar && tiros.size()<limite){
          {
       DisparoAlien aux = new DisparoAlien(alienActual.posx,alienActual.posy+tam*9);
       tiros.add(aux);
          }
        }
      }
      }
    }
  }
  void dibujarTiros(){
  for (int tir = 0; tir<tiros.size(); tir++ ){
     DisparoAlien tiroActual = tiros.get(tir);
     if(tiroActual.sale()){
       tiros.remove(tir);
     } else {
       tiroActual.avanzeTiro();
       tiroActual.hacerTiro();
     }
   }
  }
