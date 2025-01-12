class RegisterModel {
  final String email;
  final String username;
  final String password;
  final String firstName;
  // final String lastName;
  // final String phoneNumber;

  RegisterModel({
    required this.email,
    required this.username,
    required this.password,
    required this.firstName,
    // required this.lastName,
    // required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "username": username,
      "password": password,
      "first_name": firstName,
      // "last_name": lastName,
      // "phone_number": phoneNumber,
    };
  }
}
