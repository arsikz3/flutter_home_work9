import 'package:flutter/material.dart';
import 'package:flutter_home_work9/models/hotel.dart';
import 'package:flutter_home_work9/views/fetch_data.dart';
import 'package:flutter_home_work9/views/list_data.dart';

class HomeView extends StatefulWidget {
  static const String route = '/';
  const HomeView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<HotelPreview>> _hotelsPreview;

  @override
  void initState() {
    super.initState();

    _hotelsPreview = getData();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isList = ValueNotifier(true);

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.table_rows,
              color: Colors.white,
            ),
            onPressed: () {
              isList.value = true;
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.grid_view,
              color: Colors.white,
            ),
            onPressed: () {
              isList.value = false;
            },
          )
        ],
      ),
      body: Center(
        child: FutureBuilder(
            future: _hotelsPreview,
            initialData: 'Load Data',
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  List<HotelPreview> elem = snapshot.data as List<HotelPreview>;

                  return ValueListenableBuilder(
                      valueListenable: isList,
                      builder: (_, value, child) {
                        if (value == true) {
                          return ListDataWidget(elem: elem);
                        } else {
                          return GridDataWidget(elems: elem);
                        }
                      });
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            }),
      ),
    );
  }
}
