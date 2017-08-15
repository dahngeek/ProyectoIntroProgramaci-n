class GameController {
  float maldadInicial = 0.2;
  int level = 1;
  int mitad = 30;
  
  
  GameController(){
    
  }
  
  GameController(float maldadIni){
    maldadInicial = maldadIni;
  }
  GameController(float maldadIni, int nivelInicial){
    maldadInicial = maldadIni;
    level=nivelInicial;
  }
  
  void generarAliens(){
    fall=0;
    orientacion = 1;
    int xInicial = int(width*0.1);
    int yInicial = int(height*0.2);
    int fila = 0;
    while(fila<level){
      for(int i=0;i<8;i++){
        Alien generado = new Alien(xInicial+i*2*(tam*10),yInicial+(fila*(tam*15)),maldadInicial);
        alienigenas.add(generado);
      }
      fila++;
    }
    
  }
  
   
  void imprimirUsuarios(){
    int usuariosVivos = 0;
    for(int i =0; i<usuarios.size();i++){
       NaveUsuario naveActual = usuarios.get(i);
       naveActual.recibirTeclas();
       naveActual.dibujar();
       naveActual.dibujarVidas(i);
       if(!naveActual.estaMuerto()){
         usuariosVivos++;
       }
    }
    if(usuariosVivos==0){
      pantalla=2;
    }
  } 
  
  void revisarJuego(){
    //Controlamos el nivel
    if(alienigenas.size() <=0 && level<4){
      level++;
      generarAliens();
    } else if(alienigenas.size()<=0 && level>=4){
      maldadInicial = maldadInicial*2;
      generarAliens();
    }
    
    if(alienigenas.size()<mitad){
        orientacion = orientacion*2;
        mitad = (int)mitad/4;
    }
  }
}