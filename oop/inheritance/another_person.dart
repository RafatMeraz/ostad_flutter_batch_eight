import 'person.dart';

class AnotherPerson extends Person {
  @override
  void moving() {
    print('Moving with BMW');
  }

  @override
  void eating() {
    super.eating();
    print('Adding healthy foods');
  }
}
