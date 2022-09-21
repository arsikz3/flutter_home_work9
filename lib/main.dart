import 'package:flutter/material.dart';
import 'package:flutter_home_work9/models/routes_class.dart';
import 'package:flutter_home_work9/views/detail_view.dart';
import 'package:flutter_home_work9/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeView.route,
      routes: {
        HomeView.route: (_) => const HomeView(),
        DetailsPage.route: (context) => DetailsPage(
            ModalRoute.of(context)?.settings.arguments as ScreenArgumentss),
      },
    );
  }
}
