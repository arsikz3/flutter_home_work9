import 'package:flutter/material.dart';
import 'package:flutter_home_work9/models/hotel.dart';
import 'package:flutter_home_work9/views/fetch_data.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<HotelPreview>> _hotelsPreview;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _hotelsPreview = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.table_rows,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: Icon(
              Icons.grid_view,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Center(
        child: FutureBuilder(
            // future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
            future: _hotelsPreview,
            initialData: 'Load Data',
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  List<HotelPreview>? elem =
                      snapshot.data as List<HotelPreview>?;
                  //return Text(elem!.name.toString(), style: const TextStyle(color: Colors.cyan, fontSize: 36));

                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                            ),
                            child: Image.asset(
                              'assets/images/${elem![index].poster}',
                              fit: BoxFit.cover,
                              cacheWidth: 100 *
                                  MediaQuery.of(context)
                                      .devicePixelRatio
                                      .round(),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 180, child: Text(elem![index].name)),
                              ButtonBar(
                                children: <Widget>[
                                  ElevatedButton(
                                    child: const Text('Подробнее'),
                                    onPressed: () {/* ... */},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ));
                    },
                    // itemCount: myData == null ? 0 : myData.length,
                    itemCount: elem!.length,
                  );
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            }
            // builder: (context, snapshot) {
            //   if (!snapshot.hasData) {
            //     return const CircularProgressIndicator();
            //   }
            // var myData = json.decode(snapshot.data);

            // return ListView.builder(
            //   itemBuilder: (BuildContext context, int index) {
            //     return Card(
            //          child: ListTile(
            //        title: Text(myData[index]['table_menu_list'][index]
            //            ['category_dishes'][index]['dish_name']),
            //      ));
            //   },
            //   // itemCount: myData == null ? 0 : myData.length,
            //   itemCount: 1,
            // );
            //},
            ),
      ),
    );
  }
}
