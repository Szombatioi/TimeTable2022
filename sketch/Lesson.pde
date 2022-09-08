class Lesson{
  String name, type, place;
  Time start, end;
  
  public Lesson(String n, String t, String p, Time s, Time e){
    name = n;
    type = t;
    place = p;
    start = s;
    end = e;
  }
  public void draw(int size){
    textSize(0.5*size);
    text(start+"-"+end, width/2, height/2-1.5*size);
    textSize(size);
    text(name, width/2, height/2);
    textSize(size/2);
    text(type+"\n"+place, width/2, height/2+1.5*size);
  }
  
  //!!!FOR TESTS
  public String toString(){
    return name+" "+type+" "+place+" "+start+" "+end;
  }
}
