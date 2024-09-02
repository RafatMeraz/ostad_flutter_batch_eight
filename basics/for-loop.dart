main() {
  // koto bar jete hobe => n times => 50/1000/3493049039
  // counting
  // ekbar kaj korar pore check kore koto bar baki ase

  // count => 100
  // increment = 1+
  // current counting < count -> r ekbar koren

  // for syntax
  // for (initialization : condition : increment/decrement) { block of code }

  for (int i=0; i < 100; i = i + 5) {
    if (i == 50) {
      break;
    }

    if (i == 20) {
      continue;
    }

    print(i);
    print('Go to shop');
    print('Purchase something');
    print('Back to home');
  }

/*  int n = 0; // initialization

  while (n <= 100) { // condition
    // body
    print(n);
    n++; // increment
  }*/
}