class Flight {
  final int id, seatCapacity, amountPassenger, price;
  final String airline,
      seatClass,
      aircraft,
      aircraftsType,
      seatLayout,
      seatPitch,
      destinationFrom,
      destinationTo;
  final DateTime departureDate, departureTime, arrivalTime;

  Flight({
    required this.id,
    required this.airline,
    required this.seatClass,
    required this.aircraft,
    required this.aircraftsType,
    required this.seatLayout,
    required this.seatPitch,
    required this.destinationFrom,
    required this.destinationTo,
    required this.departureDate,
    required this.departureTime,
    required this.arrivalTime,
    required this.seatCapacity,
    required this.amountPassenger,
    required this.price,
  });

  factory Flight.fromResponse(Map<String, dynamic> response) {
    final airline = response['airline'] ?? '';
    final seatClass = response['seatClass'] ?? '';
    final aircraft = response['aircraft'] ?? '';
    final aircraftsType = response['aircraftsType'] ?? '';
    final seatLayout = response['seatLayout'] ?? '';
    final seatPitch = response['seatPitch'] ?? '';
    final destinationFrom = response['destinationFrom'] ?? '';
    final destinationTo = response['destinationTo'] ?? '';
    final departureDate = response['departureDate'] ?? '';
    final departureTime = response['departureTime'] ?? '';
    final arrivalTime = response['arrivalTime'] ?? '';
    final seatCapacity = response['seatCapacity'] ?? 0;
    final amountPassenger = response['seatCapacity'] ?? 0;
    final price = response['seatCapacity'] ?? 0;
    final id = response['id'] ?? 0;

    return Flight(
        id: id,
        airline: airline,
        seatClass: seatClass,
        aircraft: aircraft,
        aircraftsType: aircraftsType,
        seatLayout: seatLayout,
        seatPitch: seatPitch,
        destinationFrom: destinationFrom,
        destinationTo: destinationTo,
        departureDate: departureDate,
        departureTime: departureTime,
        arrivalTime: arrivalTime,
        seatCapacity: seatCapacity,
        amountPassenger: amountPassenger,
        price: price);
  }
}
