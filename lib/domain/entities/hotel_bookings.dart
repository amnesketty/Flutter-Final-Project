class HotelBookings {
  final String bookingDate;
  final int id, totalRoom, price, hotelId, roomId, userId;

  HotelBookings({
    required this.id,
    required this.bookingDate,
    required this.totalRoom,
    required this.price,
    required this.hotelId,
    required this.userId,
    required this.roomId,
  });

  factory HotelBookings.fromResponse(Map<String, dynamic> response) {
    final id = response['id'] ?? 0;
    final bookingDate = response['bookingDate'] ?? '';
    final totalRoom = response['totalRoom'] ?? 0;
    final price = response['price'] ?? 0;
    final hotelId = response['hotelId'] ?? 0;
    final userId = response['userId'] ?? 0;
    final roomId = response['roomId'] ?? 0;

    return HotelBookings(
        id: id,
        bookingDate: bookingDate,
        totalRoom: totalRoom,
        price: price,
        hotelId: hotelId,
        userId: userId,
        roomId: roomId);
  }
}
