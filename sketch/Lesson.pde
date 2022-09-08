enum HET{
  MINDEN, PS, PTL
};

class Lesson{
  String name, type, place;
  Time start, end;
  HET mikor;
  
  public Lesson(String n, String t, String p, Time s, Time e, int mikor){
    name = n;
    type = t;
    place = p;
    start = s;
    end = e;
    if(mikor == 0) this.mikor = HET.MINDEN;
    else this.mikor = mikor == 1 ? HET.PTL : HET.PS;
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
