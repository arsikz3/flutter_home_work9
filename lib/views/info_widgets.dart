import 'package:flutter/material.dart';
import 'package:flutter_home_work9/models/hotel_info.dart';

Widget rowInfo(
  dynamic hotelInfo,
  String lable,
  String param,
) {
  print(hotelInfo.toString());
  return Row(
    children: [
      Text(lable),
      Text(param == '' ? hotelInfo.toString() : hotelInfo[param].toString(),
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 14))
    ],
  );
}

Widget getTextWidgets(List<dynamic> strings) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: strings.map((item) => Text(item)).toList());
}
