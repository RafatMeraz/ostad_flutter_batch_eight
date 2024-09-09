void main() {
  Person userOne = Person(
    username: 'Sakib',
    address: 'Address',
    // university: 'DU',
    age: 23
  ); // object
  // userOne.username = 'Rakib';
  // userOne.address = 'Tangail';
  // userOne.university = 'DU';

  print(userOne.getPersonAddress());

  // class-name objectName = class-constructor;
  MathOperation mathOperation = MathOperation();

  userOne.updateUserName('Rakib Hasan');
  print(userOne.username);
  userOne.updateUniversity('sdfasdf');
  print(userOne.university);

  Person rahim = Person(username: 'Rahim', address: 'Rangpur', age: 12);
  print(rahim.getPersonAddress());
}

class Person {
  // properties/attributes
  String username = '';
  String address = '';
  late String university;

  int age;

  //
  // Person(String n, String a, String u) {
  //   username = n;
  //   address = a;
  //   university = u;
  // }

  // Person(this.username, this.address, this.university);

  Person({
    required this.username,
    required this.address,
    // required this.university,
    required this.age,
  }) {
    print('Hello, creating an object');
  }

  // methods
  String getPersonAddress() {
    return address;
  }

  void updateUserName(String userName) {
    username = userName;
  }

  void updateUniversity(String university) {
    this.university = university;
  }
}

class MathOperation {
  MathOperation() {
    print('Creating during the object creation');
  }

  int add(int a, int b) {
    return a + b;
  }

  int subtract(int a, int b) {
    return a - b;
  }
}
