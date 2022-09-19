import 'package:flutter/material.dart';
import 'package:flutter_home_work9/models/hotel_info.dart';
import 'package:flutter_home_work9/models/routes_class.dart';
import 'package:flutter_home_work9/views/fetch_data.dart';

class DetailsPage extends StatelessWidget {
  static const String route = '/details';
  final ScreenArgumentss arguments;
  DetailsPage(this.arguments);

  @override
  Widget build(BuildContext context) {
    Future<HotelInfo> hotelinfo = getDatail(arguments.uuid);
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title),
      ),
      body: FutureBuilder(
          future: hotelinfo,
          initialData: 'Load Data',
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                HotelInfo elem = snapshot.data as HotelInfo;

                return Text(elem.address.toString());
              } else {
                return const Text('Empty data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          }),
    );
  }
}
