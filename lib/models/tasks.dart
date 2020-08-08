class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false}); //gave the checkbox a starting value of unchecked

  void toggleDone() {
    isDone = !isDone; //changes the state of the checkbox i.e. checked/unchecked
  }
}
