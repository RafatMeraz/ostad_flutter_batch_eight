void main() {
  // welcomeMessage(); // function call
  //
  // welcomeMessage();
  //
  // welcomeMessage();
  //
  welcomeMessage('Niloy'); // argument
  // welcomeMessage('Toufique'); // argument
  //
  // addTwoNums();
  // addTwoNums();
  // addTwoNums();
  // addTwoNums(12.56, 354);
  // addTwoNums(342343, 32434.56);
  // addTwoNums(12.56, 354);
  double result = addTwoNums(32123, 349032094389);
  print(result * 4);
}

// function syntax
// return-type function-name(...parameters) {
//    function body
// }

// declare
void welcomeMessage(String name) { // parameter
  print('Good morning, $name');
  print('How are you?');
  print('Ajke ki ki kaj korben?');
  print('LAst day te ki ki kaj korsilen?');
}

double addTwoNums(double a, double b) {
  // print(a+b);
  double res = a + b;
  return res;
}