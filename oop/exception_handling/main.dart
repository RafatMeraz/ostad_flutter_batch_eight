void main() {
  try {
    print('Going to the office');
    // throw Exception('Our custom exception');
    throw DoorManException();
    print('Reached at office');
    print('Coming back to home');
  } on DoorManException {
    print('Our custom made exception');
  } catch (e) {
    print(e.toString());
  } finally {
    print('finally executed');
  }

  print('Taking breath');
}

// try, catch, throw
class DoorManException implements Exception {
  @override
  String toString() {
    return 'Random Exception';
  }
}