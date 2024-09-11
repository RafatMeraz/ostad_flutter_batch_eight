// encapsulation library level
class Student {
  // property/attribute
  String username;
  String university;
  int _result = 23;

  Student({required this.university, required this.username}) {
    _showDebugMessage();
  }

  // methods/behaviour

  int showResult() {
    return _result;
  }

  void eating() {
    print('$username is eating');
  }

  void _showDebugMessage() {
    print('Creating object of Student');
  }
}
