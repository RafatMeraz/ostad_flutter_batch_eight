void main() {
  // Null operator => ?, !, ??
  // Nullable integer
  int? a;
  int? b = null;
  print(a);
  print(b);

  a = 34;
  print(a);

  a = null;
  print(a);

  a = 45;
  b = 45;

  // Force unwrap
  int result = a! + b!;
  print(result);

  String? username;
  // if (username == null) {
  //   print('default username');
  // } else {
  //   print(username);
  // }
  print(username ?? 'default username');
  print(username ?? 'another');
}