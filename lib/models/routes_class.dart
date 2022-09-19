import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (_) => HomePage(),
        DetailPage.route: (context) => DetailPage(
            ModalRoute.of(context)?.settings.arguments as ScreenArgumentss),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/details',
              arguments: ScreenArgumentss(
                'My Details',
                'Some Message',
              ));
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  static const String route = '/details';
  final ScreenArgumentss arguments;
  DetailPage(this.arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title),
      ),
      body: Center(
        child: Text(arguments.uuid),
      ),
    );
  }
}

class ScreenArgumentss {
  final String title;
  final String uuid;

  ScreenArgumentss(this.title, this.uuid);
}
