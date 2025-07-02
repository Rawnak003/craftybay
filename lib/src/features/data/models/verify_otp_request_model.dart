class VerifyOtpRequestModel {
  final String otp;
  final String email;

  VerifyOtpRequestModel({
    required this.otp,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "otp": otp,
      "email": email,
    };
  }
}