import 'package:firstapp/side_drawer.dart';
import 'package:flutter/material.dart';

import 'package:firstapp/constants.dart';
import 'info_classes/information.dart';
import 'info_details.dart';
import 'info_lists.dart';
import 'all_info.dart';

class FavoriteInfo extends StatelessWidget {

  final String title;
  const FavoriteInfo({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Navy,
          title: Text("Favorite " + title,
              style: TextStyle(
                  color: White,
                  fontFamily: 'monospace',
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Brown,
        resizeToAvoidBottomInset: false,
        body: Favorites(title),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllInfo(title: title)),
            );
          },
          label: Text("All"),
          icon: Icon(Icons.arrow_back),
          backgroundColor: Navy,
        )
    );
  }
}

class Favorites extends StatefulWidget {
  late String title;

  Favorites(String title) {
    this.title = title;
  }

  @override
  _FavoritesState createState() => _FavoritesState(title);
}

class _FavoritesState extends State<Favorites> {
  late List<Information> infoList;
  late List<Information> favoritesList;

  _FavoritesState(title) {
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
        body: ReorderableListView.builder(
          buildDefaultDragHandles: false,
          itemCount: favoritesList.length,
          onReorder: (int oldIdx, int newIdx) {
            setState(() {
              if (oldIdx < newIdx) newIdx -= 1;
              final Information info = favoritesList.removeAt(oldIdx);
              favoritesList.insert(newIdx, info);
            });
          },
          itemBuilder: (context, index) {
          Information info = favoritesList[index];

          return Column(
            key: Key(info.title),
            children: [
              Dismissible(
                key: Key(info.title),
                onDismissed: (direction) {
                  setState(() {
                    int regListIdx = infoList.indexOf(info);
                    infoList[regListIdx].switchFavorited();
                    favoritesList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Removed from favorites")));
                },
                background: Container(
                  color: Color(0xff9f1818),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text("Remove",
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    )
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDetails(info: info)));
                  },
                  tileColor: Colors.grey,
                  title: Text(info.title,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: CircleAvatar(
                    child: Icon(
                      info.icon,
                      color: info.iconColor,
                    ),
                  backgroundColor: info.backgroundColor,
                  ),
                trailing: ReorderableDragStartListener(
                  index: index,
                  child: Icon(
                    Icons.view_headline,
                    color: Colors.blueGrey,
                  ),
                )
                ),
              ),
              SizedBox(height: 5),
            ]
          );

        },
      )
    );
  }
}
