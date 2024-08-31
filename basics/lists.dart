main() {
  // List<String> listOfStudentsName = <String>[];
  List<String> listOfStudentsName = ['Rahim', 'Karim', 'Mamum', 'Hafiz'];
  print(listOfStudentsName);
  print(listOfStudentsName[1]);
  listOfStudentsName.add('Hasan');
  print(listOfStudentsName);
  print(listOfStudentsName.length);
  print(listOfStudentsName.isNotEmpty);
  print(listOfStudentsName.isEmpty);
  print(listOfStudentsName.last);
  print(listOfStudentsName.first);
  List<String> names = ['afjkdf', 'sdfsdf', 'dfa343'];
  listOfStudentsName.addAll(['Tanmoy', 'Sara', 'Shamim']);
  listOfStudentsName.addAll(names);
  print(listOfStudentsName);

  names.add('sdafsdf');
  print(names);

  names.insert(0, 'rafi');
  print(names);
  names.insertAll(1, ['Siam', 'Fahim']);
  print(names);
  names[0] = 'Shafi';
  print(names);
  names.remove('Siam');
  print(names);
  names.removeAt(0);
  print(names);
  // names[1]
  print(names.elementAt(1));
}