PFont miTexto;
PImage titulo, img1, img2, img3, img4, img5;
String texto1, texto2, texto3, texto4, texto5;
int segundos;
int pagina;
float tamFont = 1;
int posX, posY, anchoBoton, altoBoton, tamFigura;
float vel, X = -200, Y = 700, textoY = -100, textoX = 0, textoX3 = -300, textoY4 = -100;


void setup() {
  size(640, 480);
  textSize(20);
  miTexto = loadFont("Calibri-BoldItalic-48.vlw");
  textFont(miTexto);
  
  titulo = loadImage("logo.png");
  img1 = loadImage("img1.png");
  img2 = loadImage("img2.png");
  img3 = loadImage("img3.png");
  img4 = loadImage("img4.png");
  img5 = loadImage("img5.png");
  texto1 = "En un mundo donde la magia lo es todo,\n todos nacen con poder mágico… excepto Asta,\n un joven sin magia. Su mejor amigo, Yuno,\n es un prodigio con gran talento. \n Ambos sueñan con convertirse en el Rey Mago,\n el hechicero más poderoso del reino.";
  texto2 = "Asta se une a los Toros Negros, \n un grupo excéntrico pero fuerte. \n Allí conoce a Noelle, Yami y otros compañeros. \n Mientras tanto, surge una organización enemiga: \n el Ojo del Sol de Medianoche, \n que amenaza la paz del reino.";
  texto3 = "Asta se une a los Toros Negros, \n un grupo excéntrico pero fuerte. \n Allí conoce a Noelle, Yami y otros compañeros. \n Mientras tanto, surge una organización enemiga: \n el Ojo del Sol de Medianoche, \n que amenaza la paz del reino.";
  texto4 = "La historia se vuelve más intensa \n con la aparición de demonios. \n Asta lucha contra Zagred, el causante \n de grandes tragedias del pasado. \n Descubre que su poder está conectado \n con un demonio que vive dentro de su grimorio.";
  texto5 = "El Reino de la Pica y su Tríada Oscura \n desatan una guerra. Asta y Yuno \n entrenan más duro que nunca \n para proteger su reino. \n Aunque sus caminos son distintos, \n los dos siguen luchando \n por el mismo sueño: \n convertirse en el Rey Mago.";
}

void draw() {
  background(0);

  if (frameCount % 60 == 0) { // cuenta de segundos
    segundos++;
  }
  // cambios de pagina
  if (segundos <= 6) {
    pagina = 0;
  } else if (segundos <= 12) {
    pagina = 1;
  } else if (segundos <= 18) {
    pagina = 2;
  } else if (segundos <= 24) {
    pagina = 3;
  } else {
    pagina = 4;
  }


  vel = 0.1;
  //animaciones de texto
  if (pagina == 0 && tamFont < 25) {
    tamFont += vel;
  } else if (pagina == 1 && X < width/2) {
    X += 3;
  } else if (pagina == 2 && textoY < 200) {
    textoY += 3;
  } else if (pagina == 3 && textoX3 < width/2) {
    textoX3 += 5;
  } else if (pagina == 4 && textoY4 < 200) {
    textoY4 += 3;
  }

  posX = 450;
  posY = 400;
  anchoBoton = 120;
  altoBoton = 50;
  tamFigura = 50;


  // contenido de cada pagina (TEXTO + IMAGENES)

  if (pagina == 0) {
    image(img1, 0, 0);
    fill(0, 120);
    rect(30, 30, width-50, height-50);
    fill(255);
    text(texto1, 320, 240);
  } else if (pagina == 1) {
    image(img2, 0, 0);
    fill(0, 120);
    rect(30, 30, width-50, height-50);
    fill(255);
    text(texto2,320, height/2);
  } else if (pagina == 2) {
    image(img3, 0, 0);
    fill(0, 120);
    rect(30, 30, width-50, height-50);
    fill(255);
    text(texto3, 320, textoY);
  } else if (pagina == 3) {
    image(img4, 0, 0);
    fill(0, 120);
    rect(30, 30, width-50, height-50);
    fill(255);
    text(texto4, textoX3, height/2);
  } else if (pagina == 4) {
    image(img5, 0, 0);
    fill(0, 120);
    rect(30, 30, width-50, height-50);
    fill(255);
    text(texto5, 320, textoY4);
  }

  textAlign(CENTER, CENTER);// centrar texto

  textSize(tamFont);


  //boton
  if (pagina == 4) {
    fill(255, 0, 0);
    rect(posX, posY, anchoBoton, altoBoton);
    strokeWeight(3);
    fill(0);
    text("Reiniciar", posX + 60, posY + 25);
  }
}
//comando para reiniciar
void mousePressed() {
  if (frameCount>240) {
    if (mouseX > posX && mouseX < posX + anchoBoton && mouseY > posY && mouseY < posY + altoBoton) {
      segundos = 0;
      tamFont = 1;
      textoX = -width;
      textoY = -100;
      textoX3 = -300;
      textoY4 = -100;
      X = -200;
    }
  }
}
