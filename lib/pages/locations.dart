import 'package:flutter/material.dart';
import 'package:weatherapp/main.dart';
import 'home.dart';

class Locatons extends StatefulWidget {
  const Locatons({Key? key}) : super(key: key);

  @override
  _LocatonsState createState() => _LocatonsState();
}

class _LocatonsState extends State<Locatons> {
  final List<String> places = [
    "kundapura",
    "Sagara",
    "Hosanagara",
    "Nagodi",
    "Kolluru",
    "Nagara",
    "Bengaluru",
    "Udupi",
    "Kumta",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: (ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Home(
                                location: places[index],
                              )),
                      ModalRoute.withName('/'));
                });
              },
              child: Card(
                  color: Colors.blue[100],
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(children: [
                      const Icon(Icons.location_city),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        places[index],
                        style: const TextStyle(fontSize: 20.3),
                      ),
                    ]),
                  )),
            ),
          );
        },
        itemCount: places.length,
      )),
    );
  }
}
