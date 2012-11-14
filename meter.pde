// set colors for the meter 
color bottomBlocks = color(240,12,12);
color midBlocks = color(239,240,70);
color topBlocks = color(21,240,7);

// meter circle data
int barW = 40;
int barH = 40;

// top of meter image
PShape apple;

void meter(){
   if (highFive >= 1){
     fill(bottomBlocks); 
     ellipse(width-138, height-121, barW, barH);
   } 
   for (int i = 0; i < highFive; i++){
     if (i > 0 && i < 5){
       fill(bottomBlocks);
       ellipse(width-138, ((height-121)-(barH*i)), barW, barH);
     }
    if (i >= 5 && i < 10){
       fill(midBlocks);
       ellipse(width-138, ((height-121)-(barH*i)), barW, barH);
   }
   if (i >= 10 && i < magicNumber){
       fill(topBlocks);
       ellipse(width-138, ((height-121)-(barH*i)), barW, barH);
   }
}
if (highFive >=magicNumber){
   fill(93,186,83);
   stroke(93,186,83);
   shape(apple, (width-195), 55, 1000, 595); 
}
}
