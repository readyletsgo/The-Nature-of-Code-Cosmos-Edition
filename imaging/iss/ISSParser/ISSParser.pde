// NOC Cosmos
// https://github.com/shiffman/The-Nature-of-Code-Cosmos-Edition

// Adapted from https://github.com/natronics/ISS-photo-locations/

void setup() {

  size(1200, 600);
  
  // values for converting lat lon to pixels
  float lata = -height / 180.0;
  float latb = height - (lata*-90.0);
  float lona = width / 360.0;
  float lonb = lona*180.0;

  background(255);
  int total = 0;
  // Load all the missions
  for (int i = 1; i < 35; i++) {
    println("Parsing mission " + i);
    Table mission = loadTable("ISS"+nf(i, 3)+".csv");
    for (TableRow row : mission.rows()) {
      // Get lat lon
      float lat = row.getFloat(1);
      float lon = row.getFloat(2);
      stroke(0,10);
      strokeWeight(2);
      // Draw each as xy point
      point(lona*lon+lonb, lata*lat+latb);
      total++;
    }
  }
  
  fill(0);
  text("One dot per photo\nTotal photos: " + nfc(total),10,60);
  
  // This code down here sort of puts it all on a sphere
  /*size(640,480,P3D);
   background(0);
   translate(width/2, height/2);
   for (int i = 1; i < 35; i++) {
   println("drawing mission " + i);
   Table mission = loadTable("ISS"+nf(i, 3)+".csv");
   for (TableRow row : mission.rows()) {
   float lat = row.getFloat(1) * PI/180;
   float lon = row.getFloat(2) * PI/180;
   float r = 200;
   PVector v = new PVector();
   v.x = -r * cos(lat) * cos(lon);
   v.y = -r * sin(lat);
   v.z =  r * cos(lat) * sin(lon);
   pushMatrix();
   translate(v.x, v.y, v.z);
   stroke(255,20);
   point(0, 0);
   popMatrix();
   }
   }*/
}

void draw() {
  noLoop();
}

