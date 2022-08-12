/**TODO
* EventListeners (day change, lesson change)
* 
* 
*/


//time table for uni

import java.util.Calendar;
int today;
Lesson current;
Lesson[] lessons;
Lesson pointer;
void setup(){
  frameRate(2); //TODO set it to 1
  fullScreen();
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK)-1;
  println(today);
  
  lessons = new Lesson[5]; //for each day, a list
  
  /****Working with file****/
  lessons[0] = new Lesson("Prog3", "Előadás", "IB027", new Time(10,15), new Time(12,0), null);
  lessons[1] = new Lesson("ValSzám", "Előadás", "IB028", new Time(12,15), new Time(14,0), null);
  
  
  //Műk. elv.
  lessons[0].next = lessons[1];
  pointer = lessons[0]; //later -> change when day changed
  while(pointer != null) {
    println(pointer.name);
    pointer = pointer.next;
  }
}

void draw(){
  background(0);
  //image
  
  
  if(today<5) { //if it is a weekday, render
    
    ///lessons[today].draw(48);
    
    /**************************For test***************/
    stroke(255);
    stroke(255,0,0);
    line(width/2, 0, width/2, height);
    line(0, height/2, width, height/2);
  }
}
