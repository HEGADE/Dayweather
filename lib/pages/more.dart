import 'package:flutter/material.dart';

class More extends StatefulWidget {
  var data;
  More({Key? key, this.data}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  static const color = Colors.blueGrey;
  var borderRadius = BorderRadius.circular(6.0);

  Map content = {};
  @override
  void initState() {
    content = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: borderRadius, color: color),
                    width: 150.0,
                    height: 200.0,
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                        'Humidity ${content["main"]["humidity"].toString()}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 28.0, color: Colors.white)),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: borderRadius, color: color),
                      width: 150.0,
                      height: 200.0,
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                          'visibility ${content["visibility"].toString()}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 28.0, color: Colors.white))),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Container(
                      width: 150.0,
                      height: 200.0,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: borderRadius, color: color),
                      child: Text(
                          'Pressure ${content["main"]["pressure"].toString()}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 28.0, color: Colors.white))),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Description: ${content["weather"][0]["description"].toString()}',
              style: TextStyle(fontSize: 25.0),
            ),
            Text(
              'Time zone: ${content["timezone"]}',
              style: TextStyle(fontSize: 25.0),
            ),
            Text(
              'Country: ${content["sys"]["country"].toString()}',
              style: TextStyle(fontSize: 25.0),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Day weather"),
      ),
    );
  }
}
