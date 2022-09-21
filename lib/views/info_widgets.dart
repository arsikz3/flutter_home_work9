import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowInfo extends StatelessWidget {
  dynamic hotelInfo;
  String lable;
  String param;
  RowInfo(
      {Key? key,
      required this.hotelInfo,
      required this.lable,
      required this.param})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

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

// ignore: must_be_immutable
class GetTExtWidgets extends StatelessWidget {
  List<dynamic> strings;
  GetTExtWidgets({Key? key, required this.strings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings.map((item) => Text(item)).toList());
  }
}
