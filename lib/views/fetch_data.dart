import 'dart:convert' as convert;

import 'package:flutter_home_work9/models/hotel.dart';
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
