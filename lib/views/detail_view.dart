import 'package:flutter/material.dart';
import 'package:flutter_home_work9/models/hotel_info.dart';
import 'package:flutter_home_work9/models/routes_class.dart';
import 'package:flutter_home_work9/views/fetch_data.dart';
import 'package:flutter_home_work9/views/info_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
              return Center(child: const CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                HotelInfo elem = snapshot.data as HotelInfo;

                return elem.uuid == '0'
                    ? const Center(
                        child: Text('Контент врменно недоступен'),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: CarouselSlider(
                            options: CarouselOptions(),
                            items: elem.photos
                                .map((item) => Container(
                                      child: SizedBox(
                                          child: Image.asset(
                                              'assets/images/$item',
                                              fit: BoxFit.cover,
                                              width: 1000)),
                                    ))
                                .toList(),
                          )),
                          SizedBox(
                            height: 5,
                          ),
                          rowInfo(elem.address, 'Страна: ', 'country'),
                          rowInfo(elem.address, 'Город: ', 'city'),
                          rowInfo(elem.address, 'Улица: ', 'street'),
                          rowInfo(elem.rating, 'Рейтинг:', ''),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Сервисы',
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Платные',
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  getTextWidgets(elem.services['free']),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Беcплатнo',
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  getTextWidgets(elem.services['paid']),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
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
