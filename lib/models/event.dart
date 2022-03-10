class Event{
  String name = 'event1';
  DateTime date;
  String status = 'new'; // either new or done
  // Video workout;

  Event({
    required this.name,
    required this.date,
    required this.status
  });

  void addEvent(name, date){
    this.name = name;
    this.date = date;
    status = 'new';
  }

  void markDone(){
    status = 'done';
  }
}