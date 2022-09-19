import 'package:flutter/material.dart';

Widget rowInfo(
  dynamic hotelInfo,
  String lable,
  String param,
) {
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
