class HotelBookings {
  final String bookingDate, bookingHotelNo;
  final int id, totalRoom, price, hotelId, roomId, userId;

  HotelBookings(
  {
    required this.id,
    required this.bookingDate,
    required this.totalRoom,
    required this.price,
    required this.hotelId,
    required this.userId,
    required this.roomId,
    required this.bookingHotelNo
  });

  // factory HotelBooking.fromResponse(Map<String, dynamic> response) {
  //   final bookingDate = response['data']['bookingDate'];
  // }



}


