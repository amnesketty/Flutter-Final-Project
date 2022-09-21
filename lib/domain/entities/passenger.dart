class Passenger {
  final int id, bookingFlightId;
  final String title, name, idCard;

  Passenger({
    required this.id,
    required this.bookingFlightId,
    required this.title,
    required this.name,
    required this.idCard,
  });

  factory Passenger.fromResponse(Map<String, dynamic> response) {
    final id = response['id'] ?? 0;
    final bookingFlightId = response['bookingFlightId'] ?? 0;
    final title = response['bookingFlightId'] ?? '';
    final name = response['name'] ?? '';
    final idCard = response['idCard'] ?? '';

    return Passenger(
        id: id,
        bookingFlightId: bookingFlightId,
        title: title,
        name: name,
        idCard: idCard);
  }
}
