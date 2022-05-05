import 'package:coffee_and_code/constants.dart';
import 'package:coffee_and_code/journal/past_journal.dart';
import 'package:flutter/material.dart';

import '../model/readable.dart';
import 'readable_data/readable_list.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Navy,
        title: const Text("coffees.forEach(c => {",
            style: TextStyle(
                color: White,
                fontFamily: 'monospace',
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        // automaticallyImplyLeading: sfalse,
        // leading: new IconButton(
        //   icon: new Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
      ),
      backgroundColor: Brown,
      resizeToAvoidBottomInset: false,
      body: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late List readable;

  @override
  void initState() {
    readable = getReadables();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Readable readable) => ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          tileColor: readable.color,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: Icon(readable.icon, color: White),
          title: Text(
            readable.title,
            style: TextStyle(
                color: White,
                fontSize: 24,
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.keyboard_arrow_right, color: White, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PastJournal(readable: readable)));
          },
        );

    Card makeCard(Readable readable) => Card(
          color: Colors.transparent,
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: makeListTile(readable),
        );

    final makeBody = Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: readable.length,
          itemBuilder: (BuildContext context, int index) {
            return makeCard(readable[index]);
          },
        ));

    return makeBody;
  }
}
