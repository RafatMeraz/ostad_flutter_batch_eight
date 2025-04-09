class SignUpModel {
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String password;
  final String deliveryAddress;

  SignUpModel(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.password,
      required this.deliveryAddress});

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": phone,
      "city": deliveryAddress,
    };
  }
}
