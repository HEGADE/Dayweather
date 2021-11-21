import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:weatherapp/pages/locations.dart';
import 'more.dart';

class Weather extends StatefulWidget {
  var location;

  Weather({Key? key, this.location}) : super(key: key);
  int ss = 002;

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  bool isLoading = true;
  bool erro = false;
  Map data = {};
  @override
  void initState() {
    print(widget.location);
    widget.location ??= "Kundapura";
    getWeatherData();
    super.initState();
  }

  void getWeatherData() async {
    try {
      var res = await Dio().get(
          "https://api.openweathermap.org/data/2.5/weather?q=${widget.location}&appid=3ff324786dd5cf7cc256e9fa2165af82");
      data = res.data;

      print(data);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("some error occured ");
      setState(() {
        erro = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          color: Colors.blue,
        )),
      );
    }
    if (erro) return const PageNotFound();
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return More(data: data);
        }), ModalRoute.withName('/'));
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.blueGrey, spreadRadius: 10.0)],
            color: Colors.blueGrey,
          ),
          padding: EdgeInsets.all(10.0),
          width: 340.0,
          height: 250.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data["name"],
                style: const TextStyle(fontSize: 40.0, color: Colors.black),
              ),
              const SizedBox(height: 20.0),
              Text(
                '${data["main"]["temp"].toString()} ',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              Text(
                'Wind speed ${data["wind"]["speed"].toString()}',
                style: TextStyle(fontSize: 40.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey,
      ),
      padding: EdgeInsets.all(10.0),
      width: 340.0,
      height: 250.0,
      child: const Text(
        "Sorrry location is not found",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 40.0, color: Colors.white),
      ),
    ));
  }
}
