class Human {
  void eating() {
    print('Eating');
  }

  void moving() {
    print('Moving');
  }
}

// Student -> Child of Human=Parent
class Student extends Human {
  void joiningClasses() {
    print('Joining classes via Zoom');
  }
}

class Teacher extends Human {}

class Engineer extends Human {}

class SoftwareEngineer extends Engineer {
  void coding() {
    print('Coding in Dart');
  }
}
