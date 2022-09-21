import 'package:flutter/material.dart';
import 'package:flutter_home_work9/models/routes_class.dart';
import 'package:flutter_home_work9/views/detail_view.dart';
import 'package:flutter_home_work9/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
<<<<<<< HEAD

=======
>>>>>>> 24fb7d0... почищено
      initialRoute: HomeView.route,
      routes: {
        HomeView.route: (_) => HomeView(),
        DetailsPage.route: (context) => DetailsPage(
            ModalRoute.of(context)?.settings.arguments as ScreenArgumentss),
      },
<<<<<<< HEAD

      // initialRoute: '/',
      // routes: {
      //   '/': (BuildContext context) => HomeView(),
      //   '/detail': ((context) => DetailPage(hotelinfo: hotelinfo)),
      //   '/details': ((context) => ModalRoute.of(context).settings.arguments)).
      // },
=======
>>>>>>> 24fb7d0... почищено
    );
  }
}
