main() {
  List<String> friends = [
    'Rafi',
    'Shafi',
    'Siam',
    'Mobin',
    'Akash',
  ];

/*  for (int i=0; i < friends.length; i++) {
    print("${i}th friend's name is ${friends[i]}");
  }*/

  for (String f in friends)  {
    print(f);
  }

  Map<String, String> random = {
    'key1': 'skdfjkjdf',
    'key2': 'skdfjkjdf',
    'key3': 'skdfjkjdf',
    'key17': 'skdfjkjdf',
  };

  for (String k in random.keys) {
    print('Key $k : ${random[k]}');
  }
}