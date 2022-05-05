import 'package:flutter/material.dart';
import 'package:firstapp/side_drawer.dart';
import 'all_info.dart';

class InfoMenu extends StatelessWidget {
  const InfoMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
      ),
      drawer: SideDrawer(),
      body: Center(child: Column(
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
                                    Color(0xff50342f),
                                    Color(0xff452e29),
                                    Color(0xff3E2723),
                                    Color(0xff50342f),
                                  ]
                              ),
                            )
                        )
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
                        primary: Color(0xffe3dad6),
                        textStyle: const TextStyle(fontSize: 40),),
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
                      padding: const EdgeInsets.fromLTRB(55, 40, 55, 40),
                      primary: Color(0xffFFFFFF),
                      textStyle: const TextStyle(fontSize: 40),),
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
                      padding: const EdgeInsets.fromLTRB(15, 40, 15, 40),
                      primary: Colors.lightGreen[400],
                      textStyle: const TextStyle(fontSize: 40),),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllInfo(title: 'Guidelines')));
                    },
                    child: const Text('Coding Guidelines'),
                  )
                ]
            ),
          ),
        ],
      ),),
    );
  }
}