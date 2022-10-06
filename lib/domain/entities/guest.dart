class Guest {
  final String name, email, phone;
  final int bookingHotelId;

  Guest(
      {required this.name,
      required this.email,
      required this.phone,
      required this.bookingHotelId});

  factory Guest.fromResponse(Map<String, dynamic> response) {
    final name = response['name'] ?? '';
    final email = response['email'] ?? '';
    final phone = response['phone'] ?? '';
    final bookingHotelId = response['bookingHotelId'] ?? 0;

    return Guest(
        name: name, email: email, phone: phone, bookingHotelId: bookingHotelId);
  }
}
