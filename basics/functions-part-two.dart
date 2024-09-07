void main() {
  printMyName('Halim');
  printMyName('Yousouf');
  int res = getResult(123, 23);
  print(res);
  getResult(12323, 34367, 98596);
  String userName = getUserName(id: 34, age: 23);
  print(userName);
}

String getUserName({required int age, int id=0}) { // named optional parameter
  return 'Jahir Khan';
}

int getResult(int a, int b, [int c = 0]) { // optional parameter
  print(c);
  return (a * b) + 10;
}

void printMyName(String name) {
  print(name);
}