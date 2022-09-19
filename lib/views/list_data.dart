import 'package:flutter/material.dart';

import 'package:flutter_home_work9/models/hotel.dart';
import 'package:flutter_home_work9/models/scree_arguments.dart';

Widget listData(elem) {
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return Card(
          elevation: 10,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.orangeAccent,
                ),
                child: Image.asset(
                  'assets/images/${elem![index].poster}',
                  fit: BoxFit.cover,
                  cacheWidth:
                      100 * MediaQuery.of(context).devicePixelRatio.round(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 180, child: Text(elem![index].name)),
                  ButtonBar(
                    children: <Widget>[
                      ElevatedButton(
                        child: const Text('Подробнее'),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: ScreenArgumentss(
                                elem![index].name, elem![index].uuid),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ));
    },
    itemCount: elem!.length,
  );
}

Widget gridData(List<HotelPreview> elems) {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: elems.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16.0)),
                      child: Image.asset(
                        'assets/images/${elems[index].poster}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 40, child: Text(elems[index].name)),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16)))),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: ScreenArgumentss(
                                elems[index].name, elems[index].uuid),
                          );
                        },
                        child: const Text('Подробнее'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  });
}
