class UserTransaction {
  final String username;
  final List<TransactionHotels> bookingHotels;
  final List<TransactionFlights> bookingFlights;

  UserTransaction(
      {required this.username,
      required this.bookingHotels,
      required this.bookingFlights});

  factory UserTransaction.fromResponse(Map<String, dynamic> response) {
    final username = response['username'] ?? '';
    final List<dynamic> transactionsHotels = response['bookingHotels'];
    final List<TransactionHotels> bookingHotels = transactionsHotels
        .map(
          (dynamic response) => TransactionHotels.fromJson(response),
        )
        .toList();
    final List<dynamic> transactionsFlights = response['bookingFligths'];
    final List<TransactionFlights> bookingFlights = transactionsFlights
        .map(
          (dynamic response) => TransactionFlights.fromJson(response),
        )
        .toList();

    return UserTransaction(
        username: username,
        bookingHotels: bookingHotels,
        bookingFlights: bookingFlights);
  }
}

class TransactionHotels {
  final int id, totalRoom, price;
  final String bookingDate, bookingHotelNo, name;

  TransactionHotels(
      {required this.id,
      required this.bookingDate,
      required this.totalRoom,
      required this.price,
      required this.name,
      required this.bookingHotelNo});

  factory TransactionHotels.fromJson(Map<String, dynamic> responseData) {
    final id = responseData['id'] ?? 0;
    final bookingDate = responseData['bookingDate'] ?? '';
    final totalRoom = responseData['totalRoom'] ?? 0;
    final price = responseData['price'] ?? 0;
    final name = responseData['name'] ?? '';
    final bookingHotelNo = responseData['bookingHotelNo'] ?? '';

    return TransactionHotels(
        id: id,
        bookingDate: bookingDate,
        totalRoom: totalRoom,
        price: price,
        name: name,
        bookingHotelNo: bookingHotelNo);
  }
}

class TransactionFlights {
  final int id, status, amountPassenger, totalPrice;
  final String bookingDate, destinationFrom, destinationTo, bookingFlightNo;

  TransactionFlights(
      {required this.id,
      required this.status,
      required this.bookingDate,
      required this.amountPassenger,
      required this.totalPrice,
      required this.destinationFrom,
      required this.destinationTo,
      required this.bookingFlightNo});

  factory TransactionFlights.fromJson(Map<String, dynamic> responseData) {
    final id = responseData['id'] ?? 0;
    final bookingDate = responseData['bookingDate'] ?? '';
    final status = responseData['status'] ?? 0;
    final amountPassenger = responseData['amountPassenger'] ?? 0;
    final totalPrice = responseData['totalPrice'] ?? 0;
    final destinationFrom = responseData['destinationFrom'] ?? '';
    final destinationTo = responseData['destinationTo'] ?? '';
    final bookingFlightNo = responseData['bookingFlightNo'] ?? '';

    return TransactionFlights(
        id: id,
        status: status,
        bookingDate: bookingDate,
        amountPassenger: amountPassenger,
        totalPrice: totalPrice,
        destinationFrom: destinationFrom,
        destinationTo: destinationTo,
        bookingFlightNo: bookingFlightNo);
  }
}
