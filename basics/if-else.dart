main() {
  /// if else
  ///  jodi ->  if , nahoi -> else
  double weather = 31;

  // jodi weather < 25, tahole ami ghurte jabo
  if (weather < 25) {
    // what to do
    print('Going for walk');
  } else if (weather >= 25 && weather <= 30) {
    print('Will go to gym');
  } else if (weather == 31) {
    print('Will go for swim');
  } else {
    print('Will do some work');
  }
}
