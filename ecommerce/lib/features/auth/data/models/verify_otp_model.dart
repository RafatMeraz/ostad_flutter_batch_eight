class VerifyOtpModel {
  final String email;
  final String otp;

  VerifyOtpModel({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {'email': email, 'otp': otp};
  }
}
