class Time{
  int h, m;
  public Time(int h, int m){
    this.h = h;
    this.m = m;
  }
  public String toString(){
    return nf(h,2)+":"+nf(m,2);
  }
}
