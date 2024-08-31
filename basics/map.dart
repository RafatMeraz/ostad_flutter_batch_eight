main() {
  // Key : Value
  // Map<int, String> students = <int, String>{};
  Map<int, String> students = {
    1 : 'Rahim',
    2 : 'Karim',
    67 : 'Hasan',
    34 : 'Fahad'
  };

  print(students);
  print(students[2]);
  print(students[34]);
  print(students[34234]);

  Map<String, String> friends = {
    'fahad' : 'Teacher',
    'iram' : 'Software engineer',
    'fahad' : 'Engineer'
  };

  friends['fahad'] = 'Businessman';

  friends['key'] = 'value';

  friends.addAll({
    'marud' : 'iOS developer',
    'tareq' : 'iOS developer',
  });

  print(friends);
  // friends.clear();

  Map<String, List<String>> friendsFriends = {};
  friendsFriends['fahim'] = [
    'abc',
    'abc',
    'abc',
    'abc',
    'abc',
    'abc',
    'abc',
    'abc',
    'abc',
  ];

  print(friendsFriends);

  print(friends.keys);
  print(friends.values);
  
  friends.remove('iram');
  print(friends);
}