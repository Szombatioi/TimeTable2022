/**TODO
 *  
 * 
 */

import java.util.Calendar;

int today;
String[] textFile;
Lesson[][] lessons;
int LessonIndex;

Time currentTime;
HET mostHet;

void setup() {
  //!!!Test
  mostHet = HET.MINDEN;
  
  frameRate(1);
  //frameRate(2);
  fullScreen();
  //size(600, 600);
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  
  currentTime = new Time(hour(), minute());

  //Working with file
  lessons = new Lesson[5][];
  openFile();
  
  //Getting the INDEX of the day
  getDay();
  setLessonIndex();
}

void draw() {
  background(0);
  EventListeners();
  //image


  if (LessonIndex < lessons[today].length && today<5) { //if it is a weekday, render
    lessons[today][LessonIndex].draw(48);
  }
}

void openFile() {
  textFile = loadStrings("data.txt");

  int day = 0;
  int numberOfLessons;
  int lessonIndex;

  for (int i = 0; i < textFile.length; i++) { //iterating from Mon-Fri
    numberOfLessons = Integer.parseInt(textFile[i]);
    lessons[day] = new Lesson[numberOfLessons];
    lessonIndex = 0;

    for (int j = 0; j < numberOfLessons; j++) {
      String[] data = textFile[++i].split(";"); //name;type;place;s;s;e;e
      int[] x = {
        Integer.parseInt(data[3]),
        Integer.parseInt(data[4]),
        Integer.parseInt(data[5]),
        Integer.parseInt(data[6]),
        Integer.parseInt(data[7])
      };
      
      lessons[day][lessonIndex++] = new Lesson(data[0], data[1], data[2], new Time(x[0], x[1]), new Time(x[2], x[3]), x[4]);
    }
    day++;
  }
}

void getDay(){
  Calendar date = Calendar.getInstance();
  
  mostHet = date.get(Calendar.WEEK_OF_YEAR) % 2 == 0 ? HET.PS : HET.PTL;
  
  today = date.get(Calendar.DAY_OF_WEEK);
  if (today == 0) today = 6; //Sunday
  else today-=2; //Every other day
  
  LessonIndex = 0; //also set it back to 0
}

void setLessonIndex(){
  int i = 0;
  while(i < lessons[today].length && currentTime.greater(lessons[today][i].end)) i++;
  
  LessonIndex = i;
  
}

void EventListeners(){
  //now - idő frissülése mp-ként  ---> mert a framerate 0.1 lesz kb, 1 mp = 10 mp :)
  currentTime = new Time(hour(), minute());
  
  //lessonEnd - mp-ként
  if(LessonIndex < lessons[today].length){
    if(currentTime.equals(lessons[today][LessonIndex].end)) LessonIndex++;
    if(lessons[today][LessonIndex].mikor == HET.MINDEN || lessons[today][LessonIndex].mikor == mostHet) LessonIndex++;
  }
    
  //day - naponta
  if(currentTime.toString() == "00:00") getDay();
}
