import 'info_classes/information.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/constants.dart';

class InfoDetails extends StatelessWidget {
  final Information info;
  InfoDetails({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Navy,
          title: Text(info.title,
              style: TextStyle(
                  color: White,
                  fontFamily: 'monospace',
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ),
      backgroundColor: Brown,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Text(info.details,
          style: TextStyle(
            fontSize: 20,
            color: White,
            fontFamily: 'monospace',
          )
        ),
      )
    );
  }

}