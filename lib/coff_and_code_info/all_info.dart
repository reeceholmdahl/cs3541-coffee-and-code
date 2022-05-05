import 'package:flutter/material.dart';
import 'info_classes/information.dart';
import 'favorite_info.dart';
import 'info_details.dart';
import 'info_lists.dart';
import 'package:firstapp/constants.dart';

class AllInfo extends StatelessWidget {
  final String title;
  AllInfo({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Navy,
          title: Text(title,
              style: TextStyle(
                  color: White,
                  fontFamily: 'monospace',
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Brown,
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoriteInfo(title: title)),
            );
          },
          icon: Icon(Icons.favorite),
          label: Text("Favorites", style: TextStyle(fontFamily: 'monospace')),
          backgroundColor: Navy,
        ),
        body: AllInfoList(title)
    );
  }
}

class AllInfoList extends StatefulWidget {
  late String title;

  AllInfoList(title) {
    this.title = title;
  }

  @override
  _AllInfoListState createState() => _AllInfoListState(title);
}

class _AllInfoListState extends State<AllInfoList> {
  late List<Information> infoList;
  late List<Information> favoritesList;

  _AllInfoListState(String title) {
    switch (title) {
      case 'Recipes':
        this.infoList = InfoLists.recipes;
        this.favoritesList = InfoLists.favRecipes;
        break;
      case 'Shops':
        this.infoList = InfoLists.shops;
        this.favoritesList = InfoLists.favShops;
        break;
      case 'Guidelines':
        this.infoList = InfoLists.guidelines;
        this.favoritesList = InfoLists.favGuidelines;
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Brown,
        body: ListView.builder(
            itemCount: infoList.length + 1,
            itemBuilder: (context, index) {
              if (index == infoList.length)
                return Column(
                    key: Key("blank"), children: [SizedBox(height: 70)]);
              Information information = infoList[index];
              return Card(
                child: ListTile(
                  tileColor: Colors.grey,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InfoDetails(info: information)));
                  },
                  title: Text(information.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'monospace',)
                  ),
                  leading: CircleAvatar(
                    child: Icon(
                      information.icon,
                      color: information.iconColor,
                    ),
                    backgroundColor: information.backgroundColor,
                  ),
                  trailing: IconButton(
                    icon: information.isFavorited
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    color: information.isFavorited ? Color(0xff9f1818) : Navy,
                    onPressed: () {
                      setState(() {
                        information.switchFavorited();
                      });
                      favoritePressed(index);
                    },
                  ),
                ),
              );
            }));
  }

  void favoritePressed(int idx) {
    if (infoList[idx].isFavorited)
      favoritesList.add(infoList[idx]);
    else
      favoritesList.remove(infoList[idx]);
  }
}
