import 'package:lounga/domain/entities/hotel.dart';
import 'package:flutter/material.dart';

class HotelTile extends StatelessWidget {
  final Hotel hotel;
  final Function(Hotel) onHotelClicked;

  const HotelTile({
    super.key,
    required this.hotel,
    required this.onHotelClicked,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              onHotelClicked(hotel);
            },
            child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0XFFFFFFFF),
                ),
                child: Row(children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(hotel.photosHotel.first.image),
                            fit: BoxFit.cover),
                      )),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hotel.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18)),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(hotel.address,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(hotel.rating.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                          const Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(hotel.roomsHotel.first.price.toString(),
                          style: const TextStyle(
                              color: Color(0XFFE67E22),
                              fontWeight: FontWeight.w700,
                              fontSize: 15)),
                    ],
                  )
                ])),
          ),
        ],
      );
}
