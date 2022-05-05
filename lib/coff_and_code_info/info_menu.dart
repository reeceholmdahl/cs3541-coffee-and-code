import 'package:flutter/material.dart';
import 'all_info.dart';

class InfoMenu extends StatelessWidget {
  const InfoMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
              child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xff4b312c),
                                    Color(0xff452e29),
                                    Color(0xff3E2723),
                                    Color(0xff4b312c),
                                  ]
                              ),
                            )
                        )
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
                        primary: Color(0xffe3dad6),
                        textStyle: const TextStyle(fontSize: 34, fontFamily: 'monospace'),),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllInfo(title: 'Recipes')));
                      },
                      child: const Text('Coffee Recipes'),
                    )
                  ]
              ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xff4050af),
                                  Color(0xff303f9f),
                                  Color(0xff283599),
                                  Color(0xff4050af),
                                ]
                            ),
                          )
                      )
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(65, 50, 65, 50),
                      primary: Color(0xffFFFFFF),
                      textStyle: const TextStyle(fontSize: 35, fontFamily: 'monospace'),),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllInfo(title: 'Shops')));
                    },
                    child: const Text('Coffee Shops'),
                  )
                ]
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xff363636),
                                  Color(0xff2a2a2a),
                                  Color(0xff212121),
                                  Color(0xff363636),
                                ]
                            ),
                          )
                      )
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(13, 50, 13, 50),
                      primary: Colors.lightGreen[400],
                      textStyle: const TextStyle(fontSize: 35, fontFamily: 'monospace'),),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllInfo(title: 'Guidelines')));
                    },
                    child: const Text('Coding Guidelines'),
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}