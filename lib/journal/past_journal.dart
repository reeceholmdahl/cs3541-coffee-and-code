import 'package:firstapp/constants.dart';
import 'package:flutter/material.dart';
import '../model/readable.dart';

class PastJournal extends StatelessWidget {
  final Readable readable;

  PastJournal({Key? key, required this.readable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: 48)),
        Row(children: [
          Icon(
            readable.icon,
            color: White,
            size: 40.0,
          ),
          Padding(padding: EdgeInsets.only(left: 16)),
          Icon(
            readable.tempicon,
            color: White,
            size: 40.0,
          ),
        ]),
        SizedBox(height: 12.0),
        Text(
          readable.title,
          style: TextStyle(
              color: White,
              fontSize: 42,
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold),
        ),
        Text(
          "\nIngredients: " + readable.ingredient,
          style: TextStyle(
              color: White,
              fontSize: 18.0,
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 32.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ],
    );

    final topContent = Container(
      padding: EdgeInsets.fromLTRB(32, 0, 32, 10),
      decoration: BoxDecoration(color: readable.color),
      child: Center(
        child: topContentText,
      ),
    );

    final bottomContentText = Text(
      readable.content,
      style: TextStyle(fontSize: 16.0, fontFamily: 'monospace', color: White),
    );
    final bottomContent = Container(
      color: Brown,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(24.0),
      child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(157, 180, 165, 100),
                width: 4,
              ),
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [bottomContentText],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("coffee.description",
            style: TextStyle(
                color: White,
                fontFamily: 'monospace',
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        backgroundColor: Navy,
      ),
      backgroundColor: Brown,
      body: Column(
        children: [topContent, bottomContent],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
