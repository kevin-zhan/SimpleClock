import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:screen/screen.dart';

import 'num_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int hour = 0;
  int min = 0;
  Timer timer;

  _MyHomePageState() {
    hour = DateTime.now().hour;
    min = DateTime.now().minute;
    refreshTime();
  }


  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Screen.keepOn(true);
  }

  void refreshTime() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      int nowHour = DateTime.now().hour;
      int nowMin = DateTime.now().minute;
      if (nowHour != this.hour || nowMin != this.min) {
        setState(() {
          hour = nowHour;
          min = nowMin;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),

      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TimeBlockWidget(hour),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: TimeBlockWidget(min),
                ),

              ],
            ),
            Container(
              height: 3,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
