import 'package:flutter/material.dart';
import 'package:weatherapp/pages/home.dart';
import 'package:weatherapp/pages/locations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'nunito',
        primarySwatch: Colors.blueGrey,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  final location;
  const Home({Key? key, this.location}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  final List items = [];
  @override
  void initState() {
    items.add(Weather(location: widget.location));
    items.add(const Locatons());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text("Day Weather"),
      ),
      body: items[index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city), label: "Location")
        ],
        currentIndex: index,
        onTap: (int indexx) {
          setState(() {
            index = indexx;
          });
        },
      ),
    );
  }
}
