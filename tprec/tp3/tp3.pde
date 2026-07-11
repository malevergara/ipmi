//https://youtu.be/gCjaezKTOd8
PImage lineas;
int separacionLineas = 30;
float angulo = 0;

void setup(){
  size(800, 400);
lineas = loadImage("Lineas.jpeg");
lineas.resize(400, 400);
stroke(0);
strokeWeight(2);
}

void draw(){
background(255);
image(lineas, 0, 0);
clip(400, 0, 400, 400);
pushMatrix();
translate(400, 0);
translate(200, 200);
rotate(radians(angulo));
translate(-200, -200);

float grosor = 2;
if (mouseX > 400 && mouseX < 800 && mouseY > 0 && mouseY < 400){
float distancia = dist(mouseX, mouseY, 600, 200);
grosor = map(distancia, 0, 300, 3.5, 2);
}

strokeWeight(grosor);
dibujarPatron(separacionLineas);
popMatrix();
noClip(); 
}
void dibujarPatron(int separacion){
int contador = 1;
for (int x = -250; x < 650; x += separacion){
line(x, 400, x + 250, 0);
for (int y = 20; y < 400; y += 18){
float px = calcularX(x, y);
float py = 400 - y;
if (contador % 2 == 0){
line(px, py - 12, px, py + 12);}
else{
line(px - 12, py, px + 12, py);}
}

contador++;
}
}
float calcularX(int x, int y){
return x + y * 0.625;
}
void mousePressed(){
if (mouseButton == LEFT){
separacionLineas = int(random(20, 50));
}
if (mouseButton == RIGHT){
angulo += 90;
}}
void keyPressed(){
if (key == 'r' || key == 'R'){
separacionLineas = 30;
angulo = 0;
}}
