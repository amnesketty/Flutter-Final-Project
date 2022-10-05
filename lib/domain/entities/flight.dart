class Flight {
  final int id, seatCapacity, amountPassenger, price;
  final String airline,
      seatClass,
      aircraft,
      aircraftsType,
      seatLayout,
      seatPitch,
      destinationFrom,
      destinationTo,
      departureTime,
      arrivalTime;
  final FacilitiesFlight facilitiesFlight;

  Flight(
      {required this.id,
      required this.airline,
      required this.seatClass,
      required this.aircraft,
      required this.aircraftsType,
      required this.seatLayout,
      required this.seatPitch,
      required this.destinationFrom,
      required this.destinationTo,
      required this.departureTime,
      required this.arrivalTime,
      required this.seatCapacity,
      required this.amountPassenger,
      required this.price,
      required this.facilitiesFlight});

  factory Flight.fromResponse(Map<String, dynamic> response) {
    final airline = response['airline'] ?? '';
    final seatClass = response['seatClass'] ?? '';
    final aircraft = response['aircraft'] ?? '';
    final aircraftsType = response['aircraftsType'] ?? '';
    final seatLayout = response['seatLayout'] ?? '';
    final seatPitch = response['seatPitch'] ?? '';
    final destinationFrom = response['destinationFrom'] ?? '';
    final destinationTo = response['destinationTo'] ?? '';
    final departureTime = response['departureTime'] ?? '';
    final arrivalTime = response['arrivalTime'] ?? '';
    final seatCapacity = response['seatCapacity'] ?? 0;
    final amountPassenger = response['amountPassenger'] ?? 0;
    final price = response['price'] ?? 0;
    final id = response['id'] ?? 0;
    final Map<String, dynamic> facilitiesFlightMap =
        response['facilitiesFlight'];
    final facilitiesFlight = FacilitiesFlight.fromJson(facilitiesFlightMap);

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
        departureTime: departureTime,
        arrivalTime: arrivalTime,
        seatCapacity: seatCapacity,
        amountPassenger: amountPassenger,
        price: price,
        facilitiesFlight: facilitiesFlight);
  }
}

class FacilitiesFlight {
  final int baggage, cabinBaggage;
  final bool wifi, powerport, entertainment;

  FacilitiesFlight(
      {required this.baggage,
      required this.cabinBaggage,
      required this.wifi,
      required this.powerport,
      required this.entertainment});

  factory FacilitiesFlight.fromJson(Map<String, dynamic> response) {
    final baggage = response['baggage'] ?? 0;
    final cabinBaggage = response['cabinBaggage'] ?? 0;
    final wifi = response['wifi'] ?? false;
    final powerport = response['powerport'] ?? false;
    final entertainment = response['entertainment'] ?? false;

    return FacilitiesFlight(
        baggage: baggage,
        cabinBaggage: cabinBaggage,
        wifi: wifi,
        powerport: powerport,
        entertainment: entertainment);
  }
}

class BookingFlight {
  final int id, status, amountPassenger, totalPrice;
  final String bookingDate, bookingFlightNo;

  BookingFlight(
      {required this.id,
      required this.status,
      required this.amountPassenger,
      required this.totalPrice,
      required this.bookingDate,
      required this.bookingFlightNo});

  factory BookingFlight.fromResponse(Map<String, dynamic> response) {
    final status = response['status'] ?? '';
    final amountPassenger = response['amountPassenger'] ?? '';
    final totalPrice = response['totalPrice'] ?? '';
    final bookingDate = response['bookingDate'] ?? '';
    final bookingFlightNo = response['bookingFlightNo'] ?? '';
    final id = response['id'] ?? 0;

    return BookingFlight(
        id: id,
        status: status,
        amountPassenger: amountPassenger,
        totalPrice: totalPrice,
        bookingDate: bookingDate,
        bookingFlightNo: bookingFlightNo);
  }
}