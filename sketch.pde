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

String[] textFile;

void setup() {
  frameRate(2); ///TODO set it to 1
  fullScreen();
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);

  //Getting the INDEX of the day
  today = Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
  if (today == 0) today = 6; //Sunday
  else today-=2; //Every other day

  lessons = new Lesson[5]; //for each day, a list

  /****Working with file****/
  openFile();


  //Műk. elv.
  pointer = lessons[0]; //later -> change when day changed
  while (pointer != null) {
    println(pointer.name);
    pointer = pointer.next;
  }
}

void draw() {
  background(0);
  //image


  if (today<5) { //if it is a weekday, render

    ///lessons[today].draw(48);

    /**************************For test***************/
    stroke(255);
    stroke(255, 0, 0);
    line(width/2, 0, width/2, height);
    line(0, height/2, width, height/2);
  }
}

void openFile() {
  textFile = loadStrings("data.txt");
  Lesson iter = null;

  for (int i = 0; i < textFile.length; i++) { //iterating from Mon-Fri
    int numberOfLessons = Integer.parseInt(textFile[i]);
    for (int j = 0; j < numberOfLessons; j++) {
      String[] data = textFile[++i].split(";"); 
      
    }
  }


  //Lesson temp = new Lesson(line[0], line[1], line[2], new Time(x[0], x[1]), new Time(x[2], x[3]), null);
  //if(iter == null) {
  //  iter = temp;
  //  lessons[indexOfDay] = temp;
  //}
  //else{
  //  iter.next = temp;
  //  iter = temp;
  //}
}

//for tests
void wArr(String[] arr) {
  for (int i = 0; i < arr.length; i++) print(arr[i]+" ");
  println();
}
