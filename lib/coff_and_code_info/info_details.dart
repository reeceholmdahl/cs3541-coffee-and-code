import 'package:firstapp/side_drawer.dart';
import 'info_classes/information.dart';
import 'package:flutter/material.dart';

class InfoDetails extends StatelessWidget {
  final Information info;
  InfoDetails({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(info.title),
      ),
      drawer: SideDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Text(info.details,
          style: TextStyle(
            fontSize: 20,
          )
        ),
      )
    );
  }

}