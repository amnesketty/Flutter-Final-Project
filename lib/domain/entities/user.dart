class User {
  final String firstName, lastName, email, phone, token;

  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.token});

  factory User.fromResponse(Map<String, dynamic> response) {
    final firstName = response['data']['firstName'] ?? '';
    final lastName = response['data']['lastName'] ?? '';
    final email = response['data']['email'] ?? '';
    final phone = response['data']['phone'] ?? '';
    final token = response['data']['token'] ?? '';

    return User(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        token: token);
  }
}

        // public string FirstName { get; set; } = string.Empty;
        // public string LastName {get; set; } = string.Empty;
        // public string Username { get; set; } = string.Empty;
        // public string Email { get; set; } = string.Empty;
        // public string Phone { get; set; } = string.Empty;
        // public string Password {get; set; } = string.Empty;