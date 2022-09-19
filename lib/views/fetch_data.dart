import 'dart:convert' as convert;

import 'package:flutter_home_work9/models/hotel.dart';
import 'package:flutter_home_work9/models/hotel_info.dart';
import 'package:http/http.dart' as http;

Future<List<HotelPreview>> getData() async {
  HotelPreview hotel;
  List<HotelPreview> hotels = [];
  var url =
      Uri.https('run.mocky.io', '/v3/ac888dc5-d193-4700-b12c-abb43e289301');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> convertRes = convert.jsonDecode(response.body);
    for (var element in convertRes) {
      hotel = HotelPreview.fromJson(element);
      hotels.add(hotel);
    }

    return hotels;
  } else {
    return [];
  }
}

Future<HotelInfo> getDatail(String uuid) async {
  HotelInfo hotelIngo;
  final queryParameters = {
    'param1': 'one',
  };
  var url = Uri.https('run.mocky.io', '/v3/$uuid');
  print(url);
  var response = await http.get(url);

  if (response.statusCode == 200) {
    Map<String, dynamic> convertRes = convert.jsonDecode(response.body);

    hotelIngo = HotelInfo.fromJson(convertRes);

    return hotelIngo;
  } else {
    return HotelInfo(
        uuid: '0',
        name: '',
        poster: 'poster',
        address: {},
        price: 0,
        rating: 0,
        services: {},
        photos: []);
  }
}
