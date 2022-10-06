

import 'hotel_bookings.dart';

class Hotel {
  final String name, phone, address, city;
  final int id, rating;
  final FacilitiesHotel facilitiesHotel;
  final List<PhotosHotel> photosHotel;
  final List<RoomsHotel> roomsHotel;

  Hotel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.address,
      required this.city,
      required this.rating,
      required this.facilitiesHotel,
      required this.photosHotel,
      required this.roomsHotel});

  factory Hotel.fromResponse(Map<String, dynamic> response) {
    final name = response['name'] ?? '';
    final phone = response['phone'] ?? '';
    final address = response['address'] ?? '';
    final city = response['city'] ?? '';
    final id = response['id'] ?? 0;
    final rating = response['rating'] ?? 0;
    final Map<String, dynamic> facilitiesHotelMap = response['facilitiesHotel'];
    final facilitiesHotel = FacilitiesHotel.fromJson(facilitiesHotelMap);
    final List<dynamic> photosList = response['photos'];
    final List<PhotosHotel> photos = photosList
        .map(
          (dynamic response) => PhotosHotel.fromJson(response),
        )
        .toList();

    final List<dynamic> roomsList = response['rooms'];
    final List<RoomsHotel> rooms = roomsList
        .map(
          (dynamic response) => RoomsHotel.fromJson(response),
        )
        .toList();

    return Hotel(
        name: name,
        phone: phone,
        address: address,
        city: city,
        rating: rating,
        id: id,
        facilitiesHotel: facilitiesHotel,
        photosHotel: photos,
        roomsHotel: rooms);
  }
}

class FacilitiesHotel {
  final bool airConditioner,
      television,
      wifi,
      restaurant,
      spa,
      pool,
      playground,
      gym,
      parking;

  FacilitiesHotel(
      {required this.airConditioner,
      required this.television,
      required this.wifi,
      required this.restaurant,
      required this.spa,
      required this.pool,
      required this.playground,
      required this.gym,
      required this.parking});

  factory FacilitiesHotel.fromJson(Map<String, dynamic> facilitiesHotelJson) {
    final airConditioner = facilitiesHotelJson['airConditioner'] ?? false;
    final television = facilitiesHotelJson['television'] ?? false;
    final wifi = facilitiesHotelJson['wifi'] ?? false;
    final restaurant = facilitiesHotelJson['restaurant'] ?? false;
    final spa = facilitiesHotelJson['spa'] ?? false;
    final pool = facilitiesHotelJson['pool'] ?? false;
    final playground = facilitiesHotelJson['playground'] ?? false;
    final gym = facilitiesHotelJson['gym'] ?? false;
    final parking = facilitiesHotelJson['parking'] ?? false;

    return FacilitiesHotel(
        airConditioner: airConditioner,
        television: television,
        wifi: wifi,
        restaurant: restaurant,
        spa: spa,
        pool: pool,
        playground: playground,
        gym: gym,
        parking: parking);
  }
}

class PhotosHotel {
  final String image;
  final int hotelId;

  PhotosHotel({required this.image, required this.hotelId});

  factory PhotosHotel.fromJson(Map<String, dynamic> photosHotelJson) {
    final image = photosHotelJson['image'] ?? '';
    final hotelId = photosHotelJson['hotelId'] ?? 0;

    return PhotosHotel(image: image, hotelId: hotelId);
  }
}

class RoomsHotel {
  final int id, price;
  final String type;
  final List<HotelBookings> bookingHotels;

  RoomsHotel({required this.id, required this.type, required this.price, required this.bookingHotels});

  factory RoomsHotel.fromJson(Map<String, dynamic> roomsHotelJson) {
    final id = roomsHotelJson['id'] ?? 0;
    //final hotelId = roomsHotelJson['hotelId'] ?? 0;
    final price = roomsHotelJson['price'] ?? 0;
    final type = roomsHotelJson['type'] ?? '';
    // final List<dynamic> photosList = response['photos'];
    // final List<PhotosHotel> photos = photosList
    //     .map(
    //       (dynamic response) => PhotosHotel.fromJson(response),
    //     )
    //     .toList();
    final List<dynamic> bookingHotelsResponse = roomsHotelJson['bookingHotels'];
    final List<HotelBookings> bookingHotels = bookingHotelsResponse
        .map(
          (dynamic response) => HotelBookings.fromResponse(response),
        )
        .toList();
    return RoomsHotel(id: id, type: type, price: price, bookingHotels: bookingHotels);
  }
}
