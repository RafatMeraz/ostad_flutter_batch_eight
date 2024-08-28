main() {
  int a = 34;
  int b = 23;
  print(a + b);
  print(a - b);
  print(a / b);
  print(a * b);
  print(a % b);

  // a++ / a = a+1;

  print(a++); // postfix -> print a, then add 1 into a
  print(a);

  print(++a); // prefix -> add 1 into a, then print
  print(a);

  print(a--); // a = a - 1; // postfix -> print a, then subtract 1 into a
  print(a);

  print(--a); // a = a - 1; // prefix -> subtract 1 into a, then print

  print(a > 12);
  print(b < 50);
  print(b >= 24);
  print(a > 30 && b < 30); // true && true = true
  print(a < 30 && b > 30); // true && true = true
  print(a < 30 ||
      b < 30); // true or true = true // false && true = true // false && false = false

  a = a * 45;
  a *= 45;

  b = b + 4;
  b += 4;

  b = b % 12;
  b %= 12;
}
