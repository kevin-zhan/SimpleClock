
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  final int number;

  NumberWidget(this.number);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Text(
        this.number.toString(),
        textAlign: TextAlign.center,
        style:
            TextStyle(color: Color.fromARGB(255, 200, 200, 200), fontSize: 200, fontWeight: FontWeight.bold, fontFamily: "Oswald"),
      ),
    );
  }
}

class TimeBlockWidget extends StatelessWidget {

  final int timeNum;

  TimeBlockWidget(this.timeNum);

  @override
  Widget build(BuildContext context) {
    int tenPos = timeNum ~/ 10;
    int onePos = timeNum % 10;

    return Container(
      width: 230,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Color.fromARGB(30, 200, 220, 200), borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NumberWidget(tenPos),
            NumberWidget(onePos)
          ],
        ),
      ),
    );
  }

}
