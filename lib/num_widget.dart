
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  final int number;

  NumberWidget(this.number);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Color.fromARGB(50, 200, 200, 200), borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Text(
          this.number.toString(),
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Color.fromARGB(200, 200, 200, 200), fontSize: 200, fontWeight: FontWeight.bold),
        ),
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          NumberWidget(tenPos),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: NumberWidget(onePos),
          )
        ],
      ),
    );
  }

}
