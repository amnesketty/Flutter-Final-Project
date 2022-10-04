class User {
  final String firstName, lastName, email, phone, token, avatarImage;

  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.token,
      required this.avatarImage});

  factory User.fromResponse(Map<String, dynamic> response) {
    final firstName = response['data']['firstName'] ?? '';
    final lastName = response['data']['lastName'] ?? '';
    final email = response['data']['email'] ?? '';
    final phone = response['data']['phone'] ?? '';
    final token = response['data']['token'] ?? '';
    final avatarImage = response['data']['avatarImage'] ?? '';

    return User(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        token: token,
        avatarImage: avatarImage);
  }
}