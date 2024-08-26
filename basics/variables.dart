main() {
  // Container
  // Variable -> container -> contains the value
  // declare syntax
  // data-type variable-name = value;
  // bit -> byte -> 4
  int age = 35;
  print(age);

  double gpa = 4.505;
  print(gpa);

  bool isMale = true;
  print(isMale);

  // String name = 'Rahim';
  // String name = "Rahim";
  String name = '''Rahim
  
  adlksld
  ''';
  print(name);

  int firstNumber = 10;
  int secondNumber = 34;
  firstNumber = 3434;
  secondNumber = 34232536;
  int result = firstNumber + secondNumber;
  print(result);

  String username = 'rahim khan';
  print(username);
  print(username.toUpperCase());
  print(username.toLowerCase());
  print(username.length);
  print(username.isEmpty);
  username = 'Karim Rahman';
  print(username);

  // type conversion -> type casting
  double cgpa = 3.50;
  int res = cgpa.toInt() + firstNumber;
  print(res);

  double a = (firstNumber + secondNumber).toDouble();
  print(a);

  String random = '34.56';
  print(random.runtimeType);

  double moneyToReturn = double.parse(random);
  print(moneyToReturn);
  print(moneyToReturn.runtimeType);

  String f = a.toString();
  print(f.runtimeType);

  // String interpolation
  String message =
      'Hello everyone, greeting from $username Result => ${1 + 49304930403 + 2}';
  print(message);

  String abc = "dsjafjdjf'skdf";

  print(moneyToReturn.toStringAsFixed(1));

  String firstName = 'Rahim';
  String lastName = 'Khan';
  String fullName =
      firstName + ' ' + lastName; // concat => string concatenation
  print(fullName);

  // camelCase, snake_case, PASCAL_CASE
  String userAddress = 'Mirpur 13, Dhaka 1216';
  print(userAddress);
}
